Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D4FD68BFA
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:28:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7946ef0b;
	Mon, 18 Nov 2024 14:33:20 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b077b363
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:33:15 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ea6f821decso921954a91.1
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940394; x=1732545194; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hNYrzSG3D47KB6oeOVj5/5Bj4MnSM/SMkHnb6rGgzb8=;
 b=PsTUjhpmKmiH3iIUW86q3LcsXIU+VjViBajJwHThWa8FlDaRqEVxl51BrYIDvtcDbs
 leUhPgieJgyyKDz/lkHwinKcjpkYUfjRLbjjtuv9d7ioHNpB24SXikhkvW3OqJHf3Qaw
 RLHg7vtbnAqFs5VjRNBWVFGXvUfUmaqzBXFeDiMqzx9QQB81WtgEBqDucVj1KjWEAhwI
 PPcID3QIlxX96MQ4GywMVwaItg39vi5PJHPYWNnFzvBpnlVw2Z7RlwVgTmB4lyDMRUs9
 JALmRIwAFv8GIqZXWZDljouXbdNERbHFn4RGqOMOXeAh/z/ynLu1+ZqWqx4y/dXC0T8q
 W3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940394; x=1732545194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hNYrzSG3D47KB6oeOVj5/5Bj4MnSM/SMkHnb6rGgzb8=;
 b=D7KOmvd0wRtRTcN9mdalhXTdHzmL1EKvmISqQMvkN+8Poi1U3uoBuyoRNuTrmLynuv
 bgtPmjApD94ggekteNZjEM1K36YwOpVwTPFlmttViwhTUhKZ69H6Fs39uhFLiLcD6gv0
 +TUAcpjkjzbyDDAh4yUtls4dwEF9r/qBYmxiBRg73K3eCfaqiV4WgXWC7Fw9pd3GyOLI
 iRWKSSIdfhW3GRnWEZPWCye54DIqFZSNsGJNddpW8EvAtSpH2t42/9z3hTWHQ+ZjcBxA
 MIsJvNX9p6+AEhZ4BYOBkrppCymGE2Fa1o7Wd5NTW99ClPy9pVo8MVyYWJw72ITWUdZ3
 gMzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbrOhlhK+rxs1ReeZ064NDzhzDbNVi+eZZLSDWW6zsCDd0A/9ChoUIbFf9niRBuTRX7dKN+CRszXs=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwMloH+Py3l6dSVuHmz4czfk3wAEGC5YChVsq8oCNKFm51NIIzd
 UTGAwn0GqEtmU7kHv5dRO33WgKF9VnyEgn9/G1KBxU5ndPmih5ye
X-Google-Smtp-Source: AGHT+IEgW/YjRV6I5AmJ/mBzBZGEWBcDxNEAGQpANYhMnRAlvyIjyPQThvC+SjMr0Xf12bRSa0kQgg==
X-Received: by 2002:a17:90b:52c6:b0:2ea:5dcf:6f74 with SMTP id
 98e67ed59e1d1-2ea5dcf7122mr6227597a91.3.1731940393805; 
 Mon, 18 Nov 2024 06:33:13 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea81b0e2fasm1616926a91.52.2024.11.18.06.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:33:13 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Ido Schimmel <idosch@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jiri Pirko <jiri@resnulli.us>, Hangbin Liu <liuhangbin@gmail.com>,
 linux-rdma@vger.kernel.org, linux-can@vger.kernel.org,
 osmocom-net-gprs@lists.osmocom.org, bpf@vger.kernel.org,
 linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/5] net: Improve netns handling in RTNL and
 ip_tunnel
Date: Mon, 18 Nov 2024 22:32:39 +0800
Message-ID: <20241118143244.1773-1-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch series includes some netns-related improvements and fixes for
RTNL and ip_tunnel, to make link creation more intuitive:

 - Creating link in another net namespace doesn't conflict with link names
   in current one.
 - Refector rtnetlink link creation. Create link in target namespace
   directly. Pass both source and link netns to drivers via newlink()
   callback.

So that

  # ip link add netns ns1 link-netns ns2 tun0 type gre ...

will create tun0 in ns1, rather than create it in ns2 and move to ns1.
And don't conflict with another interface named "tun0" in current netns.

---

v4:
 - Pack newlink() parameters to a single struct.
 - Use ynl async_msg_queue.empty() in selftest.

v3:
 link: https://lore.kernel.org/all/20241113125715.150201-1-shaw.leon@gmail.com/
 - Drop "netns_atomic" flag and module parameter. Add netns parameter to
   newlink() instead, and convert drivers accordingly.
 - Move python NetNSEnter helper to net selftest lib.

v2:
 link: https://lore.kernel.org/all/20241107133004.7469-1-shaw.leon@gmail.com/
 - Check NLM_F_EXCL to ensure only link creation is affected.
 - Add self tests for link name/ifindex conflict and notifications
   in different netns.
 - Changes in dummy driver and ynl in order to add the test case.

v1:
 link: https://lore.kernel.org/all/20241023023146.372653-1-shaw.leon@gmail.com/


Xiao Liang (5):
  net: ip_tunnel: Build flow in underlay net namespace
  rtnetlink: Lookup device in target netns when creating link
  rtnetlink: Decouple net namespaces in rtnl_newlink_create()
  selftests: net: Add python context manager for netns entering
  selftests: net: Add two test cases for link netns

 drivers/infiniband/ulp/ipoib/ipoib_netlink.c  | 11 ++++--
 drivers/net/amt.c                             | 13 ++++---
 drivers/net/bareudp.c                         | 11 ++++--
 drivers/net/bonding/bond_netlink.c            |  8 ++--
 drivers/net/can/dev/netlink.c                 |  4 +-
 drivers/net/can/vxcan.c                       | 11 ++++--
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 11 ++++--
 drivers/net/geneve.c                          | 11 ++++--
 drivers/net/gtp.c                             |  9 +++--
 drivers/net/ipvlan/ipvlan.h                   |  4 +-
 drivers/net/ipvlan/ipvlan_main.c              | 11 ++++--
 drivers/net/ipvlan/ipvtap.c                   |  7 ++--
 drivers/net/macsec.c                          | 11 ++++--
 drivers/net/macvlan.c                         |  8 ++--
 drivers/net/macvtap.c                         |  8 ++--
 drivers/net/netkit.c                          | 11 ++++--
 drivers/net/pfcp.c                            |  8 ++--
 drivers/net/ppp/ppp_generic.c                 | 10 +++--
 drivers/net/team/team_core.c                  |  7 ++--
 drivers/net/veth.c                            | 11 ++++--
 drivers/net/vrf.c                             |  7 ++--
 drivers/net/vxlan/vxlan_core.c                | 11 ++++--
 drivers/net/wireguard/device.c                |  8 ++--
 drivers/net/wireless/virtual/virt_wifi.c      | 10 +++--
 drivers/net/wwan/wwan_core.c                  | 15 +++++--
 include/net/ip_tunnels.h                      |  5 ++-
 include/net/rtnetlink.h                       | 34 +++++++++++++---
 net/8021q/vlan_netlink.c                      | 11 ++++--
 net/batman-adv/soft-interface.c               |  8 ++--
 net/bridge/br_netlink.c                       |  8 ++--
 net/caif/chnl_net.c                           |  6 +--
 net/core/rtnetlink.c                          | 29 +++++++++-----
 net/hsr/hsr_netlink.c                         | 14 ++++---
 net/ieee802154/6lowpan/core.c                 |  9 +++--
 net/ipv4/ip_gre.c                             | 27 ++++++++-----
 net/ipv4/ip_tunnel.c                          | 16 ++++----
 net/ipv4/ip_vti.c                             | 10 +++--
 net/ipv4/ipip.c                               | 10 +++--
 net/ipv6/ip6_gre.c                            | 28 +++++++------
 net/ipv6/ip6_tunnel.c                         | 16 ++++----
 net/ipv6/ip6_vti.c                            | 15 ++++---
 net/ipv6/sit.c                                | 16 ++++----
 net/xfrm/xfrm_interface_core.c                | 14 +++----
 tools/testing/selftests/net/Makefile          |  1 +
 .../testing/selftests/net/lib/py/__init__.py  |  2 +-
 tools/testing/selftests/net/lib/py/netns.py   | 18 +++++++++
 tools/testing/selftests/net/netns-name.sh     | 10 +++++
 tools/testing/selftests/net/netns_atomic.py   | 39 +++++++++++++++++++
 48 files changed, 377 insertions(+), 205 deletions(-)
 create mode 100755 tools/testing/selftests/net/netns_atomic.py

-- 
2.47.0

