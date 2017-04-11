Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a70ebe5
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:06:12 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
 [209.85.128.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 939289be
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Apr 2017 11:06:12 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id c55so92922368wrc.3
 for <wireguard@lists.zx2c4.com>; Tue, 11 Apr 2017 04:13:06 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.230] (uk.webcrumb.net. [176.126.241.16])
 by smtp.gmail.com with ESMTPSA id r5sm21135322wra.50.2017.04.11.04.13.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Apr 2017 04:13:04 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Subject: DKMS build failure on kernel 3.13 (Ubuntu 14.04)
Message-ID: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
Date: Tue, 11 Apr 2017 12:12:58 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="E0GM1QS94RlxlueP0TOtanN4rx3FekQlv"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E0GM1QS94RlxlueP0TOtanN4rx3FekQlv
Content-Type: multipart/mixed; boundary="2EulB9hDi7CVOc7xL6DIHuHcp1w41CxUO";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <bb963757-98ea-a107-b402-a4c659d9e0b0@york.ac.uk>
Subject: DKMS build failure on kernel 3.13 (Ubuntu 14.04)

--2EulB9hDi7CVOc7xL6DIHuHcp1w41CxUO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi!

In testing out the new kernel<4.1 support I've hit a build failure:

> In file included from include/net/ip_tunnels.h:5:0,
>                  from /var/lib/dkms/wireguard/0.0.20170409-1~14.04.york=
0.1/build/compat/compat.h:62,
>                  from <command-line>:0:
> include/linux/netdevice.h:1890:43: error: macro "dev_recursion_level" p=
assed 1 arguments, but takes just 0
>  static inline int dev_recursion_level(void)
>                                            ^
> include/linux/netdevice.h:1891:1: error: expected =E2=80=98=3D=E2=80=99=
, =E2=80=98,=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or =E2=80=
=98__attribute__=E2=80=99 before =E2=80=98{=E2=80=99 token
>  {
>  ^

This looks to be related to lines 43-48 of src/compat/compat.h where
there's `#define dev_recursion_level() 0`. I'm not yet sure whether
Ubuntu have tweaked or backported something, or whether the 1-arity
function exists in mainline kernel 3.13.

(If there's an issue/bug tracker I've missed let me know)

Regards,

Jonathon


--2EulB9hDi7CVOc7xL6DIHuHcp1w41CxUO--

--E0GM1QS94RlxlueP0TOtanN4rx3FekQlv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAljsujoACgkQ4DBDgow/
9LuWAQ//QY//le0ZxbbINMcYA2YhpYl3JEedhnPsTyGLrh5KbMwy3Rh7AhitnHoy
YdhxT9Q8j7PQCxK53JpqkE3Rmb9ZiOcN2A/KoHIq/Xcg4zYVxata9MabY379yoiA
flXdDkUQJDUjys/IuU1ZV4t0IDoUoysCEjFWJtBswfNyZ5msra6MWXB1/KFImFEp
5i2pKXwG0EOykz+ZaPM4iJoXlEpBXAPSnojhZKcc4ZWd/mm3cKeQBs80xN0Nycsm
1D8AL+hl/EUhIco7OBBLpHnzz4SZO8LHIYfAPcXdIl3dXuZXOs+ST6i+0/vFkOaT
r2c7KJnN6eWAUCWJc/b32alwSz12GmFMikucGHiZ/HRiYtrKP8xJ0TRERbZcuCry
ehcrvWXoqmf+2yqgkvoLcB3s+bH297n/jV255s0/OwzGdmRYjw93AZrcemCf3dm0
+FTXZVMjHeBxDCBCyGsyJFfy2ug+HiqYiMKJzfZ9vcUcKJGqKzAtWmv4Bo4TmJqy
MdeyxybnStoBMW7xGvPObzih23w+GmPbjdBUOsFzSX02XJjz7FsdhWhsvVRQIm8e
x6N/fI0ajWRRaH3/H2wTQJNdHU91/JJWyRb2iDyhjac5vMdmnuKnqhTimpxL94PD
IGSn6EwCe5Ps7oEh4osm7V79cukEKEya0aaZ1wy0Nmw12IzkU5I=
=2atH
-----END PGP SIGNATURE-----

--E0GM1QS94RlxlueP0TOtanN4rx3FekQlv--
