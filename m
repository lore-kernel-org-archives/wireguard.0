Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2191C4BA0A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 04:08:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7092082F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 04:08:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="RcYXoSSH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MirheUAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7092082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42898b4f;
	Wed, 26 Feb 2020 04:05:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73f107ba
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 04:04:58 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e79bb02
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 04:04:58 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2D96C21C08;
 Tue, 25 Feb 2020 23:08:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Feb 2020 23:08:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=q
 HvSypfPKbXWkYV6ECrcHOxOFDiYksQslFiBKkWKsZI=; b=RcYXoSSHQXsY8x03Z
 PxdwEBidNW+QONoKVPmFxvzRSEXZvdkGYIx+5KKEASNcHUJYZZMT/H6v8k9gkn9V
 uD99rHUyx12Tzbjn3R5JujfytBjX51LVvpYDv6fmkIy+vNt3c15AnnHEOPu5N7GL
 F1SasMS2gRXp+qFDnWX9gUgouEy938Txci/3Kv+X1Up3fWwKvdOHQw5TOyTdEvfN
 WT13AWZ7hXJ3N64Fun1MJc4eENhPo0InYcg62Y0U0h/rzTx1XiQ4Yes2IYFrTZJl
 sq1jOEfx4wh9gT/J6Qvq3rYnpKxfW/AzGdbpt3brAfY7CK4j5gJV1PLhaKL5TcuO
 VDL8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=qHvSypfPKbXWkYV6ECrcHOxOFDiYksQslFiBKkWKs
 ZI=; b=MirheUAjqoqg/yZcneKCdoooQBjuR5evmEqUH1Im8q894aFWttpcGipt6
 S6giYclc0U7TenDqP+7tiyn+sfk9n/FQ7Bu77oFP1hJ9ZAUbXvjY1joMrJLqXlMI
 9CoqTjSukCkysjgd/mPSl9Scsa5SF13r9Yu1uv+F50aMM4dHZ88oQ0VnYgsCCo6G
 IjIDJkIAN90UcVW6LzKY6HPd4CCIER69hsHRqiqNCWIQ4rk1ZJ42JgCEFFZL+xTY
 cT/L5SXCDhFdHODHp/d7sIpnmBCoMgISuPiXOynO/zLxxJyE4Eym5bL9S5NoXQkb
 ESLDMAbNwmTrF0ACzYWQEChyKVdkw==
X-ME-Sender: <xms:Qe9VXtMwROBnnXuVkydhqoH9ecGmlziOhRDkGwNvrzrfM2D-7xw7VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthejre
 dttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehs
 hhholhhlrghnugdrohhrgheqnecukfhppeejtddrudefhedrudegkedrudehudenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Qe9VXjKsR7uAMPjY65pG5cdeAXDP9RSOBfaRjf2ZSSUCvkRjH2zaWw>
 <xmx:Qe9VXoZZq7dzdUG2StTVBh8ecf_uklmaRLWxEKU90zOxxqfvcXUqZw>
 <xmx:Qe9VXkKGs2RPrYCcrdRW4uAIN0YNJOm9YKry1tVrz17ftrFYc1_BIA>
 <xmx:Qu9VXqjUD-FpU_4lrO9EuhSOuALfHNPVn02Zc4OpyaX4VAesyfVKfQ>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92DB13060FDD;
 Tue, 25 Feb 2020 23:08:33 -0500 (EST)
Subject: Re: [PATCH] Add Simplified Chinese translation
To: srb12345@vip.qq.com, wireguard@lists.zx2c4.com
References: <20200225040252.41-1-srb12345@vip.qq.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <28d1b999-c7f9-363f-767e-83803e8741a8@sholland.org>
Date: Tue, 25 Feb 2020 22:08:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200225040252.41-1-srb12345@vip.qq.com>
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

On 2/24/20 10:02 PM, srb12345@vip.qq.com wrote:
> From: LilligantMatsuri <srb12345@vip.qq.com>
> 
> Resend the patch. Please ignore the patches I sent before.
> 
> Signed-off-by: LilligantMatsuri <srb12345@vip.qq.com>
> ---
>  app/src/main/res/values-zh-rCN/strings.xml | 174 +++++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 app/src/main/res/values-zh-rCN/strings.xml

Applied, thanks!
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
