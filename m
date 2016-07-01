Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39299b6d
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 12:10:39 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <CAHmME9p79wUVkdUX30dgrJ28rMkX13ywAi-4OBg+agiZdEijQQ@mail.gmail.com>
References: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
 <1467327323-8532-3-git-send-email-dkg@fifthhorseman.net>
 <CAHmME9p79wUVkdUX30dgrJ28rMkX13ywAi-4OBg+agiZdEijQQ@mail.gmail.com>
Date: Fri, 01 Jul 2016 08:13:26 -0400
Message-ID: <87d1mx1rq1.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH 3/4] Explain the optional nature of
	Peer.EndPoint more clearly
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu 2016-06-30 22:08:08 -0400, Jason A. Donenfeld wrote:
> I'm merging a commit with some of these suggested changes for 1,2,4.
> Thanks for those.

Thanks for the update, and for your improvements to my text.

> But the changes here are simply not correct.
>
> The endpoint is simply the initial endpoint used to contact the peer.
> If the peer sends legit traffic from a different endpoint, it will be
> updated to that new endpoint. So, specifying an endpoint doesn't bind
> traffic to that endpoint. It's simply an initial specifier of it.

Great, thanks for this explanation!

> Otherwise, how does traffic get started flowing?

Well, the traffic could get flowing because the peer initiates it,
right?  A novice admin who is trying to understand whether they should
put an "Endpoint" field in their config needs to know how to make that
decision.

What do you think of the following update:

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index 67b4cf7..3f255e7 100644
=2D-- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -130,8 +130,12 @@ to which outgoing traffic for this peer is directed. T=
he catch-all
 \fI0.0.0.0/0\fP may be specified for matching all IPv4 addresses, and
 \fI::/0\fP may be specified for matching all IPv6 addresses. Required.
 .IP \(bu
=2DEndpoint \(em an endpoint IP or hostname, followed by a colon, and then a
=2Dport number. Optional.
+Endpoint \(em an endpoint IP or hostname, followed by a colon, and
+then a port number.  This is necessary to know where to direct
+outbound traffic if no inbound traffic has been received from the
+peer.  If the peer sends authenticated traffic from a different remote
+address and/or port, it will be updated to that new information
+automatically.  Optional.
=20
 .SH CONFIGURATION FILE FORMAT EXAMPLE
 This example may be used as a model for writing configuration files.




      --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXdl5mXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKdVAQAL4a5x06QBUmI+FDrd58PT8S
AvXnKVCbosttuq8DW4IGkTiT85aFoq/DvCjn4Ox+ZwORMQ6ATbc56kbQpI32+QJ3
3SeXpxCicT6QRgnJBmtgfXnLuF3RMIwF6JMedigB4z2cwWesY7avuWFdyCL9s1md
g88IPxds40YBTlK1nt2HR8qQK1BkyiCMLmnwWSxTaO1mpsmHRARL7k+dW/7ljvmR
w1pBtEQ8WUFduuHxIOqr55yo3XnkRbHlM5cTJuECONrD7jMOO9cLg74Gkt3B/vhc
GHmQc2lIK5YdabfdMEhOlnCTrhfplRGQw0arE9aMn8/hJF78MN0iPA9p02qMvA5k
lVbPRjApupNrhGFbsO67crY2uPsQnfYk8+kB5nnZgcID74Y4rGnxoXBQbN2z9qfh
8mj9O9xr/4DtHT2AKTloX4Lz88cv7ozvgN3iA+4+v4wGx4N7rVR674yraAimftgG
Cnoq+2FojVj9lSHMKF95tn1hhbMA/BPwbpUPytRqJwoWIg/avbBEMeMfqRsI83c1
9vvdsf/P6bp2kdJDZ130EkAgZoPvCjQj7RGBt9OTwTsOtkp4b3FrhmCmlS9uIoIE
DRt6EJMxCpTDZj40bp32d8iz+gYAJKtVH+Igr2T/wNpxh8zgzGumCsFzB609znXp
LX5codjLbNWguB9UT26R
=Zp+N
-----END PGP SIGNATURE-----
--=-=-=--
