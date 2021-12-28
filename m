Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63DBC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  4 Jan 2022 18:24:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 43a9779a;
	Tue, 4 Jan 2022 18:20:43 +0000 (UTC)
Received: from hetz0.host.rs.currently.online (hetz0.host.rs.currently.online
 [2a01:4f8:120:614b::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f3aab817
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Dec 2021 23:46:16 +0000 (UTC)
Received: from carbon.srv.schuermann.io (carbon.srv.schuermann.io
 [178.63.44.188])
 by hetz0.host.rs.currently.online (Postfix) with ESMTPS id 93E533B91
 for <wireguard@lists.zx2c4.com>; Tue, 28 Dec 2021 23:46:15 +0000 (UTC)
From: leon@is.currently.online
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=is.currently.online;
 s=carbon; t=1640735174;
 bh=y0Odxi4VIDG1wjDAIjWdCJJBb7xOYfLtdYVXwf7JwyE=;
 h=From:To:Cc:Subject:Date;
 b=hWOq7zZMejGfZ/21n+z6Nq8LCroOUkbArZ9P5VjVaKhzSZs5sFttG2OoEKPFDQDPk
 R2cBiT7BMVt6hYwtJtUNvzJ5UHsDfM0CnHw8FTgwOTjnMjLBfnTs1irURScMLRkBPw
 rbtEXCyCj7PSb36nF5KR+hV4N6gKsDEZWYxOq56g=
To: wireguard@lists.zx2c4.com
Cc: Leon Schuermann <leon@is.currently.online>
Subject: [RFC PATCH 0/4] Introduce per-peer MTU setting
Date: Wed, 29 Dec 2021 00:45:21 +0100
Message-Id: <20211228234524.633509-1-leon@is.currently.online>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Jan 2022 18:20:36 +0000
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

From: Leon Schuermann <leon@is.currently.online>

This patch series is an attempt to integrate a per-peer MTU setting
into WireGuard. With matching changes to the wireguard-tools,
individual MTU values can be set and retrieved for each registered
peer.

While Linux supports setting an MTU metric for specific FIB route
entries [which I've only found out after implementing this :)], and
thus allows to lower the MTU for individual peers, this appears to
disable regular path MTU discovery (PMTUD) entirely on the
route. While regular PMTUD does not work over the tunnel link, it
should still be usable on the rest of the route.

Furthermore, with the goal of eventually introducing an in-band
per-peer PMTUD mechanism, keeping an internal per-peer MTU value does
not require modifying the FIB and thus potentially interfere with
userspace.

In an effort to solve this issues, this patch series introduces a
rather generic framework for implementing these kinds of dynamic MTU
policies. By providing a hook in the netdevice implementation to
decide on the applicable MTU, very flexible designs can be built. I
suppose that these changes are rather controversial, or at least
require some more discussion. I'm sending this patchset to the
WireGuard development list in hopes to get some initial feedback on
the idea and implementation and would like to eventually submit the
non-WireGuard changes directly to the netdev ML.

The patches are currently based on v5.10, as that happens to be
what I was developing on. I'll gladly rebase to the latest
revision / wireguard-devel if requested.

Thanks!

Leon

Leon Schuermann (4):
  netdevice: add ndo_lookup_mtu for dynamically determining MTU
  net/ipv4: respect MTU determined by `ndo_lookup_mtu`
  net/ipv6: respect MTU determined by `ndo_lookup_mtu`
  net/wireguard: add per-peer MTU setting

 drivers/net/wireguard/allowedips.c |  2 +-
 drivers/net/wireguard/allowedips.h |  2 +-
 drivers/net/wireguard/device.c     | 20 ++++++++++++++++--
 drivers/net/wireguard/netlink.c    |  8 +++++++
 drivers/net/wireguard/peer.c       |  1 +
 drivers/net/wireguard/peer.h       |  1 +
 drivers/net/wireguard/queueing.h   |  2 +-
 include/linux/netdevice.h          | 12 +++++++++++
 include/net/ip.h                   | 34 ++++++++++++++++++++++--------
 include/net/ip6_route.h            | 14 ++++++++++--
 include/uapi/linux/wireguard.h     |  5 +++++
 net/ipv4/ip_forward.c              |  2 +-
 net/netfilter/nf_flow_table_core.c |  2 +-
 13 files changed, 87 insertions(+), 18 deletions(-)


base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
-- 
2.33.1

