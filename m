Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8BDC2D0CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5546b30f;
	Tue, 20 May 2025 19:37:43 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c25328d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 4 Jan 2025 12:59:08 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2166651f752so213603215ad.3
 for <wireguard@lists.zx2c4.com>; Sat, 04 Jan 2025 04:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735995547; x=1736600347; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=EuBo5dUaBpZNgZNwUZFL4i1GDoRuDlR/fTKjs1R/yl2hRN+qmpVj9Dxp3tbHIO5CT7
 HbZfrTcmh9DBgP7Ql52I9Jnj60GWYb+beBNiUiU3yMdM9+sfP03ZYOEG13rY1CPJzwcu
 oEG/yTEsQ2n5mNrECrHaURc1MpsE1e+IKoFv5OuF6CdkqxuxMp+n2JD96cWROsfOmzZc
 u5t9yG5I6Qbid50u1724y0RzPH82Z2z6IWYqkCCUVYeqVS9ws3nke5lCIHVxiArDV1XO
 hw6EXSxxR3x0g31i3m/uwdHEU16mFCeIF3wWShDbbGyldqpRfQeYYv2SumaKn0Pg8DIJ
 EZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735995547; x=1736600347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/aVoxIsj2NaHZxO0wthneclpZNQFTaEi7bz2gcdad0=;
 b=fExePPjdEAKmqtyxoVxF2e6LQ7hi9IJby4c8YFGaq9BO9kI0OMzDBR6JPQF+vvLl1Z
 eHG+IwJd/aQ7bEYCdoMOEXo7hf4Aept27/ToUAmga2AyVeJqyvprniNRxIjzUx2/0k6Z
 kXNnDMjcML4ZncQHtuEFhCQiauWEjec8H5mQZ/RoyAnjDF7dW5f2gXLuqSKVZc/5cdWp
 FG13mVGmiPOBrzkkIFUC3Tm4YtNaWA3XwF668Q9XKhQ3UJ1jY6CUwudu6ChjIDSwUtdI
 UN8cASngMJZss8XfPxyBcciQP7GG8ORf/h3mROM5P36PB+j19GeJ6nupina4SGkXJG/N
 Icng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf8msVZbQs/q9evIRZBNpND1vx8mVvRwiobys4y6ke6XaELvI4uyn4bdePt4mTjVDlSP7yEACzwCU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyILZ8HfjIcDgTFngI4p0Mw7cXt0Lc8Koi5SGoiBoroLKKzKMZN
 Wo/Zvm9QHcUoY+yPf+ipHCEfOIy06cOJYiddtd7UXwkY4shj70Gw
X-Gm-Gg: ASbGnct/6bfbOwg1Kw94uFasqXZwAyG//amqFD+aI0D/LlG3cyulv9zGVFK/shjaAs0
 jQMPPQXWKznltIgYrpo2sd/VKk7+6gLeUx/7FmSweebnYY8Qe6fgb5onXj2/DK+ObDG0rdwWhao
 V7m54H9gqX/JyH/mJsHsSPHfrXOW0aF70z93Uh+fu3HW9DtVkOb+hAicKaEhdgp66u3hm8LI3vw
 +40DDTIa75L3yHKCWphmgRoImhw1oSUdKMm5TJqVHvSaf0=
X-Google-Smtp-Source: AGHT+IGUseWUHEPuZ2azBnIbXH4/rAn+CSEtKsSSu9kCqJsAhEDYnxH1YaaDUJFfNwCRIx8vP1I8ew==
X-Received: by 2002:a05:6a20:2d14:b0:1e1:dbfd:1fde with SMTP id
 adf61e73a8af0-1e5e04a3427mr79059917637.27.1735995547161; 
 Sat, 04 Jan 2025 04:59:07 -0800 (PST)
Received: from ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad830349sm27761344b3a.47.2025.01.04.04.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jan 2025 04:59:06 -0800 (PST)
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
Subject: [PATCH net-next v7 10/11] selftests: net: Add python context manager
 for netns entering
Date: Sat,  4 Jan 2025 20:57:31 +0800
Message-ID: <20250104125732.17335-11-shaw.leon@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250104125732.17335-1-shaw.leon@gmail.com>
References: <20250104125732.17335-1-shaw.leon@gmail.com>
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

