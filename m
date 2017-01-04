Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c265b54
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:16:48 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72a0aeed
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:16:48 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Christian Hesse <mail@eworm.de>,
 Dan =?utf-8?Q?L=C3=BCdtke?= <mail@danrl.com>
Subject: Re: distro packaging, makefiles, deps, systemd, new tools
In-Reply-To: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
References: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
Date: Wed, 04 Jan 2017 16:16:52 -0500
Message-ID: <877f6ajzjv.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Wed 2017-01-04 13:50:14 -0500, Jason A. Donenfeld wrote:
> Hey Christian, Daniel, Dan, and other maintainers,
>
> The next snapshot is going to have some improvements to the tooling,
> and along with this comes a more complicated Makefile. I wanted to run
> the changes by y'all (downstreams).
>
> - The makefile now has a few WITH_{FEATURE}=yes|no environment flags,
> as well as auto-detection. Documentation is here:
> https://git.zx2c4.com/WireGuard/plain/src/tools/INSTALL
> And the Makefile itself is here:
> https://git.zx2c4.com/WireGuard/tree/src/tools/Makefile
>
> Question: does this propose a desirable situation for you as a downstream?

Reading through INSTALL, these parameters look reasonable to me as a
downstream.

> - The wg-config script is now called wg-quick and is quite simple and
> nice. Documentation:
> https://git.zx2c4.com/WireGuard/about/src/tools/wg-quick.8
> And source:
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick.bash
>
> OpenWRT should _not_ ship this. NixOS probably should not ship this.
> When systemd-networkd gets support for WireGuard, systemd-based
> distros should not ship this. But everybody else who just wants a
> simple rough script for quickly bringing up and down VPNs can ship
> this, as it's a big help to users. It's installed according to the
> documentation for the Makefile above.

this also looks good.

> - There's now an "upstream" systemd unit for wg-quick, called
> wg-quick@.service. It's pretty simple:
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick@.service
>
> Question: does this unit seem sane to you? Can you ship it downstream
> as is, or will you need modifications?

although i haven't tested it, a quick read through the .service file
looks reasonable to me.  Thanks for thinking about system integration
stuff.

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlhtZkUACgkQFJitxsGS
Mjef4BAAvS8zQ8+BLFBLuOqM+w3ybvhrRUgaAFkZh0azeGMyxVwSLty59U0pynW+
tvbknQUg9Bd+u/6VotAaho2vJ6EIeeTkh0Ln8nEGS3Bql7xoaahacpVb5E/UYBDN
zGgb0rJ5Glm3oLAoTU3qsdcrqi9RlFi2WKFdelu/IWxuWYU9+2B6MuBlsqlxvZ2z
rnn3ntGRNyFORB58QoRQuFclULLsbx01Gv0m1YkZKFRlM03kC3kFClCQcdUR5PWb
OF9CEmAqkko02QtUsHVRfTLmiOuFAkT6AFS6bNDItoFfw2RhihryxsG6TB6/eP5h
sxGSvxXGe8MJLQxE2PFDdejpviN/iwmSGBMtnC61LRHbcashSAaa4gmfCzH/TGhr
rDZC1SbcRJGEXMtkAGyfAZzOOLBUkVtPaF1V4dIWoaJor5cukISGLxSAcHF49Rtn
muLoHcrf2BeaJshxowXnGtzWz99YH214s6xCmwFTw6Gcjg636QFekJL7vSKNPn72
vJnAEOdZVSZAoJ8cYMuwyYj/FadzfDnTgu5a4+BBqll6x5R82Zha+ZjXKces+h73
tOQrsZkbdQaEnB1D8mbMBlRu+qSCDdXhdLINYdQrY3l4ygdF8RupVSGOfkpOn6aS
FdYb8Bp5WQhrUxGJIjzPRpa1srQRhGirPdEvgUEQ+2ZzNkkwYMY=
=LuR7
-----END PGP SIGNATURE-----
--=-=-=--
