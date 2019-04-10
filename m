Return-Path: <SRS0=meay=SM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAB0C10F14
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Apr 2019 15:34:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FCC20818
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Apr 2019 15:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FCC20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd9276af;
	Wed, 10 Apr 2019 15:34:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04fa98c1
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Apr 2019 15:34:34 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5326f978
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Apr 2019 15:34:34 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 99DAD202C1
 for <wireguard@lists.zx2c4.com>; Wed, 10 Apr 2019 15:34:32 +0000 (UTC)
Date: Wed, 10 Apr 2019 20:34:31 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Revisiting the weird MTU issue
Message-ID: <20190410203431.24b55c89@natsu>
MIME-Version: 1.0
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

Hello,

I use WireGuard over IPv6 on a PPPoE connection. The Internet interface MTU is
1492. By my calculations MTU 1412 on the WG interface should fit.

However, the following occurs on various MTU combinations between the Remote
(a server in a DC with full 1500 wire MTU) and Local WG interface MTUs:

Fails or not, is whether a within-WG Remote->Local TCP connection (iperf3)
works fine or hangs up after transferring a few initial bits of data.

Remote  Local  Result
====================
  1420   1420  Fails (as expected)

  1420   1412  Fails (weird)

  1412   1412  Works (fair enough)

  1420   1408  Works (super weird!!!)

Now I hope I described the situation clearer than the last time posting about
this, so maybe someone has an idea what could be the culprit?

So far this doesn't cause too much issue, as I'm using on designated p2p links
for when one of the peers is on this PPPoE, I just use 1412 on both sides. But
still, surely the above shouldn't happen?

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
