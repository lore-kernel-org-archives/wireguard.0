Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6f27cd0
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jun 2018 19:06:25 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4b1f1ee
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jun 2018 19:06:25 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id 8C9AE1E30D8
 for <wireguard@lists.zx2c4.com>; Tue,  5 Jun 2018 15:09:18 -0400 (EDT)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 5CE5C1E3047
 for <wireguard@lists.zx2c4.com>; Tue,  5 Jun 2018 15:09:18 -0400 (EDT)
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Content-Type: text/plain; charset=us-ascii
Subject: WireGuard within a WireGuard VPN
Message-Id: <6B721880-CEB7-49DA-9EC2-E349BCB631DB@lonnie.abelbeck.com>
Date: Tue, 5 Jun 2018 14:09:15 -0500
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I have successfully implemented a WAN failover using a Netgear LB1121 =
4G/LTE Modem over a WireGuard tunnel to a VM instance (static IPv4) in =
the cloud.

Since most 4G/LTE providers only support outbound-only (NAT'ed), =
IPv4-only, dynamic IPv4 address networks, by using WireGuard to a static =
IPv4 endpoint a bidirectional dual-stack IPv4/IPv6 network is created.  =
Works very well.

Question ...

When failover occurs a 0.0.0.0/1 + 128.0.0.0/1 route is added to the wg0 =
interface via the cloud VM WireGuard address.

There is a secondary WireGuard peer (dynamic remote endpoint) other than =
the failover 4G/LTE peer, which on failover tries to re-establish over =
the WireGuard failover peer, which fails.

Possible solutions:

1) On failover add a route for the secondary endpoint (extracted using =
'wg') and route to the ethernet interface the 4G/LTE Modem is connected. =
 Fingers crossed the dynamic remote endpoint does not change during the =
failover.

2) Possibly reduce the MTU of the secondary WireGuard peer to allow it =
to work within the WireGuard failover peer.  If so, what MTU would be =
required for WG to tunnel within another WG ? Possibly would require =
separate wg0 and wg1 interfaces for matching MTU's ?

Appreciate any comments.

Lonnie
