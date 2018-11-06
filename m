Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA35FC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 07:04:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0F620827
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 07:04:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EJ0284v9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0F620827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=testtoast.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d5be4c8;
	Tue, 6 Nov 2018 07:00:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbeec451
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 07:00:12 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d63c01b
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 07:00:11 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 0107A222ED;
 Tue,  6 Nov 2018 02:04:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 06 Nov 2018 02:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7i9dfP
 ZsF4MCbsYy+Cksw5jzO+pG0a3oPC9i+9SixVU=; b=EJ0284v9ZN+dGIq6NmO/Aa
 dr/ieUytb9dnRW1x3vvFxOGYGwss2QLHAH68ppPDcHxA8ZKdH/Cl4Z2PkKWeoCSh
 4/B1whVLNWNYMrQ4Q0dVTYnYWU/VaTlPZoc9ZOjqE8DGh7QWpiv0VBd1FDR7veZy
 /rwXZ07247qF3FqGwUAh3KYZkeBpvRj0EDZf3J8zfqUX0y7ql/MmoSn3AgtIOJgI
 EALrN5iJdpSk5Xu+jqtEIManQXK4TJE1fZCIJw2WRtEaRfcgdjxMwk2XQ9DFrKfY
 ewtUM/vL7HPJvTtYZGOLmmwOazS7SoAUdkE3Ob3+S+Gpm20MqT33VBKEB81pCvDA
 ==
X-ME-Sender: <xms:_jzhW9UYtWhFLAzhzD_aMJ8S1EiraJA0rI5r-pMNHgRJL60_IWq-xg>
X-ME-Proxy: <xmx:_jzhW03JBFEFwcEebL0qtF-2a2ugt2jHo7qdmGXSELthmxh0mt0DCg>
 <xmx:_jzhW4A93Sga9kYMVtHo91QiX04aRfgIsqazrsWcjlxyeInMhyTUWA>
 <xmx:_jzhW4d3rTPr997rKWuAcuJawoK8bOM-OMLuqPLkdROcbt2Ybk-JUg>
 <xmx:_jzhW95vJBT7o732L16JdhgE2mqSC2N8BNKLcNzX9obiLrEYWyfPTg>
 <xmx:_jzhWzVwcD3IQzP-07aEHwl6Meyt0ojDazqEFndM2PlldahrL8eqJw>
 <xmx:_jzhW7PgYf9vzNMQaQLGq5kiCtIv5sGNxhbqFzwWRresegF9LPDrSw>
Received: from [10.100.100.4] (180-150-21-37.cust.aussiebb.net [180.150.21.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id C00B2102EE;
 Tue,  6 Nov 2018 02:04:23 -0500 (EST)
Date: Tue, 06 Nov 2018 07:04:13 +0000
From: Ryan Walklin <ryan@testtoast.com>
Subject: Re: WireGuard for iOS - TestFlight
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-Id: <1541487853.25302.0@smtp.fastmail.com>
In-Reply-To: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
References: <CAHmME9p5bjmP8qSapvf1vmiMAk3BAkONjwXev3O_QtGYM=k3QQ@mail.gmail.com>
X-Mailer: geary/master~gd2d0fc7b-dirty
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Thank you very much!

Generated new keys and configuration on my laptop from the UK, remoted 
into my server in Australia and added the keys to my existing tunnel, 
then used the QR reader (nice touch!) to upload the configuration to my 
iPhone, and was online immediately. Great stuff.

Regards,

Ryan

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
