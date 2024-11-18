Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABE2D591A0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:28:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffafc0c3;
	Mon, 18 Nov 2024 14:34:02 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b39c7ff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:33:59 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-720d01caa66so2786285b3a.2
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 06:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940438; x=1732545238; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Mad+mOcno2P0CIpC5U9uxqbBM+RxeN4q/RBh6+yxx1g=;
 b=e2++wtmWiCPRX/PluA81mjgBXwmh/OQnHom9ohHTvL9CIDFZDGe3Xok2c2xnBieb6Z
 kd+j992Lt8CXYKjuD+RfrmFNShhr9ELO21MT7DxSk6FVjF9gx5qdwOOhKG5ZdpDEtNfr
 /sTPV7+8gycLRCL2xPOu8akvD7bD0GONBkWywZHGvaG34BBCNYdd61YCDoI0QfZabQaG
 RASY864LqlRcLsBxpZiTAcbjdr6Wn4RoFG/ZH1EnB3g1mx8+9CJhz6LTVqODgDuN0INl
 OBmLWqmH7YbxyU6jyUcfBaEZDWOWkbhQNBrjEBIS1YNfDLkIfBF4lr/CfXQ0NHBoeu3Y
 vLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940438; x=1732545238;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Mad+mOcno2P0CIpC5U9uxqbBM+RxeN4q/RBh6+yxx1g=;
 b=Kkbw7shO3KJlHYa4ndCpo7D3poheeunKDhbTH4KDiYrF++KQj3MS15NThgY2mmisVr
 8o/HpQv9JM+s5/PpOpOknLdfOd9L/+YoynGzJGzLh3Z++cOU7nZYq1PzShbmJznzmMYY
 1+D8ky3/NEySGehPZCYQtDyw4SoAqj4Vg5rc+hkfxiuba6Tq19spDRVMTXBC2d0C2jd2
 mgbsTOs1gzSS2AfM37wxeqNiiUpTztKT1LEI88T2d3uSm6kub8ntRdIia06YdpvxNqzK
 649oUC7SL11tx8nJvwmcmhZ9LZLrUTOrGlB+nEDwLB9iKQgm5PfmczPdYcTweQL+V43K
 5rPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYSdGMbabtJhxE0EPZQls6JDXJFmRL0ycoG4jC0FOt612A6qSwbKnMT5XwkGlKvDxxFJ2g1mPv84=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzh8LZSoLBFcQG8KYUYDa8FpfYLTQX+yvD0hevYEry4Z76PbNNd
 RNqEYyuI8kokhMQ1tajyRfeI8M16VfU4HBa0FiXgLEbky3+Yt1dS
X-Google-Smtp-Source: AGHT+IF3SrGnsKmrF4jvHwe9jv6er3cYNAFkQ6BmUOZb81V3DDpEwoq4AchAw0/egZEddY1NEy8bEw==
X-Received: by 2002:a17:90b:3887:b0:2ea:98f1:c172 with SMTP id
 98e67ed59e1d1-2ea98f1c2a5mr1425759a91.7.1731940436264; 
 Mon, 18 Nov 2024 06:33:56 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea81b0e2fasm1616926a91.52.2024.11.18.06.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:33:55 -0800 (PST)
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
Subject: [PATCH net-next v4 5/5] selftests: net: Add two test cases for link
 netns
Date: Mon, 18 Nov 2024 22:32:44 +0800
Message-ID: <20241118143244.1773-6-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241118143244.1773-1-shaw.leon@gmail.com>
References: <20241118143244.1773-1-shaw.leon@gmail.com>
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

 - Add test for creating link in another netns when a link of the same
   name and ifindex exists in current netns.
 - Add test for link netns atomicity - create link directly in target
   netns, and no notifications should be generated in current netns.

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 tools/testing/selftests/net/Makefile        |  1 +
 tools/testing/selftests/net/netns-name.sh   | 10 ++++++
 tools/testing/selftests/net/netns_atomic.py | 39 +++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100755 tools/testing/selftests/net/netns_atomic.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 3d487b03c4a0..3aaa7950b0f0 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -34,6 +34,7 @@ TEST_PROGS += gre_gso.sh
 TEST_PROGS += cmsg_so_mark.sh
 TEST_PROGS += cmsg_time.sh cmsg_ipv6.sh
 TEST_PROGS += netns-name.sh
+TEST_PROGS += netns_atomic.py
 TEST_PROGS += nl_netdev.py
 TEST_PROGS += srv6_end_dt46_l3vpn_test.sh
 TEST_PROGS += srv6_end_dt4_l3vpn_test.sh
diff --git a/tools/testing/selftests/net/netns-name.sh b/tools/testing/selftests/net/netns-name.sh
index 6974474c26f3..0be1905d1f2f 100755
--- a/tools/testing/selftests/net/netns-name.sh
+++ b/tools/testing/selftests/net/netns-name.sh
@@ -78,6 +78,16 @@ ip -netns $NS link show dev $ALT_NAME 2> /dev/null &&
     fail "Can still find alt-name after move"
 ip -netns $test_ns link del $DEV || fail
 
+#
+# Test no conflict of the same name/ifindex in different netns
+#
+ip -netns $NS link add name $DEV index 100 type dummy || fail
+ip -netns $NS link add netns $test_ns name $DEV index 100 type dummy ||
+    fail "Can create in netns without moving"
+ip -netns $test_ns link show dev $DEV >> /dev/null || fail "Device not found"
+ip -netns $NS link del $DEV || fail
+ip -netns $test_ns link del $DEV || fail
+
 echo -ne "$(basename $0) \t\t\t\t"
 if [ $RET_CODE -eq 0 ]; then
     echo "[  OK  ]"
diff --git a/tools/testing/selftests/net/netns_atomic.py b/tools/testing/selftests/net/netns_atomic.py
new file mode 100755
index 000000000000..d350a3fc0a91
--- /dev/null
+++ b/tools/testing/selftests/net/netns_atomic.py
@@ -0,0 +1,39 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+import time
+
+from lib.py import ksft_run, ksft_exit, ksft_true
+from lib.py import ip
+from lib.py import NetNS, NetNSEnter
+from lib.py import RtnlFamily
+
+
+def test_event(ns1, ns2) -> None:
+    with NetNSEnter(str(ns1)):
+        rtnl = RtnlFamily()
+
+    rtnl.ntf_subscribe("rtnlgrp-link")
+
+    ip(f"netns set {ns1} 0", ns=str(ns2))
+
+    ip(f"link add netns {ns2} link-netnsid 0 dummy1 type dummy")
+    ip(f"link add netns {ns2} dummy2 type dummy", ns=str(ns1))
+
+    ip("link del dummy1", ns=str(ns2))
+    ip("link del dummy2", ns=str(ns2))
+
+    time.sleep(1)
+    rtnl.check_ntf()
+    ksft_true(rtnl.async_msg_queue.empty(),
+              "Received unexpected link notification")
+
+
+def main() -> None:
+    with NetNS() as ns1, NetNS() as ns2:
+        ksft_run([test_event], args=(ns1, ns2))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.47.0

