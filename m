Return-Path: <SRS0=L5sV=CH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A750C433E2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 23:17:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78ED207BB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Aug 2020 23:17:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="rkBMah9R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Mnuv/s05"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78ED207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88c284df;
	Sat, 29 Aug 2020 22:49:53 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 59d7b330
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Aug 2020 22:49:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8456F5C00B5
 for <wireguard@lists.zx2c4.com>; Sat, 29 Aug 2020 19:17:29 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Sat, 29 Aug 2020 19:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=WwHUk
 xuWk93E25PapDN2mjtLSVD68JW2oO8UhUQKc8A=; b=rkBMah9RwCZRZQrC8E0rF
 ZbdzZVol2O71TGSU4A/jIg0IS6T+zihDIR2Nwz7JKreFhTmDjFZjJ+I9NIcGW00z
 P02EzzNvACDS5jWdziqvXhnkotz0UM+vwowa6diy/VvpuQ/Q4anVssprRl/lMI3w
 nXniWhUIgTDw6n6Ya3PvmGZDMr7wPsYMnhU4HN0JKiwPMRAxwGHGVb4aagNW3lFm
 mApQWssAkTIPHlHYIsi5nG14WxqLAv9qNmoNobqTespm2xLEx6pwe6qiVqXVG7Tl
 Z39Q4O98eRlqlGH1x7bSsP0id5FP58XAkrT7VSHwJU3Hf7kl+OSkhB64H1PkbaK2
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=WwHUkxuWk93E25PapDN2mjtLSVD68JW2oO8UhUQKc
 8A=; b=Mnuv/s05X5Nal7Qf4bfvlQA+BFDf1X/LK4klzWlAVBao2yqf/O9/6IOTT
 4NVUmuaRldI9MrXt/6Rgo0rASg6HOziGWtuSpgTTFS5faJBHvusoceabHchMfyg2
 weckXtWBJAoBkhjQU1ALSdZh5Kh4UZqmvf5H5hyZpo9GrHngCYI1QfMSRqL8iCtj
 2EhEwhZ1l7xRMCVoMCjYXFoL7iDxliQ0wg895Mzgh9yvFx8s+ArqCyaVAU8K0Mi6
 alT0s5XMtxV909UCxj/+z7oINXBu/ERG1XqyVKEoJzuo9UrZ/e7LAPC+Wyx0whpf
 7FioLnVzi64p75+1vGFfGkZXrVhwQ==
X-ME-Sender: <xms:CeJKXzsMO3vWpnD0Ax-Xn5adBskcEhUahmC42kx3h93zxNEZjrs-sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefvddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepfdfgrhhitgcunfhighhhthdfuceovghrihgtsegvrhhi
 tghlihhghhhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejteekvdffhfeguddtjeeuje
 etteejvedtffefhfeghefguefhvddujeekieffudenucffohhmrghinhepshgvnhhtvghn
 tgdrvghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epvghrihgtsegvrhhitghlihhghhhtrdgtohhm
X-ME-Proxy: <xmx:CeJKX0dTez00XGeoUajPWsxU78i7BonGhbWtogjpX__pjqLxbdX5gw>
 <xmx:CeJKX2yXKEl2iueimHjSNHbEn2Nm1Q9sh0d2kYbNSKcDMHNZvAMH9Q>
 <xmx:CeJKXyPtxiJaWqOLqD4GwXInIidqKYd4BgK-Ws7QRaIUpcMp4VCEFw>
 <xmx:CeJKX9lZUyehvv_OtQLYATWXrJpSJo51KVfcqUqYw4BDdAvSVdcRKw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 3C4A5180183; Sat, 29 Aug 2020 19:17:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-232-g4bdb081-fm-20200825.002-g4bdb081a
Mime-Version: 1.0
Message-Id: <f4484f4c-d744-48ad-b78f-c6005936d60e@www.fastmail.com>
In-Reply-To: <CA+oXxS2pqyYht7gA71vMK69i8RK0soX9fi-FiXqAK2FfTnSB=Q@mail.gmail.com>
References: <CA+oXxS2pqyYht7gA71vMK69i8RK0soX9fi-FiXqAK2FfTnSB=Q@mail.gmail.com>
Date: Sun, 30 Aug 2020 11:16:45 +1200
From: "Eric Light" <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
Subject: Re: AllowedIPs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

I believe it's both, in a way.

As far as wg is concerned, the AllowedIPs is effectively an ACL.  Any tr=
affic hitting your wireguard interface from an IP not within the Allowed=
IPs will either be dropped on decryption, or won't even be decrypted.  (=
It's one of these, but I can't remember which)

On top of that, wg-quick interprets the AllowedIPs string and does other=
 things, such as adding appropriate network routing (the second part of =
your guess), as well as modifying any client firewall rules to permit th=
e traffic.

Hope this helps  :)

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Sun, 30 Aug 2020, at 04:07, Aaron Bolton wrote:
> I=E2=80=99m trying to understand AllowedIPs better is it effectively a=
 ACL
> that day what is allowed down the tunnel or is it mechanism to
> configure what addresses get routed down the tunnel?
>=20
> Thanks in advance
>
