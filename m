Return-Path: <SRS0=q2lx=MG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9B9C07E9A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 05:49:41 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C68EE60232
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 05:49:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C68EE60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e912df87;
	Wed, 14 Jul 2021 05:49:38 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c721dce
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jul 2021 05:49:36 +0000 (UTC)
Received: from [192.168.129.136]
 (dslb-094-220-252-156.094.220.pools.vodafone-ip.de [94.220.252.156])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 63CB31C3204
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jul 2021 07:49:36 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: Android: more than one tunnel
To: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
 <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
Message-ID: <e8e94195-b1f0-df62-4393-929f20f762a3@spam-free.eu>
Date: Wed, 14 Jul 2021 07:49:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <296f17d0-3f0b-6021-7bb3-4b4bf576f6c7@spam-free.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
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

I have two distinct tunnels defined on Android.
However, I can only toggle between the two. I cannot have both activated at the 
same time.
I need both connections.
Am I missing anything?
Why not several tunnels with several wg servers???
Why is this being prevented?

BR
Chris

