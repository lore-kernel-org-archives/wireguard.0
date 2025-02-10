Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 142D5C54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:59:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0539d161;
	Tue, 20 May 2025 19:40:37 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 159e1ab6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Feb 2025 13:31:49 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2f9b9c0088fso6828282a91.0
 for <wireguard@lists.zx2c4.com>; Mon, 10 Feb 2025 05:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739194308; x=1739799108; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ke0PFn5ns0UuVrqND5gWG1VnmGxHj7kcjuhyXJXO0M=;
 b=j9qLc5pyDZ+DRuVVn5UH+NZ7MqZSwlRZJuCm7X/5kqnPO0aL6Eu9MFINUEM0bxfzlA
 VoYiV3V4w72GASlN7yjS3/nR1DdvBFj1MfajM1JWd5vygT1ttOhPqxQXpOMIrEiZPFEN
 ueElc7dXbxGq4oYS4AhSZHseeb7Y99k5i2pRklaUs8llz0NB86+ecJgM+7HGNFVuVn/h
 sobH7ssqPgIurSoaXlB/iEqbIVqEWw3rm2joQi3ZIvLjzMc6wMXgbR2HtSK7WBXAIamJ
 ma5FXWQbeStvLspCEFqxiPESTwyxhOwsenLCwRsZNo68PMkbPpS/nozcX7GZc82z3EC5
 AiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739194308; x=1739799108;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8ke0PFn5ns0UuVrqND5gWG1VnmGxHj7kcjuhyXJXO0M=;
 b=c7RfUMcXMqgaUA0a8CtHsLj7lMawMUofdsZVfCCcwzPtp/2jlTsTEuj0oyzQ2+x76o
 HfwWv0E90gNVQvgNlorSpT1f3tlOfksn8w8YFAe+SIGBJ4HK8g29OlB8qKop1ZrkKpGQ
 gi9HXe549SgKoU3nzV2gjCTw+z/52KuiKvgvF9TrowtBnZA1TiOT3oZkNSpComeir2ul
 LRi3MgTUH7FcJWYJCpvC8ger1H7qHy0XN4YEkaMvLYBEBvJkWCvg0XFzyqs59LxTIP4+
 MbzTlVj3zrU5VQjZeOHD9LzdhyhHAm9SXfxxyC2cpugJYgKtGeJVTEs2Zl4/h0tM43in
 Utcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMw7RIRAC85vTm69BzxM+w70V5wMDzC89ILkzt/zjMA2mv/RSgqH/PLkzhSUxnpS2lGNlk7KOBYQQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YwF6fHob4E/Ea4Q6wCAzlyZ4BSOp2RcZcVOdAH8Mtk+1EEmuqP9
 PbMELo3YZZ/vRytT6Wrs8r12dAg7659xxIGUnttmzmwt9FQjn361
X-Gm-Gg: ASbGncurZhVeNrVUY6/wNMtxI3CHSegS3zgq6mPqjphVTsJE3ax6JpXvk07/ZVkshAT
 7lmG9FLummaOMQVsmIIg7RvraUsPkMitjmLsW5tcfjPufM7PI/WUIQLfQZZ1i2aigZ+qYgP7P4R
 PcM3HHetpa6QZ9mXGr3b67qkX+hG51s6Ya65sayxT0SP95YA5oRI1S7AlGF1nVhtT7WX7OxBrXF
 pvpPl/M00XzAXNejkXvFOZjeo1vRnqmTsg4xc9bHeGXmNjPIF17v/lDCv8OH2DXVMD3GYkn8VbQ
 sHWVKQ==
X-Google-Smtp-Source: AGHT+IFPiBsnnOAy2e8DGACZaeMc4ZZCgfCsAVv3/+u7QA91zVdRjIX/zkP0E7/3XIVhHqlMh6JYtA==
X-Received: by 2002:a17:90b:350e:b0:2ef:ad48:7175 with SMTP id
 98e67ed59e1d1-2f9ffb7ba83mr30255082a91.15.1739194308152; 
 Mon, 10 Feb 2025 05:31:48 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653af3bsm78799445ad.57.2025.02.10.05.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 05:31:47 -0800 (PST)
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
Subject: [PATCH net-next v9 10/11] selftests: net: Add python context manager
 for netns entering
Date: Mon, 10 Feb 2025 21:30:01 +0800
Message-ID: <20250210133002.883422-11-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210133002.883422-1-shaw.leon@gmail.com>
References: <20250210133002.883422-1-shaw.leon@gmail.com>
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
2.48.1

