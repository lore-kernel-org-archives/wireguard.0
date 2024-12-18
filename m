Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE089C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 20:19:20 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49faf714;
	Tue, 20 May 2025 19:35:39 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c23cfe2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:09:26 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-725abf74334so5674477b3a.3
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527365; x=1735132165; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6llrxywd5dEoVM0OKwihGrkHHqwNftGWmdHiygXfmj8=;
 b=hlLlcpFtgetVRs5+j2g42ipZPY7+qsA18/cbOezswBWIU1xJisEV7W36i/cxn7I7D8
 maHy+AspSP+SJXNI6x6DGcHqKxgJwYI9hvKlznsjC4aS7eplZvyuwzk8So6saD/+E6de
 G+3DWXBvV6uOT+iUBa6+citPwwN/f8KoExN2edyawYodtOMmVDoAJm9bGxbHcMJu+IgT
 kWzJvwGQMeVNGoh+54yYA8nBL5ihr603npKjSxAymqNrGumurzDK6Nd19t7AsqRYmPGj
 UDEDGGcMKKzlg77/3hbJpwSAFpzYigTdqmJknTKoiH1JsqQVtL/aypeyCYaN3mhI96lt
 Duyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527365; x=1735132165;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6llrxywd5dEoVM0OKwihGrkHHqwNftGWmdHiygXfmj8=;
 b=iPu1zec1+sDFuKHc8f3BW5cdzmzNxquFynLeIZyA1Y2GXsmm4wbA3JStg+7lk4CRoA
 IaUEJetZ3ohAto7ljptjp4FAMn1xchntlgaY5vMR3Bh3CxuAGQWnfO8/ynPMAjorAa0c
 bOUu3NLyiBkD6UDWq/KcAmLz2yxXPQcUfhT0XfrimfcHl3eZ3Kmunq0hWi6mG8kO8Vw+
 x7zcJ7DMfgFD8S6vag0f+8M9Y9AvyTaSIdOkvunVsDzeeM5I8bOlBmfns1Vyc89PW9EY
 Q2NOg8b0gsgVpYnmrS9kU6WqRgm9+jyqE7wRZ1FHw3GXQfFghhhHsTovc/VS61npn8s9
 X6dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcbqb5iqZIwHDWrsv1ZVFpZ2NW4EpigVgYICj6ihD/mCMpKRzsvhcaE/X1WZcNKy7ulq8HGeX29o8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxrBv8pSpcmvPt913UsaG/ccJHC3/UfVRsXV7lf887K9VM86hgw
 dwdKyrOZPNqkY/gzBLXcVan6Z8pO3wWSvvzxRF64TCi5ZZtv9e8V
X-Gm-Gg: ASbGncuABc0vnC11CzWEc18h3CKZ4AKhhC303siIAwXsxdT1j5FMHjXRzBdYOTMUJ7e
 kd/fuFORetNzhSwyZqdDVnRLo5Sj6M4NUeBNDqKHXRoVdCmUE8MX2iVegjbl/x+9Ag+IYX6mkfF
 tLumZamgcGLw8uxwbReXWHtxXa3MVU3xt5dS924EqEwu8RoZwkQ0CQJfmaDvdYvhargxu5Kwna2
 ns6vTZqGmfm/n1AGoOKOXRX4Pmi6UVOh1pRIe6glEmdUVI=
X-Google-Smtp-Source: AGHT+IHxL0OHgUEQczY58g8XDBLqS8Ex4WTxtaZ2NUqH1g4R3asgqmGfw3HW/w2dfnMjfE/n2fJrPg==
X-Received: by 2002:a05:6a00:2313:b0:728:e906:e466 with SMTP id
 d2e1a72fcca58-72a8d2dc70cmr4546358b3a.21.1734527364845; 
 Wed, 18 Dec 2024 05:09:24 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:09:24 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Jiri Pirko <jiri@resnulli.us>,
 Hangbin Liu <liuhangbin@gmail.com>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 00/11] net: Improve netns handling in rtnetlink
Date: Wed, 18 Dec 2024 21:08:58 +0800
Message-ID: <20241218130909.2173-1-shaw.leon@gmail.com>
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
rtnetlink, to make link creation more intuitive:

 1) Creating link in another net namespace doesn't conflict with link
    names in current one.
 2) Refector rtnetlink link creation. Create link in target namespace
    directly.

So that

  # ip link add netns ns1 link-netns ns2 tun0 type gre ...

will create tun0 in ns1, rather than create it in ns2 and move to ns1.
And don't conflict with another interface named "tun0" in current netns.

Patch 01 servers for 1) to avoids link name conflict in different netns.

To achieve 2), there're mainly 3 steps:

 - Patch 02 packs newlink() parameters into a struct, including
   the original "src_net" along with more netns context.
 - Patch 03 ~ 07 converts device drivers to use the explicit netns
   extracted from params.
 - Patch 08 ~ 09 removes the old netns parameter, and converts
   rtnetlink to create device in target netns directly.

Patch 10 ~ 11 adds some tests for link name and link netns.


BTW please note there're some issues found in current code:

- In amt_newlink() drivers/net/amt.c:

    amt->net = net;
    ...
    amt->stream_dev = dev_get_by_index(net, ...

  Uses net, but amt_lookup_upper_dev() only searches in dev_net.
  So the AMT device may not be properly deleted if it's in a different
  netns from lower dev.

- In gtp_newlink() in drivers/net/gtp.c:

    gtp->net = src_net;
    ...
    gn = net_generic(dev_net(dev), gtp_net_id);
    list_add_rcu(&gtp->list, &gn->gtp_dev_list);

  Uses src_net, but priv is linked to list in dev_net. So it may not be
  properly deleted on removal of link netns.

- In pfcp_newlink() in drivers/net/pfcp.c:

    pfcp->net = net;
    ...
    pn = net_generic(dev_net(dev), pfcp_net_id);
    list_add_rcu(&pfcp->list, &pn->pfcp_dev_list);

  Same as above.

- In lowpan_newlink() in net/ieee802154/6lowpan/core.c:

    wdev = dev_get_by_index(dev_net(ldev), nla_get_u32(tb[IFLA_LINK]));

  Looks for IFLA_LINK in dev_net, but in theory the ifindex is defined
  in link netns.

---

v6:
 - Split prototype, driver and rtnetlink changes.
 - Add more tests for link netns.
 - Fix IPv6 tunnel net overwriten in ndo_init().
 - Reorder variable declarations.
 - Exclude a ip_tunnel-specific patch.

v5:
 link: https://lore.kernel.org/all/20241209140151.231257-1-shaw.leon@gmail.com/
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


Xiao Liang (11):
  rtnetlink: Lookup device in target netns when creating link
  rtnetlink: Pack newlink() params into struct
  net: Use link netns in newlink() of rtnl_link_ops
  ieee802154: 6lowpan: Use link netns in newlink() of rtnl_link_ops
  net: ip_tunnel: Use link netns in newlink() of rtnl_link_ops
  net: ipv6: Use link netns in newlink() of rtnl_link_ops
  net: xfrm: Use link netns in newlink() of rtnl_link_ops
  rtnetlink: Remove "net" from newlink params
  rtnetlink: Create link directly in target net namespace
  selftests: net: Add python context manager for netns entering
  selftests: net: Add test cases for link and peer netns

 drivers/infiniband/ulp/ipoib/ipoib_netlink.c  |  11 +-
 drivers/net/amt.c                             |  16 +-
 drivers/net/bareudp.c                         |  11 +-
 drivers/net/bonding/bond_netlink.c            |   8 +-
 drivers/net/can/dev/netlink.c                 |   4 +-
 drivers/net/can/vxcan.c                       |   9 +-
 .../ethernet/qualcomm/rmnet/rmnet_config.c    |  11 +-
 drivers/net/geneve.c                          |  11 +-
 drivers/net/gtp.c                             |   9 +-
 drivers/net/ipvlan/ipvlan.h                   |   4 +-
 drivers/net/ipvlan/ipvlan_main.c              |  15 +-
 drivers/net/ipvlan/ipvtap.c                   |  10 +-
 drivers/net/macsec.c                          |  15 +-
 drivers/net/macvlan.c                         |   8 +-
 drivers/net/macvtap.c                         |  11 +-
 drivers/net/netkit.c                          |   9 +-
 drivers/net/pfcp.c                            |  11 +-
 drivers/net/ppp/ppp_generic.c                 |  10 +-
 drivers/net/team/team_core.c                  |   7 +-
 drivers/net/veth.c                            |   9 +-
 drivers/net/vrf.c                             |  11 +-
 drivers/net/vxlan/vxlan_core.c                |  11 +-
 drivers/net/wireguard/device.c                |  11 +-
 drivers/net/wireless/virtual/virt_wifi.c      |  14 +-
 drivers/net/wwan/wwan_core.c                  |  25 ++-
 include/net/ip_tunnels.h                      |   5 +-
 include/net/rtnetlink.h                       |  44 +++++-
 net/8021q/vlan_netlink.c                      |  15 +-
 net/batman-adv/soft-interface.c               |  16 +-
 net/bridge/br_netlink.c                       |  12 +-
 net/caif/chnl_net.c                           |   6 +-
 net/core/rtnetlink.c                          |  35 +++--
 net/hsr/hsr_netlink.c                         |  14 +-
 net/ieee802154/6lowpan/core.c                 |   9 +-
 net/ipv4/ip_gre.c                             |  27 ++--
 net/ipv4/ip_tunnel.c                          |  10 +-
 net/ipv4/ip_vti.c                             |  10 +-
 net/ipv4/ipip.c                               |  14 +-
 net/ipv6/ip6_gre.c                            |  42 ++++--
 net/ipv6/ip6_tunnel.c                         |  20 ++-
 net/ipv6/ip6_vti.c                            |  16 +-
 net/ipv6/sit.c                                |  18 ++-
 net/xfrm/xfrm_interface_core.c                |  15 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/lib/py/__init__.py  |   2 +-
 tools/testing/selftests/net/lib/py/netns.py   |  18 +++
 tools/testing/selftests/net/link_netns.py     | 142 ++++++++++++++++++
 tools/testing/selftests/net/netns-name.sh     |  10 ++
 48 files changed, 546 insertions(+), 226 deletions(-)
 create mode 100755 tools/testing/selftests/net/link_netns.py

-- 
2.47.1

