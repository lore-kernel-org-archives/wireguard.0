Return-Path: <SRS0=3Rrq=4D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F2AC352A3
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 06:14:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C13E2067D
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Feb 2020 06:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="AcJNKHH/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nGdFpT8W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C13E2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beb0a523;
	Sat, 15 Feb 2020 06:12:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7af44d8
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 06:12:28 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8dd7688
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Feb 2020 06:12:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2DF6C21E1C;
 Sat, 15 Feb 2020 01:14:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 15 Feb 2020 01:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=s
 KunUzmwm2yiR/NOqf5sFKfnV84p5V1N8QWrjzrTlkw=; b=AcJNKHH/MR/XYa4x2
 kVzmSNoBPt4anyNMDqYNDjfhu7TajXMk5WubWstwONCEHpmMxa8Rqc+/xzTt2mrZ
 aciDU8O9berINY2w7hSnNfs/Qi9da+KXa9t/2o57f222tLPTskv8xTHl9oSHGw6x
 DRMy1WEeG62HGqwJY+BEImbumOHBTJdsBkaClqGhzzqQWVp32u6fcqV4D9nxSp+M
 rXbkQF9JsItn9/cP86W/Pil5sF1BWtFT2mGVGf1NTMebOUsCn/42L2wjhjcfyeXR
 dEySZeJ2+pMfOLnrBNEHDpzfjV15PGzqV2zmk00/MlhXLwMzchf3JaeWTEFhji1l
 FARgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=sKunUzmwm2yiR/NOqf5sFKfnV84p5V1N8QWrjzrTl
 kw=; b=nGdFpT8Wyp/3Oiqjm0BhAsqIVPwxxuXwqZU7M7g5rlb6yv2wcXsz3Q7LO
 29d3aYZqAyWH1J2TLP7D6WoydKom3J76fTpA06u8n2ypqOPOEeKHvrTodXop4dsG
 XLDMgMmPL7RJ5SqpE3/AVyh1CvC3eeQsKJcXOhQdfudxIznFAEqIZgoDudUc1wwi
 1rTL1Simi32CJmKYf8rjY7KwX83vlx05unwbv6P5Ql//DITBYl1AvN3cujYwxNvP
 NihrWjUeZWMSu2jHfAwiZOu3aZCse1XeEux7aQIHdET9DL/C2Uhasn9Po1llnnz6
 MJ4U8MPADwhU8TcTxu/vzWlMUpCvw==
X-ME-Sender: <xms:T4xHXh0uW0gGjs1lZRF_R_eYFpxDKEEa9LnZDhYoT9fh54wmXFQ7Rg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrjedugdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucffoh
 hmrghinhepiiigvdgtgedrtghomhenucfkphepjedtrddufeehrddugeekrdduhedunecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvg
 hlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:T4xHXtOkW333r28kEd3Ihv8pVtYzbDkUgbXKi8JwbQC1n0BBTGTuGw>
 <xmx:T4xHXk2XcB-nBA-3BZcWLafRAk85T9WLrXHNDdqxFP02BtEpranjTA>
 <xmx:T4xHXk3iJ___OPaWxntZIg4zRlmIbYUY3EveqOqs7bjV5ZKKP0wfvQ>
 <xmx:UIxHXlx_8malROO8Vp11fC1g7UOdvAar2835oKK-47M1AxSqJm5Aog>
Received: from [192.168.50.169]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A11D23060C28;
 Sat, 15 Feb 2020 01:14:39 -0500 (EST)
Subject: Re: [PATCH] Add japanese translation.
To: Eiji Tanioka <tanioka404@gmail.com>, wireguard@lists.zx2c4.com
References: <20200213103117.68943-1-tanioka404@gmail.com>
 <120ad97e-0dcb-6502-f097-e1368d9987cf@sholland.org>
 <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <851381cd-3fc0-94f9-63a1-7b69deb9a640@sholland.org>
Date: Sat, 15 Feb 2020 00:14:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAA2ss9EDZ4qip3Rh-z_zseLr2u0+A8ePEUUBd7dnJq2RTdPmwA@mail.gmail.com>
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

On 2/14/20 11:27 PM, Eiji Tanioka wrote:
> Hi, Samuel.
> 
> Thank you for your reply!
> I re-created patch.

Thanks, applied:
https://git.zx2c4.com/wireguard-android/commit/?id=822f72df956ecd3aaa6a2b254e059e38ba5122e4
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
