Return-Path: <SRS0=8wxJ=TW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18CB2C072A4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 May 2019 04:27:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1BE520675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 May 2019 04:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="hQtSTx1i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hMTWCSZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1BE520675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7076a94;
	Wed, 22 May 2019 04:27:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8baada59
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 May 2019 04:27:27 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed34ce02
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 May 2019 04:27:27 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 6115220D7C;
 Wed, 22 May 2019 00:27:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2019 00:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=7
 qaiLykPd6szGtrHm7M6++ghX0h8G6/x1gqd3xZw/Wo=; b=hQtSTx1i1zBxUWPBb
 QO0VBwE4tjWJXV2RQQNGrrlIWq+63naxyos8Izj0RD8PX7kaLSVz2QtZci4wOIyg
 FUL6O9j8Ucr3VO2iVDpXFkaIpn9rHZVrdeoYCryNXYcXYYB9HYDMMRLWmmZNLK29
 6fbGfUXF9EeCxdAuSeGxlArqnvsnrTMDeWlaDN3imS72X0GxWRSPCvbU0GH6W0ak
 36nCpWVTk4mw/0lquetG2TIcSoYmKJ2ycbmI89HwXBRKTmbpl2QM9B+MJoCa/Ree
 2baqC45do2chbmi0/+a5+sCXbq6zVTZZvhZNizinImw6CMs2W/PclzVc1m8LND7L
 xJcHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=7qaiLykPd6szGtrHm7M6++ghX0h8G6/x1gqd3xZw/
 Wo=; b=hMTWCSZlh006Gv3XEXSB/9lzzjTnlY6pMEu575aZ/ARQe03puHlpCrzVV
 5MZ78PiV+eqmA7jrIN71620NgWRfRb6Tda9+8qah529uPTqMWWyZJN3E7MpzIQss
 XLyOqeYpQ/JTPwxbLHiVkSurbAOw771sKL+8kUA8KO80AK9nXwI+hhWzl93nzXYL
 o2H22dWOnu98mkxCnlM6vt5jr/6A0CG1tlbrnEtDFQ+alKL81O+CROCuH5/UfEbU
 z8NZegarh/Hj0u7pcVCl/eCOemZWp9kwA7399yk6nZc47aiLTmranpDFma5ZA7HF
 Y5uqPNgS+gI+7LJ/lm8OMv7VGAL6A==
X-ME-Sender: <xms:r8_kXHMxGKkN-lfw4Ntr0lt1YAA-guSAivXM3ireZxZdpFGZLElAXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukf
 hppeejtddrudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgr
 mhhuvghlsehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:r8_kXKExvTYAXshXqBPYsQRYlEjZ5i8W_HX8WiH5EZYHXc7XGXoFwg>
 <xmx:r8_kXFzVKXG8Po0FjHvr41sLybIs4ua0Pss4UARplawf-iRJSkqQwg>
 <xmx:r8_kXLr-uo-LMKpA5ZHP7p60ZD_R5xZjG3mCmtZxPeptZOJHJwSfkg>
 <xmx:r8_kXNAhicVWhf60GiUA1pvya3lSw4oLRpOvPq6YfBgCbvZCD8SLRA>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id B157E8005B;
 Wed, 22 May 2019 00:27:26 -0400 (EDT)
Subject: Re: Wireguard andoird and Fire TV
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Revath S Kumar <gmail@revathskumar.com>
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
 <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
 <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
 <CAHmME9rJkejZJsuD5oCqgHCeKzz_Psry5ykaCE+rcj4acT87Dg@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <155570d4-4611-d355-ab05-1674d5b194eb@sholland.org>
Date: Tue, 21 May 2019 23:27:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHmME9rJkejZJsuD5oCqgHCeKzz_Psry5ykaCE+rcj4acT87Dg@mail.gmail.com>
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

Jason,

On 5/21/19 8:58 AM, Jason A. Donenfeld wrote:
> Looks like you added that in dc7363845b3edacc5bac7be85eb7fc63790e97af.
> Remember why?

Yes (after some digging). It's due to the fact that ListView's
OnItemClickListener won't fire if you have a focusable view (like a checkbox or
a switch) in your list item. That's no longer an issue since moving to
RecyclerView, since we add the listeners to each list item ourselves. To be
sure, I tested without blocksDescendants, and I couldn't notice any difference
on a touchscreen device.

> Jason
Cheers,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
