Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E02D4923D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:43:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e15309b5;
	Mon, 18 Nov 2024 12:45:33 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id df6b3782
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 12:58:20 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2e30db524c2so5448983a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Nov 2024 04:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731502699; x=1732107499; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFTsOSdSHxPXXC/kmCtPA19UOd1z5UErpUP4tQUDFm4=;
 b=bT41UoNyyNdV7qGiMxlIsLBzmOGhrBmLtwOHybID3NDTRZtqnPkUs/clzQekS96INu
 jiYW7E8+AoQwCyukTAjeYpiQre6x/HhGykKJddcrasazAwbNt2i5yMr4oWrZuqdpXlJS
 4Vekhh0JbOGIeo61AQEQtzIrTGk5n9fAWHGJHthtSNfWBpq5QF1UyZ0FzmpiSdXjbXpd
 CX4cJxqdLfVqODp5mBEpdoeT3NuX44wVdinUYmapFx2oVDmz+Ymi+qT0SZdOvaIboTOE
 z7dvO4/GXnagrwe/hv5VMKP0iWYTUFnyP7GY33XUdrHE1VUCa74Y8xZTGsTSkdiTStyN
 EnEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731502699; x=1732107499;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFTsOSdSHxPXXC/kmCtPA19UOd1z5UErpUP4tQUDFm4=;
 b=JL7sI0hHvmdpGhH0Bq5v/uhj6q5oGL8MbuELy0Gs1r8gAa74QccC+0fYTPCc/A3+aZ
 NMrVXAr9YShqSytPJY0YpP/xw60v23coOeB8Q6tys/FnAmom7/19hR9ArVhFs/yJTFmd
 zSdRRC+TNKutxHdpvbeDZ4qE/dtm7eB2QaFcIc07WtZFG9SdgXcB7Hz60kZVOvOflDWN
 E3BIBnUxOEoExNsyzNe2oJdvME+4gs10mMZddQQhCQrJ67D6ub7YqBXstkPOTQCeRFLc
 dIhFV/jN2EvS+nbf1S8K6Vop6MQI+iDzA/0GyFzIlFqO+2I+AfA8yH9fNO3AaQ1rHiVf
 htEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9w228tQR/0jIQGi4ht8sA2LSXmywzOAZ/rSDk6H3kLDLlQFcLOaEAN66ls8Y5qctM695v/BMvZAA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzI4wbA+83CQb9dWD6AqBXaBebF4uAPKZoK/yGJKBvvkmUkZjJr
 zEqyHgC24G0DQ8oiNZrJM2yZdRywoabqcAJL5RbBJ0KnQyBfHtBh
X-Google-Smtp-Source: AGHT+IG3aP3jfG+H+mqTGfWaQF6eC/hcm8KAxQSToRubUMwTZod3v43r/5qYZbnllxo9jc+4RsAB2Q==
X-Received: by 2002:a17:90b:1810:b0:2e2:cd5e:7eef with SMTP id
 98e67ed59e1d1-2e9b1773411mr26583707a91.27.1731502698852; 
 Wed, 13 Nov 2024 04:58:18 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3f8ed0esm1398632a91.40.2024.11.13.04.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:58:18 -0800 (PST)
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
Subject: [PATCH net-next v3 5/6] selftests: net: Add python context manager
 for netns entering
Date: Wed, 13 Nov 2024 20:57:14 +0800
Message-ID: <20241113125715.150201-6-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241113125715.150201-1-shaw.leon@gmail.com>
References: <20241113125715.150201-1-shaw.leon@gmail.com>
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

Change netns of current thread and switch back on context exit.
For example:

    with NetNSEnter("ns1"):
        ip("link add dummy0 type dummy")

The command be executed in netns "ns1".

Signed-off-by: Xiao Liang <shaw.leon@gmail.com>
---
 tools/testing/selftests/net/lib/py/__init__.py |  2 +-
 tools/testing/selftests/net/lib/py/netns.py    | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/lib/py/__init__.py b/tools/testing/selftests/net/lib/py/__init__.py
index 54d8f5eba810..e2d6c7b63019 100644
--- a/tools/testing/selftests/net/lib/py/__init__.py
+++ b/tools/testing/selftests/net/lib/py/__init__.py
@@ -2,7 +2,7 @@
 
 from .consts import KSRC
 from .ksft import *
-from .netns import NetNS
+from .netns import NetNS, NetNSEnter
 from .nsim import *
 from .utils import *
 from .ynl import NlError, YnlFamily, EthtoolFamily, NetdevFamily, RtnlFamily
diff --git a/tools/testing/selftests/net/lib/py/netns.py b/tools/testing/selftests/net/lib/py/netns.py
index ecff85f9074f..8e9317044eef 100644
--- a/tools/testing/selftests/net/lib/py/netns.py
+++ b/tools/testing/selftests/net/lib/py/netns.py
@@ -1,9 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
 from .utils import ip
+import ctypes
 import random
 import string
 
+libc = ctypes.cdll.LoadLibrary('libc.so.6')
+
 
 class NetNS:
     def __init__(self, name=None):
@@ -29,3 +32,18 @@ class NetNS:
 
     def __repr__(self):
         return f"NetNS({self.name})"
+
+
+class NetNSEnter:
+    def __init__(self, ns_name):
+        self.ns_path = f"/run/netns/{ns_name}"
+
+    def __enter__(self):
+        self.saved = open("/proc/thread-self/ns/net")
+        with open(self.ns_path) as ns_file:
+            libc.setns(ns_file.fileno(), 0)
+        return self
+
+    def __exit__(self, exc_type, exc_value, traceback):
+        libc.setns(self.saved.fileno(), 0)
+        self.saved.close()
-- 
2.47.0

