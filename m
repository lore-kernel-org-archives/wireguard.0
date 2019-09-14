Return-Path: <SRS0=Wz3S=XK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1C01C4CECD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Sep 2019 01:40:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C3C20830
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Sep 2019 01:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bright.gdn header.i=@bright.gdn header.b="K9N3dEln"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C3C20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bright.gdn
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f21d58cc;
	Sun, 15 Sep 2019 01:40:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbff81dc
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 23:59:51 +0000 (UTC)
Received: from eugene2.servers.bright.gdn (eugene2.servers.bright.gdn
 [95.216.136.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 779e049b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 23:59:50 +0000 (UTC)
Received: from [192.168.0.227] (unknown [5.18.177.98])
 by eugene2.servers.bright.gdn (Postfix) with ESMTPSA id 63B431E9177
 for <wireguard@lists.zx2c4.com>; Sun, 15 Sep 2019 02:59:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 eugene2.servers.bright.gdn 63B431E9177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bright.gdn; s=mail;
 t=1568505589; bh=St2AbYkwUTR0ip66Uit5KzKSaBBUgEpBp8KpJjbkXsU=;
 h=To:From:Subject:Date:From;
 b=K9N3dElnJzPAofiCjiGInKH0VKyyudXKwpnDE9quxHuwbG/tMdl6UeW1Fqz9cVA9I
 nujx+NnLO0hKvYhaUN3f3TbDbWoUOXevRAFd+ylvfyCyO56WUOchhpK/ou6qYH4LRb
 xVAcWQwqX1UgfFdRR8uz8e5x88LKMJiLD6ZernUyZGKksl927RJsF+7Iiji5lRkGGd
 krYZNdYaF5/eEKe4gpZccWCarnvSvX76td/0WZ/Qek7KCcOr739fxL82qTra9D7DZh
 fwk4t6TgHhH1j4uFA+G/m8/LnlO4GefXGYtNaBd4bmixpgG4OJzz0b7DGnwLOs8HXx
 SvawWW4Yv2VVTn9IwrW+kPI7As8OO9oWNq7x0Xk9+BcD4WISORC3oM8GDD8u3wxELt
 s046OvECSBpfjXpJrScvrTiQSLp5x/xRDP9Zny91FbqoGk/SV2LEinSsdqeqjzRp2t
 HWb5ohTFww6qL439J0wpkpCxSl5+ESrGzxS5aE8udiZQPf/TDUedo8wOqrL9S8i+LO
 eXgLOhBjGYd5tRpEPNPNfdBjlkGmG/4P8GOP4fmtZrOLtjCplqTvPj+GJpyPt+Mtt7
 ecpbjNTJA0XgUOES+mbAign3mNjAW1+8jQD3tn5fx7HCa5ETC/7BwG+rWzBLDb9R2+
 6Ul8crY6g+Wb2AgAEciS4pQo=
To: wireguard@lists.zx2c4.com
From: Eugene <eugene@bright.gdn>
Openpgp: preference=signencrypt
Autocrypt: addr=eugene@bright.gdn; keydata=
 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
 Dj2Nis8DZwD8pOBj8xeuyReZWmqHgb4jhh5Jkg==
Subject: Policy routed packets are dropped by wireguard
Message-ID: <75b66091-5b02-c043-5113-9883cf96851e@bright.gdn>
Date: Sun, 15 Sep 2019 02:59:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.0
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 15 Sep 2019 03:39:57 +0200
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
Content-Type: multipart/mixed; boundary="===============2348251513081463422=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2348251513081463422==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="C2JfmTmtsqaHzncP6FpnFxg8NJAtiHio6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--C2JfmTmtsqaHzncP6FpnFxg8NJAtiHio6
Content-Type: multipart/mixed; boundary="jwZR4hWEeOuoSu1NIYG2oca9BHKijxFzB";
 protected-headers="v1"
From: Eugene <eugene@bright.gdn>
To: wireguard@lists.zx2c4.com
Message-ID: <75b66091-5b02-c043-5113-9883cf96851e@bright.gdn>
Subject: Policy routed packets are dropped by wireguard

--jwZR4hWEeOuoSu1NIYG2oca9BHKijxFzB
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello!

I'm looking for technical advice.
Currently I'm trying to pass marked sessions through wireguard VPN networ=
k.

Marking is done by cgroups classid matching:
> iptables -A OUTPUT -m cgroup --cgroup 3735928559 -j MARK --set-xmark 0x=
1c3/0xffffffff

The only route in the `vpn` table is default routing through wg0:
> ip route add default dev wg0 table vpn

Routing rule is pretty simple:
> ip rule add fwmark 451 table vpn

Now I pass some packets on the interface:
> cgexec -g net_cls:vpn ping 10.0.1.1

I see packets reaching interface but dropped in the driver:
> tcpdump -i wg0 host 10.0.1.1
> ...
> 6 packets dropped by interface

Value in 4th column (TX drop) is increasing in the `/proc/net/dev` for wg=
0.

If I add route to default routing table and do ping without assigning cgr=
oup to the process then all is perfectly fine.
> ip route add 10.0.1.0/24 dev wg0

> ping 10.0.1.1                                                          =
       =20
> PING 10.0.1.1 (10.0.1.1) 56(84) bytes of data.                         =
                      =20
> 64 bytes from 10.0.1.1: icmp_seq=3D1 ttl=3D64 time=3D46.1 ms

Is it some kind of a bug of misconfiguration?

> uname -r                                                               =
       =20
> 5.2.1-gentoo

Installed Gentoo package atom.
> =3Dnet-vpn/wireguard-0.0.20190913

Thanks for any help!

--=20
Eugene Bright
IT engineer
Tel: + 79257289622


--jwZR4hWEeOuoSu1NIYG2oca9BHKijxFzB--

--C2JfmTmtsqaHzncP6FpnFxg8NJAtiHio6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEERtTEikLGad2ULk9Zvc2vv3xe74IFAl19fu8ACgkQvc2vv3xe
74IDEQf7BZqVZvlBlWmbtNmFxoQQWxpDI3uMihBP3Pz+HvmLx0nCRVAe8VsB+a1r
7l4wslhR2kZOoW+Kky+Gg7AtNYBF46V66V0VushpGMqq2nm2rNsBY00QPYmv1T65
1gUX8AQ26LBj+9vs/vouiRLlv3o7ynb9rv2Kojoj/NayC7OA+ds7whjtNcUskPGm
H5QuO/zy28eLRbG4pkRLDwVOMbKa+kLkc3g+dZu0qmntH9/XnVphj/mGvwAzK44V
IR/ewugY/TW9GLESP1pQ4dN7i1X0x4T34C6MoCPGouJZNIiBw/IeTIAhR4UIBEVw
CqMjnFvWXnHjNKKalCVHdejD0WMHQA==
=M1jR
-----END PGP SIGNATURE-----

--C2JfmTmtsqaHzncP6FpnFxg8NJAtiHio6--

--===============2348251513081463422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2348251513081463422==--
