Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B76C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1d404b0;
	Tue, 20 May 2025 19:39:09 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 63192474
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jan 2025 14:39:06 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-216281bc30fso91285855ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jan 2025 06:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736779144; x=1737383944; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=LYvWQQRY/Wyr6pJ/KQV3MKLw/exMNJbT9/tsjWNPw7dQnqnNbUV5V3VfgSoPKxU5dU
 kKLHUXp6xCeU0qK0CcnINnhr95zfSUgTdxJJCk3qtQSL25T0RNsa3nyKkKhv1SH8Q2w3
 RjWNqJ6lcvSG8CUbGLPzonx2sRtbgcF9/wZnuXHepZhQKs5b041USpd1A2oHF1X3pe3n
 FMp1fA5O8ASDOYiO28ewbFhnyTd7QhlLmUXrCvTgWZ4P3t0WMgfu0yI5cQoAmTSr/BVZ
 ON43Ts5tyHkSHgG+f0zECLMzql4PpwA/y6Q0XHzGuOF0FlYMFd7vIFdDpMIXrTevsRUF
 fiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736779144; x=1737383944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=VxIhPl0ZKpV9GQ4Ugjbde2FQw34akqlbONL1spgFn/vnTK+YrrPbT7K0DqwEsq6ykb
 i4SdGTWTyReoaG88pRmN9MW9J/40ERCQtnP5xlEDpqhiq8roUyKBORXQ55HwYRoDWW9t
 t2Y/dqifMv+NF/c4Uwwy0gQiAqhllDTAY8DF1K6iZGnjpIL9Ov/XO/a2qYme7Mj+kclH
 57H8WI5ctZQCgAZdAA1ghNOLvIp6iKtV86yuLDrtD+KCayy+hWCx+SY27ESHi0fa8+Re
 s0/U8gXm+63DOkvLGHWK6mRkj5jF6e0VcznrFaB5TgNgQuQzA9/DBPqSSSFCXraTHchV
 xwng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvoy11E5OOnO1TSW1gZNKgRcKsu3a34fzKB0G7xNPlCul7NACRhcg+1QNSh3lJ3IZe20n5pxHpQdA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwmMeJgbznP74XMfUlYlOHNwNGGXUwcLB2L/qlDrXRUa9qUpfZx
 yPobkUg4VN67NjHYe8fG/Bxtat5F3CDYgxKMIPANGH6S0MzO7Cbm
X-Gm-Gg: ASbGnctISs+UTmX7qmSFnl/n6dzWzrGeQi+9hscWG2BtBXNaoGvJ2kjWPicCs8w7csm
 GskywQCGUU+tGU/mrM36dyWW5AjcxI89eVqk46J0SDIWaWiJWDmaiQDtQGSlSDwPtvcekW+WsHP
 9xynMycpSOZfeo9/dSwHn6XO+Y9mXISnGh8y8/M/5NcCajqTZm/1A6USsnuYpwVJts52MmAxieY
 WH5SZYhi0Rpc+GNEYfhKyMZqKyDxiaFItM9jwSQ1q9POlw=
X-Google-Smtp-Source: AGHT+IEL9Q/TeE8X83a4D73J5c4BnqISbL2nsMzkDnt4Xq2JHmNtTfGl7cYLX08uLNv4xfpjIcH6KQ==
X-Received: by 2002:a17:902:f685:b0:216:5002:7341 with SMTP id
 d9443c01a7336-21a83fde2bcmr322676685ad.44.1736779144551; 
 Mon, 13 Jan 2025 06:39:04 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f155e00sm54328715ad.103.2025.01.13.06.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 06:39:04 -0800 (PST)
From: Xiao Liang <shaw.leon@gmail.com>
To: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Kuniyuki Iwashima <kuniyu@amazon.com>, Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, linux-rdma@vger.kernel.org,
 linux-can@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org,
 bpf@vger.kernel.org, linux-ppp@vger.kernel.org, wireguard@lists.zx2c4.com,
 linux-wireless@vger.kernel.org, b.a.t.m.a.n@lists.open-mesh.org,
 bridge@lists.linux.dev, linux-wpan@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v8 10/11] selftests: net: Add python context manager
 for netns entering
Date: Mon, 13 Jan 2025 22:37:18 +0800
Message-ID: <20250113143719.7948-11-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113143719.7948-1-shaw.leon@gmail.com>
References: <20250113143719.7948-1-shaw.leon@gmail.com>
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

