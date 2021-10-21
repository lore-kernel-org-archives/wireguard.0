Return-Path: <SRS0=KwQm=PJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115B4C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 08:52:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 259E2610C8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Oct 2021 08:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 259E2610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fala.red
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06f2f501;
	Thu, 21 Oct 2021 08:52:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6293af0
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Oct 2021 08:52:38 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A34AE1C0002
 for <wireguard@lists.zx2c4.com>; Thu, 21 Oct 2021 08:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1634806357; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wjvV1qKwHnwFdgwtoR37zbQyoT3r7HuNgInvBfk0HgY=;
 b=j6FkyjslThUoBkT0LWTvveSGTF30lWJ+8bVqztYsxjZ3JlJ8UR17jC3n7hbmMdqQ6eUx7D
 npv1/9Vnn1fsk0WqJo93m2OTw6tYseE2ro+7gqY5fRMUDfBvn+kraWxsGmzC2eTpONu5ZL
 NKfKTo3aXEw3SH/JPAtweuyV4dSAyCep7Sk6FBZcJkt6m3Q/MqRdZOL5oGawqT6ICSoGo0
 T5zs3XbNdrT6QFf40d/Ub27b1qx1qrPYCh/eBWfNqpM01rCGc+1sicrvLVv0zo/0QK10Vn
 XoEduJ228ysJZrNT6YqTqf2SN9bvBHbOgv8jESAIomBiuw5BPYMNPQMiQ3bCDA==
Date: Thu, 21 Oct 2021 10:52:36 +0200
From: Faustin Lammler <faustin@fala.red>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <YXEqVJkZ3rJiWHZU@falared>
References: <YWFuczOf1dM3B4Pt@falared> <2505087.Lt9SDvczpP@marie>
 <YXEaXIkYfcSPO+tR@falared> <4688156.31r3eYUQgx@marie>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fSsghWwp3+GfyrjR"
Content-Disposition: inline
In-Reply-To: <4688156.31r3eYUQgx@marie>
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


--fSsghWwp3+GfyrjR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samu!

Samu Voutilainen <wireguard@smar.fi>,
21/10/2021 =E2=80=93 11:07:44 (+0300):

> kernel-default-base is kind of minimal version of default kernel, usable =
in=20
> certain virtualization setups, for example.=20
>=20
> Actually it looks like in SLE-15-SP3 wireguard.ko is in kernel-default ra=
ther=20
> in -extra. That was case in SP2.
>=20
> $ rpm -ql kernel-default | ag wireguard.ko
> /lib/modules/5.3.18-59.27-default/kernel/drivers/net/wireguard/wireguard.=
ko.xz
Ok, thanks you.

> If the module is not present, maybe it is not compiled for s390x. Maybe S=
USE=E2=80=99s=20
> support could enlighten why such choice has been made?
I believe that Jason already asked Daniel to check for it.

--=20
Faustin

--fSsghWwp3+GfyrjR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmFxKlQACgkQOQovJ4Mq
XHlOkQ/5AfwMc8sU6Cap99uvEMerK8/QSGJwtL54zaMMKD1iF9pV9P/qgAbGvtvx
56GKn3kO9Xo3QJ/WEV8pbZy9KgagwPCumkFhX2TtHPjqfWg5mjYEwbX20c/fGgks
16mYbe5pwFDJ8tWSYziGZDl/z5cID2E8/rhN7HvH+hrvNqwPJ40NGv/xDHrWYW18
tm107RNLFjcu+2sV577arV0MZsiiYdYZ8XVOV202rmBvR4x5a35h2tkkH/fhQ/0X
QT8oDvAi8KV+YnQsGdwkI+TxCgZVtfMsIfxgFAuI3b6Kk7UaQdUi4huk4FPDJR+0
4wnvE3fw5naNYQAcxKE7SGodle8BLbIMcMpD1L4OzS2yOJVCVZbdB8gD+FeBLO78
KJElw3TSZwbAYj14gTfjRBclKQvMneYhK/l7P3TjfYfwLY7x7oeTzMS6jFoBXxlE
ai06SZNNtC4LN6viM74cFpss1eHY38+QiUGva1g07uYuhBgKcDHgLADRhuxHVQRA
eLbG43Zpd/gnaCP9/DUrXjw+PqqbR+OK69o3gsEbzEGYq4fl40XSW/B4kk+7Bi4S
5T9pbO6TCSkopfsi5A7J44FxmHqkrxGqp/5tdjzNzieNznAbXCoKQe/0TIUpVbyG
7fc/K8aD0LcH8wtcvLBibDR1vnNAiDCn1rQdUHpOehhzlvrMvoE=
=NPjC
-----END PGP SIGNATURE-----

--fSsghWwp3+GfyrjR--
