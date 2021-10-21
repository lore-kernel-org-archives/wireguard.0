Return-Path: <SRS0=KwQm=PJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8BDC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 07:44:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5DA6610EA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 07:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5DA6610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fala.red
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cfe165b;
	Thu, 21 Oct 2021 07:44:31 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 576c01b4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Oct 2021 07:44:30 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id EC942FF80D
 for <wireguard@lists.zx2c4.com>; Thu, 21 Oct 2021 07:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1634802270; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yGfC4HDrMfKJ2QtESMfRxEfkBuypXK/PBI4D3oPKoNg=;
 b=MnSu+IlBnVtiI7g7bMNIDBY5CRFamx4ZOvo4OCSsaN8TAoTKDJrhVhJTn/XaVvC2AwCk/l
 W8mS7s5T4ECyIseKGZZZ9wZCUUfyxy6j/hG6gA2uH7/Q3DTUJgKkN6bn28YmHsKJzPHP1d
 ledEQz6cS5vrWasMxX1KX4FzZC0GxcnVCfdVNtDl9zBmKXpd4tEaABioN6TR0Jveaj5Do3
 Posad9KRUjjEqFSYUw385tHR9gB/Fej4NYt4+jyVil0O95e17WzXeWIISRrdfXpeIB/QC7
 lObA1rwxr+mdmH+3PnWuY18bTWEc9b3vaUp7VkxOd3a+pcvvW0iJb1bo6z7G8g==
Date: Thu, 21 Oct 2021 09:44:28 +0200
From: Faustin Lammler <faustin@fala.red>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <YXEaXIkYfcSPO+tR@falared>
References: <YWFuczOf1dM3B4Pt@falared>
 <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
 <YW/awIN8jqUF0DPk@falared> <2505087.Lt9SDvczpP@marie>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="P3bGE4234jOKjTeT"
Content-Disposition: inline
In-Reply-To: <2505087.Lt9SDvczpP@marie>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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


--P3bGE4234jOKjTeT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Samu Voutilainen <wireguard@smar.fi>,
20/10/2021 =E2=80=93 19:25:49 (+0300):

> At least on x86_64 SLE, the module is in kernel-*-extra package, for exam=
ple=20
> in kernel-default-extra.

Zypper does show kernel-default-extra but:
| kernel-default-base | The Standard Kernel - base modules | package

That is not installed, maybe this is where the wireguard module is?

--=20
Faustin

--P3bGE4234jOKjTeT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmFxGlwACgkQOQovJ4Mq
XHkQJQ//SdGk2jmX/3IsGnItG8FOdZilKbl0L7olMIs7145utYyZS/VuM7wu5ZZj
cS2Jud1hIl7p/IVa2/lg1N1xiPyIp1EN/d3xCO5/QC0yMtT0r9j7q5Jbbaun4H4W
0rZ8672WqXf/cy8jI0QDwVE3FrxKTABk/ckciOfWGpaGMfg9VMEthaqdcsipJ7eL
sYnKkLZRstbgVXx0QoOClOFaiWgACyVeuQMkwHMD0w7dRdxcYQ7i1qDe7TofC/wN
IbmJcxcjBH/AryvQpNGPxEvzbPzEnEXr/YYZDwvmsv5blNz/kiYT+XTzmWCw4Ejh
v4xEwE0ui6zal6uEXjnQ5nFv9Da4w7lE56WPiNJGvP6MDI+9AiVqtmOltX0xzMPz
3nGYLHilgne/0/16nPHP8xGrDZ6+ax3t9kBWB79V1YNTYWYxig9VGcRUJ6wwrBHe
55Xkj6AFnJwk1lOm6BMpUlxiseaYEU7Sxzx3XUY4AEpbt73tGSfOd1r+n+5tNCnY
Czzd2bo6k2bidN7qrNNzj3Idhodlvg3aVnK6B2hig60OoJ7aj3xruA130b0spZZM
92MxNnGfgJkzaL62ARMm54Hy0+Ir9OY4JVpNl+eulR2/ERDzHHJ72zhen8RePGC8
AlqlOR4e5YVnzltvHB1yV8TjjsjQ9/DGy7BcNJMSDO9KEwirhDc=
=KbDz
-----END PGP SIGNATURE-----

--P3bGE4234jOKjTeT--
