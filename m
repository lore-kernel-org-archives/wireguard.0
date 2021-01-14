Return-Path: <SRS0=Ms3O=GR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842F7C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:57:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D266423A3B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Jan 2021 10:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D266423A3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd4ab8d1;
	Thu, 14 Jan 2021 10:53:52 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2e1e9c01
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jan 2021 10:53:50 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 0C7E7880;
 Thu, 14 Jan 2021 10:53:49 +0000 (UTC)
Date: Thu, 14 Jan 2021 15:53:50 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Posegga, Joachim" <jp@sec.uni-passau.de>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Multiple Clients behind NAT
Message-ID: <20210114155350.2ce90402@natsu>
In-Reply-To: <f785012b2c5a49c7ba7f48f40b6ce62f@smith.sec.uni-passau.de>
References: <f785012b2c5a49c7ba7f48f40b6ce62f@smith.sec.uni-passau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 13 Jan 2021 20:14:46 +0000
"Posegga, Joachim" <jp@sec.uni-passau.de> wrote:

> Dear all,
> 
> I am trying to connect multiple wireguard clients behind the same NAT-Gateway to a Mikrotik  server with a public IP. I am not yet sure where exactly the problem is, but it seems that only one client at a time can establish a tunnel. 
> 
> Is this a known problem due to the UDP transport, or should multiple clients behind a NAT work in principle? 
> 
> I understand from the documentation that the server looks at the public key of the incoming packet and identifies the client. The response sent back from the server then arrives at the NAT gateway, and it should map the target port to the correct client and forward it. However, I am not very familiar with UDP over NAT, so I am wondering if this usually works without problems. If this is the case, I would know that the problem is most likely on the side of the Mikrotik server.

The NAT router will rewrite outgoing UDP port of your clients' packets when
they try to connect to other peers; for two clients on the LAN-side trying to
send from the same port, it should change that to two separate UDP ports.
Therefore remote peers will see your two clients as being on the same global
IP, but using two different ports -- and that should work normally.

Check with tcpdump on your NAT's WAN interface what actual UDP packets it
sends out. The ports also might be very different from what you specified in
WG's config, so account for that in firewalling or routing rules on remote
sides.

-- 
With respect,
Roman
