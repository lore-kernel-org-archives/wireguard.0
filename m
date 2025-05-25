Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFF5C5AD49
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 May 2025 22:51:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4064b56;
	Sun, 25 May 2025 22:51:05 +0000 (UTC)
Received: from eldiron.immae.eu (eldiron.immae.eu [176.9.151.89])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30c02bbf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 May 2025 22:51:03 +0000 (UTC)
Received: from dilion (unknown [IPv6:2a01:4f8:141:53e7::])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by eldiron.immae.eu (Postfix) with ESMTPSA id 0633DAB2186;
 Sun, 25 May 2025 22:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bouya.org; s=eldiron2;
 t=1748213463; bh=/0JvrvjYX0MILdichsekDglJU26EKAE4ZeRsf6zudoM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=aVjyc2kwAVwRG7TYW4mx99UwGLBKNbBj8MDgYr6iYrxKRizMr27iTAGIn50LlJ1vk
 xhjPfBJ6lMqAhRfrfeOD+ZD09poj4hBFGgHHD3SG2X/RukOm5fu5UFe/H3zC6MCXD2
 7m4wVOyxBlMK09xh0hwmxCjTY38GQQfTYHjmYD0kfbp1Qe+HrPPvlbTTms6TrqpHw5
 aHdXi8uhmr5TazY1/YC/wTLA3Tyx97g/BPwK7k7CkyyVi3rNEppp1UPihhqNo9Ispn
 vsNP0k9W9iwU/7bDLv0EA/clkw7Q6uei9pzpnhLJAJnB89NWDZs9pZ6cGPeWo1SXXr
 LvDE8nmKaU+/w==
Date: Mon, 26 May 2025 00:51:02 +0200
From: Ismael Bouya <ismael@bouya.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Incorrect computation of the MTU in wg-quick
Message-ID: <xph2i3p5ar5h2w26pse7pmiwiyoqph6zmq5ecbnj32l7w4paan@wh4zxu3vygs7>
References: <cvlwdlcato6fv5ih7qcib2tyzjltvfnq3l4flfcfrqqltl32j7@2mae3zkuvmuw>
 <aC5A29Qmn-5uoCC0@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zdju6pjsszhuflui"
Content-Disposition: inline
In-Reply-To: <aC5A29Qmn-5uoCC0@zx2c4.com>
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--zdju6pjsszhuflui
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Incorrect computation of the MTU in wg-quick
MIME-Version: 1.0

Hi Jason,
It seems to work correctly now, thanks for the fix!
Kind regards,

(Wed, May 21, 2025 at 11:08:43PM +0200) Jason A. Donenfeld :
> > I would like to report a behavior that seems to be incorrect in the way
> > wg-quick computes the MTU to assign to a wireguard interface:
> > https://git.zx2c4.com/wireguard-tools/tree/src/wg-quick/linux.bash#n125
> > In this block, wg-quick goes through every endpoint it knows about,
> > gets the mtu of the route to reach the endpoint, and takes the highest
> > value among all the computed values.
> > However it appears to me that the chosen value should instead be the
> > lowest among all endpoints rather than the highest.
> >=20
> > As an example, if I declare myself (localhost) as an endpoint (it may or
> > may not be supported, but that=E2=80=99s how I found about this issue),=
 then the
> > mtu will be set to 65456 (65536-80) which is higher than what the other
> > endpoints are able to manage, and I=E2=80=99ll only be able to contact =
myself
> > properly.
>=20
> Thanks for the report. Fixed:
> https://git.zx2c4.com/wireguard-tools/commit/?id=3D5150cd647073be1f1c1268=
8aef291bdf17970154
>=20
> Let me know if that looks okay to you.
>=20
> Jason

--=20
Ismael

--zdju6pjsszhuflui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEHbA6XjnBfeR3vtz7/R1O9X+pWQIFAmgzntAACgkQ/R1O9X+p
WQJjlw//Sy1KX3yWfOuobJA7zRLFunvU2eSRRtDP8LYcvz5/IXh9XaLgv+8vwL4i
lIeE6xhcXH9o+viqpcKdYQsTVOqQ9hYgG+TLIPsWJPBPUruW5tDmCAl2Of00nXsI
zkRD+gNXKQ8A5Jqbbs1Fcc6T1DFgQU5QqAToFn/LgoC/gZLE0V7yH9iyqBwAXpcW
5/M/xvN/q8yPg4UZazx1Urzg0xQSvBTeEW2uIr4nNdBGeagtlnHI8D5DmL+useyg
FzsKvbw8MAheJTJU5fkG19C+0QQXEqd64taVvnkktDCAw+MQoYBZQzmsLaJLw7uJ
nJKV16sOvtz9i4zFITatGnE9wMFh+cqA8qIVve2ZZH96oEjxJK5KcjwR0fdq50cQ
JeEy8/QZVDz7WbMesSItJHrDcoCG+hHbAJtTogGNMC8lRPD1MWnLHjZDw9pXiSRb
ie/kYKRlBRiWfdRluEzBaeYqWtSVPJ84WFdDnV2a1OP+Xh6/douBDhYBpK8yaZzW
T/hWCD16I2cAee9j4XRFNhI/QWpGxvTelSjwdlKPLuNrXaZg/IJSTxw+Xn87wnLh
ScRyCbA1tRl1dwo+q+bk0651gHGQ/6XN+9A5ynzABeaHiDndtWipw+P5HEvqwM28
H1MtCRRmPLaJyS3F0nUx8bPlrlKz5ibmMAbMqPbnSK3RCBHfXDg=
=OKeQ
-----END PGP SIGNATURE-----

--zdju6pjsszhuflui--
