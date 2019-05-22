Return-Path: <SRS0=8wxJ=TW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85006C072A4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 May 2019 04:19:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1F5A2173C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 May 2019 04:19:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="f5exd0Qw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iShN5/jE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1F5A2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e77192b;
	Wed, 22 May 2019 04:19:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a02e5f02
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 May 2019 04:19:44 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c560c17a
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 May 2019 04:19:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5FB072661E;
 Wed, 22 May 2019 00:19:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Wed, 22 May 2019 00:19:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=u
 kJz4yJpca7VkIqTMqyD28RUJOKwpO8m/CvwWLJidVM=; b=f5exd0QwywZFJoi53
 VzTAQ72UYSdOORr22FnowFfVoC1s/CAICUwTTeqAN3pL5M+taBq3PSazybM8Mu8y
 OrS7QTonCU4LNHwUrHM5RZ26yTCuYZGp/g8rRI2fPt58/zV2ktehUy4UPqxpZJje
 hILeBQ31IsW9dLJhNcCpwH3tdQaC7ILg6WBj3gEnSsW+5YRIcn7oNwvmy0DI3DBx
 QwNTkKdVtbZyj2TXsg3LWJ47Ed+gCoJDGPUN292trN2ZJE+IvSY4nqjSVyb54+Z3
 0qaSRVsirGnHc2LGvIc9LjftiQRi628z4GO9yxtoNpLZMiyHZrhS+zDoT28DG98Y
 Xwz1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=ukJz4yJpca7VkIqTMqyD28RUJOKwpO8m/CvwWLJid
 VM=; b=iShN5/jEJgCW/pkiyD2ReOTk/3tj6BBLZFRaMh8hP8kDmKSIyHrSYRghv
 W1GDnk+CTppJLw/U7EX/JT7pFkREIhc/yPuz36gBbcmx6+tOBwpBaHBt7X00UmbO
 huLiOWR4OWaiuRWXClNlLBShG+1BSrsPeZWVamQTYRyx3Wzn5sTrrMWs5tDEAx8n
 3WktPpd1W3kN+E9e2GL7EKNcwJyBEmTSvhuu+EgYejy3fPYbLOaEz8ouItXtjLai
 VK9XXiAB0VRb1djuwmMVb8SCyRP+O0pfEWfuvBHXStXbJT9tme8QL72DWdaU29kD
 QarYDjZc0pB70jUSmVYMJdG4FntOg==
X-ME-Sender: <xms:4M3kXAXhrvuUWVJnTa_581PSFYU2CfPW05zS_r9CtHkekl6mWi-Z8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgfgsehtje
 ertddtfeejnecuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhes
 shhhohhllhgrnhgurdhorhhgqeenucfkphepjedtrddufeehrddugeekrdduhedunecurf
 grrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:4M3kXGG2DVh98TTxRor1IEkYo5q8eqbwwMQ2Hdjje2tHrDFVt7ht1Q>
 <xmx:4M3kXI8sLVNhyLI4Y7prcThlqy_naSQnebSol5uJyaTuvlKriKuf4w>
 <xmx:4M3kXO0cCroRSiC0NY-boSUFpGr4-lKmMflW86p-YA20Ezz449jR5g>
 <xmx:4M3kXNKFQcRNyeEjF1kq5wIx295563ELdktPwFxcazAUHxaNEyzDjA>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id A612580060;
 Wed, 22 May 2019 00:19:43 -0400 (EDT)
Subject: Re: Wireguard andoird and Fire TV
To: Revath S Kumar <gmail@revathskumar.com>
References: <CAO=kRDLSnhMHFbiKsxvuPeHo3WT9EQLTeu6T8nRF_nJLWr=NMA@mail.gmail.com>
 <d28d2f8d-0af3-d9f8-3e40-01d0956720db@sholland.org>
 <CAO=kRDLdn9mX-j4Pxm6W7K=_xttDjbgUNG6qRtqpWh-cVyrwPg@mail.gmail.com>
 <CAO=kRD+TqOv3FZpjrwgWHeP+TYzJvPWG3ahofjdsfJJo_aQxbw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <f104de77-07a3-7b41-e99d-07bdbc3ec808@sholland.org>
Date: Tue, 21 May 2019 23:19:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAO=kRD+TqOv3FZpjrwgWHeP+TYzJvPWG3ahofjdsfJJo_aQxbw@mail.gmail.com>
Content-Language: en-US
Cc: wireguard@lists.zx2c4.com
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

Revath,

On 5/21/19 5:45 AM, Revath S Kumar wrote:
> I have send a patch to fix this issue.
> Let me know if any more changes needed for the patch.

Thank you very much for the patch! I could have guessed at what to change, but I
wouldn't have been able to test it. I've merged your patch with a bit of
cleanup, so it'll be included in the next release.

> with regards,
> Revath S Kumar

Thanks,
Samuel
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
