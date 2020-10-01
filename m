Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24DDC4727E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 15:25:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5246720719
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 15:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5246720719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=spam-free.eu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 268746f9;
	Thu, 1 Oct 2020 14:53:08 +0000 (UTC)
Received: from s2.spam-free.eu (s2.spam-free.eu [195.5.121.125])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3c9cacbc
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 14:53:06 +0000 (UTC)
Received: from [192.168.129.206]
 (dslb-002-204-084-239.002.204.pools.vodafone-ip.de [2.204.84.239])
 by s2.spam-free.eu (Postfix) with ESMTPSA id 1EAE21C0D02
 for <wireguard@lists.zx2c4.com>; Thu,  1 Oct 2020 17:24:57 +0200 (CEST)
From: Chris <wireguard@spam-free.eu>
Subject: lineageos 17.1 no incoming
To: wireguard@lists.zx2c4.com
References: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
Message-ID: <63eb4370-74b1-d139-41b9-12963aa25d96@spam-free.eu>
Date: Thu, 1 Oct 2020 17:24:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <mailman.0.1601114111.20018.wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

I'm running the f-droid repo of the wireguard client on lineageos 17.1
After the tunnel is up:
I can ping the wireguard client, and I can initiate an outgoing connection 
through the tunnel.

However, a process binding on all interfaces will not see any incoming traffic 
on tun0.
The same process works fine with incoming traffic on wlan0.

Sending the TCP SYN from the wireguard server through the tunnel, never receives 
an ACK.

Openvpn does not show this behaviour.

As the tun0 interface successfully reacts to pings, I guess it may be an 
iptables problem.
I.e. the traffic on tun0 is differently firewalled than the traffic on wlan0.

Chris


