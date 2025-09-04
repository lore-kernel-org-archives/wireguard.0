Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9C2CEE35E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 21:27:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c405abfe;
	Tue, 18 Nov 2025 17:25:57 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 326340d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023398;
 bh=1RFc/pW39oBZ0KGQQemB1yrZjFzlWLZCdWNfKKF5zzg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JNtjo5vy21ADZCeR4p04qE6EDMiskDmWDgfE0/ZzVgSuc2jlR/2cBnlR03DjqKhIQ
 vw30V0s039G/8t85aiVhKQDcof3YKH1K83iaX2UPX3YXRh5Vg/81ArEpbT6KeZs9bd
 N344+Zb1lGJc5FpZz9A2caCcPYjw4ejS9W7VdfpfChux4lmF3/EO1f+6NjYsPLxwsa
 RcpDtQwhu4T/eh0QLtvK/77kdMAimi2J4G544MlfFbPafghZjxxkETxbbEOfm3AnYU
 EYJo1UEQFn8pwvYwF5XrnR+wS76PPnZZKpeLqdy0/2FwVhMiNHtJWQoCOBzAaLE3rA
 8alyWAcwf04bw==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id ED0C36057D;
 Thu,  4 Sep 2025 22:03:18 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id CD5E5202695; Thu, 04 Sep 2025 22:02:09 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 08/11] tools: ynl: move nest packing to a helper
 function
Date: Thu,  4 Sep 2025 22:01:31 +0000
Message-ID: <20250904220156.1006541-8-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904-wg-ynl-prep@fiberby.net>
References: <20250904-wg-ynl-prep@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Nov 2025 17:23:15 +0000
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

This patch moves nest packing into a helper function,
that can also be used for packing indexed arrays.

No behavioural changes intended.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/lib/ynl.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 8244a5f440b2..4928b41c636a 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -562,11 +562,8 @@ class YnlFamily(SpecFamily):
 
         if attr["type"] == 'nest':
             nl_type |= Netlink.NLA_F_NESTED
-            attr_payload = b''
             sub_space = attr['nested-attributes']
-            sub_attrs = SpaceAttrs(self.attr_sets[sub_space], value, search_attrs)
-            for subname, subvalue in value.items():
-                attr_payload += self._add_attr(sub_space, subname, subvalue, sub_attrs)
+            attr_payload = self._add_nest_attrs(value, sub_space, search_attrs)
         elif attr["type"] == 'flag':
             if not value:
                 # If value is absent or false then skip attribute creation.
@@ -623,6 +620,14 @@ class YnlFamily(SpecFamily):
         pad = b'\x00' * ((4 - len(attr_payload) % 4) % 4)
         return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_payload + pad
 
+    def _add_nest_attrs(self, value, sub_space, search_attrs):
+        sub_attrs = SpaceAttrs(self.attr_sets[sub_space], value, search_attrs)
+        attr_payload = b''
+        for subname, subvalue in value.items():
+            attr_payload += self._add_attr(sub_space, subname, subvalue,
+                                           sub_attrs)
+        return attr_payload
+
     def _get_enum_or_unknown(self, enum, raw):
         try:
             name = enum.entries_by_val[raw].name
-- 
2.51.0

