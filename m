Return-Path: <SRS0=tdjr=OT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E992C07E85
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:05:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5763D2064D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 10 Dec 2018 02:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="S4cT3nd6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZSO19Oqu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5763D2064D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df4cccbb;
	Mon, 10 Dec 2018 01:56:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b9db89a
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:56:16 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27e83732
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Dec 2018 01:56:16 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2BE9221B90;
 Sun,  9 Dec 2018 21:04:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 09 Dec 2018 21:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=6
 D93nb/hT0sJq50aRXPheqYiEkqYF75YTzQ/fHFFZvk=; b=S4cT3nd6DGvvwNTwX
 S1iYjG5v4UkivP2tbnxIvEPA1FA4UyqSRYvMPRKl6DiJiv95PkdszExnM/F+kic/
 vlnIWfmiss0SnjvTavlK6ispQNuyV9SBQ3cUqrgSQ7wUrLhGMFoEj8UT3CX0jpVW
 v48vb8lgjbQRBNqNKG1yuQNxZ/haSZF3DnBUlkJgZHDfOb0YVZqBNZ6c9TpXPGF2
 /v4D5yVM8AU+cBKmW9zjdNVXHJ5Jh6nkSdxfpTed0fQ/pf1Dmsg6cwm3/T0xWrw5
 AvQ2PQswWrYXpvCfumkwUEOKomAVu9FBPSlaK04/dMYEB52auRIScHfR0bEKMdAD
 4U1dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=6D93nb/hT0sJq50aRXPheqYiEkqYF75YTzQ/fHFFZ
 vk=; b=ZSO19Oqu2gFJyolvin5slqZ7T5YMcIZ8cA0pq60e588WeeFpoi7yMRzhE
 aBl+KSzZ9TYTralygdX6a/HNeIbNUqxiwFvSkL3XjTiti+oFncS51gO1K6CeIiU0
 n3opd9c49L1WRdN/cla6LPPuyetfhcM1LpUScGkw8UskWkn+n1U3iATWMTplh+ap
 EY78Gu/oJBZi86vV0ST3wB5TdOggYHPF+U8oEo57GY5/rKhwXSf5JJAGIgnKpvUH
 I/ytJtkMImk4A+oHVgv/XwU+kZUX3da1f47Ti7tDBNITYRIqWGzOTmr+ps1xqmfD
 xLXrga7rVwug1OeR69fxjqjhE8R1w==
X-ME-Sender: <xms:xMkNXMM4_ie6HQUuJqBC6V1GtW5HL3PrRyQoJnuH8vzywL9ycJ2Uig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtkedrudeggedggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
 tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkff
 gfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcu
 oehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucffohhmrghinhepiiigvdgtge
 drtghomhenucfkphepjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhl
 fhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptd
X-ME-Proxy: <xmx:xMkNXJuSIIPmhJ1YP29QlfW6PWBtakT6UPVgZDmMzeCdNE37vKBEIw>
 <xmx:xMkNXL7julbOTNZOEgILr6-Mtu0PaIOYcg2COXJzXRxnjcyrV3eY9g>
 <xmx:xMkNXMX57dutphFhQRDjyaXKSiA85pUyQDuWuuYVOk84Pz2n5I7jcQ>
 <xmx:xMkNXF9qQRK5ZQVwjSFUSZqQzT63C82jeqO3wRU7R65EbMqoBEPYlw>
 <xmx:xMkNXAmLLBj2e9oENtkhT-HOGti_UP3GpgBq5lLt2RtfV4_mxBYWug>
 <xmx:xckNXJDV4IkeYo47FyWM5Z_fY0XId9SWT_i6yEnbVDRXmOfdUX154A>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 34F06102A0;
 Sun,  9 Dec 2018 21:04:52 -0500 (EST)
Subject: Re: Should wg-quick with SaveConfig accumulate IPv6 link-local
 addresses
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, xand@xand.uk
References: <c430b4be-fc84-40c3-c9d2-5d5833d8ae89@attglobal.net>
 <6a703cdc-13e4-4881-7bb5-072b0f576a3e@xand.uk>
 <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <1b935975-d810-fe67-a7b3-eb89e4c625c3@sholland.org>
Date: Sun, 9 Dec 2018 20:04:51 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qw52LXqgJj=yanmyB6Yzm1Q_cYbe50ZYLNT0b5dzbu+g@mail.gmail.com>
Content-Language: en-US
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On 12/09/18 19:15, Jason A. Donenfeld wrote:
> This is mostly just a CentOS issue. On older kernels, we don't
> successfully disable LLv6:
> https://git.zx2c4.com/WireGuard/tree/src/compat/compat.h#n583
> 
> There's probably a way to backport that tweak to before 3.17, but I
> haven't spent time on it. Feel free to send a patch, and if it's clean
> and fits entirely into compat.h, I'll gladly apply it.

You can also work around this in wg-quick by changing up_if() to

  cmd ip link set "$INTERFACE" up addrgenmode none
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
