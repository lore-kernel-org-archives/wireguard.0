Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D79C43463
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 07:14:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34AC2207DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 07:14:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34AC2207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e31150a9;
	Mon, 21 Sep 2020 06:43:05 +0000 (UTC)
Received: from telperion.info (<unknown> [2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0e16a1de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 06:43:01 +0000 (UTC)
Received: from [192.168.127.224] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77]) (AUTH: LOGIN pallas, )
 by telperion.info with ESMTPSA
 id 0000000000044119.000000005F6852BC.00006A6F; Mon, 21 Sep 2020 00:14:03 -0700
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Derrick Lyndon Pallas <derrick@pallas.us>
Subject: Interest in adding multicast support to Wireguard?
Message-ID: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
Date: Mon, 21 Sep 2020 00:13:00 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

I know this has come up a few times before, but if there was resolution, 
I couldn't find it.

I am trying to set up a hub-and-spoke network with many clients 
connected to a single concentrator. One application I need to support 
relies on mDNS. Because Wireguard does not allow overlapping ranges (for 
understandable reasons), this works on point-to-point links with two 
peers but not on hub-and-spoke or other multi-peer setups. This would be 
possible if every peer had its own hub interface, but that seems like an 
inelegant, error-prone workaround.

Some have suggested running vxlan or another encapsulation method on top 
of Wireguard, but that's not possible in this situation because I do not 
control the software running on the peers. Typically, they'll just be 
running the official Wireguard apps for MacOS or Windows.

Hacking Wireguard to understand the multicast range and to 
clone-and-forward this traffic to all peers does work. If there is wider 
interest in that specific feature, I'm happy to work what I have into 
something that could be upstreamed. Currently the range is global and 
hard-coded, but I could imagine wanting fine-grained control over which 
peers were interested in specific multicast addresses, e.g., for a 
user-space daemon managing IGMP subscriptions. However, before I spent 
time on any of the above, I wanted to gauge whether there was interest 
and whether that kind of feature might be accepted at all.

Thanks, ~Derrick


