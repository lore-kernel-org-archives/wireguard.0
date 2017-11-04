Return-Path: aranea@aixah.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da91ed47
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 22:58:46 +0000 (UTC)
Received: from wp260.webpack.hosteurope.de (wp260.webpack.hosteurope.de
 [80.237.133.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90b6ad49
 for <wireguard@lists.zx2c4.com>; Sat, 4 Nov 2017 22:58:46 +0000 (UTC)
Date: Sun, 5 Nov 2017 00:01:22 +0100
From: Luis Ressel <aranea@aixah.de>
To: wireguard@lists.zx2c4.com, Markus Woschank <markus.woschank@gmail.com>
Subject: Re: wg showconf
Message-ID: <20171105000122.09eae100@vega.skynet.aixah.de>
In-Reply-To: <CAKUy5ayAzFtkLvagJN=m9Qk5Zuk1uwhHkj19=kCKDqNDj4jBxQ@mail.gmail.com>
References: <CAKUy5axWvBJfDQOjWSs7T0BCJ3Gw051Uu8gGw0BdSUOrzMAndw@mail.gmail.com>
 <20171104212701.527fadc1@vega.skynet.aixah.de>
 <CAKUy5ayAzFtkLvagJN=m9Qk5Zuk1uwhHkj19=kCKDqNDj4jBxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/+NAG15Kva376O3jABP=t_Ts"; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--Sig_/+NAG15Kva376O3jABP=t_Ts
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 4 Nov 2017 14:25:28 -0700
Markus Woschank <markus.woschank@gmail.com> wrote:

> While searching for arguments I realised that wireguard will allow a
> peer to connect with a different IP from the one set in the
> configuration.
> Not sure if this is the best behaviour (I understand that the peer
> needs to know the secret key, anyway not sure).

Yes, wg does this. It's a deliberate design decision which is important
to supporting roaming peers.

This is not a security problem. Since wg uses UDP as a transport
protocol, source IPs can be trivially forged by an attacker; therefore
checking source IPs wouldn't add any real value.

Cheers,
Luis Ressel

--Sig_/+NAG15Kva376O3jABP=t_Ts
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEbPzLt4vriSGj7oj2YKkwapaNrTgFAln+RsIACgkQYKkwapaN
rTjbRg/9GdIoR/lzeqMK3UHPoi4JH+H2v/uz0cGs2+KuTAfPbX8R1MJWw0Pdbyci
K/ewrL3J5QJlpi25olhsjfmmRlTs3ePU5lmrnLbC+KtIyUuMj/QndP77JAF0xfpC
bzf8KGXjiWZHixfXUVAnHJaMTuqpvIzve6z/nGK4t3dZ06kw/Ipe7khtw2GoagqX
qRz5Q3JV1jYm8L6cghXMPdJtFsONWgt2DwYbBrPTaSDM3piz2i7bdvuQ+jIwzlV8
QJYkwVz4QS4kNPuKKzIDSRA1v23focxx9BT2LIZrHHi36jYT/w9722k4isnI79Jk
ggBTqG03Yibx7Wx4hr/aCw6n/itV48x3b7eGwLGmoKBskPebU11FSKfnRJKVxecW
83ux7FgHaVAWuMPJ4mDfEKeh//lGzASnuXGCoNTDtSEHHs9uLA74dvzlBSI2MTdj
Kk7pLHyOslg8aZKDzakw4oen9bNez0IRWNGSPjTw/dqhGuOBiGaeeAjfvwMJEbkX
+JOSZB8sIEoEdMLg+liDUKKpzpPS6WY3tHx6BZo/YkIh6/K6EuKn1V6lUk2izcED
rof4XMZcwJ3gI5fkaC1FCcvUXUvL8zt1N3RFZw49leJ1y+QBpdyeIk1bx5RtPOXf
pZaPhQVBQoCZqBjGMVbByW5ICvid9SY8HEJfsNxNsOnZWcMV0SY=
=Utch
-----END PGP SIGNATURE-----

--Sig_/+NAG15Kva376O3jABP=t_Ts--
