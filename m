Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410A1EE4993
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 14:02:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5886e9d9;
	Sat, 19 Aug 2023 14:02:37 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b72fe0f4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 14:02:35 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 19 Aug 2023 16:02:34 +0200
Date: Sat, 19 Aug 2023 16:02:18 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: bird-users@network.cz, babel-users@alioth-lists.debian.net
Subject: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hi wireguard, birds, and babelers,

tl;dr I want to add a new Linux route attribute (think "via $wgpeer") to
supplement wireguard's internal AllowedIPs logic for both routing and
source address filtering.

I've been pondering how to better integrate wireguard into dynamic routing
daemons, particularly BIRD and babeld. Essentially we want to be able to
dynamically add/remove AllowedIPs depending on current reachability and/or
link quality stats.

Looking at the wg netlink API I see two major efficiency/scalability
problems: 1) there is no way to be notified of changes in AllowedIPs made
by other processes meaning we have to do periodic scans and 2) a peer's
AllowedIPs set can only be replaced wholesale, not modified
incrementally. This is problematic as "someone" might, in the worst case,
want to install an entire internet routing table's worth of AllowedIPs and
the set will likely change frequently. FYI: The IPv4 table has ~1M entries
at present, yikes.

Assuming external AllowedIPs changes are infrequent occationally dumping
them all to keep a consistent view of the state shouldn't be too much of an
issue as long as the netlink interface is performant enoug, so I'm going to
concentrate on the add/remove API for now.

Instead of doing the obvious thing and adding a more efficient incremental
AllowedIPs netlink interface I figure why not just add a route attribute to
select a target wg peer on a device. That way we could not only save memory
(no separate AllowedIPs trie) but also simplify routing daemon
implementation considerably.

This would mirror how on ethernet you can have `dev eth0 via $router_ip`.
I'm still reviewing the net/ code to find the best way to do this, but I'm
thinking either a new RTA_WGPEER, like: `default dev wg0 via-wgpeer
$peer_pubkey` or perhaps re-using RTA_VIA and keying off a statically
configured AllowedIP addresses.

To start I'd make this an opt-in replacement for our usual AllowedIPs
logic, making sure to only activate it if any via* RTAs are active on a
particular device, but if it proves to work well I don't see why we
couldn't adapt the netlink code to maintain AllowedIPs using this RTA (but
invisible to userspace) to re-use the same code and get rid of allowedips.c
altogether. That's assuming this ends up being less code overall or perhaps
more performant.

Happy to hear your thoughts,
--Daniel
