Return-Path: <SRS0=FNV9=G3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6D0C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:37:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DEC122CF6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Jan 2021 16:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DEC122CF6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00bf88f8;
	Sun, 24 Jan 2021 16:33:12 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c839bb87
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Jan 2021 16:33:10 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 59AC976A;
 Sun, 24 Jan 2021 16:33:09 +0000 (UTC)
Date: Sun, 24 Jan 2021 21:33:08 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Ken D'Ambrosio <ken@jots.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Access subnet behind server.
Message-ID: <20210124213308.4b774a07@natsu>
In-Reply-To: <4464b11ea233ea1e57f49d4a5d1a84d5@jots.org>
References: <4464b11ea233ea1e57f49d4a5d1a84d5@jots.org>
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

On Sat, 23 Jan 2021 11:52:56 -0500
Ken D'Ambrosio <ken@jots.org> wrote:

> Hey, all.  I'm relatively new to WireGuard, and have a RasPi at my house 
> doing firewall duty.  Installed WG on it, and on a VPS, and am trying to 
> get the VPS to access hosts on my home subnet.  So:
> 
> VPS <-192.168.50.0/24-> RasPi <--> [192.168.10.0/24]
> 
> And, clearly, I'm doing something wrong.
> 
> -----------------------------------------------------------
> RasPi server/firewall:
> [Interface]
> Address = 192.168.50.1/24
> SaveConfig = false
> ListenPort = 51820
> PrivateKey = XXX
> [Peer]
> PublicKey = XXX
> AllowedIPs = 192.168.50.11/32
> 
> VPS:
> [Interface]
> Address = 192.168.50.11/24
> PrivateKey = XXX
> [Peer]
> PublicKey = XXX
> Endpoint = vpn.foo.bar:51820
> AllowedIPs = 192.168.50.0/24,192.168.10.0/24
> -----------------------------------------------------------
> 
> The client connects just fine, and it can talk to the server's VPN IP 
> (192.168.50.1) as well as its internal interface (192.168.10.1).  
> Likewise, the server can talk to 192.168.50.11.  But nothing gets inside 
> to other 192.168.10.x hosts.  I do have forwarding set up for "all":
> 
> root@prouter:/proc# cat /proc/sys/net/ipv4/conf/all/forwarding
> 1
> 
> Note that the config files have gone through several permutations as I 
> tried to figure this out, so there may be some dumb stuff, but totally 
> open to suggestions right now.  I'm kinda stumped.  Note that a tcpdump 
> on the RasPi shows the ping requests coming in, but not being forwarded 
> to the internal interface, so I assume I'm just missing Something 
> Dumb(tm) in WG land.

Did you allow forwarding in RPi's firewall? Post "iptables-save" from it.


-- 
With respect,
Roman
