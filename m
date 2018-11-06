Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 605D2C32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:16:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E94992083D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:16:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sunfi.sh header.i=@sunfi.sh header.b="ZO+3OURJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E94992083D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sunfi.sh
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a427a80;
	Tue, 6 Nov 2018 20:12:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 314b06ef
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:12:15 +0000 (UTC)
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc04f937
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:12:15 +0000 (UTC)
Date: Tue, 06 Nov 2018 20:16:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sunfi.sh;
 s=protonmail; t=1541535397;
 bh=To5pufOiQXsGQCl0IkT3wJy+CqTbYORtIUZpyXO3IQA=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=ZO+3OURJFlukN7OTObMXXjDwEtfnLy8TEm0Dtcoe1tuzUZQgDQhFtfpaUbKkrOcZK
 ZVgeOF5p5EqaIBHjE6hA/437GIwZLKu7w/j+1eie9Kz+iDHHniIOmAK/sBO+M/R/ur
 1+8emw+rsIsVZOQ/8g+0uSwJTtgGm04Hwwd3exuM=
To: Lars Francke <lars.francke@gmail.com>
From: Phil Hofer <phil@sunfi.sh>
Subject: Re: Question about AllowedIPs and proper "mesh" setup
Message-ID: <3jyAZC1J0MGdvAW-Ldzv1OiVrcdJ-GLbqgVTNY2U_1Qp-SstlhEUK9l82mBR9FwfS3F4yiwnNREeFzMaSlR0L6cw2M58JhcB3itJYNBTOUg=@sunfi.sh>
In-Reply-To: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
References: <CAD-Ua_hRW4RyOMrP3jX3hAAVLJCLHXYPvYY_PaK0y-=r_HhTQQ@mail.gmail.com>
Feedback-ID: KQYgXwW95KZKFtdKXbDLp7uXG-WRoO_GBxBXScjXQTnH4hk8IX5tVgVB60E7xVGeWaFgWV0KxGB7LiMdLyDAuw==:Ext:ProtonMail
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Phil Hofer <phil@sunfi.sh>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0986720862201270038=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0986720862201270038==
Content-Type: multipart/signed; protocol="application/pgp-signature"; micalg=pgp-sha256; boundary="---------------------9a1d05c71b889ca09ebbc756fc2a599b"; charset=UTF-8

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------9a1d05c71b889ca09ebbc756fc2a599b
Content-Type: multipart/mixed; boundary="---------------------de50dbc65af157069135034adce5ed15"

-----------------------de50dbc65af157069135034adce5ed15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;charset=utf-8

> Now I want to add an outside client into the mix (e.g. my laptop). I wan=
t to be able to connect to just one of those hosts and have that host forw=
ard my packages to the others.
> I can get it to work if I pick _one_ specific jump host but I haven't ma=
naged to set it up in a way that I can connect to any of them.

You might consider setting up just one of your servers
as a gateway for a subnet dedicated to your client machine(s).
Then add routes on your servers to the gateway.

For example, set up 10.0.0.1 as the gateway to 10.0.1.0/24,
and set your client machine up as 10.0.1.1. Machines on
10.0.0.0/24 remain connected directly.

If you need to be able to route through any one of
your servers on an ad-hoc basis, then you'll need some
additional routing protocol magic, as Matthias suggested.

Cheers,
Phil
-----------------------de50dbc65af157069135034adce5ed15--

-----------------------9a1d05c71b889ca09ebbc756fc2a599b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail
Comment: https://protonmail.com

wsBcBAEBCAAQBQJb4fagCRCcWq5QArEh8AAAElIH/A6F3JlChJsG0HNvI5q6
7tlJTWlh1pm50FPsMjQ45yxllzUxP2X1hN12u8qY+bIhUfCgL5s/j5CCVCto
lxWALp3BKgACsoLYl28dKZnmrjWcMf9RSt4mmtI47KWDYWxZjq/Finqqst+v
jde/aQWmk/9GrdO956g8AE8OvM7FSykjs+elhMsChm2IEQ/57ser4X+E20dt
GNLczB8O7FmiY/VkJrDA1gm2ZpN0rdn/NmRh+bMN5ywZg8EYgZvACbWOFuAg
T9tw8aKOSDxZDvqAs3Qu0TzuO6tM+++HU2TQ/5PpWzXzyfwyI8rbcVnNsn8x
n+lFhjObhzbF1G4YG0nQP0Q=
=uxNE
-----END PGP SIGNATURE-----


-----------------------9a1d05c71b889ca09ebbc756fc2a599b--


--===============0986720862201270038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0986720862201270038==--

