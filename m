Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A527DC3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 00:00:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a58ec060;
	Tue, 20 May 2025 19:34:51 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b9276d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2024 14:02:30 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2166651f752so4243975ad.3
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733752948; x=1734357748; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OAhPp2pGpsvDTqVI2eQ221kABd4Y8/kh7k1mWyeQzTw=;
 b=O0a8iYMR19QJxeIbtl3nO4JKB7tVff3lgMxkpa8pHsRLsZ5rZ4xDSCH0Z5UgygpepN
 8IDb5OxJ0oUUmMrWl+ARE5RuDXf+g9MqF4zWaaJCtpoU4jTboRexIKKcvff8zBlZVZzS
 xam2G2X6VxTejiqmyJc9mfYcW4z8a0AhLTfBKjiaIu+Sgq7rwX8ZvtQU5/1+urH+oXkM
 NDii09sP/T0NTZvq+pV2ntGpOzZKdDR6fQviYjqb9EbRs45hP3OctdgTICrfQDeUgwwT
 QMx3SDuDaPpyudhQYAzXrd1olDaVo1R7dSc2wKthsFgWbHaA+vLX96qRVfpvx6cgaSf4
 WRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733752948; x=1734357748;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OAhPp2pGpsvDTqVI2eQ221kABd4Y8/kh7k1mWyeQzTw=;
 b=O1Nnw+wucLr2ZTcK/tkKVzUuDyZYceTGoTS8/cyHvNVCyl9P24HmRvPzf+pex0w2jL
 NQrwdiWvSuMVhd/SFisXahhZAjZKqbd5GOACz9Pm/Q5AuFqK9iCjS2c3q9+0x0b1IBKf
 UDW3VW4z4aeBiXeubE4CEs/g221f2LrnMavts7D+DQWh6Z7SFqSzo42xOMUh2kpqnmZO
 Kx8pYtnTH8PLTkJZoWT15zGw3UeKOtOpI8KF4CJDRPKS+QgjTrkaxU4qsPdXV4zfwbQo
 bQ4UDnrpQrf+QB5F7vw2jlfI6AgRaNyZyRs5VYkGxndRCO2qE4UkNmhUkz2d+D5/CqjP
 JOug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgsRI7tGnBpYqQckSpnBXnITBbxaOVtKUpqX1hhqARKO+fc/8Rc2Hsh1/wyse01KEJ4Bm+cmwK4ZQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyNgt2z+ZUpritarW3nVh3EEXJViKpP1sDjw8vfhFP+HshqyCaX
 6mNQ5ff7XmQMd2TBtJ4m18lL3f7ub2HsjLCl41fkswqXHNLdJM4D
X-Gm-Gg: ASbGncsQohmUfjvuwaBLD1+rnKPMoKv1rErQbznwvF9uzqvB/umDVNS4IARoj1jEOxD
 YxaAw2WYSBnuHEPXnAfJVza0ZrU2vXSOavb4kNbb9fIKzdddtK8PfAubz0gIFh4bB2BaCA5X1C3
 T360YLMr7Fhq0Gfkdne2zG+/IWjMbocjsVYkAoqdxmCwRhpQeYxmZ4EZGNzsRX8Vy/4rUofiMpl
 ESrLuRaegF+beBQWt2iIp+NNC0m6HLLu4cuPPUnvY4x6/c=
X-Google-Smtp-Source: AGHT+IEziqjANISe8V7T1b1Vo9dS8nge43qoErTxjCtNhfTplDp9qnHGPIzO4tjQCtyFccSJFTBRCw==
X-Received: by 2002:a17:902:e74f:b0:216:4122:925f with SMTP id
 d9443c01a7336-21641229442mr90363145ad.14.1733752948110; 
 Mon, 09 Dec 2024 06:02:28 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216221db645sm49605645ad.46.2024.12.09.06.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 06:02:26 -0800 (PST)
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
Subject: [PATCH net-next v5 0/5] net: Improve netns handling in RTNL and
 ip_tunnel
Date: Mon,  9 Dec 2024 22:01:46 +0800
Message-ID: <20241209140151.231257-1-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
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

v5:
 - Fix function doc in batman-adv.
 - Include peer_net in rtnl newlink parameters.

v4:
 link: https://lore.kernel.org/all/20241118143244.1773-1-shaw.leon@gmail.com/
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

 drivers/infiniband/ulp/ipoib/ipoib_netlink.c  | 11 +++--
 drivers/net/amt.c                             | 13 +++---
 drivers/net/bareudp.c                         | 11 +++--
 drivers/net/bonding/bond_netlink.c            |  8 ++--
 drivers/net/can/dev/netlink.c                 |  4 +-
 drivers/net/can/vxcan.c                       |  9 ++--
 .../ethernet/qualcomm/rmnet/rmnet_config.c    | 11 +++--
 drivers/net/geneve.c                          | 11 +++--
 drivers/net/gtp.c                             |  9 ++--
 drivers/net/ipvlan/ipvlan.h                   |  4 +-
 drivers/net/ipvlan/ipvlan_main.c              | 11 +++--
 drivers/net/ipvlan/ipvtap.c                   |  7 ++-
 drivers/net/macsec.c                          | 11 +++--
 drivers/net/macvlan.c                         |  8 ++--
 drivers/net/macvtap.c                         |  8 ++--
 drivers/net/netkit.c                          |  9 ++--
 drivers/net/pfcp.c                            |  8 ++--
 drivers/net/ppp/ppp_generic.c                 | 10 +++--
 drivers/net/team/team_core.c                  |  7 +--
 drivers/net/veth.c                            |  9 ++--
 drivers/net/vrf.c                             |  7 +--
 drivers/net/vxlan/vxlan_core.c                | 11 +++--
 drivers/net/wireguard/device.c                |  8 ++--
 drivers/net/wireless/virtual/virt_wifi.c      | 10 +++--
 drivers/net/wwan/wwan_core.c                  | 15 +++++--
 include/net/ip_tunnels.h                      |  5 ++-
 include/net/rtnetlink.h                       | 44 ++++++++++++++++---
 net/8021q/vlan_netlink.c                      | 11 +++--
 net/batman-adv/soft-interface.c               | 12 ++---
 net/bridge/br_netlink.c                       |  8 ++--
 net/caif/chnl_net.c                           |  6 +--
 net/core/rtnetlink.c                          | 35 ++++++++-------
 net/hsr/hsr_netlink.c                         | 14 +++---
 net/ieee802154/6lowpan/core.c                 |  9 ++--
 net/ipv4/ip_gre.c                             | 27 ++++++++----
 net/ipv4/ip_tunnel.c                          | 16 ++++---
 net/ipv4/ip_vti.c                             | 10 +++--
 net/ipv4/ipip.c                               | 10 +++--
 net/ipv6/ip6_gre.c                            | 28 +++++++-----
 net/ipv6/ip6_tunnel.c                         | 16 +++----
 net/ipv6/ip6_vti.c                            | 15 +++----
 net/ipv6/sit.c                                | 16 +++----
 net/xfrm/xfrm_interface_core.c                | 14 +++---
 tools/testing/selftests/net/Makefile          |  1 +
 .../testing/selftests/net/lib/py/__init__.py  |  2 +-
 tools/testing/selftests/net/lib/py/netns.py   | 18 ++++++++
 tools/testing/selftests/net/netns-name.sh     | 10 +++++
 tools/testing/selftests/net/netns_atomic.py   | 39 ++++++++++++++++
 48 files changed, 385 insertions(+), 211 deletions(-)
 create mode 100755 tools/testing/selftests/net/netns_atomic.py

-- 
2.47.1

