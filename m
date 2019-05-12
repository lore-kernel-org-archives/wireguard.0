Return-Path: <SRS0=HyV5=TM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84DC1C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 17:38:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC35321019
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 May 2019 17:38:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="hDAZnnkR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Zc1I3vKm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC35321019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e8f391f;
	Sun, 12 May 2019 17:37:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a0fc701
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 17:37:47 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 696c36d2
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 May 2019 17:37:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 61F862202A;
 Sun, 12 May 2019 13:37:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 12 May 2019 13:37:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=k
 F8fxuR/tys7RMOeyzuDgCp5/a3yLnnx/bwbFbAZKH8=; b=hDAZnnkRgYr27RrTM
 Fxi6CV74n/qikEkbwKp/TlgOuvm1+OFvt/jvlo00b6eqwcueXfiaEyyVNEIrgSny
 7ErGQOAMiwrjUQxtMkpgZlwcCp0BervMATXsc3hoVscbdEYc1R4Swx1+Eoi50Wdi
 /hefgyNfpdPvrf5HHYmPFma6OM1kpJE6Dy4T69mH7w6qunxBne2aAXSI4hCSrOue
 fMMV9sCan7mygR0C8HM9qkjB09UTw///vSLMLViTM5Um6GGI7nBfFn8+m444LMkH
 eb2TZuQQbkL2LjJIgrNb2OVdwY9WbMfPG/5/2+llLwujEXyrqSDpAEEHu3J0wKhD
 AJNFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=kF8fxuR/tys7RMOeyzuDgCp5/a3yLnnx/bwbFbAZK
 H8=; b=Zc1I3vKmAjGFXWTS8EBDJJa2BMFlFpNRZuPujU6fT+/32fB0sY6UboiAn
 4jQCEuBndqugI4RsP+nuRrEjku59xQ5kHB4BqmDZG4W+Jed87AMq+357q2pXOwH6
 G/Y0EhFaGHmvQi35Hr5JlIbbbSn22RhOjmUvS8q0P7a7b1cNcHVTDxsHaI2NLJ56
 C6JCWNO1mNonog3o8nnuafVUxGy6a/jdsRjl32ovz6OB/podw4aF1TylBXKDMliF
 NYEwYYAx4ag440ysTqVwHtOqBj01RQ/tbN8lwgiEk1x5RMHfgxXNZ21vKzpTF7Ll
 82NNRFMKuOymtRscu6lJPnmqs7RUg==
X-ME-Sender: <xms:6VnYXOJo4QcP6pCr4SMGsHAIjn2mrwBR2Y01rUjyjwUsVenKd6Of5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrledvgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucffohhmrghinhepiiigvdgtgedrtghomhenucfkph
 epjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
 uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6VnYXO_wTJbKrKY8eu6z7EkfUlaHqDpCaFatcJCLp17mMZRkzXv_NA>
 <xmx:6VnYXFCY9hDGBwEndufnww8MP_ZZ8DsB2AozdqBkMn_BsaKQjX5gTA>
 <xmx:6VnYXKAvI4HUxMBu0soAVSwvjDYgqFBKpI_IgPFuPMiahjVeuCNprw>
 <xmx:6lnYXDIbJfJqmm6U3VSu7OBMCouGo6QmioHo89Un32WLqh3PWVd2CQ>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6E41F80059;
 Sun, 12 May 2019 13:37:45 -0400 (EDT)
Subject: Re: Wireguard andoird and Fire TV
To: Revath S Kumar <rsk@revathskumar.com>, wireguard@lists.zx2c4.com
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
Date: Sun, 12 May 2019 12:37:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
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

On 5/6/19 4:27 AM, Revath S Kumar wrote:
> Hello all,
> 
> I tried to side load the wireguard android on Fire TV stick.
> I was successfully able to install and create a new config.
> But once the config is created I was not able to enable the config.
> 
> The navigation using the FireTV remote never gets focus on config toggle button.
> 
> Any plan to support TV sooner?

See https://lists.zx2c4.com/pipermail/wireguard/2019-January/003768.html

It's possible to get it working with the remote, but that would require someone
to write (and test!) the code to do so. Right now there's nobody working on the
Android app.

> with regards,
> Revath S Kumar,
> JavaScripter / Rubyist / PHP

Cheers,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
