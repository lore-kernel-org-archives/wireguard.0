Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCA2C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Mar 2024 18:57:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cc689b5;
	Fri, 22 Mar 2024 18:52:21 +0000 (UTC)
Received: from mx2.mythic-beasts.com (mx2.mythic-beasts.com
 [2a00:1098:0:82:1000:0:2:1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 69e3ed25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2024 18:52:18 +0000 (UTC)
Received: by mailhub-hex-d.mythic-beasts.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <peter@bikeshed.quignogs.org.uk>) id 1rnk02-00Afv9-5n
 for wireguard@lists.zx2c4.com; Fri, 22 Mar 2024 18:52:18 +0000
Message-ID: <7d701aaa-b9fd-4b59-b8db-ce360a94280e@bikeshed.quignogs.org.uk>
Date: Fri, 22 Mar 2024 18:52:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Peter Lister <peter@bikeshed.quignogs.org.uk>
Subject: WG on LXC
To: wireguard@lists.zx2c4.com
Content-Language: en-GB
Organization: Quignogs! (Bikeshed)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
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


I'm using wg on my home network, using a Linux router with OpenWRT and 
running services (e.g. IMAP) on LXC containers.

Having read how wg is intended to work within name spaces, I expected to 
easily create LXC containers with *only* a wg interface, but it seems 
that LXC only understands a "veth" interface and then a wg instance 
using this interface's address as an endpoint.

This works, but I want my internal services to see *only* the wg vpn. If 
a server container needs to connect out, e.g. for software update, I'll 
fire up a temporary veth with a temporary address.

It also seems odd that client hosts need each wg client to use 
per-server endpoint addresses when they are all hosted on one physical 
server's network interface.

I'm sure it's possible to script a solution, but ideally I want to 
specify lxc.net.0.type as "wireguard", give it a key pair and that 
should be that, with all config living outside the container.

This appears to me as common use-case. Has anyone spoken to the lxc 
developers about adding this kind of "first class citizen" support for wg?

All the best,
Peter
