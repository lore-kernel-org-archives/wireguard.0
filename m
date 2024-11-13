Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D738D49231
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 15:15:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8eb281da;
	Mon, 18 Nov 2024 12:45:28 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 06412c7a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 12:57:46 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2e9e377aeadso1739717a91.1
 for <wireguard@lists.zx2c4.com>; Wed, 13 Nov 2024 04:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731502665; x=1732107465; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9sIZI/WV8nhbNfyJEUDND2yz+m6sbgKmtk/cQXv5cxc=;
 b=YMwvyCrdxfDL6KGKVc5RaMuEUpJuzZwICHBUxJttqQNBac1LNEw6TcP+4YmPR1JKjg
 J2cswryR4mgq4rUh7lHNwI2xYmWGzybszq76LNvzkzIJBnEr3Cl/i0BnlVobfoiDnRjO
 avhoWA8qJkyfTb8+Y1iPRF0Bd7Mev6ZHFEHEu9f7mwX5mElVTWFNepCz0o+chk2sTAlL
 BjjcYQ6sWdY5UNnlkpR/5G7c6i1weu6tMogoNB9vp5jW8TvnLoumQeI55DsUuFn3wDhm
 mf+bb5S8kjMdFJ/xBmSOr3OJs+z8+nqkTLCrpMyUpJL87T4JyChYUoPWSn4dP5b/t2WP
 fG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731502665; x=1732107465;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9sIZI/WV8nhbNfyJEUDND2yz+m6sbgKmtk/cQXv5cxc=;
 b=F/2STo7Sv3I7jVZvpZL/C30Nl1hckdJYUu/HFI+jiVQwpI4d+/gd3jpzLevSWaa05v
 A/NKiC0rI9qMhZYEL+tzxL+HKlB2mAKkl5Vsb5ffO+OVMJy7+QL58ENVfB5cuCiSv52R
 95OIkbVlqw1xm/QlMeEW0SDPf7zltGBDeJKtlWUtY10Ec8KtL6B+TBpUu/ut8etGdiVS
 wX2VZclPD32pXaL32115vh2ReLCnkcCTD05YadpkxZXGslc386qIEXue1fXdC9tcyw0C
 fXP3JJke0/mba5tMrSEP8ZuhOyINJ+Ihwqak/3bes+5iIbDPYBkq9N5NrYra8kQDdiwd
 8pDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrV+hK3KIDMX8rz60iupJ+kaXvgg1rdDv+rJdeuEML2Xzk4kLOt+f/KM1a4O1x9ng49KZcDRj+raw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yzw0jQ4E8k+YeBdKulKWbptEYy1YM6kvCBHSCJJKI68rgZqzyul
 bdOEmg9HKKpyrAj/msMoh5u1TFrVc4Gnu2kBsNZ6uQB4+tSTLClM
X-Google-Smtp-Source: AGHT+IFBBLW/otzoU3VQWNkQ98rdfNz5WHNkXJFNuYVXzuqAWCzWf4F656wLCdVO3Ph+9deaw1I3JA==
X-Received: by 2002:a17:90b:48c8:b0:2e2:c40c:6e8a with SMTP id
 98e67ed59e1d1-2e9f2d5da7amr2684315a91.26.1731502664731; 
 Wed, 13 Nov 2024 04:57:44 -0800 (PST)
Received: from nova-ws.. ([103.167.140.11]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e9f3f8ed0esm1398632a91.40.2024.11.13.04.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Nov 2024 04:57:44 -0800 (PST)
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
Subject: [PATCH net-next v3 1/6] Revert "tools/net/ynl: improve async
 notification handling"
Date: Wed, 13 Nov 2024 20:57:10 +0800
Message-ID: <20241113125715.150201-2-shaw.leon@gmail.com>
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

From: Donald Hunter <donald.hunter@gmail.com>

This reverts commit 1bf70e6c3a5346966c25e0a1ff492945b25d3f80.

This modification to check_ntf() is being reverted so that its behaviour
remains equivalent to ynl_ntf_check() in the C YNL. Instead a new
poll_ntf() will be added in a separate patch.

Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/cli.py     | 10 +++-----
 tools/net/ynl/lib/ynl.py | 49 ++++++++++++++++------------------------
 2 files changed, 23 insertions(+), 36 deletions(-)

diff --git a/tools/net/ynl/cli.py b/tools/net/ynl/cli.py
index 9e95016b85b3..b8481f401376 100755
--- a/tools/net/ynl/cli.py
+++ b/tools/net/ynl/cli.py
@@ -5,7 +5,6 @@ import argparse
 import json
 import pprint
 import time
-import signal
 
 from lib import YnlFamily, Netlink, NlError
 
@@ -18,8 +17,6 @@ class YnlEncoder(json.JSONEncoder):
             return list(obj)
         return json.JSONEncoder.default(self, obj)
 
-def handle_timeout(sig, frame):
-    exit(0)
 
 def main():
     description = """
@@ -84,8 +81,7 @@ def main():
         ynl.ntf_subscribe(args.ntf)
 
     if args.sleep:
-        signal.signal(signal.SIGALRM, handle_timeout)
-        signal.alarm(args.sleep)
+        time.sleep(args.sleep)
 
     if args.list_ops:
         for op_name, op in ynl.ops.items():
@@ -110,8 +106,8 @@ def main():
         exit(1)
 
     if args.ntf:
-        for msg in ynl.check_ntf():
-            output(msg)
+        ynl.check_ntf()
+        output(ynl.async_msg_queue)
 
 
 if __name__ == "__main__":
diff --git a/tools/net/ynl/lib/ynl.py b/tools/net/ynl/lib/ynl.py
index 92f85698c50e..c22c22bf2cb7 100644
--- a/tools/net/ynl/lib/ynl.py
+++ b/tools/net/ynl/lib/ynl.py
@@ -12,8 +12,6 @@ import sys
 import yaml
 import ipaddress
 import uuid
-import queue
-import time
 
 from .nlspec import SpecFamily
 
@@ -491,7 +489,7 @@ class YnlFamily(SpecFamily):
         self.sock.setsockopt(Netlink.SOL_NETLINK, Netlink.NETLINK_GET_STRICT_CHK, 1)
 
         self.async_msg_ids = set()
-        self.async_msg_queue = queue.Queue()
+        self.async_msg_queue = []
 
         for msg in self.msgs.values():
             if msg.is_async:
@@ -905,39 +903,32 @@ class YnlFamily(SpecFamily):
 
         msg['name'] = op['name']
         msg['msg'] = attrs
-        self.async_msg_queue.put(msg)
+        self.async_msg_queue.append(msg)
 
-    def check_ntf(self, interval=0.1):
+    def check_ntf(self):
         while True:
             try:
                 reply = self.sock.recv(self._recv_size, socket.MSG_DONTWAIT)
-                nms = NlMsgs(reply)
-                self._recv_dbg_print(reply, nms)
-                for nl_msg in nms:
-                    if nl_msg.error:
-                        print("Netlink error in ntf!?", os.strerror(-nl_msg.error))
-                        print(nl_msg)
-                        continue
-                    if nl_msg.done:
-                        print("Netlink done while checking for ntf!?")
-                        continue
+            except BlockingIOError:
+                return
 
-                    decoded = self.nlproto.decode(self, nl_msg, None)
-                    if decoded.cmd() not in self.async_msg_ids:
-                        print("Unexpected msg id while checking for ntf", decoded)
-                        continue
+            nms = NlMsgs(reply)
+            self._recv_dbg_print(reply, nms)
+            for nl_msg in nms:
+                if nl_msg.error:
+                    print("Netlink error in ntf!?", os.strerror(-nl_msg.error))
+                    print(nl_msg)
+                    continue
+                if nl_msg.done:
+                    print("Netlink done while checking for ntf!?")
+                    continue
 
-                    self.handle_ntf(decoded)
-            except BlockingIOError:
-                pass
+                decoded = self.nlproto.decode(self, nl_msg, None)
+                if decoded.cmd() not in self.async_msg_ids:
+                    print("Unexpected msg id done while checking for ntf", decoded)
+                    continue
 
-            try:
-                yield self.async_msg_queue.get_nowait()
-            except queue.Empty:
-                try:
-                    time.sleep(interval)
-                except KeyboardInterrupt:
-                    return
+                self.handle_ntf(decoded)
 
     def operation_do_attributes(self, name):
       """
-- 
2.47.0

