Return-Path: maximilian+wireguard@eschenbacher.email
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea6204f4
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:51:44 +0000 (UTC)
Received: from qadesch.kajt.de (qadesch.kajt.de [5.45.108.103])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6de6b4e7
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jun 2018 16:51:43 +0000 (UTC)
Date: Fri, 1 Jun 2018 18:54:01 +0200
From: Maximilian Eschenbacher <maximilian+wireguard@eschenbacher.email>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Wireguard on android w/o kernel module
Message-ID: <20180601165401.olea7a7gljb4zwtx@kajt.de>
References: <20180601163852.bjlmnqjeqd5eidvo@kajt.de>
 <CAHmME9oR380gmce39SrdocWCR37NSRCAqUdm6-_qRQdCqoyqnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="enzbh3gpmd7v3jvl"
In-Reply-To: <CAHmME9oR380gmce39SrdocWCR37NSRCAqUdm6-_qRQdCqoyqnA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--enzbh3gpmd7v3jvl
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

Hey Jason,

thanks for the quick response.

On 01/06/2018 18:42:41, Jason A. Donenfeld wrote:
>You can investigate (b) by fishing around in the system VPN settings
>and seeing what's there, possibly removing authorization for those.
>Afterwards, close the application, reopen it, and it should prompt you
>to accept permissions.

This was exactly what had happened.

Best regards

Max

--enzbh3gpmd7v3jvl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEERYcLdcC+E/zRfMueawQJLrDVljUFAlsReiYACgkQawQJLrDV
ljVCrhAAwMfut5rr3tV4Y39mt2HpTlPqK1nkSRcTjoRn57CTfJGBDwjnz2brKn+4
IRxKDB2sWvwma7A9gPskrFD80cNYCPHGTGpyfAo7bBLyj4IiZQwLMB//6QfUBe/E
aCDEjAEkp2jbb3A4Hc+9ItCVXxCOtDHNRo3wLyGFOXYTkX/XD4J29ArLIkRjhJ0M
bN+wEk64tepzMKkTU16qQlKY3barRrFITSU4eftpkPO4U/wyCQ2+CUnhUm4AWIdH
fZ1TukjZ0eaRX+gtuB1SZzrhENz6CJAizExTvk4/3zW5djioDkAaHMNmZN2VsFhW
D9i9XvsYYn8V2VQCW7RQers7gB2YPn8MWvIUUpazTOPV8nHcGFEMGD3MaO8FrWtt
2Hyyas6mr48hSSQ5c/p913jd561EGEq7cFxxOAdTO95ciZXas2GhjnFMnsI4O3+1
n4de0NxHLbZh1lQ6r7/BYoKHbqZRLSJIIuuOnYar3pk2yhank6qvBHV3EHqRtOMB
wGpvYQ3tijYh4i9lNXC1CwHhVVv4owyvw9JWYUEeDj7FLpGvcr/P7WEowNpSFFPk
Ux9KeS9MSMzar0CLAx7s5uzetyFMnGAPy0zZRJjBeQVBJmFiML+/qm/G6RMbONC8
ZLTFUGTi0zNbyOsb569blcsOd7IHH7Cm2QiSN7egTY551mcXsgg=
=E3yw
-----END PGP SIGNATURE-----

--enzbh3gpmd7v3jvl--
