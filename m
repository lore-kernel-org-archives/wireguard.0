Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC41CF259D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 08:15:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 303cf3cd;
	Tue, 18 Nov 2025 17:30:44 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9de3f964
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Sep 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757947661;
 bh=IsmjNeaXavqPvifeThqRq8BNJU4LPyh8Y4FXmPIrN2A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WEW24BMrMoIAB6//FCu9YqsdwI5AcZBBuX+35+Ggi7+lMKwLnQ+a52vkM1tbBhyPd
 ebI37IDVsiZJeeKtMvFrihYh3b5MTjPu1nmXdWJ40CencVLpV8KguEPlHAhoswSvJl
 oDQZ36lRXm6+Rd/uQiqxSjhwGUv13Q47Ytj1v7B7juFEmrBf8pRrGr4hLVnPESTfnH
 3PP8pbEQhqMp1PkYLWDdtliGMAmyt+Vsey8OoSviFnscS0Cm0excutaR55atOpJnpi
 Vrxvjox43wlpUJpZrzcbUXSKzGI+vm6/uWGmu5SOSS0rsM7Uuj/rom/GKRMlHC+SRL
 BwlE1zzNqdtXg==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 044D06013B;
 Mon, 15 Sep 2025 14:47:41 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 2BC77203CF3; Mon, 15 Sep 2025 14:43:06 +0000 (UTC)
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
Subject: [PATCH net-next v5 04/11] tools: ynl-gen: refactor local vars for
 .attr_put() callers
Date: Mon, 15 Sep 2025 14:42:49 +0000
Message-ID: <20250915144301.725949-5-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915144301.725949-1-ast@fiberby.net>
References: <20250915144301.725949-1-ast@fiberby.net>
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

Refactor the generation of local variables needed when building
requests, by moving the logic from put_req_nested() into a new
helper put_local_vars(), and use the helper before .attr_put() is
called, thus generating the local variables assumed by .attr_put().

Previously only put_req_nested() generated the variables assumed
by .attr_put(),  print_req() only generated the count iterator `i`,
and print_dump() neither generated `i` nor `array`.

This patch fixes the build errors below:
$ make -C tools/net/ynl/generated/
[...]
-e      GEN wireguard-user.c
-e      GEN wireguard-user.h
-e      CC wireguard-user.o
wireguard-user.c: In function ‘wireguard_get_device_dump’:
wireguard-user.c:480:9: error: ‘array’ undeclared (first use in func)
  480 |         array = ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
      |         ^~~~~
wireguard-user.c:480:9: note: each undeclared identifier is reported
                        only once for each function it appears in
wireguard-user.c:481:14: error: ‘i’ undeclared (first use in func)
  481 |         for (i = 0; i < req->_count.peers; i++)
      |              ^
wireguard-user.c: In function ‘wireguard_set_device’:
wireguard-user.c:533:9: error: ‘array’ undeclared (first use in func)
  533 |         array = ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
      |         ^~~~~
make: *** [Makefile:52: wireguard-user.o] Error 1
make: Leaving directory '/usr/src/linux/tools/net/ynl/generated'

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 3266af19edcd..a0c571456236 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -2040,6 +2040,20 @@ def put_enum_to_str(family, cw, enum):
     _put_enum_to_str_helper(cw, enum.render_name, map_name, 'value', enum=enum)
 
 
+def put_local_vars(struct):
+    local_vars = []
+    has_array = False
+    has_count = False
+    for _, arg in struct.member_list():
+        has_array |= arg.type == 'indexed-array'
+        has_count |= arg.presence_type() == 'count'
+    if has_array:
+        local_vars.append('struct nlattr *array;')
+    if has_count:
+        local_vars.append('unsigned int i;')
+    return local_vars
+
+
 def put_req_nested_prototype(ri, struct, suffix=';'):
     func_args = ['struct nlmsghdr *nlh',
                  'unsigned int attr_type',
@@ -2062,15 +2076,7 @@ def put_req_nested(ri, struct):
         init_lines.append(f"hdr = ynl_nlmsg_put_extra_header(nlh, {struct_sz});")
         init_lines.append(f"memcpy(hdr, &obj->_hdr, {struct_sz});")
 
-    has_anest = False
-    has_count = False
-    for _, arg in struct.member_list():
-        has_anest |= arg.type == 'indexed-array'
-        has_count |= arg.presence_type() == 'count'
-    if has_anest:
-        local_vars.append('struct nlattr *array;')
-    if has_count:
-        local_vars.append('unsigned int i;')
+    local_vars += put_local_vars(struct)
 
     put_req_nested_prototype(ri, struct, suffix='')
     ri.cw.block_start()
@@ -2354,10 +2360,7 @@ def print_req(ri):
         local_vars += ['size_t hdr_len;',
                        'void *hdr;']
 
-    for _, attr in ri.struct["request"].member_list():
-        if attr.presence_type() == 'count':
-            local_vars += ['unsigned int i;']
-            break
+    local_vars += put_local_vars(ri.struct['request'])
 
     print_prototype(ri, direction, terminate=False)
     ri.cw.block_start()
@@ -2424,6 +2427,9 @@ def print_dump(ri):
         local_vars += ['size_t hdr_len;',
                        'void *hdr;']
 
+    if 'request' in ri.op[ri.op_mode]:
+        local_vars += put_local_vars(ri.struct['request'])
+
     ri.cw.write_func_lvar(local_vars)
 
     ri.cw.p('yds.yarg.ys = ys;')
-- 
2.51.0

