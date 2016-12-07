Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c00d8e66
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 10:32:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c90686c
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 10:32:42 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b6d6f97
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 10:32:40 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id c184so33642989wmd.0
 for <wireguard@lists.zx2c4.com>; Wed, 07 Dec 2016 02:38:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <58475B7C.14182.19D586@pageexec.freemail.hu>
References: <e15d1fea-8761-fde9-6802-cb483340ebb4@sholland.org>
 <CAHmME9qBAt84jOvJhnSOybekbOFQb1RH+7mmfGK=bc2i9bxADg@mail.gmail.com>
 <CAHmME9q+oEAo+HuSRf8WJoGv+jbsA46c3GHXCUT4QvX8a+k23w@mail.gmail.com>
 <58475B7C.14182.19D586@pageexec.freemail.hu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 7 Dec 2016 11:38:02 +0100
Message-ID: <CAHmME9rHB20Ywi_ZkFGq5WioqeDApUvaTwaOP1HB1WBpYRVCag@mail.gmail.com>
Subject: Re: Kernel Panic
To: pageexec@freemail.hu
Content-Type: text/plain; charset=UTF-8
Cc: Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Spender, Pipacs,

On Wed, Dec 7, 2016 at 1:44 AM, PaX Team <pageexec@freemail.hu> wrote:
> that's is your problem, DMA is forbidden to/from the stack in linux,
> Documentation/DMA-API-HOWTO.txt says this:

I realize that you shouldn't shove stack addresses inside
scattergather lists and do DMA with them. I certainly don't do this.
I've read the various parts of the kernel that erroneously do, and
I've looked at the million little grsec patches that replace these
with kmalloc everywhere. That's not what's going on here, however.

In this case, I'm hitting the bug with scatterwalk_map_and_copy, a
function designed to copy bytes out of a DMA region to put them into
any address, even a stack one, for CPU manipulation. The
implementation maps the DMA region, and then essentially calls memcpy
between that region and my stack buffer. This kind of usage certainly
must be permitted.

The place where kstackoverflow gets involved in
scatterwalk_map_and_copy is a small optimization in which the function
exits early if the destination regioin is the same as the source
region. It compares these values by calling virt_to_page and checking
those, and then calling offset_in_page and checking those. But this
doesn't mean anybody is DMAing with the stack.

Grepping the whole tree for other uses of scatterwalk_map_and_copy
indicate that it is widely used as a means of copying stack data to
and from DMA regions with this safe memcpy. For example,
arch/arm64/crypto/aes-ce-ccm-glue.c:

        /* copy authtag to end of dst */
       scatterwalk_map_and_copy(mac, dst, req->cryptlen,
crypto_aead_authsize(aead), 1);

        /* compare calculated auth tag with the stored one */
        scatterwalk_map_and_copy(buf, src, req->cryptlen - authsize,
authsize, 0);
        if (crypto_memneq(mac, buf, authsize))


Not only is `mac` a stack buffer, but it's being used for the same
functional purpose as me -- copying the authtag to/from the stack for
checking or adding.

Looking at the grsec sources for these uses of
scatterwalk_map_and_copy, it doesn't appear that the usual kmalloc
fixup is being applied, which likely indicates you didn't think it was
a problem either.

So -- I think this might be a grsec bug. Or am I still mistaken?

Jason
