Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0117ECEE355
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 20:47:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36f9c221;
	Tue, 18 Nov 2025 17:25:34 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a577bab7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023398;
 bh=kfNKsp1FHappfXlSa3oCQen0sULVOEgKmZ5WZwpdTBk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HhCs/zKfXQtb+hq+pa99bB1PTkRLkiO84V9dq15EmSJ/7PDXYqePkTS4Kxe7A4Kui
 /Ggma/1U5k+fZeVj03VOXSNzULLuzFfQqFdgO+L/SrRKHoH0fWcOf9RQD42wvHKm41
 sxWwZHSzWSB/0haGq/bShUKKUkDomWGs9AoILzyYGYTQjOkQBM6Mrf4DRRMOAVyxNc
 gSMZ8HXgUPFLkk2fJDMGOwOts+xB0+sRyvPpTlhLHVMYGulzk5BflSFjoIrr+oq9JO
 7j7R61lMNpbvNCi1roX5TtWlYHYqobDzTTEf/vO1mx9dCz/+6ZSTqmU0JYTB8P7/4p
 9QtGcAAlyHj9w==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 9485860142;
 Thu,  4 Sep 2025 22:03:18 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id B168C2024AB; Thu, 04 Sep 2025 22:02:09 +0000 (UTC)
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
Subject: [PATCH net-next 05/11] tools: ynl-gen: define nlattr *array in a
 block scope
Date: Thu,  4 Sep 2025 22:01:28 +0000
Message-ID: <20250904220156.1006541-5-ast@fiberby.net>
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

Instead of trying to define "struct nlattr *array;" in the all
the right places, then simply define it in a block scope,
as it's only used here.

Before this patch it was generated for attribute set _put()
functions, like wireguard_wgpeer_put(), but missing and caused a
compile error for the command function wireguard_set_device().

$ make -C tools/net/ynl/generated wireguard-user.o
-e      CC wireguard-user.o
wireguard-user.c: In function ‘wireguard_set_device’:
wireguard-user.c:548:9: error: ‘array’ undeclared (first use in ..)
  548 |         array = ynl_attr_nest_start(nlh, WGDEVICE_A_PEERS);
      |         ^~~~~

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index b0eeedfca2f2..e6a84e13ec0a 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -842,6 +842,9 @@ class TypeArrayNest(Type):
         return get_lines, None, local_vars
 
     def attr_put(self, ri, var):
+        ri.cw.block_start()
+        ri.cw.p('struct nlattr *array;')
+        ri.cw.nl()
         ri.cw.p(f'array = ynl_attr_nest_start(nlh, {self.enum_name});')
         if self.sub_type in scalars:
             put_type = self.sub_type
@@ -857,6 +860,7 @@ class TypeArrayNest(Type):
         else:
             raise Exception(f"Put for ArrayNest sub-type {self.attr['sub-type']} not supported, yet")
         ri.cw.p('ynl_attr_nest_end(nlh, array);')
+        ri.cw.block_end()
 
     def _setter_lines(self, ri, member, presence):
         return [f"{member} = {self.c_name};",
@@ -2063,13 +2067,9 @@ def put_req_nested(ri, struct):
         init_lines.append(f"hdr = ynl_nlmsg_put_extra_header(nlh, {struct_sz});")
         init_lines.append(f"memcpy(hdr, &obj->_hdr, {struct_sz});")
 
-    has_anest = False
     has_count = False
     for _, arg in struct.member_list():
-        has_anest |= arg.type == 'indexed-array'
         has_count |= arg.presence_type() == 'count'
-    if has_anest:
-        local_vars.append('struct nlattr *array;')
     if has_count:
         local_vars.append('unsigned int i;')
 
-- 
2.51.0

