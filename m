Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7575ECF2570
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 05:36:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77fa6687;
	Tue, 18 Nov 2025 17:29:30 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ca44436
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Sep 2025 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757621127;
 bh=JXLnIORMG1oj7UEnKhu1WJfE+dEgFaaB5hGxhVbbsrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PdXDTPxTb7H0iDyGXYjYKodzCI9BzoHTM7tYLCslc+rSxuJTLB+NNZNPqQxu7kIl8
 /6Yn/hLfwo+TpaRAn+i2y/vaDUYV1FYlZrX4+/rFERNO1Z7x/OCRMAz3nMUbfoxUoV
 iw3125jD4vwV47zBKTv0lcteGC/SAAaNCSyg09quXpJpGpzhAur6SVZAkwqKPLZs9D
 LKICsC8VtU4f/TxAJmQ6aOosTU3gfRUFngF0WJ2FK/avcVcVWjaEgDK/CPeMyvuOmr
 xZSTCeBulB5Cr4N6aQGfN3RHusiA35snv0yzNVtYQa3PJlRYflfioR+ch1l4YYlQO+
 tqa5zC2Knn/HQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 4C69B6013F;
 Thu, 11 Sep 2025 20:05:27 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 33809204FB3; Thu, 11 Sep 2025 20:05:21 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Sabrina Dubroca <sd@queasysnail.net>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 09/13] tools: ynl-gen: rename TypeArrayNest to
 TypeIndexedArray
Date: Thu, 11 Sep 2025 20:05:02 +0000
Message-ID: <20250911200508.79341-10-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911200508.79341-1-ast@fiberby.net>
References: <20250911200508.79341-1-ast@fiberby.net>
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

Since TypeArrayNest can now be used with many other sub-types
than nest, then rename it to TypeIndexedArray, to reduce
confusion.

This patch continues the rename, that was started in commit
aa6485d813ad ("ynl: rename array-nest to indexed-array"),
when the YNL type was renamed.

In order to get rid of all references to the old naming,
within ynl, then renaming some variables in _multi_parse().

This is a trivial patch with no behavioural changes intended.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index ab5b8d98cbda..2c5787b518f0 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -788,7 +788,7 @@ class TypeMultiAttr(Type):
                 f"{presence} = n_{self.c_name};"]
 
 
-class TypeArrayNest(Type):
+class TypeIndexedArray(Type):
     def is_multi_val(self):
         return True
 
@@ -825,7 +825,7 @@ class TypeArrayNest(Type):
         elif self.attr['sub-type'] == 'nest':
             return f'.type = YNL_PT_NEST, .nest = &{self.nested_render_name}_nest, '
         else:
-            raise Exception(f"Typol for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
+            raise Exception(f"Typol for IndexedArray sub-type {self.attr['sub-type']} not supported, yet")
 
     def _attr_get(self, ri, var):
         local_vars = ['const struct nlattr *attr2;']
@@ -855,7 +855,7 @@ class TypeArrayNest(Type):
             ri.cw.p(f'for (i = 0; i < {var}->_count.{self.c_name}; i++)')
             ri.cw.p(f"{self.nested_render_name}_put(nlh, i, &{var}->{self.c_name}[i]);")
         else:
-            raise Exception(f"Put for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
+            raise Exception(f"Put for IndexedArray sub-type {self.attr['sub-type']} not supported, yet")
         ri.cw.p('ynl_attr_nest_end(nlh, array);')
 
     def _setter_lines(self, ri, member, presence):
@@ -1132,7 +1132,7 @@ class AttrSet(SpecAttrSet):
             t = TypeNest(self.family, self, elem, value)
         elif elem['type'] == 'indexed-array' and 'sub-type' in elem:
             if elem["sub-type"] in ['binary', 'nest', 'u32']:
-                t = TypeArrayNest(self.family, self, elem, value)
+                t = TypeIndexedArray(self.family, self, elem, value)
             else:
                 raise Exception(f'new_attr: unsupported sub-type {elem["sub-type"]}')
         elif elem['type'] == 'nest-type-value':
@@ -2120,18 +2120,18 @@ def _multi_parse(ri, struct, init_lines, local_vars):
             else:
                 raise Exception("Per-op fixed header not supported, yet")
 
-    var_set = set()
-    array_nests = set()
+    indexed_arrays = set()
     multi_attrs = set()
     needs_parg = False
+    var_set = set()
     for arg, aspec in struct.member_list():
         if aspec['type'] == 'indexed-array' and 'sub-type' in aspec:
             if aspec["sub-type"] in {'binary', 'nest'}:
                 local_vars.append(f'const struct nlattr *attr_{aspec.c_name};')
-                array_nests.add(arg)
+                indexed_arrays.add(arg)
             elif aspec['sub-type'] in scalars:
                 local_vars.append(f'const struct nlattr *attr_{aspec.c_name};')
-                array_nests.add(arg)
+                indexed_arrays.add(arg)
             else:
                 raise Exception(f'Not supported sub-type {aspec["sub-type"]}')
         if 'multi-attr' in aspec:
@@ -2145,16 +2145,16 @@ def _multi_parse(ri, struct, init_lines, local_vars):
         except Exception:
             pass  # _attr_get() not implemented by simple types, ignore
     local_vars += list(var_set)
-    if array_nests or multi_attrs:
+    if indexed_arrays or multi_attrs:
         local_vars.append('int i;')
     if needs_parg:
         local_vars.append('struct ynl_parse_arg parg;')
         init_lines.append('parg.ys = yarg->ys;')
 
-    all_multi = array_nests | multi_attrs
+    all_multi = indexed_arrays | multi_attrs
 
-    for anest in sorted(all_multi):
-        local_vars.append(f"unsigned int n_{struct[anest].c_name} = 0;")
+    for arg in sorted(all_multi):
+        local_vars.append(f"unsigned int n_{struct[arg].c_name} = 0;")
 
     ri.cw.block_start()
     ri.cw.write_func_lvar(local_vars)
@@ -2173,8 +2173,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
         else:
             ri.cw.p('hdr = ynl_nlmsg_data_offset(nlh, sizeof(struct genlmsghdr));')
         ri.cw.p(f"memcpy(&dst->_hdr, hdr, sizeof({struct.fixed_header}));")
-    for anest in sorted(all_multi):
-        aspec = struct[anest]
+    for arg in sorted(all_multi):
+        aspec = struct[arg]
         ri.cw.p(f"if (dst->{aspec.c_name})")
         ri.cw.p(f'return ynl_error_parse(yarg, "attribute already present ({struct.attr_set.name}.{aspec.name})");')
 
@@ -2192,8 +2192,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
     ri.cw.block_end()
     ri.cw.nl()
 
-    for anest in sorted(array_nests):
-        aspec = struct[anest]
+    for arg in sorted(indexed_arrays):
+        aspec = struct[arg]
 
         ri.cw.block_start(line=f"if (n_{aspec.c_name})")
         ri.cw.p(f"dst->{aspec.c_name} = calloc(n_{aspec.c_name}, sizeof(*dst->{aspec.c_name}));")
@@ -2218,8 +2218,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
         ri.cw.block_end()
     ri.cw.nl()
 
-    for anest in sorted(multi_attrs):
-        aspec = struct[anest]
+    for arg in sorted(multi_attrs):
+        aspec = struct[arg]
         ri.cw.block_start(line=f"if (n_{aspec.c_name})")
         ri.cw.p(f"dst->{aspec.c_name} = calloc(n_{aspec.c_name}, sizeof(*dst->{aspec.c_name}));")
         ri.cw.p(f"dst->_count.{aspec.c_name} = n_{aspec.c_name};")
-- 
2.51.0

