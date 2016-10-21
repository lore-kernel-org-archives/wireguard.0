Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e74d558e
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 08:46:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a61cd7d8
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 08:46:51 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c5d77a2d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 21 Oct 2016 08:46:51 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id l131so127821611lfl.2
 for <wireguard@lists.zx2c4.com>; Fri, 21 Oct 2016 01:47:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5809CB98.15179.767FB18@pageexec.gmail.com>
References: <87mvi0jxsb.fsf@toke.dk>
 <58096029.23859.5C451AE@pageexec.gmail.com>
 <CAHmME9opbKv9c67uCk69K_J3=A0-8p0gkwmJos83wBiMJ9WmCw@mail.gmail.com>
 <5809CB98.15179.767FB18@pageexec.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 21 Oct 2016 17:47:52 +0900
Message-ID: <CAHmME9oAnWiN8fx5dGP6+i+rTdxH4fMfxmbsr56Ey7viBwiL-Q@mail.gmail.com>
To: Pipacs <pageexec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Emese Revfy <re.emese@gmail.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 Brad Spengler <spender@grsecurity.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, Oct 21, 2016 at 5:02 PM, PaX Team <pageexec@gmail.com> wrote:
> are you sure it was for satisfying PaX only and not a bug itself? :)

Blurg. I was overly hasty. Note to self: do not prepare conf
presentations and push code at the same time. Indeed this /should/ be
~0, which means "unset". I can't see any bugs by making it 0, but it
would make things "semantically incorrect", I think.

So the bug is actually in the ipv6 fragmentation code. I just sent a
patch upstream and CC'd you and Emese.

>
> if you ask me, you should just get rid of __read_mostly unconditionally (which
> is what i do in PaX as it interferes with constification) as rtnl_link_ops extends
> over several cache lines so any concerns with false sharing with writable data
> would at most affect only a few fields that are rarely used (or the fields could
> be reordered and/or aligned for such affect). otherwise you'll need to have your
> own #ifdef based on CONSTIFY_PLUGIN as suggested originally by Toke.

I'll use CONFIG_PAX_CONSTIFY_PLUGIN. Upstream uses __read_mostly for
that structure always, everywhere else. They'll probably enforce their
uniformity, so I'll stick a conditional redefinition of __read_mostly
in compat.h.
