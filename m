Return-Path: <SRS0=+QJz=DM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7072DC4727F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E0DD20665
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E0DD20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0de321a6;
	Mon, 5 Oct 2020 13:19:05 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d014cf2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Oct 2020 13:19:04 +0000 (UTC)
Received: from [192.168.129.206]
 (dslb-002-204-084-239.002.204.pools.vodafone-ip.de [2.204.84.239])
 by s2.spam-free.eu (Postfix) with ESMTPSA id BEE9D1C0D02
 for <wireguard@lists.zx2c4.com>; Mon,  5 Oct 2020 15:51:24 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: wg-quick up (on linux) fails in case of several default routes
To: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
Message-ID: <ebc8ff04-a073-13a8-2f80-a5cf01ab8416@spam-free.eu>
Date: Mon, 5 Oct 2020 15:51:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
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

In case there is more than one default route (with different metrics):

wg-quick tries to set the route to the wg server through the default gateway.
However, in case there is more than one default route it
fails setting the route to server correctly.

Instead it should run through the list of default gateways and set routes to the
wg server through ALL default gateways with a metric of the corresponding 
default route.
Chris

P.S.: Shall one report bugs here or rather at gitlab or both?




