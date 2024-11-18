Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797A2D591A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 16:28:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e23d39d1;
	Mon, 18 Nov 2024 14:33:59 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4dffd42e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 14:33:49 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-72467c35ddeso3022208b3a.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 06:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731940428; x=1732545228; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFTsOSdSHxPXXC/kmCtPA19UOd1z5UErpUP4tQUDFm4=;
 b=OSFWFy2RiMwxE22yedTJsV0EL6ro2Gc3pD8Bb87PPVN4c66gzEbgrLwTZZESlbe4+u
 OIoWuvOqNr0i5oGjmNuKfD4MuvnfG1S94zBmb8hpD1wtzkmC8BeMxJldEsrhsg46aEJP
 kCPdkYXQUkrtJVOoKAaiuaJrfgk8F+RvD96UEbBfjDhgF6M47KLGuxcn0DuBuW6sUvZ9
 vz4rQwDVMRghFjxRTiPM6T2nlJmp2ljeLUp3cw8GH4CSlK68cuuTDCHXmpso4tPcjtc7
 SjEhd/ll11fl/AoUd5NreC5M1klVVqAauPrpfwEwpCTRc5MVcaMmHanNqk+C8pi76c4D
 3ezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731940428; x=1732545228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFTsOSdSHxPXXC/kmCtPA19UOd1z5UErpUP4tQUDFm4=;
 b=f0Hr35TuPBvzAYRXep6txYX2zcwS3TqHRU1aBTuMHtIO4HC0/HnLhfNsCYPfNAwma1
 pAyrMDTKxKaFRE9VsiDtHx/oHIhns5XdOHl1vj58vAf0/VRaqd/AnZSSYQSHY9bQSI64
 Pf4iaeYMs/FbRnZS71/iizolPgaAnRj0ZLB20IbhSkDtegDnenlkLPgVnoXp/HkeFckR
 GTx2tNh92ADtwOfN5bbONfAXaoC+NOXzw9Eo5daI8Chz3ySYeUzPWFtO0U+eEPqRyeq9
 dvQI/KjNWDnXVfQMbKe03v6YYKOVWIyyXRPjpn1B5/aa2kI6BavsAGrqUGZpT7Strfsp
 2d9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5vlFFVdnRGuRrukm9GnoSjxMq4DkqTxVKlzLTrtsn2YoxZI+41hxJwOta+IaQ7ruVpwbgwDTSFFM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxGs7b/QVhoDmB+ZMPKxNxM4qDoCx8/aDFEdMFjO7ADziAUQiKH
 cYzcbmI+n9t24zCkz4oGDVQcQ7Edo4vOZZerKOs1hZupeZC5dz/H
X-Google-Smtp-Source: AGHT+IEB4OLbXUI9lGpusUMTTQj7CZMlri2szirQ6bOEHE+aXQRtMaJMjzV66+oDEF7uQxq+tjw2ug==
X-Received: by 2002:a17:90b:4a87:b0:2ea:7bdd:f320 with SMTP id
 98e67ed59e1d1-2ea7bddf3c1mr5084481a91.1.1731940427545; 
 Mon, 18 Nov 2024 06:33:47 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ea81b0e2fasm1616926a91.52.2024.11.18.06.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 06:33:46 -0800 (PST)
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
Subject: [PATCH net-next v4 4/5] selftests: net: Add python context manager
 for netns entering
Date: Mon, 18 Nov 2024 22:32:43 +0800
Message-ID: <20241118143244.1773-5-shaw.leon@gmail.com>
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

