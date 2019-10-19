Return-Path: <SRS0=OnWR=ZT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB01C432C3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:18:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2BDF2070A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 27 Nov 2019 09:18:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2BDF2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=electromail.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c4a03d0;
	Wed, 27 Nov 2019 09:18:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cb43c69
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Oct 2019 08:42:14 +0000 (UTC)
Received: from mx-b.spam-sponge.de (mx-b.spam-sponge.de
 [IPv6:2a01:4f8:1c17:63a6::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23528e74
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Oct 2019 08:42:13 +0000 (UTC)
Received: from linux.fritz.box
 (46.59.248.242.dynamic-cablemodem.pop1-arris.ipv4.wtnet.de [46.59.248.242]
 (may be forged)) (authenticated bits=0)
 by mx-b.spam-sponge.de (8.15.2/8.15.2) with ESMTPSA id x9J8g7FN030769
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <wireguard@lists.zx2c4.com>; Sat, 19 Oct 2019 10:42:11 +0200 (CEST)
 (envelope-from franz@electromail.org)
Authentication-Results: mx-b.spam-sponge.de; dmarc=none (p=none dis=none)
 header.from=electromail.org
Authentication-Results: mx-b.spam-sponge.de;
 spf=fail smtp.mailfrom=franz@electromail.org
To: wireguard@lists.zx2c4.com
From: Franz Schwartau <franz@electromail.org>
Subject: using wireguard intents from tasker?
Message-ID: <7273dde5-290a-7657-1c4e-3397db01038b@electromail.org>
Date: Sat, 19 Oct 2019 10:42:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 27 Nov 2019 10:18:08 +0100
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

Hi!

The commit

https://git.zx2c4.com/wireguard-android/commit/?id=402d59a4ecfa5b65ac69f9a30521b2425d32209b

intruduces the intents

com.wireguard.android.action.SET_TUNNEL_UP
com.wireguard.android.action.SET_TUNNEL_DOWN

Is it possible to trigger them from tasker?

https://tasker.joaoapps.com/userguide/en/intents.html

It did some tests on my own but they didn't succeed. Did someone had any success sending intents to wireguard from tasker?

	Best regards
		Franz
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
