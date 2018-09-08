Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87712e39
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:28:08 +0000 (UTC)
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a62f596e
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 14:28:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u12-v6so17517800wrr.4
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 07:28:37 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: [PATCH 5/7] netlink: allow setting of transit net
To: Julian Orth <ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-6-ju.orth@gmail.com>
 <a6d8b0be-1d69-c803-17f4-e23d49073c28@gmail.com>
 <a5352639-fe6b-7417-dd44-3cf893dcd020@gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <cbd6d70d-9edd-996e-ed25-fde8cf530ba7@gmail.com>
Date: Sat, 8 Sep 2018 14:28:34 +0000
MIME-Version: 1.0
In-Reply-To: <a5352639-fe6b-7417-dd44-3cf893dcd020@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="szC8sZBeRZacNkJHr6jMNtKay9MJH7Puk"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--szC8sZBeRZacNkJHr6jMNtKay9MJH7Puk
Content-Type: multipart/mixed; boundary="XWGO17JQgjg6VsZYckLu8JKWU9Yx3Nmlp";
 protected-headers="v1"
From: Aaron Jones <aaronmdjones@gmail.com>
To: Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <cbd6d70d-9edd-996e-ed25-fde8cf530ba7@gmail.com>
Subject: Re: [PATCH 5/7] netlink: allow setting of transit net
References: <20180908121841.8372-1-ju.orth@gmail.com>
 <20180908121841.8372-6-ju.orth@gmail.com>
 <a6d8b0be-1d69-c803-17f4-e23d49073c28@gmail.com>
 <a5352639-fe6b-7417-dd44-3cf893dcd020@gmail.com>
In-Reply-To: <a5352639-fe6b-7417-dd44-3cf893dcd020@gmail.com>

--XWGO17JQgjg6VsZYckLu8JKWU9Yx3Nmlp
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 08/09/18 14:20, Julian Orth wrote:
> On 9/8/18 4:03 PM, Aaron Jones wrote:
>> Does this handle file descriptor 0 (unlikely, but perfectly valid) ?
>=20
> I believe so.

Ah, so it does; I misread the start of set_socket(). My apologies.



--XWGO17JQgjg6VsZYckLu8JKWU9Yx3Nmlp--

--szC8sZBeRZacNkJHr6jMNtKay9MJH7Puk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAluT3JIACgkQivBzdIir
MBKu+BAAsSkAu00eINgl62AJl+LHE6zBMhd1EBoGyQMFuxyw1GNIQ8T4E68/H2zr
NMro7Jrr6GFRa/SEf46zL1eWsLdgN+BHJx/72duyBkRktBSJTcBeQS3Y7u+PJD43
GN9sovFagapo7bXFgtwLvCUcZ4u4ICvcg2VmGB81PizIYZoLuTDK670mf9kMY5Oy
8wkyN3nDpLxtSxPQKDWovcVOB+thgx34/elFYuGUt7UTP47IjRnMsCPtyr/upLU2
YNrgJmy515kpVwZFHZtKnaWxzcHlKdm4DNJrjCehfJ0GcxL8URjkaOH7kWInjWir
3HtNQ6S87U04DX3mT4MCNokfe8l1q0XPfsMRNcGUHMGs2tpRmaDDck1xiOCKB8j0
tg9C+FxmDWUrl1gTl76AuPua1//YtyFBifAyIBZQ4PtdN8RKs1KtZLnZMB0xnjDD
TZsw/mBgD9V5aQ6iXrnU6a2+kyLnDjbSOgCsG81HvfDcCTq3rLVlc4etXAe7JtBH
3ZWskFGBv+Q0FDAvUHfHrYnjRw25RJDnkKAeo+2bqEQAD17JhmmJk7kKjdvebnLf
3k7059G5I7UZ1DN0/X5kq/AU/NhpKqdAYZ5YJJHSLxDTaDzpKc2ltdZA7ABJHsu4
pDgeCXNtbmIiu2AQ7ADFpReKoojge2+zu0rK69F2b24hd/E3kWs=
=Zrzc
-----END PGP SIGNATURE-----

--szC8sZBeRZacNkJHr6jMNtKay9MJH7Puk--
