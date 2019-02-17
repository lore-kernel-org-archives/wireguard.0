Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8390DC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:22:30 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B037121917
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 17:22:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="Zgg7p/BI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="zQi9bF2o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B037121917
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed7fa73b;
	Sun, 17 Feb 2019 17:14:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c9865083
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:14:07 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8264cbd
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 17:14:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 6B47A1628;
 Sun, 17 Feb 2019 12:22:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 17 Feb 2019 12:22:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=j
 dqpF796TK1KU+eRhq5bwWalD/UCmKauiUctOSRHWmA=; b=Zgg7p/BIHX1ndQuel
 lAQRqHNdG9t6NFus17ELmDX2Mbesaxv84ccozl9wLEV7ctUG5+UAZ9ZN2VH9GTw8
 k+CLGDqWOiELPX4qIDAOb1gbv7UjJb2vXfz5R/Y3gZ4RA1iJ2zwAy61KUnyvTpHh
 Yox9NE+WWgn6jGTx99zZu2fcU0SGL69Jwb3d9FG67mmtNdR649Wc7SgB2zSRcnYD
 u3lFwoR6rhh6nvrtQnqHigu7Ax4ek3ChFUH9kdert9UEX7SwrORqC4rNnLw9KYBp
 UvUGg7RYdHxIw3Jsuo/ojjhqy1C8emU6+RGx0pxm8vkg6gjkpI64AacRYjkhj7j2
 loaxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=jdqpF796TK1KU+eRhq5bwWalD/UCmKauiUctOSRHW
 mA=; b=zQi9bF2oaSn0nn07vzBB+pr1+Db2+WfPgKde4xQIrJxVCI0elzqEF5GfY
 +Z6zVOY2RAegRhZqYZIsoI25scgX+m3QzwrRzkqF2FVHoVOPOJ6NjZCUL8kLaxlB
 vNy+9lDmrgJ6W3xovGtM/vDqHe4LJyvlfF0L0/w0v7mWiKp4ptL4rtvfbVillGJ3
 yDvNljtc9PwqRtVw43/RwvL9j4cbPdZDE/uChgYm9zxwfGDDl/Ki7EEvedxHjjsV
 LSJdo2BJu7PEyDQRl2lllhNnwHISvNFc6OfehNCDv16NudDA6ceIb72fB8KryxL4
 DSq2DXf3MRpOrI7ZTRQv01I198AcQ==
X-ME-Sender: <xms:T5hpXH6lYsMNLLNutMXe3EY3R6alN8QaQVgyF2JIUe9jIyl8KtZEaA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrudduuddguddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecu
 fedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkf
 fffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhgu
 uceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppeejtddrudefhedrud
 egkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
 rghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:T5hpXBmSZhSBnc7atzZK5v-DxCnkgE3hKqlw3NiPXaKK8n7oSx3QQw>
 <xmx:T5hpXGWNa29Y13CgHRhlvvQ0aFX036NPMm2YZTEJxNv4NtYjpNIOmw>
 <xmx:T5hpXL4eozP9p6yyLfQOEemi_LFKL6rkye6xGoIRKT4MgVzY1vc_5w>
 <xmx:UJhpXNiYwQSjlVm5WXBQYSHaPuMhcyRvS2W2K0ex0WYlBB-bZ6CMAw>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 32748E425A;
 Sun, 17 Feb 2019 12:22:23 -0500 (EST)
Subject: Re: dynamic reload of configuration file
To: Raffaele Spazzoli <rspazzol@redhat.com>, wireguard@lists.zx2c4.com
References: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <9f8a7d82-051c-67d5-0a45-04fe400d3f34@sholland.org>
Date: Sun, 17 Feb 2019 11:22:21 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOeLqLQjM1AQPpi31F_Fxvv02tFgD+27qFGjnLnW8KFcy66Kw@mail.gmail.com>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On 02/17/19 09:21, Raffaele Spazzoli wrote:
> I'm using wireguard to build a VPN mesh. The nodes of the mesh are dynamic 
> and can come and go at any time. Is there a way to reconfigure a wireguard 
> device without restarting it or losing the current connections?
> 
> If yes, how can it be done?

Yes, please read the wg(8) manual page, specifically the `set`, `setconf`, and
`addconf` sections.

Cheers,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
