Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eb573df1
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:59:15 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bc621ff
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 01:59:15 +0000 (UTC)
Date: Mon, 22 May 2017 04:11:07 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: openresolv dependency
Message-ID: <20170522041107.7f5a8be8@msi.defcon1>
In-Reply-To: <CAHmME9q-vbp4H3z8YdxFgd-Q55-+nwzork9D7wt3nnuT9UQhAA@mail.gmail.com>
References: <2fa3ef35-fde6-55d2-0872-52aa2bcb87d2@biot.com>
 <CAHmME9pJEXKRhz8dbY6hrg33Ey-j6zD6O2uu125bMqx_vCKovg@mail.gmail.com>
 <20170522030211.6fb18de8@msi.defcon1>
 <CAHmME9pntk1UvFscCWsryW8eSCqzL66of0_F=H4KE0bmpZwA+Q@mail.gmail.com>
 <20170522033439.38979b0a@msi.defcon1>
 <CAHmME9q-vbp4H3z8YdxFgd-Q55-+nwzork9D7wt3nnuT9UQhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 22 May 2017 03:40:36 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Whoops, back in the loop:
=20
> Anyway, here's the solution I'm considering at the moment:
> https://github.com/jlund/streisand/pull/702

> My Gentoo system is more click-o-matic than Ubuntu dysfunctionality. =20

Gentoo is good (they also hate shitstemd;)
ubuntu is=E2=80=A6 ubuntu - using testing packages I wouldn't consider in a=
ny
configuration (I use Debian).

> Anyway, here's the solution I'm considering at the moment:
> https://github.com/jlund/streisand/pull/702 =20

This sounds fair, the only pending question being the last one:
"Building on that last point, I'm still uncertain exactly how Ubuntu's
use of dnsmasq interacts with --enable-updates/disable-updates and
resolvconf in general."
that I can't answer.
All I know is Debian waits for ~30s and jump to another resolver if
there's one into /etc/resolv.conf - but it doesn't keep track about
that (or not very long) and do the same for almost each DNS request.

My guess is you're trying to do too much for end users; just advertise
behaviors and let people fix their own configuration.
After all, this ML is here for that and WG is about VPN, not DNS.

Jean-Yves
