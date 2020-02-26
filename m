Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C51AFC4BA0B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 02:56:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C45C24650
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 02:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="MNGrotMX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I6UzXoC/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C45C24650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79465e65;
	Wed, 26 Feb 2020 02:52:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b9d863d
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 02:52:53 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 54f95488
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 02:52:53 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 0BFD920F5E;
 Tue, 25 Feb 2020 21:56:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Feb 2020 21:56:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=J
 ErlaCZtVXIGjltLxFgEOQpqcjqg/edAc3Je9Q/Gtn8=; b=MNGrotMXv1H+vfDOn
 zMVxdt7t14iDnf+TYA7FF2SGmF6MFwAMG1ZOgTluFnY9ZkhyQVTkyHobgS0m6A+2
 Zba3uZmESZiPfpGmtBz1PuiwC3Ag7Z0mBy3mnoVfryop/EpBrNuiQ2svP6nNQ5/N
 8cRKf9HFGs+KFV4nwJOtxzsd0aOi2U5omhox7ZvyYpE6BXUvqD36IrjYUsWnJqUi
 xPHlV7ylULkPrKGyqqYQuIqaShau4q0cBqZ0sqRboVe5k5h4zw2HyUneC0WzNLDh
 kQjofueTygdjLpPQOVHPbIjeL95rOjVs5SFZjnk2Gtm7hfIiK/i8GvClG0+HsVnm
 aLNTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=JErlaCZtVXIGjltLxFgEOQpqcjqg/edAc3Je9Q/Gt
 n8=; b=I6UzXoC/ZHPpF2I58br9PC5/QFcYvkg3oiaMxlqnDgOZT9pjiGhRPiGrp
 H6+0xq4yYNU2UjMODeqllDYnROLcItpZe2CKr166NmwfjrS6iQKwIq1CZVSR5V1v
 a76NjS3zNUk46XTX8EZ9guI7BXErvHRTcTiY6XzdMWbQt6c6GWWKoO2RhnOcYlSR
 FFpFbcT1a9WRJJrHr2b2KpuqGkxIIvLRmglXpaIB87W3G9v29VbSR5iiA+daJUa4
 8ACUn/LN/YHiJcz0ZNxIe4ApMviK3O4AMjwpSk9oiO6lOjX7jX1BmbVhcTIMuOQt
 kpDUZ1Lw9wQs1Pyox4kOc/xbLS/Gw==
X-ME-Sender: <xms:XN5VXnSAnTANCBkJsmBN0PdkZY3cL1x5M9BtNWMx8wG14a9gVT_U8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:XN5VXmrvPLDhadqp3Wp4wU_b57F6k-fLrF7q2NvUFQ0ZY5ca5kxdTA>
 <xmx:XN5VXl6gmBYRXEccTFHtp7ywjYEwevB4VHa5e4I6_qPgPHBwEApcbw>
 <xmx:XN5VXoQZy7QtFQcyLAuTX5IhVg_LHEX5e0pgyyJ88ttDUc5uXntqtQ>
 <xmx:Xd5VXmQe-1X45Yxg0U7MK5H4CEV-jOkIN75g_ZX8ZNdf5ElgEshf4A>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id AAE303060BD1;
 Tue, 25 Feb 2020 21:56:28 -0500 (EST)
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Eiji Tanioka <tanioka404@gmail.com>, wireguard@lists.zx2c4.com
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
Date: Tue, 25 Feb 2020 20:56:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
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

On 2/25/20 2:13 AM, Eiji Tanioka wrote:
> Hi Samuel.
> 
> I already translated in Japanese, but I didn't concern about plurals.
> 
> Japanese doesn't have plurals, so does "values-ja/strings.xml" needs these fix?
> - remove plurals
> - add string resource that have same "name" attribute as plurals

Resources that have <plural> tags in the untranslated XML should use <plural> in
translations as well. However, the only <item> tag inside them should be
"other". (It should look like the Chinese translation did before this patch.)

So the only thing to fix is removing the <item quantity="one"> tags.

Thanks,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
