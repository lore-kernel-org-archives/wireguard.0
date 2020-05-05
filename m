Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A41C38A2A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:49:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD402206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:49:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=alternativebit.fr header.i=@alternativebit.fr header.b="Z+RuLswF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dBDISIPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD402206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alternativebit.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae858ab1;
	Wed, 6 May 2020 10:36:28 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d5f4b803
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 07:16:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DAABD5C00C4;
 Tue,  5 May 2020 03:28:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 05 May 2020 03:28:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 alternativebit.fr; h=from:to:subject:in-reply-to:references:cc
 :date:message-id:mime-version:content-type; s=mesmtp; bh=m4SoQF6
 jsX9ied4i5emCpXmvCy+Pw/iZk2eLsHGtTRc=; b=Z+RuLswFmILN/76AjYZUSOV
 4fz3tqYtOpAPLffIMJv9hzzhTU2b87SRYXxcb9IEOx0eSKBsNbXLlApf+rVq8inF
 vVU3S3+Vg+wjQVXpxfTBvN48DR59M4ZgqrDwtshE2+ugrX+CFV+P0pNvKOajTIO2
 J1IPIJ8sAiorMbYRGpfQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=m4SoQF
 6jsX9ied4i5emCpXmvCy+Pw/iZk2eLsHGtTRc=; b=dBDISIPxQ/qYpMzXTwBbZT
 pyC0qanbU3i5IhcOgtIpAwzqLuJ6ley2sHUVXzQrBllJL8kYvx6gSXFmfG7dtJWS
 qQsVm/sFxqU27982GBB09xjgOiGTEI/AFt4Z8UZr5j+5NeATwb6uOkTL9GLH2lFF
 iJyP0kJYBm86HZY1o51E6RsWa6K8yRV3P2axFOJ/onhcZzrP275Xk7khBYFRI6Aj
 rRlX1T6hP7fak+IspwNnGIPq/KQwXvxh9X5ZRy4gT9wcg7CR8XDzVA9gmEp0hiDF
 +318Vh1znkEwLkVAGeZXZvJWYd2r3PY8lrCp9TBOq8DJoplOSF/rEoAxQIA1Gx0A
 ==
X-ME-Sender: <xms:txWxXgVtyQIfFxOKzREXhd4RyHnaIAPH-iscfo6k1ECkO_HB6KE0YA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrjeehgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufgjfhffkfggtgesthdtredttddtjeenucfhrhhomhephforlhhigicu
 uegrhihlrggtuceofhgvlhhigiesrghlthgvrhhnrghtihhvvggsihhtrdhfrheqnecugg
 ftrfgrthhtvghrnhepheekgeelheetgeevgeetvdehgefhgfeijefgfedvjeevfeehkeet
 hffhkeelveegnecukfhppeektddrieejrddukeeirdegvdenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfvghlihigsegrlhhtvghrnhgrthhi
 vhgvsghithdrfhhr
X-ME-Proxy: <xmx:txWxXoljmhZmCu9Qag9-m4CPYtZHBGHkzmu0lBHCWaLF088rN5vgzw>
 <xmx:txWxXjeuluIRc9mPaZzCt3rPYnw_tAro3rxGgX7EvJiHnNHMBP7mMg>
 <xmx:txWxXhEORMKcHJs2ktsxMzZm3iDV80qaBc-cjHRuu0wb8lV6Z_-j-g>
 <xmx:txWxXmbOpZweMBatjNy2TAGd38SJOMWUc0Fiv4_ySaEnVmTkNp7NAg>
Received: from localhost (unknown [80.67.186.42])
 by mail.messagingengine.com (Postfix) with ESMTPA id DC28C3066046;
 Tue,  5 May 2020 03:28:54 -0400 (EDT)
From: =?utf-8?Q?F=C3=A9lix=20Baylac?= <felix@alternativebit.fr>
To: Hans Kraus <hans@hanswkraus.com>
Subject: Re: Newbie - WireGuard per systemd on Debian Buster
In-Reply-To: <1588599175.18qb4zf4yk.none@localhost>
References: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
 <1588599175.18qb4zf4yk.none@localhost>
CC: wireguard@lists.zx2c4.com
Date: Tue, 05 May 2020 09:28:53 +0200
Message-ID: <87y2q6suve.fsf@alternativebit.fr>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 06 May 2020 12:36:21 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

You also probably want to add:

[Service]
Environment=SYSTEMD_LOG_LEVEL=debug

to your /etc/systemd/system/systemd-networkd.service.d/01-log-level-debug.conf

Networkd is not really chatty by default, the config parser will
silently ignore the syntax errors unless you enable the debug logging :/

Note: remember to disable this once your problem gets fixed.
