Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8531b43
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:30:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4918731d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:30:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1552f520
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:21:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ab81b008
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 15:21:32 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id f11so18712728otj.12
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 07:39:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CA+55aFzLR2DbGnAKQwg79Ob9dpkOM1Z7bxkjyPBSp3Zdxmk5eQ@mail.gmail.com>
References: <1518168340-9392-1-git-send-email-joro@8bytes.org>
 <CALCETrUF61fqjXKG=kwf83JWpw=kgL16UvKowezDVwVA1=YVAw@mail.gmail.com>
 <20180209191112.55zyjf4njum75brd@suse.de>
 <20180210091543.ynypx4y3koz44g7y@angband.pl>
 <CA+55aFwdLZjDcfhj4Ps=dUfd7ifkoYxW0FoH_JKjhXJYzxUSZQ@mail.gmail.com>
 <20180211105909.53bv5q363u7jgrsc@angband.pl>
 <6FB16384-7597-474E-91A1-1AF09201CEAC@gmail.com>
 <20180213085429.GB10278@kroah.com>
 <CA+55aFzLR2DbGnAKQwg79Ob9dpkOM1Z7bxkjyPBSp3Zdxmk5eQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 6 Mar 2018 16:39:43 +0100
Message-ID: <CAHmME9rntZnGBfN_yp5+zBBpXiinFJTU2RkuREa4a5DQGiMB7A@mail.gmail.com>
Subject: Re: [PATCH 00/31 v2] PTI support for x86_32
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Eduardo Valentin <eduval@amazon.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will.deacon@arm.com>, Dave Hansen <dave.hansen@intel.com>,
 Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 Hugh Dickins <hughd@google.com>, "Liguori, Anthony" <aliguori@amazon.com>,
 Adam Borowski <kilobyte@angband.pl>, Joerg Roedel <jroedel@suse.de>,
 Denys Vlasenko <dvlasenk@redhat.com>,
 Daniel Gruss <daniel.gruss@iaik.tugraz.at>, Brian Gerst <brgerst@gmail.com>,
 Kees Cook <keescook@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>,
 Linux-MM <linux-mm@kvack.org>, Mark D Rustad <mrustad@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, David Laight <David.Laight@aculab.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jiri Kosina <jkosina@suse.cz>,
 Waiman Long <llong@redhat.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Linus,

On Tue, Feb 13, 2018 at 6:25 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> So let's try to fix the iscsi and ipsec issues. Not that anybody sane
> should use that overly complex ipsec thing, and I think we should
> strive to merge WireGuard and get people moved over to that instead,
> but I haven't heard anything from davem about it since I last asked..
> I have some hope that it's slowly happening.

Sorry for missing this comment earlier. We're really quite close to a
point where we can post our v1 patchset. I'm headed on the road this
week, but will be back on the first of April, and I expect that
sometime in the spring we should begin to have the cycles of posting
patches and receiving reviews and getting this into shape for shipping
upstream.

So, fear not, we're still rolling ahead!

Regards,
Jason
