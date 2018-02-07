Return-Path: celti@celti.name
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b1d678db
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 12:02:38 +0000 (UTC)
Received: from ilmatar.celti.name (ilmatar.celti.name [173.255.241.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e9c1671
 for <wireguard@lists.zx2c4.com>; Wed, 7 Feb 2018 12:02:38 +0000 (UTC)
Received: from dana.celti.name (unknown
 [IPv6:2600:8800:4480:2210:e08b:50ae:3769:79ac])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ilmatar.celti.name (Postfix) with ESMTPSA id 072EA64866
 for <wireguard@lists.zx2c4.com>; Wed,  7 Feb 2018 05:08:33 -0700 (MST)
Date: Wed, 7 Feb 2018 05:08:32 -0700
From: Celti Burroughs <celti@celti.name>
To: wireguard@lists.zx2c4.com
Subject: Re: wg-quick systemd service does not work directly after boot
Message-ID: <20180207050832.66a7f364@dana.celti.name>
In-Reply-To: <CAOAVeL3iu+xrhSLdNcLkR7X0nLQz8Uyb+dGAeecFtv3ArL=7Pw@mail.gmail.com>
References: <CAOAVeL3iu+xrhSLdNcLkR7X0nLQz8Uyb+dGAeecFtv3ArL=7Pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xapDSnMNgLH7mDo5qR+jqNN"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/xapDSnMNgLH7mDo5qR+jqNN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Feb 2018 10:03:43 +0100
Henning Reich <henning.reich@gmail.com> wrote:

> Hi,
>=20
> I'm not sure if this a problem of wg/wg-quick or my system but maybe
> somebody can help.
> [snip]=20
> It looks for me like wireguard can't resolve my remote site at this
> moment. I tried a static resolv.conf file and also systemd-resolved.
> Both sites have dynamic IPs so I can't use direct IPs.
> If I run "systemctl restart wg-quick@wg0" it works as expected, so my
> workaround is to add a 'sleep 5' to the service file.
>=20
> Any better solutions or is this a "bug"?
>=20
> Merci

wg-quick@.service orders itself After=3Dnetwork-online.target. Systemd
will only activate this target once it knows the network is online,
which it can only know if your network manager tells it that. You'll
need to enable the appropriate service:
  NetworkManager-wait-online.service
  systemd-networkd-wait-online.service
  ifup-wait-all-auto.service

Enable whichever of those is appropriate for your configuration,
reboot, and see if it works this time.

~Celti

--Sig_/xapDSnMNgLH7mDo5qR+jqNN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEe2WcUpra5pvQ3AVJRG4RbCsYCqQFAlp67EAACgkQRG4RbCsY
CqQERxAAmd5CMgoVvI+LGeSHsRkoZ4p1vGwkaNlPuHajvbGkEwioXwR3weAlGxAC
+gKtqozIJ54j4lAA+KgY06ul0ZNwJDCmdUi5p1yxjbhFBwH63DsVGbw4NkH7AVqk
qmuULrC0ukLR3O7cuQp8YrbJW0LvTCiAPnSvE8AiQmuhdvjQJnwsTXRPeOGr2QXy
g8Ba5hynPFphPRw7piT1/NIsPZ+as+tifMLyo8oq0cgBGfV99hpCRqxB/NF1W+nd
1kK7JnULKUAI7MURHsxCCmrwVtM1UyHFfMPVDpHjDDjAdCvGtC6R9cWX/e2VuMGY
EM4gErk7IzlYfAqNlQIgGYQkvYolJ7gdI7mXvHgsX4aBA4NeQGWnnTVi6hBCBj9P
18cJOPxazyM4FbF2pQUBuLyIXQllVgMHSkUHiq7cTNOoQ+OTRj/03rfMcPae17kT
IsBZcqpFLzIvVZZH7eCto6oxrgtHf5YDF44CJyTMBDtC7nAl6CB7WtyGq4GfHumV
eDP+QR9wdETeZF02+pasx+wD6j7iFQm5LeBPIoZRGFNm8z++9XXXFxL4X8MfcFfN
xjwQBLqKuYzS/FUpaqwHElzD0LYetGC/oXjAH/XvuoyxfPA1PWzmrcSQKfAdz5/H
qqSjMMs9bAJqRF6aw2NMh0u2z1YdTvK2k51u6L9xfEw1GbW4szE=
=DiGI
-----END PGP SIGNATURE-----

--Sig_/xapDSnMNgLH7mDo5qR+jqNN--
