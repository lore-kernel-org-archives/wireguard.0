Return-Path: <SRS0=PTk7=4O=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6585FC4BA0A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:59:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB89A21927
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Feb 2020 03:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="pjaXz/ky";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mdTtt3wC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB89A21927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b95f5c08;
	Wed, 26 Feb 2020 03:55:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8f9bf62
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:55:42 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37351405
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Feb 2020 03:55:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 535CD21CBA;
 Tue, 25 Feb 2020 22:59:18 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Feb 2020 22:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=1
 0sju+DJWsAUfGP5T9seH3OyTHr7m/Z1CJZnp3hNO6I=; b=pjaXz/ky4zqoMgbZC
 gWs9p3kIQStptJA42prQ7CD6JAUhyZwWMYJPD4JQOP/OTJzLyABqDGGn4IZ3K+o9
 cHc4dUiFezB42jZj9G0q139C02o5lZCYQRnWbL7ovxul1yC/4dbHxNGHGb4jMx3e
 tuxOKDXnjMT7uv+RmnNLwOi8A1ufgJtCfnKsdaO72V0c4K0fqZ8r+96Pi4yTNoMa
 jX30lr3uenRTDORtOxBOjNxNzsoZ26HRQg2xhKdc6A/5EzqL9e2qioXdhYdJfNCD
 C/kaiGDQIsgYmJ/7UL/vDrTMLi/1mHkz5cXfTC6NnhmgZnUfg5RrlJPd5oEq+3Ea
 EHmvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=10sju+DJWsAUfGP5T9seH3OyTHr7m/Z1CJZnp3hNO
 6I=; b=mdTtt3wCpPnC2QoQHx+Mxu5EcaG5MJ98f2ZVQzsMufyBRr6cHzXF/1DDi
 DwP8jcnfYDAOKMV49j6p+lDeqQH9CnIMTcaXG/8HA36r8UxUkKu4BGqDgb06PTy/
 a5MkOXYr7FDypFoRfNNEcM3Dm4a5WnYF3VuNjPHDHvPOjQhs13Xd7bm4Ao22luV6
 4AHpt5uuHw6rJSQlAjyYxq3EQAwaAOQT9otybc0YDVU3Mv7lHmNLGySlXez3tzIa
 TClJWs2LtxmwSr2aWiW3h+XLRx72ZflfrtCOYDaO1gVhpNXIKxxKMzGarL5ac/AE
 e78wnTTSU/HNbSJZNMaWgDB1lSIew==
X-ME-Sender: <xms:Fu1VXgM8s72z3ZYGMokSurKviaYoUpId3v1hb-egMfksI_WtPH5EfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleefgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesthejre
 dttdefjeenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehs
 hhholhhlrghnugdrohhrgheqnecukfhppeejtddrudefhedrudegkedrudehudenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Fu1VXsFVo0MmImKzLIIsdQwoXda4Y-bDx7Tq_5bcHhMg_V0wpo4sLg>
 <xmx:Fu1VXujyM0eChRr6IxEeHOt-BYvJ70GmIoMXmdcleuf6Qs2HK_NvIA>
 <xmx:Fu1VXgS-6BgGbgn1q2HLua9NusUKG3bl-Y25XYworC44W4-pOw8ZBw>
 <xmx:Fu1VXg55lPjJdswZEZ2ZZL6h2VP6DA33brd4MvN1dwaviMGifdWaWQ>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9C7830610DB;
 Tue, 25 Feb 2020 22:59:17 -0500 (EST)
Subject: Re: [PATCH] Update Simplified Chinese translation
To: Vasili Pupkin <diggest@gmail.com>, wireguard@lists.zx2c4.com
References: <20200223111248.1083-1-srb12345@vip.qq.com>
 <8b65014d-b6b9-c933-1ccd-d92d9f28ed23@sholland.org>
 <CAA2ss9F2XipJeiD0gJUn7Zz=f+JyLij4UQ4rnQ+dCND=UA6BUA@mail.gmail.com>
 <e0c0aa85-ebb9-7adc-a9dd-fbd91c2d61c2@sholland.org>
 <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <bc47c4f7-4aa4-fc6e-8f3c-34366c756236@sholland.org>
Date: Tue, 25 Feb 2020 21:59:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1eb99bf8-f07e-9b13-f543-017b14a3df5f@gmail.com>
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

On 2/25/20 9:44 PM, Vasili Pupkin wrote:
> On 26.02.2020 5:56, Samuel Holland wrote:
>> On 2/25/20 2:13 AM, Eiji Tanioka wrote:
>>> Hi Samuel.
>>>
>>> I already translated in Japanese, but I didn't concern about plurals.
>>>
>>> Japanese doesn't have plurals, so does "values-ja/strings.xml" needs these fix?
>>> - remove plurals
>>> - add string resource that have same "name" attribute as plurals
>> Resources that have <plural> tags in the untranslated XML should use <plural> in
>> translations as well. However, the only <item> tag inside them should be
>> "other". (It should look like the Chinese translation did before this patch.)
>>
>> So the only thing to fix is removing the <item quantity="one"> tags.
> 
> It seams that russian translation is very basic and not utilize quantity="two"
> and quantity="few" forms, without them some plurals reads odd. Do you need help
> fixing it or it is done on purpose?

I don't think it was done on purpose; likely the translator was unaware of the
additional options for quantity in <item> tags. I am happy to merge patches
improving the translation (which is really up to your judgement, since I don't
speak any of these languages).

Thanks,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
