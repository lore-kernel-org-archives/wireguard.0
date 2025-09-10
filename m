Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B660CF256C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 04:41:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98d371d0;
	Tue, 18 Nov 2025 17:28:58 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f1e0948f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Sep 2025 23:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757545731;
 bh=6kMrPysvFhVYyAdolkuF1QheVD/lPJPn0VFB/qw9PH0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W86Ob1A4S+GbFW3JBjOBZKocDqdJi0q8nb59vp7FPIFlwiKL+bTnNulRC38BPS9h+
 xFml9J0U48uhhxlhCa0VkNxxOBVZKOzcUSXs5zoH8SVgwRhtduKBKxa90t8HN6DGjM
 lPjvTesFXMxpgLgeG81uB/vzN5JaisB3LrJwJ0PN5PzpPxuQbjMnoqhTDRunl4K4TV
 hwXI5+eiQ+6HCtmnt0UTHldkTlcU5Esq/7wehIPAMJoovbjxpMN8H2OjPFuRVRlMIr
 6iLEgf8FdPORbXqgPXRS47LBUSlhrhRLT2IlPy1SYEIFSBfrC+mcydYoIfXjZX5DWw
 iJ7DYumsPRpyQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id D3DEF6013D;
 Wed, 10 Sep 2025 23:08:50 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id E0D83202DF2; Wed, 10 Sep 2025 23:08:42 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Sabrina Dubroca <sd@queasysnail.net>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 03/12] tools: ynl-gen: add sub-type check
Date: Wed, 10 Sep 2025 23:08:25 +0000
Message-ID: <20250910230841.384545-4-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910230841.384545-1-ast@fiberby.net>
References: <20250910230841.384545-1-ast@fiberby.net>
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

Add a check to verify that the sub-type is "nest", and throw an
exception if no policy could be generated, as a guard to prevent
against generating a bad policy.

This is a trivial patch with no behavioural changes intended.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index b7de7f6b1fc7..04c26ed92ca3 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -826,8 +826,10 @@ class TypeArrayNest(Type):
             return f'.type = YNL_PT_U{c_upper(self.sub_type[1:])}, '
         elif self.attr['sub-type'] == 'binary' and 'exact-len' in self.checks:
             return f'.type = YNL_PT_BINARY, .len = {self.checks["exact-len"]}, '
-        else:
+        elif self.attr['sub-type'] == 'nest':
             return f'.type = YNL_PT_NEST, .nest = &{self.nested_render_name}_nest, '
+        else:
+            raise Exception(f"Typol for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
 
     def _attr_get(self, ri, var):
         local_vars = ['const struct nlattr *attr2;']
-- 
2.51.0

