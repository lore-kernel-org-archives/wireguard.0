Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e8214eb
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 04:01:16 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1a0db48
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 04:01:16 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Vadim Zotov <z@zenit.ru>
Subject: Re: passtos patch
In-Reply-To: <CAHmME9rL9Koi2-vctwmTjCf2DCMCTEOcueJJNLsprO03-3gwMQ@mail.gmail.com>
References: <4dc5f671-790e-88df-5483-ee00716d570e@zenit.ru>
 <CAHmME9rL9Koi2-vctwmTjCf2DCMCTEOcueJJNLsprO03-3gwMQ@mail.gmail.com>
Date: Thu, 18 Jan 2018 23:04:39 -0500
Message-ID: <87y3ku4hpk.fsf@fifthhorseman.net>
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

On Thu 2018-01-18 17:11:16 +0100, Jason A. Donenfeld wrote:
> Not sure the infoleak is worth it.
>
> List: thoughts?

I don't think the infoleak is worth it.  Certainly not by default.

and i know wg doesn't want to have a lot of fiddly knobs, so if it's not
by default, please don't add a fiddly knob here.

As just one scenario where it's harmful, consider the case where your
ISP wants to sell you VoIP service.  They have a concrete financial
incentive to delay or add jitter to packets coming from you marked with
common VoIP ToS markings if your VoIP connections are not made through
their competing service.  If your VoIP traffic goes out via wireguard,
your ISP will damage it to try to convince you that their service is
what you should be using :/

The goal of wireguard-style tunnelling is to avoid leaking information
about what the user is actively doing.  Let's not introduce exceptions
where we actively try to export otherwise-confidential information
outside the encrypted envelope.

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlphblcACgkQyu+ogyFn
UzO/WQ/+JQ3WfwT7dP3tgq8ljgUGiNZZJnXlf+qbIM9OYZGXT1iHtKx7e4C5XSUk
raepg66qNvXQsTxRypFdd8pc2bt6tmwr8Vk4tsJdB4TPO1pPsKYL65fjCcRBx4LM
x9uFh60mHlmAbU7bf5jaSpNizio1KGv63yPQUdsq9SMbbV3eDRR3UDDqZUQqTHyf
uSaGKNXYyn0+UboMvNGGUyrrj5yM8PxZZvZwXNn2F71cr6xc3RJ1QFF00FQ3fwsr
IrY/hx7ofzExtzzq9B73jv0f9McO80T18jSCxdbAtUdpa6jTcDBPoCHu52qHZAWe
rA4uhgzKcBDWhBo2bgvQYGojXXdQttdiwWrOjWdy3w3CVEOOSiKf2ok9gSHayi/W
eCyCnWxnOPU+vObEDXcnVGQV2PQQcXN+RaLC0jSUXXnUQXWbhPQfwaUm9rWjLS2i
wbAs0yeLjZTZA+aq+UvhN7K0zPde6J5qS9Ug6DoRJt8d0Gk7U078ArNaU4uEFFQr
2ZFxWeC4l8a0fxY6rxZlFjjAmtcYZIOhSzWPXNyT9uyJsph+xn6zAMX5r6fOnh4D
kVghy0qqndk5T9YOgvNgBHWnjGUUpqgOPVrppFJg9DfDhscK4F65TUPzbf+uDXhw
BwFvAqJ4Bw4gyjn+5z5QZEF89YkthGIulJuYSXkYU+273FTTLQA=
=9e2L
-----END PGP SIGNATURE-----
--=-=-=--
