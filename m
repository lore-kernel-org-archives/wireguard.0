Return-Path: <SRS0=LuSS=P6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810A4C37124
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 02:22:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94E0F2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Jan 2019 02:22:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="FmZi0Oxm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ntnSMNTp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94E0F2085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6715baaa;
	Tue, 22 Jan 2019 02:18:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b9fea58
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 02:17:59 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2d32ec6
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Jan 2019 02:17:59 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C203A21C9C;
 Mon, 21 Jan 2019 21:22:51 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 21 Jan 2019 21:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=E
 iUdICU9QfSTjHF2Lrx/q2FMDSMvnDtCigufnwgvfNQ=; b=FmZi0OxmpntFyZxqj
 4XW8qtTWnmg72GpfyhUN75pvo9NPISinz+Fx4YJ//kjKKEnKNLM9VFSCUuvm5bz7
 H0Mi/QcE37e11QTEYDkQl+Q9Dx4u/llsr5ubza4C//EEzpZm+e0vJJ6V5wGUtmT0
 jx+c4hBLZVidEcPBIsNoqtaeCGO37KHLqS/AOpT2ADpT5Dzx7+eNOOlKcIg9LrxI
 WX5s0pQW0YnWRopzdFIEENacoosyvRUk666vHscek8VB3N7qHHLvQUoEhJg5ZLsK
 2ziRqJ83zZf+jDAvSLoN475K7j2IfWrj3XVlPGdv56CXP38SLHIE8x6OcBiBxZxm
 2LFKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=EiUdICU9QfSTjHF2Lrx/q2FMDSMvnDtCigufnwgvf
 NQ=; b=ntnSMNTpLktyG9tInZ06WmIWgn8ei6E2GyUkUmsFUItkrA3VZvkE3HJZt
 5gMMALNPlNFyMjxlb80SAsC1oFB4xXmNSoNpMXWYuITFAJvloCTptEiDKXiVYGpx
 XAyIvkS1azyNrwYDS2hD/D8yBq+i+EmV7EgTl2qTHeEaHWdMbQgxabKZV/RAUa2y
 8u0WnBohxd0FwerzBJ8gQ5vh764Gq7hWzaIvFrpe6zDRpJWx1ZgjGMyCTFeYLSRa
 z/ImZIc1sPL6dousGVVkXYSypsAlYE/tXeeJBMIDMCNSgjdya9uBj+jDVe6Zlr5C
 dRo4QTyva32BoN8zKSFtbX1O/BkBA==
X-ME-Sender: <xms:e35GXIeLJk9lXUQ8I-DNQptWyAZ6sv4I0BRkF5-7cNEL31kXwARYEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrheejgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
 tdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpe
 furghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
 qeenucfkphepjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgep
 td
X-ME-Proxy: <xmx:e35GXOenXaiY1-lvTIa6pu1SR1XKsJWDqTfstvBYx6_SDIIbliVV7A>
 <xmx:e35GXEj0WLFw8hgzNUTATpe1--DcO6TmB93Dd9nGC_CSAqzFEg785Q>
 <xmx:e35GXCS8tx9txBcW1xhm9CICn8bo3OCl5ebMzK8TB-pu8LpxHFVjYA>
 <xmx:e35GXDrzyAk8R1kYLQvV_wzsHRkQrD_LKjte9Zr8qXgWJ_oe2ACZGg>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id BEC94E4652;
 Mon, 21 Jan 2019 21:22:50 -0500 (EST)
Subject: Re: [PATCH] %i is not a valid format specifier
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>, wireguard@lists.zx2c4.com
References: <20190121233840.6401-1-alex_y_xu@yahoo.ca>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <2e839d4e-7311-15db-ae1e-906c7e046f29@sholland.org>
Date: Mon, 21 Jan 2019 20:22:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190121233840.6401-1-alex_y_xu@yahoo.ca>
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

Hi,

On 01/21/19 17:38, Alex Xu (Hello71) wrote:
> ---
>  app/src/main/res/values/strings.xml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks!

Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
