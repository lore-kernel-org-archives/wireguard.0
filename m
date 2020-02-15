Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D476C352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 03:40:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9939D2083B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 03:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="JNDPpzNb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R+pB4w4O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9939D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d278cbc0;
	Sat, 15 Feb 2020 03:38:24 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62bbe003
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 03:38:22 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 525bdde6
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 03:38:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 231724C6;
 Fri, 14 Feb 2020 22:40:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 14 Feb 2020 22:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=T
 le0fpgh6nx5jmbQZTOJX1WealLpBL/Y8MIn52Ye1uU=; b=JNDPpzNb+h7ORUQy/
 fkcsyH2uAZCUT+tQ9VP909gEyqMMWG8I73XOmd/ua6B2rCLLh+MpuyFEJa0sWzy/
 ikb38Q5AiLSMIXhkHl8BeEoatHwec4L7FJYTqwQNidjU45+NJcQBR2I8e1A5S4Oc
 k6sXifslgxtYZPcU8Z0aDcLZu2eWMNs+nsGYA6UBncGuSW5RJdWkzVqcFZIalMvL
 0hFDIcdoQHjyPFUuVe8iX1hD6oGuUrtEViH4XchJuVvkWiafkCnuGvHZFWI6RYwZ
 TqVFQg+lIrbYojvYAoYOnnw71RhVncVzvUf54pDe7VawCcmR92cORyfl4Ip5Qmw9
 0D5MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=Tle0fpgh6nx5jmbQZTOJX1WealLpBL/Y8MIn52Ye1
 uU=; b=R+pB4w4O5Si3O3qd62skwPjkjDKeQ9aCbUuEQleOpTVVsLf4r6u1lguIZ
 rDfxJTPK7ZO34pQRcsZv/cgWFF6BnTOZ6hW6hK/gHr0Ct9Ym94LyHmjdvLSEQ749
 3uVVBgqM8BCHmpJ77dS7aOsC75ILpFNvswE7sd0WdxErsniwcZseMhCwCnKJZyib
 a2Odfas4WBzTMLf1MzPmC/eCQ0LJDTKckvJAiNYuRyS2MqjYrpH9IMy151kchmnP
 jweTyGXpJcqmKpHN/OifAGCiU8yDHCukf+izTlWJL+9XRkQccPhve5qjlRmreihw
 GqXoKGUB9PDa1mQWIy5HNDS6+PfJw==
X-ME-Sender: <xms:IGhHXuFBZDRjb3fFHQL7nhfkvVL5i7qol9yqtQBkkHTutQ-mv_X5eQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
 epjedtrddufeehrddugeekrdduhedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:IGhHXmMZeVYExkkzwmgznXtnBZ-J2AHOfa9zF7Ma3qwTEToFz1kXog>
 <xmx:IGhHXgdUtYLbx7zDZBcU0Ur9oU06BBtC2qDZEiyj_9jrL55AX6eeww>
 <xmx:IGhHXjs7yJ5gHVFhdYm4yKnBMB3ZVrS4jKrm2j8sct4xqbFiv6ICtA>
 <xmx:IGhHXsEuP6yamuX7t8rY04bDegEIKCj1OOUEGiiv64izlvK4a9uIqw>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C6DA3060BD1;
 Fri, 14 Feb 2020 22:40:16 -0500 (EST)
Subject: Re: [PATCH] Add japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>, wireguard@lists.zx2c4.com
References: <20200213103117.68943-1-tanioka404@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
Date: Fri, 14 Feb 2020 21:40:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200213103117.68943-1-tanioka404@gmail.com>
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

On 2/13/20 4:31 AM, Eiji Tanioka wrote:
> This patch is Japanese translation for wireguard-android.

Thank you for the patch!

Yes, `git format-patch` and sending to this list is how we're currently
accepting contributions to the Android app.

Next time, please also include your Signed-off-by: line in the commit message.

> ---
>  app/src/main/res/values-ja/strings.xml | 300 ++++++++++++-------------
>  1 file changed, 150 insertions(+), 150 deletions(-)

It looks like you created this file in a previous commit. Please squash your
changes to a single commit that creates the file with its final contents.

Thanks,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
