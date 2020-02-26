Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4BFC4BA0B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 04:02:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC40821927
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 04:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="tOO6P1oS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hyBF1fmn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC40821927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 211c2b40;
	Wed, 26 Feb 2020 03:59:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 413b4c13
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:59:06 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5d4f6d6
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:59:06 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6417921C26;
 Tue, 25 Feb 2020 23:02:42 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Feb 2020 23:02:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=B
 twsmAY4mMq7H+PjSstKr47eSaKUdeJp9P7SCP8oRto=; b=tOO6P1oSwGqdMK0SP
 4U6t7+tddWIyjbPmNcOSv/Hb7fssHYx1c/TLBcyVUz/tlZ/M6h0oRYYRc1yfPYxN
 YpvRTeHEBHPt4s3Kge+qMSVYIJLBR/gm2GgQ3F1hBDcRFUuHk4lo77mMemLPx8K9
 WCrQj5VGxm1uRl8XSollvQJPb8jw3CVYFS7jgg72Y+xmMC1y0wmlRv3MCo7/bvlb
 H3a2/fvRfnLoYkUsqqvT0E7NBXd/2cQiIelnrMho9NF6TWkgaGmiqtgSL2w9AyLW
 ZHnLiYu0cv1OQ+U8fszmEX+e6+kdlwrlLE9PI9eGTG1AXVX1maGW9VxLZYN3ZKhO
 A6wow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=BtwsmAY4mMq7H+PjSstKr47eSaKUdeJp9P7SCP8oR
 to=; b=hyBF1fmn4PsTzoQ8cku/cI2Tits19yS8lZatUXOosq07lNJTieuw7gkbE
 oWnSd7dfCx0GmQ3OUgiGnFScx/XgHAEnLIePOBX95WDwW0OlSvKkHM3SD/6gZFRW
 mVGVoQI5LFIU9TVg7jT9y5386KiT6BI/f2USZodnhJ/i8m6+9kBloiKvpJqTmuAs
 5C+tnw/TFOXnKbn7GnPiWR3/+fU7hPyGp70q0ccHB6Gj27RXzeeiSeuES/VBWH5R
 Os+SZlb77NWoPrqZH2S+0yOK4oNfyt/VTx1GryroRTw+/kHDRUCM1NjfsicdbwaH
 3FOQvRt8mGACUwgyKZx8A/+K0GZWg==
X-ME-Sender: <xms:4u1VXihUaSWWNPiuyJPC82HgjYk0uaCd5qZPOnmpVmh02hagzA62XA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:4u1VXqQxLpYPA13Fv9oeZ2lqHBeE51DNe0GKCeUG3yI2c3icfligjA>
 <xmx:4u1VXpk_1JlTvL7h9uEosn2PAJYU97PJrmAFHcEEjxPXtdUqwH-9MA>
 <xmx:4u1VXkYS8IvAOADHNljyvnoCmCmgWKYtggjmZhOfqLhZtWxoULCJpw>
 <xmx:4u1VXgZGsc5TaQGxUjOkkmcqCfVkLPDgFj6jLv6MycA3U6u3iOhAaA>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D10993060FCB;
 Tue, 25 Feb 2020 23:02:41 -0500 (EST)
Subject: Re: [PATCH wireguard-android] remove <item quantity=one> tag due to
 no plural form in Japanese.
To: Eiji Tanioka <tanioka404@gmail.com>, wireguard@lists.zx2c4.com
References: <20200226032442.2668-1-tanioka404@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <645b0656-dacd-adda-19cb-e64aaf21c356@sholland.org>
Date: Tue, 25 Feb 2020 22:02:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200226032442.2668-1-tanioka404@gmail.com>
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

On 2/25/20 9:24 PM, Eiji Tanioka wrote:
> Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
> ---
>  app/src/main/res/values-ja/strings.xml | 6 ------
>  1 file changed, 6 deletions(-)

Applied, thanks!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
