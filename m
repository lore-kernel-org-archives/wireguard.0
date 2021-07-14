Return-Path: <SRS0=q2lx=MG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A29C07E9A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 09:56:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84EC26115A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 14 Jul 2021 09:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84EC26115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc9c53d7;
	Wed, 14 Jul 2021 09:54:43 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c608ba5b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Jul 2021 09:54:43 +0000 (UTC)
Received: from [192.168.129.136]
 (dslb-094-220-252-156.094.220.pools.vodafone-ip.de [94.220.252.156])
 by s2.spam-free.eu (Postfix) with ESMTPSA id A2D291C3204
 for <wireguard@lists.zx2c4.com>; Wed, 14 Jul 2021 11:54:42 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: wg-quick with default route fails on nfs root filesystem
To: wireguard <wireguard@lists.zx2c4.com>
Message-ID: <e4fef9da-ee7f-d1db-036e-b294785d9ee8@spam-free.eu>
Date: Wed, 14 Jul 2021 11:54:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

When wg-quick detects a default route through the tunnel it does this through a 
new routing table with a default route.
However not to destroy the existing non-default routes these will looked up and 
used first. This results in the follwing policy rule entries:
(The priority numers may be different from system to system)

32764:    from all lookup main suppress_prefixlength 0
32765:    not from all fwmark 0xca6c lookup 51820

It is very important of course, that the suppress_prefix rule comes first in the 
list, before
the second rule introduces the new default route (preventig the wireguard 
traffic through it's own tunnel).

The way to archive this is done by the following command sequence:

ip -4 rule add not fwmark 51820 table 51820
ip -4 rule add table main suppress_prefixlength 0

The sequence of the commands is important as the latter command gets the higher 
priority (lower numer).

BUT:
In case your root filesystem needs the local network, the second command will 
not be reached as the
first command (setting the new default route) kills the root filesystem and the 
system stalls!!!!!!

One possible solution:
Instead of adding the suppress_prefixlength 0 command secondly it must be first.
The you must find the priority of that rule and the add the default route with 
the same priority.
A rule with same priority will be added AFTER the other rules.

Example:
ip -4 rule add table main suppress_prefixlength 0
PRIO=$(ip rule list from all|grep suppress_prefixlength|sed -e 
'{s/^\(.*\)\:.*/\1/;q}')
ip -4 rule add not fwmark 51820 table 51820 priority $PRIO

This will lead to the correct sequence:
32765:    from all lookup main suppress_prefixlength 0
32765:    not from all fwmark 0xca6c lookup 51820
(Note the same priority number)

There are probably better ways to cirumvent cutting off the root filesystem.

Chris

