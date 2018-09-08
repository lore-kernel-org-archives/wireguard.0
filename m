Return-Path: ju.orth@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf37a136
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:58 +0000 (UTC)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2c05fe35
 for <wireguard@lists.zx2c4.com>; Sat, 8 Sep 2018 12:18:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id z96-v6so17358292wrb.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 Sep 2018 05:19:27 -0700 (PDT)
Return-Path: <ju.orth@gmail.com>
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 7/7] tests: add test for transit-net
Date: Sat,  8 Sep 2018 14:18:41 +0200
Message-Id: <20180908121841.8372-8-ju.orth@gmail.com>
In-Reply-To: <20180908121841.8372-1-ju.orth@gmail.com>
References: <20180908121841.8372-1-ju.orth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/tests/netns.sh | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/src/tests/netns.sh b/src/tests/netns.sh
index 568612c..4cfcf61 100755
--- a/src/tests/netns.sh
+++ b/src/tests/netns.sh
@@ -222,6 +222,46 @@ n1 wg set wg0 peer "$more_specific_key" remove
 ip1 link del wg0
 ip2 link del wg0
 
+# Test using transit namespace. We now change the topology to this with transit-net of wg0 = $ns0
+# ┌──────────────────────┐    ┌───────────────────────┐     ┌────────────────────────────────────────┐
+# │    $ns1 namespace    │    │     $ns0 namespace    │     │             $ns2 namespace             │
+# │                      │    │                       │     │                                        │
+# │  ┌─────┐             │    │ ┌──────┐              │     │  ┌─────┐            ┌─────┐            │
+# │  │ wg0 │             │    │ │vethrs│──────────────┼─────┼──│veths│────────────│ wg0 │            │
+# │  ├─────┴──────────┐  │    │ ├──────┴────────────┐ │     │  ├─────┴──────────┐ ├─────┴──────────┐ │
+# │  │192.168.241.1/24│  │    │ │10.0.0.1/24        │ │     │  │10.0.0.100/24   │ │192.168.241.2/24│ │
+# │  │fd00::1/24      │  │    │ │SNAT:192.168.1.0/24│ │     │  │                │ │fd00::2/24      │ │
+# │  └────────────────┘  │    │ └───────────────────┘ │     │  └────────────────┘ └────────────────┘ │
+# └──────────────────────┘    └───────────────────────┘     └────────────────────────────────────────┘
+
+ip1 link add dev wg0 type wireguard
+ip2 link add dev wg0 type wireguard
+configure_peers
+n1 wg set wg0 transit-net /run/netns/$netns0
+
+ip0 link add vethrs type veth peer name veths
+ip0 link set veths netns $netns2
+ip0 link set vethrs up
+ip0 addr add 10.0.0.1/24 dev vethrs
+ip2 addr add 10.0.0.100/24 dev veths
+ip1 route add default dev wg0
+ip2 link set veths up
+waitiface $netns0 vethrs
+waitiface $netns2 veths
+
+n1 wg set wg0 peer "$pub2" endpoint 10.0.0.100:2 persistent-keepalive 1
+n1 ping -W 1 -c 1 192.168.241.2
+n2 ping -W 1 -c 1 192.168.241.1
+[[ $(n2 wg show wg0 endpoints) == "$pub1	10.0.0.1:1" ]]
+# Demonstrate n2 can still send packets to n1, since persistent-keepalive will prevent connection tracking entry from expiring (to see entries: `n0 conntrack -L`).
+pp sleep 3
+n2 ping -W 1 -c 1 192.168.241.1
+
+ip0 link del vethrs
+
+ip1 link del wg0
+ip2 link del wg0
+
 # Test using NAT. We now change the topology to this:
 # ┌────────────────────────────────────────┐    ┌────────────────────────────────────────────────┐     ┌────────────────────────────────────────┐
 # │             $ns1 namespace             │    │                 $ns0 namespace                 │     │             $ns2 namespace             │
-- 
2.18.0
