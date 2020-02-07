Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1FEC352A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A574D22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A574D22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=powercraft.nl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90da899c;
	Sat, 8 Feb 2020 21:24:11 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a80bac62
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 16:48:41 +0000 (UTC)
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net
 [194.109.24.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16054133
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 16:48:41 +0000 (UTC)
Received: from yessica.powercraft.nl ([80.127.158.83])
 by smtp-cloud9.xs4all.net with ESMTP
 id 06pFj89au2Mf206pGjhTRO; Fri, 07 Feb 2020 17:49:54 +0100
Received: from [192.168.24.203] (ebony.powercraft.nl [80.127.158.83])
 by yessica.powercraft.nl (Postfix) with ESMTPSA id 0B3142046F
 for <wireguard@lists.zx2c4.com>; Fri,  7 Feb 2020 17:49:53 +0100 (CET)
From: Jelle de Jong <jelledejong@powercraft.nl>
Subject: how to forward/route/rule all traffic broadcast from an br0 to wg0
To: wireguard@lists.zx2c4.com
Message-ID: <bfa1d3ff-7885-0c68-9d74-212dec0aaed8@powercraft.nl>
Date: Fri, 7 Feb 2020 17:49:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Language: en-US
X-CMAE-Envelope: MS4wfKS6yOio5b1rMq48MbOA4uGfHES5rhCYk3TuFpPrC4iuYILqPPln/eJu7/NTdCznuqmgs9FREg+mNiXQNEmMFIfSJNm613PsI8jnl5rOoOHvJTuSUYWb
 /IUd1SkbGRItACX1Sxk6fs714RoqE8X2Rwqtr4z0A9rvoU0wPLvPinMXzdI4SSXFeJwTx6MvU6WA3b6yHWbvAn/4ASOs5eSge8M=
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:24:08 +0100
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

Hello everybody,

br0 (with eth0 eth1 eth3)
wg0 (192.168.43.10/24)

dhcp-helper to forward broadcast to ip?

I am looking for way to use a wireguard tunnel to route all traffic 
including dhcp broadcast from one network to an other network and create 
a form of a network bridge.

I got an working wireguard client wg0 (192.168.43.10/24) that has a 
linux bridge br0 on the same system, so br0 and wg0.

I can not add wg0 to the bridge because bridging is layer2.

How can I use either ip route, nftables, iptables, etc to route all 
traffic on br0 to wg0.

I want to runnel an dhcp and pxe boot over the br0 to wg0.

Can someone share an example?

Kind regards,

Jelle de Jong
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
