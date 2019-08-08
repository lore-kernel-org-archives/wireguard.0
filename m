Return-Path: <SRS0=64CQ=WE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56F8C32751
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Aug 2019 01:17:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46BFE2184E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Aug 2019 01:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46BFE2184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a8630cc;
	Thu, 8 Aug 2019 01:17:37 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c70491d8
 for <wireguard@lists.zx2c4.com>; Thu, 8 Aug 2019 01:17:30 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9011ad32
 for <wireguard@lists.zx2c4.com>; Thu, 8 Aug 2019 01:17:30 +0000 (UTC)
Received: from [192.168.123.238] (1piece.static.monkeybrains.net
 [::ffff:208.90.213.83]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 000000000005066E.000000005D4B7898.000004DD; Wed, 07 Aug 2019 18:19:19 -0700
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Subject: New: wgnlpy = WireGuard + Netlink + Python
Message-ID: <b96ac55c-4e13-28b9-f29c-1d98cdd71135@pallas.us>
Date: Wed, 7 Aug 2019 18:16:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I just released v0.0.1 of wgnlpy [1], a WireGuard Netlink connector for 
Python.

It does not support the full range of Netlink operations at the moment. 
Specifically, set_interface and set_peer only operate on a single peer 
at time. (It is possible to clear peers or allowedips in bulk, however.) 
I am considering adding something similar to getconf/setconf using with 
configparser.

It probably only works in python3. (Read: I only tested with Python 3.7.)

License: MIT

Enjoy, ~Derrick


[1] https://github.com/ArgosyLabs/wgnlpy


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
