Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CDC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4520f7fe;
	Tue, 20 May 2025 19:36:11 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b8aa3d1d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Dec 2024 13:10:48 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-728ea1573c0so5638799b3a.0
 for <wireguard@lists.zx2c4.com>; Wed, 18 Dec 2024 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734527446; x=1735132246; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=QB1AezRcMhCkyx9D7SXE5Dh6AoywkZ2v0U1wGsuMeSUiwNn6UoonXJawdtkJlr1FBY
 VPAIi5vf7KT45K4aQMXvO2BH/IWz6DYTTcfCpM5dZ6m7fkTaRpf5EVwNu4aTevIXDsQg
 X7TnZ76rxKGunOfE0StivDxoHwBSMUD4bsX8dNABucfqSYGdl3Dr8T+YDCzLIQ6hGWBo
 d4UGC6AHSL/f9z5rlzO1VK4G1MyNhm0cd79kHqka/GE84qbnjRzSEM8oIoU2d+McP9k1
 Xlv8HHJzeWHf14noWFdanalY+8PtvBjBaPlWqep0MQ42FHdVtxfHO4CjmInF480Br4GK
 uuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734527446; x=1735132246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=dWYloVdNRaWTpWv3xA5sAolKBr1wW6G954WOdl0TyyBzw1EHZFDhqv64DlmwTY68ep
 B5Gh+AFgxcDO6jFudTtKcmdFF6eBKrvZj3J+hb0ZJ8MM9hxoUWI7ZpH+EXDK2LKKX6YF
 t2Y5EUl8TYYfKddN1yshzik8fO8/PZkpB0Ga4b4/YG9DD8KqBDLJvzvIE3JlGdBPz4Wv
 FHWYnrYHSuRW9BPA5KlFb7bzCuNWg8nNs7cQjFYpIcuHL6hXyczfPPEKZQj0eC+mlAen
 SFFUDnUi8NQH7Da9rmhWKCBbVVE/zCPJqpzldRfKRDiVYK3ocBW1GVhlqgI4mJdsRp8l
 j/6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLkXkNX2E0XqHv8UA/wXjMZYrPF4E/9fhg7Q3gr2Y1sfwH/4iTMFq5a2XFm0I69Fc7czl/hbp7hOk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxbsf9kSvHGFLi7VYWwqJZFYs2cGF3RHYeDg8kPNS3F9DkcUAD1
 iUiLT5H4ga+xqy0pH8aGlsbFdlz1OQhKMmlC45WCSgdXod495Yyo
X-Gm-Gg: ASbGncsZ+S4C6A4DxVkktkZ9bxug1Eoc0/ik5DZwMJaWoHkQsEcd7mkQFngBoqr2+oi
 PfISckxlqymY05pUZYsc7WqBh/mtsyPcjQpkE7AODR4QFDnWQhypgpcQpnJUAHAaNDJmCdeYbMQ
 CK1cF5oxxvPoXp8nwppAc2vzs87lFu2Bmrn+wMLr5/kuDxc8Uzseq8PzWFzTY0t3xKKOFgdOwx1
 N+h7jpMIxqQHM9uNlLUxfJ+sysr0y5435Z8E7QCOHf2axE=
X-Google-Smtp-Source: AGHT+IFJSba0hMYoxDtWWfQo3+fMH+6cNLxoIt5yunX4KkQHyaeVCZq9fnVPYHJO8DT42j8sEsCrNg==
X-Received: by 2002:a05:6a21:6f02:b0:1e0:dcc5:164d with SMTP id
 adf61e73a8af0-1e5b47f3b12mr5217374637.8.1734527446438; 
 Wed, 18 Dec 2024 05:10:46 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5c0f59asm7434754a12.67.2024.12.18.05.10.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 05:10:45 -0800 (PST)
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
Subject: [PATCH net-next v6 10/11] selftests: net: Add python context manager
 for netns entering
Date: Wed, 18 Dec 2024 21:09:08 +0800
Message-ID: <20241218130909.2173-11-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218130909.2173-1-shaw.leon@gmail.com>
References: <20241218130909.2173-1-shaw.leon@gmail.com>
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
2.47.1

