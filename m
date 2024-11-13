Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B6D6D49233
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:15:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b03c43f8;
	Mon, 18 Nov 2024 12:45:26 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf8e66d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 12:57:38 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2e2bb1efe78so524842a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Nov 2024 04:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731502656; x=1732107456; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=16RIG7XtmkaIMsGLfFdWcl8EYTUAA5lDQMgC+uoAVXA=;
 b=KYYhxfzOm7m1RMFe8GY/6TVB7nmTGilw47RErwApyzulJS+rSkj1i5Fu3sO33aJKiY
 ZWlBDLUCufezIkfIkG9CY1/ggCJ6ro73Ye00WPUYnHdjECVaSm+7lxuix7QkCb26w5+b
 asPqYR+/Z5g+VrUs4mLARti4BRyhT+WBPFhJB+iE3C3Bt2mtz4EJR+wgrmqeGdwQ6JFJ
 USUuOqyV1pq9llKRoO72zaJRR+9Os4Nl1Pdkza2U9To/bHjk+0i/WzGREZwFlU3d3VGQ
 qUVUQ8llyDBjG8FfHK9pd/BJGEyQZhC5mGXdGgLfvONAcuWEz/njIp8dOsQP1uzzuB9E
 OuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731502656; x=1732107456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16RIG7XtmkaIMsGLfFdWcl8EYTUAA5lDQMgC+uoAVXA=;
 b=r0LM9J1pesxszOc4xNENI8eoZOmNw6vV1feyT0TLx/ZvqcQLH9WmaPDfcVIDPtWl8l
 aDy9xVicjP9X1yuoQ4nZbh/J18NWBqjCnRjxaAC0KSEASefEp4mbPfZwu/OtZ4SiE6ky
 lCjL0rKgy2OBDn9SYdXeIDuPyOXvUoVtJoPlrqVsFED3/EBuYKu2heaeHqtQz2wOLyuv
 Vd3OPPQVzpCpCaKTzvSsajZVu9INycQyHz/WqKmcyubxSBJLOFf3gGpLzDvaN4rZv7gw
 ublPkyfvzIITqhnXHlKAaYEwLfqLcxl2G3dEHgh1Z40nxNSVEPF6QJOrdnfXNyV4/ku4
 EaWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlREF9Jw9vl4pQIPF+b5rxUw/seaszxePPB9v9kBXKDctDvgB6jTm5TsR7bKzQMD/VOQHS2Qqn/Tk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw2UPKE68E7iFmxxsMio67yFh70uyE5E4mlUu8gBPysRi7jRkb3
 L9FEshZxIlNVc0n2f8udA6zRh8OHGKQjEcdZjQnYnJYfNFxF5tFP
X-Google-Smtp-Source: AGHT+IG1llNssb9d3itpdlPx9GEqMX+Zp38UcErZg9PjxNGttUHCL6O3wsgZQ/zCnjJA57EpkRZP1g==
X-Received: by 2002:a17:90b:2789:b0:2e2:bb32:73e7 with SMTP id
 98e67ed59e1d1-2e9b1f844damr30704968a91.15.1731502656393; 
 Wed, 13 Nov 2024 04:57:36 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3f8ed0esm1398632a91.40.2024.11.13.04.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:57:35 -0800 (PST)
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
Subject: [PATCH net-next v3 0/6] net: Improve netns handling in RTNL and
 ip_tunnel
Date: Wed, 13 Nov 2024 20:57:09 +0800
Message-ID: <20241113125715.150201-1-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Patch 1 from Donald is included just as a dependency.

---

v3:
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


Donald Hunter (1):
  Revert "tools/net/ynl: improve async notification handling"

Xiao Liang (5):
  net: ip_tunnel: Build flow in underlay net namespace
  rtnetlink: Lookup device in target netns when creating link
  rtnetlink: Decouple net namespaces in rtnl_newlink_create()
  selftests: net: Add python context manager for netns entering
  selftests: net: Add two test cases for link netns

 drivers/infiniband/ulp/ipoib/ipoib_netlink.c  |  6 ++-
 drivers/net/amt.c                             |  6 +--
 drivers/net/bareudp.c                         |  4 +-
 drivers/net/bonding/bond_netlink.c            |  3 +-
 drivers/net/can/dev/netlink.c                 |  2 +-
 drivers/net/can/vxcan.c                       |  4 +-
 .../ethernet/qualcomm/rmnet/rmnet_config.c    |  5 +-
 drivers/net/geneve.c                          |  4 +-
 drivers/net/gtp.c                             |  4 +-
 drivers/net/ipvlan/ipvlan.h                   |  2 +-
 drivers/net/ipvlan/ipvlan_main.c              |  5 +-
 drivers/net/ipvlan/ipvtap.c                   |  4 +-
 drivers/net/macsec.c                          |  5 +-
 drivers/net/macvlan.c                         |  5 +-
 drivers/net/macvtap.c                         |  5 +-
 drivers/net/netkit.c                          |  4 +-
 drivers/net/pfcp.c                            |  4 +-
 drivers/net/ppp/ppp_generic.c                 |  4 +-
 drivers/net/team/team_core.c                  |  2 +-
 drivers/net/veth.c                            |  4 +-
 drivers/net/vrf.c                             |  2 +-
 drivers/net/vxlan/vxlan_core.c                |  4 +-
 drivers/net/wireguard/device.c                |  4 +-
 drivers/net/wireless/virtual/virt_wifi.c      |  5 +-
 drivers/net/wwan/wwan_core.c                  |  6 ++-
 include/net/ip_tunnels.h                      |  5 +-
 include/net/rtnetlink.h                       | 22 ++++++++-
 net/8021q/vlan_netlink.c                      |  5 +-
 net/batman-adv/soft-interface.c               |  5 +-
 net/bridge/br_netlink.c                       |  2 +-
 net/caif/chnl_net.c                           |  2 +-
 net/core/rtnetlink.c                          | 25 ++++++----
 net/hsr/hsr_netlink.c                         |  8 +--
 net/ieee802154/6lowpan/core.c                 |  5 +-
 net/ipv4/ip_gre.c                             | 13 +++--
 net/ipv4/ip_tunnel.c                          | 16 +++---
 net/ipv4/ip_vti.c                             |  5 +-
 net/ipv4/ipip.c                               |  5 +-
 net/ipv6/ip6_gre.c                            | 17 ++++---
 net/ipv6/ip6_tunnel.c                         | 11 ++---
 net/ipv6/ip6_vti.c                            | 11 ++---
 net/ipv6/sit.c                                | 11 ++---
 net/xfrm/xfrm_interface_core.c                | 13 +++--
 tools/net/ynl/cli.py                          | 10 ++--
 tools/net/ynl/lib/ynl.py                      | 49 ++++++++-----------
 tools/testing/selftests/net/Makefile          |  1 +
 .../testing/selftests/net/lib/py/__init__.py  |  2 +-
 tools/testing/selftests/net/lib/py/netns.py   | 18 +++++++
 tools/testing/selftests/net/netns-name.sh     | 10 ++++
 tools/testing/selftests/net/netns_atomic.py   | 38 ++++++++++++++
 50 files changed, 255 insertions(+), 157 deletions(-)
 create mode 100755 tools/testing/selftests/net/netns_atomic.py

-- 
2.47.0

