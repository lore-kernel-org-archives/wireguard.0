Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 653A0C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FF2206BA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:24:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=althea.net header.i=@althea.net header.b="VQZnYgAJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cDIhTs/l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06FF2206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc46b33;
	Sun, 25 Aug 2019 19:23:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34cec1c0
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:23:50 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1028afe3
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:23:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0DA6621B55
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 15:23:50 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 15:23:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=kS5EXy7YhVVdV7wrRC2MHYlo75wWgYb
 37y8IiScfcms=; b=VQZnYgAJO9Vn80AwIGD20+JJ3GZHMGpaUkzDTcV/sGdx7Ct
 GL1SWZaNVkQFqxfZcSOT8BYyNuKvdFJkIBAwIGeI2mHF66u07A9dxajqv0ey3+RI
 V3gZAqfCnzf+6R4M26jzFHi/fg+IOcczBSMpka6nj/1CUqcEubLUoFBBj8vQm8bl
 1Pi3hpmePc2SMbcHKtGwZM2+cEiOzpzkegiasCZlNedABOi2zi1Zwn3mSYuUjUEE
 5rGvVYAh+edrCiEpEXKgBVMW0aTXfCdss2LzJfB06f84reFA+phUam/Zba93C/kk
 bNeivQXoMGRVmARS7Ur8za+8DGZCCXIPFIEusSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kS5EXy
 7YhVVdV7wrRC2MHYlo75wWgYb37y8IiScfcms=; b=cDIhTs/lQKzh1vvEscBQZL
 XchKsE1m2c+egucpDcUcEkKIqorAaxkIYjrjqcgbOmEb7y2bi68F7NABJu5KAfek
 2iPHbAWuHefOG/sEutEHjxS9s7oLdDWbTW2DXTbIDyxUPAmhMWKVp3cxBXenCgHy
 0bZCP3RDZJH5obpetmZBz2PBX5fLZ+DTa/JGvdn0VTFgK9kyl3i8vz4b+Ujv/P3p
 uyR78Up/KOEkoJNzTxFTM6AGiknki1F7fsmaYocEGhl7Bm8bOJs4M+KldXvBqtlw
 d5YVyiD0vkMKty6ITDxakfdwzW3BsxJZeHmom7Pbtj/bFgGePa3Ni+SH0RtQ3ChQ
 ==
X-ME-Sender: <xms:ReBiXRy5WqYlA9iPjFAiUtXyYlfL8hG1u1No9JOSb_BrCGCMOKj3fA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehvddgudefkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehj
 uhhsthhinhesrghlthhhvggrrdhnvghtqeenucffohhmrghinhepuggrthgrtggvnhhtvg
 hrlhhighhhthdrtghhpdhonhhiohhnrdhiohdpfihikhhiuggvvhhirdgtohhmpdiigidv
 tgegrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjuhhsthhinhesrghlthhhvg
 grrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:ReBiXXGQZnSpqAvWl_mwRzzOBbAS9LKn7g6sYDhMBWlxVupDP4NyMA>
 <xmx:ReBiXdYbDwHvNgrpVsFiN0ymO51k3GveYifJfSQQopqWuWNPYZeFgA>
 <xmx:ReBiXcE0WjboYF12696CpTIAC-NFfpkNBPUBHeY_4EUsWhGcEaffjA>
 <xmx:ReBiXWe2ze6-6ZZkksmetHajnswZFqQ6yHxjTn4mX13FS0wKUHnRuw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B70AFE00A3; Sun, 25 Aug 2019 15:23:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <4d3d2a31-79b6-4d30-92a4-ccfe81e9acba@www.fastmail.com>
In-Reply-To: <87ef2c4ttm.fsf@line.ungleich.ch>
References: <87ef2c4ttm.fsf@line.ungleich.ch>
Date: Sun, 25 Aug 2019 15:23:28 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Wireguard compatible with Omega2 / Omega2+
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

For our application (Althea) we run Wireguard on embedded routers, I think the most similar CPU I have experience with is the MT7621[1] in the Edgerouter X.  We see a little over 100mbps of throughput with that. 

This chip is lower clocked and single rather than dual core. So expect low to mid double digit mbps (10-40mbps). Hard to predict more than that without trying it out. 

You don't need to concern yourself with ram, I would be far more concerned about getting your hands on the LEDE fork they are using on these devices. I'm not seeing a source code link after glancing at the site. 

If you don't have the kernel sources you can't build a WireGuard module. They may have their own build in a repository but I don't think you want to be at their mercy for updates either. 

[1] https://wikidevi.com/wiki/MediaTek_MT7621

-- 
  Justin Kilpatrick
  justin@althea.net

On Sun, Aug 25, 2019, at 11:42 AM, Nico Schottelius wrote:
> 
> Good evening,
> 
> I was wondering if an MT7688 SoC that features a 580 MHz MIPS CPU
> is feasible for running wireguard? With either 64 or 128 MB RAM.
> 
> To be specific, we are considering to get a a batch of Omega2/Omega2
> [0][1] and deploy IPv6 nodes on it that get their IPs via wireguard.
> 
> If anyone has experience with such lowe power device, any input would be
> appreciated.
> 
> Best,
> 
> Nico
> 
> [0] https://onion.io/store/omega2p/
> [1] https://onion.io/store/omega2/
> 
> --
> Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
