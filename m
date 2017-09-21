Return-Path: konstantin@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba515ca0
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 18:54:28 +0000 (UTC)
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
 [209.85.214.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a667cd33
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Sep 2017 18:54:28 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e134so1484584ite.3
 for <wireguard@lists.zx2c4.com>; Thu, 21 Sep 2017 12:21:53 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from gmail.com (192-0-230-179.cpe.teksavvy.com. [192.0.230.179])
 by smtp.gmail.com with ESMTPSA id m145sm1311601itg.31.2017.09.21.12.21.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Sep 2017 12:21:50 -0700 (PDT)
Date: Thu, 21 Sep 2017 15:21:48 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: wireguard@lists.zx2c4.com
Subject: 2-factor auth options
Message-ID: <20170921192148.GB2587@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="3MwIy2ne0vdjdPXF"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--3MwIy2ne0vdjdPXF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

Is there any mechanism to add some kind of 2-factor authentication
mechanism either via:

a. additional prompting for a HOTP/TOTP key sequence similar to how
openvpn allows doing auth-user-pass in addition to certificate-based
authentication

b. some way to use PGP Auth keys with wireguard so that keys stored on
GnuPG-capable smartcards can be used for establishing a VPN connection.

c. (some other means)


Best,
-K

--3MwIy2ne0vdjdPXF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEVvtv9GdDE/wE1t+WNLq4CvnyR7gFAlnEEUgACgkQNLq4Cvny
R7iWbw/+Ie8bS0rH1NB49D816X2u8jzQlFyCp4pLR5HqYmAX95Yk7T5sVT7L+hY7
nYaOQVcOXwFIrvs3J6WRt4AWUyStSqBIPBNMbZTuaR8qtxtifCCinW/8L8/fTiuq
PvEGKn7iuO0jtN+VUtUNeak3Cvw3uept2d8ep61vGMtrEAOBkxXEAaYpKhf+sTqt
mmBiWZXQn0NElUTrwTBnC66gNrw7AXY1E0Y3psEFpraWLr9xB6w1p5X5PXaRuooZ
Dv+NlBZ+eMjNcYieolLrrAoxiYbwtayvcHSktGhKHs9fJrgu1BEfsoJ0sCYiMydH
Tl8cFwYKA6CRy+ipux28/1svU1Thdo4iAfv1cp4nS6jSkEItAixYV1st/5q16+pQ
Mxxuux/RdXdZ0kl9/3lBYp9MSBniRLxplW32DtvZQs+cumuHRnwvpTaKScREnWTe
XajK3JzRuVF/fA81zCdG9bHlmqQhtXlFDXgUJ1nr0zh01YHmyc8KoT1T+F0uXj4K
KIXqrTCnaQdm+8NBuafKWqjrVj2RU0LqE5J6znHbNcNKDMU4d7QVtKOozVi3XnAR
mi9dxLmb/NAGB55FRu2EFY+lsK3X0XBDFGp1WQWsKCXtIWhtdeVZHWRN67OLToKH
zApZXMHlxcH4illvcdPNP6HElqnBAbZZkEqtqgQ1SQ5csP74Bco=
=8KxT
-----END PGP SIGNATURE-----

--3MwIy2ne0vdjdPXF--
