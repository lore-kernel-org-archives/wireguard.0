Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74197CF2579
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 04:41:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b7264af;
	Tue, 18 Nov 2025 17:28:53 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9760017c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Sep 2025 23:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757545730;
 bh=AJhXtkWuMzpABxvSR0d9FQM3KyK8VD9yoZ5MetyiYuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EGexIctJYnZrFmOZKzEMxSehii6fotVPm7gk9m/CLcRMi4P7IGNuLXyh66CtANQR3
 ji0nCVE5RUX4HTyHTIGWzSYNfQxesLXuK4du+w+jI6zior+IbeSs/JEE46WY/HyZmp
 r7UwUVVmzqnRqG2qIFVfqSocXCmqynVcAGJxKK9pK0bzNt6mHY4XKsfUH7wuT9gwaR
 6SMaq8cY0RHoDqfRm/t5MCbuA2USSe8rkz7JfJwKv1CPyK7Cf99oLlNlug+5+QfFKa
 ycdvyrpBpf4G6XsOHsROPrl86MG2Hi4Dg2dKwrzn9rrbPdjIJjN+SYU4S7RmeSjkjI
 arQQEmzV8Rk7g==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id C7B1160138;
 Wed, 10 Sep 2025 23:08:50 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 1DFF5204C9F; Wed, 10 Sep 2025 23:08:43 +0000 (UTC)
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
Subject: [PATCH net-next v2 08/12] tools: ynl-gen: rename TypeArrayNest to
 TypeIndexedArray
Date: Wed, 10 Sep 2025 23:08:30 +0000
Message-ID: <20250910230841.384545-9-ast@fiberby.net>
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
 tools/net/ynl/pyynl/ynl_gen_c.py | 34 ++++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index e93f5d724b42..574faa89b1f7 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -793,7 +793,7 @@ class TypeMultiAttr(Type):
                 f"{presence} = n_{self.c_name};"]
 
 
-class TypeArrayNest(Type):
+class TypeIndexedArray(Type):
     def is_multi_val(self):
         return True
 
@@ -830,7 +830,7 @@ class TypeArrayNest(Type):
         elif self.attr['sub-type'] == 'nest':
             return f'.type = YNL_PT_NEST, .nest = &{self.nested_render_name}_nest, '
         else:
-            raise Exception(f"Typol for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
+            raise Exception(f"Typol for IndexedArray sub-type {self.attr['sub-type']} not supported, yet")
 
     def _attr_get(self, ri, var):
         local_vars = ['const struct nlattr *attr2;']
@@ -860,7 +860,7 @@ class TypeArrayNest(Type):
             ri.cw.p(f'for (i = 0; i < {var}->_count.{self.c_name}; i++)')
             ri.cw.p(f"{self.nested_render_name}_put(nlh, i, &{var}->{self.c_name}[i]);")
         else:
-            raise Exception(f"Put for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
+            raise Exception(f"Put for IndexedArray sub-type {self.attr['sub-type']} not supported, yet")
         ri.cw.p('ynl_attr_nest_end(nlh, array);')
 
     def _setter_lines(self, ri, member, presence):
@@ -1137,7 +1137,7 @@ class AttrSet(SpecAttrSet):
             t = TypeNest(self.family, self, elem, value)
         elif elem['type'] == 'indexed-array' and 'sub-type' in elem:
             if elem["sub-type"] in ['binary', 'nest', 'u32']:
-                t = TypeArrayNest(self.family, self, elem, value)
+                t = TypeIndexedArray(self.family, self, elem, value)
             else:
                 raise Exception(f'new_attr: unsupported sub-type {elem["sub-type"]}')
         elif elem['type'] == 'nest-type-value':
@@ -2127,33 +2127,33 @@ def _multi_parse(ri, struct, init_lines, local_vars):
             else:
                 raise Exception(f"Per-op fixed header not supported, yet")
 
-    array_nests = set()
+    indexed_arrays = set()
     multi_attrs = set()
     needs_parg = False
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
             multi_attrs.add(arg)
         needs_parg |= 'nested-attributes' in aspec
         needs_parg |= 'sub-message' in aspec
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
@@ -2172,8 +2172,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
         else:
             ri.cw.p('hdr = ynl_nlmsg_data_offset(nlh, sizeof(struct genlmsghdr));')
         ri.cw.p(f"memcpy(&dst->_hdr, hdr, sizeof({struct.fixed_header}));")
-    for anest in sorted(all_multi):
-        aspec = struct[anest]
+    for arg in sorted(all_multi):
+        aspec = struct[arg]
         ri.cw.p(f"if (dst->{aspec.c_name})")
         ri.cw.p(f'return ynl_error_parse(yarg, "attribute already present ({struct.attr_set.name}.{aspec.name})");')
 
@@ -2191,8 +2191,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
     ri.cw.block_end()
     ri.cw.nl()
 
-    for anest in sorted(array_nests):
-        aspec = struct[anest]
+    for arg in sorted(indexed_arrays):
+        aspec = struct[arg]
 
         ri.cw.block_start(line=f"if (n_{aspec.c_name})")
         ri.cw.p(f"dst->{aspec.c_name} = calloc(n_{aspec.c_name}, sizeof(*dst->{aspec.c_name}));")
@@ -2217,8 +2217,8 @@ def _multi_parse(ri, struct, init_lines, local_vars):
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

