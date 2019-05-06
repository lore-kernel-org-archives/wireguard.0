Return-Path: <SRS0=sgLz=TL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6BBC04AB1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B3972173B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 11 May 2019 13:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B3972173B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cyphar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b5083e8;
	Sat, 11 May 2019 13:07:57 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9bfbdd9a
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 21:08:54 +0000 (UTC)
Received: from mx2.mailbox.org (mx2a.mailbox.org
 [IPv6:2001:67c:2050:104:0:2:25:2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ead80bb
 for <wireguard@lists.zx2c4.com>; Mon, 6 May 2019 21:08:54 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id BFE13A1038
 for <wireguard@lists.zx2c4.com>; Mon,  6 May 2019 23:08:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id iqpPFk-vxE-9 for <wireguard@lists.zx2c4.com>;
 Mon,  6 May 2019 23:08:33 +0200 (CEST)
Date: Tue, 7 May 2019 07:08:27 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: wireguard@lists.zx2c4.com
Subject: Overlapping AllowedIPs Configuration
Message-ID: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 11 May 2019 15:07:56 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5031711449869283312=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============5031711449869283312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ml4xynxb7agtwmtn"
Content-Disposition: inline


--ml4xynxb7agtwmtn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I just found out that WireGuard apparently allows you to configure an
interface that has peers with overlapping AllowedIPs ranges -- which
obviously won't work with cryptokey routing -- but additionally is
strange since I feel this should cause an error when configuring the
interface.

In my case, I accidentally used /32 when generating the IPv6 addresses
of my clients and ended up with a config like:

  [Interface]
  Address =3D 10.13.37.1/32,fd00:dead:beef:cafe::1/64
  ListenPort =3D 51820
  PrivateKey =3D [key]

  # Peer A.
  [Peer]
  PublicKey =3D [pub]
  PreSharedKey =3D [psk]
  AllowedIPs =3D 10.13.40.1/32,fd00:dead:beef:1000::/32

  # Peer B.
  [Peer]
  PublicKey =3D [pub]
  PreSharedKey =3D [psk]
  AllowedIPs =3D 10.13.41.1/32,fd00:dead:beef:1001::/32

This config is wrong (because both peers have overlapping addresses
specified for AllowedIPs), but wireguard will happily accept it:

  % wg-quick up wg-foo
  [#] ip link add wg-yavin type wireguard
  [#] wg setconf wg-yavin /dev/fd/63
  [#] ip address add 10.13.37.1/32 dev wg-yavin
  [#] ip address add fd00:dead:beef:cafe::1/64 dev wg-yavin
  [#] ip link set mtu 1420 up dev wg-yavin
  [#] ip route add fd42:dead::/32 dev wg-yavin
  [#] ip route add 10.13.41.1/32 dev wg-yavin
  [#] ip route add 10.13.40.1/32 dev wg-yavin

This configuration results in only one of the peers actually being given
the IPv6 range, but I feel like "wg setconf" should've rejected this
configuration.

  % wg
  interface: wg-foo
    public key: [pub]
    private key: (hidden)
    listening port: 51820

  peer: [peer A]
    preshared key: (hidden)
    allowed ips: 10.13.40.1/32

  peer: [peer B]
    preshared key: (hidden)
    allowed ips: 10.13.41.1/32, fd42:dead::/32

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--ml4xynxb7agtwmtn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlzQokgACgkQSnvnv3De
m5+ijxAAkP5TEer9ELT06psCAMYPFKo00F68NyW0jvDXZwU78MdvOnb6bmCmKS7+
EjfQeT3ODJHey31SVyo3aNykYiI8ZV+ISyVqFefILNlbN0eW/dkR/5OW/BlrSAfA
9LOO3pe4DDCLHf3KNVWiCzPL/TDEe7qiD7UAmbGhX1EzQDiJGk59dvr5JUmsdJ1k
xxRTsc0vL3AMMCRtpO9U0cFGkFK2OBukFTwWtdqKtKynXMiSqBz6rL79wqXuanlJ
1kLtBwwX5FDGtoLo1iolRCso1Hha0EI/35efXjNCGXm9qzVZE4Y/dGahwf4u1tmW
JIW/kokIV9usI1TQdK+9q/OOD4KzXBk/uQBdiyEAtrl0fwweauvHQho8Gr8SB5dm
X78ovA5ZvsIzy2mepXdEUucxB8llFvki3GrIiaIuRvrbDwVvs9Iin0hQs5efP32a
niy5RvXn2almtzLVmsGLWgqfNA3I0OC1FrPylrwck2FCKzYsji1AwJp6CbaIkpPg
Yq1MoXd79mNjlswOZZshV8yGGLN+IM6ohLGspWfvLXWrtsy4RlpRuis4uGw8PPeW
CTcncgwxnzMpbFbInI6oH2oaGaBoBMTZ+mFcFxUTdIYRTqoF3YUH7V4KvDD2Anbu
HctKlc2bZU4cAX3Gr8WLAls9DRr2HNb+fCwQ0PtNLso6RabstNw=
=Tqps
-----END PGP SIGNATURE-----

--ml4xynxb7agtwmtn--

--===============5031711449869283312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5031711449869283312==--
