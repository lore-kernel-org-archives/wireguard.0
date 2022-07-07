Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C674C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Jul 2022 17:17:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 533ff385;
	Thu, 7 Jul 2022 17:14:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [2001:4b98:dc4:8::224])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f0b122f9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2022 17:14:54 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by mail.gandi.net (Postfix) with ESMTPSA id E1A58E0003
 for <wireguard@lists.zx2c4.com>; Thu,  7 Jul 2022 17:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1657214094; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=Q2W9IXq8/QnQMTg0M2VPTUvacu/lAbKyCcEdzyAeHto=;
 b=BL3daOT307kYJZOi7S9/lhLVfALmq3jFIz2KcbX6mUXFkItCxrZPV1bSRUR5H1+XGZzKLE
 u307oX5iIxROep0LRetydjtp6GRH4boGA3E9UWvZStEmhpz2qPyLl250bAhgURBGJyIigK
 dsU5IohSJVrBFp7fPSjj2ptrOHmVfpI+sjSmc5mzxfJyfJt6LRLkUaslW/OEUvh/NADXkj
 JbCSp5XniUtRXaFC/A1bWhYrZewXBMIOoOAghdTDvBRJ04GxvRTp8rpqcCk6U4d6BAV9Ns
 KXiOOj0NGUq3b9l1hQmk3PLw3/7vRV0uLh0+crCmyXNlgf9sjd01ihkjy2b2OA==
Date: Thu, 7 Jul 2022 19:14:52 +0200
From: Faustin Lammler <faustin@fala.red>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Update wireguard installation instructions for RHEL7/8-Centos8Stream
Message-ID: <YscUjPnRGvyQIO5Y@falared>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SUzM6R3+JKgKUpV9"
Content-Disposition: inline
User-Agent: Mutt/2.2.6 (d1ee1314) (2022-06-05)
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Reply-To: faustin@fala.red
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--SUzM6R3+JKgKUpV9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!
I am wondering if the installation instruction page [1] should not be
updated to reflect [2] ?

After upgrading a Centos 8 Stream machine, it took me some time to
understand why I was not able to load the wireguard module for the new
kernel (I had to rollback from 4.18.0-394 to 4.18.0-348).

Cheers!

--=20
Faustin

[1]: https://www.wireguard.com/install/#red-hat-enterprise-linux-8-module-k=
mod-module-dkms-tools
[2]: https://git.zx2c4.com/wireguard-linux-compat/commit/?id=3D3d3c92b4711b=
42169137b2ddf42ed4382e2babdf


--SUzM6R3+JKgKUpV9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmLHFIwACgkQOQovJ4Mq
XHkl+w/+IU2lFeiGUKGkjDsfrbBduuaa4GDoO/1gZTYa52fcIuCjnCHeX9msNIsQ
IWAER1fK0Btr6WXW+4lu8u+b05ixtc0gdTcVmiprwMkQqplQBk8lxaC7GqvuoGjE
VtCoOS12+btzhQFkUdCYFKemMDM5zGXlWV/8Rpz3PN946CEsM5F+qVw5PbxqAdqd
97Cz1lXEGfsmOIt6TarnM3EcyOGmL7mZAZW5Nc1iNr2PQzkGBz/0BwS4GOps6gur
uBNGxS9CFQyXtX2cdH38HOwli7QiEYiVED6IsCQa6MnETsj4ga8kf2sPtNMcqHBL
ZKZS8q/IRkpqzfMrEUrt3PxDFrs5KUlNhtqbY7xQIjyDTHCC5VkiQY9LfP7wHqKV
vBEZnLyuJgMxqoz+rhS543zT/EO/3N0saeei2FRkIrzKOU7X4jMzODZ95p2B5DYr
0u/by3Ea4jS7iPdon8QVZz/6pNInHSML7p7nfmsQz7OyVL1cjYXeyXvp2uilA9Jv
7ThuvVsZ57yFOZlqhLloDmy//NaUGn4bSz6pXpW17k4tuQR16xDl8vZF1FNt+kEO
Rp3GJPd3yz1A9EY3i1ZEJVXidcMWy1I2z4T7vZEeetIhSAXjp7HGYCLAZJbrlzbV
apE/q+zir/LhZqk+NjAVVl7v4mBQCPQBVdVTcoQ8H4vElk6U/08=
=XVqM
-----END PGP SIGNATURE-----

--SUzM6R3+JKgKUpV9--
