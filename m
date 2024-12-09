Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD288C2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42bcd4d4;
	Tue, 20 May 2025 19:35:09 +0000 (UTC)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a7970b11
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2024 14:06:16 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2165448243fso9518765ad.1
 for <wireguard@lists.zx2c4.com>; Mon, 09 Dec 2024 06:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733753174; x=1734357974; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IZacjWdb8RyenSpXv6Caz5kcIhA6mwKRd5G/S3r2hOU=;
 b=YZZQkRlZhoB5wKt0Hf18+NiI7ZvU8rSr0OySE+0B6zSrT0H/IaaGvXa5lXROaEsHVN
 75CipuP8Qwct2Lj0h7r1RSFQtWqOBHaLWP0nm2OeUZ38eyaLr+0jCfKwrwYoe1GDxL1K
 BJy3KBxcBGJx8lmwtwyjhqSMss7arVEb5uae++686NOsD1/c0RoP2FnNDqwYohcMauYW
 K3mVH61QAAAXctYQ4JzRtZojYJdIr9pf5ZcXeGrVLvqgPcRrsWTLX1RWltzjfG1OwcHM
 hrSCNf4i40Bgz05iQlp3GYzFNF87jnju4Q1PTjx3uAsPwdWczowmz8wmvWQosIa8ze+s
 bxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733753174; x=1734357974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IZacjWdb8RyenSpXv6Caz5kcIhA6mwKRd5G/S3r2hOU=;
 b=gVVaUQbNP6xWAl09PalzHZfodItWV66mCxt+Gr0H+AFpHlyue3wVbPs2NDfNVakeHj
 nG1cNMNfbNxeXs1Fp0Alq5/9XS+JChZX3ReBW9wd+gb2LPYnCBNHkJIMXz+T02qri+IL
 q7Dv8O0mlLpa3Eg0ScusSg9Sf0LRm7mBPQuP7JPrAvC19rbL29SU2k6AyXbA+s64uRsP
 d/leu8X+Fi/vbrfRJjqeOJgJoNrBWpP/9OwXl4YE/6DKHNLVD/63RQ/TcDaRblUITwfP
 ifFNtqL2V9O/6kQdPYg+qiw9wa5Qep+TO7lMwcUSBjENz3Gmcs+fSzazKm8Fqxg8tDnQ
 F21w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyvGBTLuSu+j4zDWCOHeiz6zIqA+VqM5ebSF3V6bT4WZtKed1ENXdIPfjVVdj3g6Nsfa9m3APMKms=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Ywn2ZKC4ChqlyKlNnD/Lflb8Jn6ZNeS6/S/XZlm8ohMP5oXTUcu
 xTUPvf8EsKxj7alLRvTl/DRNDz8VTa8N+ntNuFdXfS1Q+OoFwjeO
X-Gm-Gg: ASbGncul7x/MRUAGa/FSX/aLMyp1qXEV++Fw4t+hs465Ro96FUaHBiHogXX2mL2GL3J
 yOZ9D3sNkp104Ypz6t45Qe903T6FwOSCKMuIUIRpwlNyh7rsmMWYFfGhfEZLLwyS88jgt9XiZ1S
 tb0yYi7V8iKxI3tPyt4C3sq/IU2kNpIH8AsL9wTLdjZqZELCLoZ+XabmhZeyj/taAHHo3H+hHc6
 Wu7GoYiyAacMuBfON5CHrCRpnYWfQ71zZV5ISB5PznSLf8=
X-Google-Smtp-Source: AGHT+IHmgSwYi0f3YPXZUnipKY4/LE+6y74m5MtL3Oj9+h7tdAHjZEgR2L+TFdRwx2htNJ1fIiOnow==
X-Received: by 2002:a17:902:ce8d:b0:215:a2af:44ca with SMTP id
 d9443c01a7336-21614dd2374mr177498285ad.37.1733753174431; 
 Mon, 09 Dec 2024 06:06:14 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216221db645sm49605645ad.46.2024.12.09.06.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 06:06:13 -0800 (PST)
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
Subject: [PATCH net-next v5 5/5] selftests: net: Add two test cases for link
 netns
Date: Mon,  9 Dec 2024 22:01:51 +0800
Message-ID: <20241209140151.231257-6-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241209140151.231257-1-shaw.leon@gmail.com>
References: <20241209140151.231257-1-shaw.leon@gmail.com>
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
index cb2fc601de66..f9f7a765d645 100644
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
2.47.1

