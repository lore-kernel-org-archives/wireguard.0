Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC59CEE355
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 20:47:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bff5ab2e;
	Tue, 18 Nov 2025 17:25:25 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 612156c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023398;
 bh=eBBuwNaUDHXo8diw1UVgSV3P1XZ5UqZY0UXPecgkD5k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2FjblNSimyRinWpU52JayO17SNj9IDU70wB4c74C1GPk5ZwAxxLn53/kKzbQ2dyc
 CyCRm6wy11I+8pmuGqMmYmv6Ks5W4/KdaYVXaeamcpoNxG60w4tvdeSt0ZiDgwfTBm
 mxX+62rW5Hp9wQ9GsmVVSqMwlJPY/O17mYD41UOIdZ3WsDdyv2uz9hxOz0KKb46ICy
 4CJpzZ4c2RptkZLM/TA4Hr0hjk78poWK2xSLUizgcUHLoB/Az34ch52y6++J7uIoWW
 RRGCAgEOa+N600eXqWWqXd2KX6on/LpvjtIxFGf13WJN6uVhelo+zVysN/Iw0FfSV6
 SZrIxwQaxTEyQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 4C5B960138;
 Thu,  4 Sep 2025 22:03:18 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 954F72020F1; Thu, 04 Sep 2025 22:02:09 +0000 (UTC)
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
Subject: [PATCH net-next 02/11] tools: ynl-gen: generate nested array policies
Date: Thu,  4 Sep 2025 22:01:25 +0000
Message-ID: <20250904220156.1006541-2-ast@fiberby.net>
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

This patch adds support for NLA_POLICY_NESTED_ARRAY() policies.

Example spec (from future wireguard.yaml):
-
  name: wgpeer
  attributes:
    -
      name: allowedips
      type: indexed-array
      sub-type: nest
      nested-attributes: wgallowedip

yields NLA_POLICY_NESTED_ARRAY(wireguard_wgallowedip_nl_policy).

This doesn't change any currently generated code, as it isn't
used in any specs currently used for generating code.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 1543d4911bf5..b7de7f6b1fc7 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -816,6 +816,11 @@ class TypeArrayNest(Type):
                     f'unsigned int n_{self.c_name}']
         return super().arg_member(ri)
 
+    def _attr_policy(self, policy):
+        if self.attr['sub-type'] == 'nest':
+            return f'NLA_POLICY_NESTED_ARRAY({self.nested_render_name}_nl_policy)'
+        return super()._attr_policy(policy)
+
     def _attr_typol(self):
         if self.attr['sub-type'] in scalars:
             return f'.type = YNL_PT_U{c_upper(self.sub_type[1:])}, '
-- 
2.51.0

