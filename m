Return-Path: <SRS0=38ps=PI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD47C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 16:28:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46AF1611C7
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Oct 2021 16:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46AF1611C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=smar.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d05d8bc;
	Wed, 20 Oct 2021 16:25:54 +0000 (UTC)
Received: from airi.smar.fi (airi.smar.fi [95.216.48.100])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id de010609
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Oct 2021 16:25:53 +0000 (UTC)
Received: from marie.localnet (marie.smar.fi [IPv6:2a01:4f9:2a:64d:2000::30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by airi.smar.fi (Postfix) with ESMTPSA id C740ADBEDC
 for <wireguard@lists.zx2c4.com>; Wed, 20 Oct 2021 19:25:52 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smar.fi; s=mail;
 t=1634747152; bh=3KIeu/2DOGezpMS5Xk3GRZWv5rS6WOc/Si5LsV1ClM4=;
 h=From:To:Subject:Date:In-Reply-To:References;
 b=rtNE2WeTPdSJf5dGtT9MztPU8k83oEVmqYcAm9OJRwUAwUvr7BsHYc374LVWhkUzB
 sNeUveesR/RidS4nA2rsT9OTXfarwrmQBsECVNsmYvnrJkoOWowXP4lOwClW3uh26D
 wqdJtpp1peeqq3G180SrIIgpLvPuCEg9L+8yKqeM=
From: Samu Voutilainen <wireguard@smar.fi>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Date: Wed, 20 Oct 2021 19:25:49 +0300
Message-ID: <2505087.Lt9SDvczpP@marie>
In-Reply-To: <YW/awIN8jqUF0DPk@falared>
References: <YWFuczOf1dM3B4Pt@falared>
 <CAHmME9off=sXrL0hjkGvOgJUtJx6oCvhdAycHT=bTQfUtQjO=w@mail.gmail.com>
 <YW/awIN8jqUF0DPk@falared>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4163039.ejJDZkT8p0";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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

--nextPart4163039.ejJDZkT8p0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Faustin Lammler kirjoitti keskiviikkona 20. lokakuuta 2021 12.00.48 EEST:
> Hi Jason!
> 
> My understanding is that it should, that's why I was surprised to have
> to build it. But apparently not.
> 
> This may be related to a specific kernel from IBM LinuxONE cloud
> infrastructure?
> 

Hi,

At least on x86_64 SLE, the module is in kernel-*-extra package, for example 
in kernel-default-extra.
--nextPart4163039.ejJDZkT8p0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEzQiQ+Sk/d1O26r4vtNtW2rUdxQ0FAmFwQw0ACgkQtNtW2rUd
xQ08XAgAgEnEC8lorbZ0knhPhg7Pz8IFArM4p3RmbvY1VcAxv12s6Vs1eDWZ2EOB
adNpD2NFqyOW5Wv55zxYCIyabg8yzhmENPGQGMmtLmzBySkOz+l6wnhk4fxfx/um
is/L6WnoBYUpy5LV2oYMVblOgcvV+a2oXv97Vlne+/NyUTSxYxtvCGrGbaa4DRwh
TnQ3CA5tUtY7EmCWx4cb51BbIfp0DteaGN/Q9XM/YedFrKZUaMt6opSAtfC/s4BV
abKAciz0oymTqwOK9hrtEO7qm9Lzwdldg8rPHH7InmpoaoNH6metAikPncdRS4+R
Ujay/drMDLXec3QAqMI5ZRciIJSO9Q==
=8znv
-----END PGP SIGNATURE-----

--nextPart4163039.ejJDZkT8p0--



