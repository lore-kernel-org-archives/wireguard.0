Return-Path: <SRS0=CDXv=5U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB4BC2BA1B
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B618206E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  4 Apr 2020 22:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=mutualaid.info header.i=@mutualaid.info header.b="O4u8IDMb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cfz3MhAv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B618206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mutualaid.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 976d06a5;
	Sat, 4 Apr 2020 22:36:04 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3ea40277
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 17:09:42 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3B3A35C030C
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 13:17:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 30 Mar 2020 13:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mutualaid.info;
 h=from:content-type:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id; s=fm1; bh=pe
 cP2+nz77KuQZeKMRnq65ImzgqRhXCTSURDwslotCM=; b=O4u8IDMb4mMvCtCwlN
 aPJV882TesxM+KZ3Smrwm80sGV5EVoXnU1eG9pAuVnFVO6uRXf4mCiPanThiMTgy
 GiJzLdh3njVeGxZxm3RfeOa1pDmmOPhcxV2+0WbTNXyPCQgVsInrZbwmFp9fEHOe
 rAJhLTekPReu33q2FTl0YhwnCi3JNTnythvxiF8QWBQWbcTCLhFkKK/dEqk0T9z5
 bCipUXPU69h0dftawLPECGvKO89uUYXqhNGVBfA8q+r5wHkw7sHeIo+s5gV/r1H/
 BLJePeMCyk3Vkm+KMiYgRfLMuVP8TmRVNxFDsq90Sz+x6YV8+o5QPT8IjGm1AGyK
 H7Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=pecP2+nz77KuQZeKMRnq65ImzgqRhXCTSURDwslot
 CM=; b=cfz3MhAvhcGkNPdsmoevkkdC8nlCuZLxAmU0di3TQ/XeS160/tuYQwSFB
 oYQ4o1T/e5FCtDDLRcBfemSp7rxAHYJ016skN9GqpXNnivvWTfX21eDzirQRWweM
 BQONJJz9/kwOwq8su5iG4TjNg81QBk9rIINQ/UuJcMiAVsOvBb/foa5h/Xeata91
 xB1LdAo+/H+xwhifNO6Jw9ZBAtx+2M2SYK/gD1hkdmXtjKGJWlvj++Oik05uHtSU
 s5FbqOgN1pDbcAdGHVhHMgBRLhww11DDnk5au+nHiurZFdCCnxk2JTjOCaq6Sgvc
 M2KQt0qG7XPVK/Jy8YioEh79lfNqQ==
X-ME-Sender: <xms:sCmCXp45-m3XL6KlK3MzG01RBvM2P53I4deFXTneM9f1WV8SZ-rrPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeihedguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfgguffffhfvjgfkofesth
 hqmhdthhdtjeenucfhrhhomhepuehrihgrnhcuoegsrhhirghnsehmuhhtuhgrlhgrihgu
 rdhinhhfoheqnecukfhppedutdekrddvtddrkedtrdeigeenucevlhhushhtvghrufhiii
 gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhhirghnsehmuhhtuhgrlhgrihgu
 rdhinhhfoh
X-ME-Proxy: <xmx:sCmCXur_wK0CUbI0luz03sp_GwEfaLEAOFHBxDXQy3UK7v9zN8crYA>
 <xmx:sCmCXjiuMqNqHIhnFD5tcAYNCJEt_WWJwiIb4eVap5mj_TNsT9FSkQ>
 <xmx:sCmCXgL_Szt2EMcIspfELFVcWjtWxieVncbB2ZqFQ-4eTizArXnf0w>
 <xmx:sSmCXsodsANa41s-sQdZ7utH0VuNXafEdk0miuKLOB5v2hbjz8MbTg>
Received: from [172.17.100.102] (pool-108-20-80-64.bstnma.east.verizon.net
 [108.20.80.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9850C3280063
 for <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 13:17:36 -0400 (EDT)
From: Brian <brian@mutualaid.info>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Support for running as non-root user on OpenBSD with WG_TUN_FD?
Date: Mon, 30 Mar 2020 13:17:36 -0400
References: <B5A44FC5-FCE3-4A6C-BA82-77173CC2B42C@mutualaid.info>
To: wireguard@lists.zx2c4.com
In-Reply-To: <B5A44FC5-FCE3-4A6C-BA82-77173CC2B42C@mutualaid.info>
Message-Id: <DD8A540E-EA7C-403A-875F-3A88CB19F4C6@mutualaid.info>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
X-Mailman-Approved-At: Sun, 05 Apr 2020 00:36:00 +0200
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

> On Mar 25, 2020, at 9:31 PM, Brian <brian@mutualaid.info> wrote:

> I don=E2=80=99t know Go very well, but it seems like main.go calls the =
CreateTUN function, and CreateTUN (in tun_openbsd.go) tries to open =
/dev/tun2 in read-write mode? There seems to be an option to set the =
WG_TUN_FD environment variable, so that CreateTUNFromFile gets called =
instead of CreateTUN, but I don=E2=80=99t understand how to properly get =
a file descriptor in this context.

I=E2=80=99ve since done some reading and I think that WG_TUN_FD is =
designed more for contexts like running Wireguard in a container.

I=E2=80=99ve been able to get it working as a non-root user on OpenBSD =
but I did have to give the _wireguard user or group read/write =
permissions on /dev/tun2 and /var/run/wireguard. I=E2=80=99m exploring =
some alternatives to this but don=E2=80=99t think there is a bug or =
anything here. If there are any =E2=80=9Cbest practices=E2=80=9D for =
running wireguard-go as a non-root user I=E2=80=99d love to hear them!

-Brian=
