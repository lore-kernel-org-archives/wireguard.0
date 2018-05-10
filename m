Return-Path: weiti@weiti.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 047e7cc1
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:34:12 +0000 (UTC)
Received: from hub01.weiti.org (hub01.weiti.org [5.44.101.154])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9764fcc1
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:34:12 +0000 (UTC)
Received: from mail02.weiti.home (mail02.weiti.home [172.18.20.20])
 by hub01.weiti.org (Postfix) with ESMTPS id 62CA3A0212
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 11:36:53 +0200 (CEST)
Received: from weiti-p772 (unknown [172.18.9.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail02.weiti.home (Postfix) with ESMTPSA id EDE81222E2
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 11:20:10 +0200 (CEST)
Date: Thu, 10 May 2018 11:36:49 +0200
From: Tim Weippert <weiti@weiti.org>
To: wireguard@lists.zx2c4.com
Subject: Re: WG load balancing?
Message-ID: <20180510093648.GA1674@weiti-p772>
References: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Matthias, 


On Thu, May 10, 2018 at 11:21:44AM +0200, Matthias Urlichs wrote:
> Hello list,
> 
> Assume a branch office with two uplinks to the Internet that wants to
> use WG to talk to the main office, using both of these uplinks in
> parallel (assuming they're both up) for better uplink speed (and for
> redundancy if they aren't). Now the obvious idea is to create two WG
> interfaces on each side, and add a couple of firewall rules to make sure
> that packets fwmarked 1 go out on the first uplink, and so on.
> 
> That's the easy part. The hard part is how to teach the kernel to load
> balance its default route between the WG interfaces. I tried to use a
> libteam or bonding interface to tie them together, but apparently WG
> isn't Ethernet, so that doesn't work.
> 
> I thought about using a GRE tunnel, but tunnels have fixed endpoint
> addresses – somehow I don't think it'd be a good idea to create two
> wireguard interfaces with the same IP address … and I don't really want
> to do heavy-handed address mangling on every packet. Losing all
> connectivity whenever I happen to flush my firewall tables doesn't
> appeal to me.

Maybe you can use some kind of dynamic routing approach here. Use FRR,
Quagga or Bird with e.g. OSPF and ECMP ( Equal Cost Multipath) to utilize
both links. (practically you can also have two default routes with the
same metric and this should do a round robin fashioned loadbalancing)

Additional you get a failover functionality with the dynamic routing, as
one path is lost, it moves to the other one. And you don't need to mark
packets on the firewall level.

> Ideally I would like the kernel's wireguard interfaces to be compatible
> with teaming … any takers?

Can't help with teaming here.

HTH, 
tim

-- 
Tim Weippert
http://weiti.org - weiti@weiti.org
GPG Fingerprint - E704 7303 6FF0 8393 ADB1  398E 67F2 94AE 5995 7DD8
