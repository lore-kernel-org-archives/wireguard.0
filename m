Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE8CF259B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 08:15:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87e04fb7;
	Tue, 18 Nov 2025 17:30:46 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c0e5b406
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Sep 2025 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757947661;
 bh=+xB7OdBH5/hOoPqTnhZSd84UXQV32QC9Igc+BZIJ9TQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R3xdIgxCeA3n4EbMNYcIrRdec2kx3Q55RbVNs+fSZKSnNH5f96l+aN38xj69pVEAt
 db26hmc7StGFTbOrlTaTgzK1klDBXy7P1S7lqjLT6P/LWOC5cvG6Bj5dRfeskgLJpZ
 /R2sICGICoqeRWvob38nD55yijrLSrt268BJkwPAJrq0IhSxX1jy2I51aRjxuSUBLl
 vQ0XTBI1pTD9sALnALoMt25Kb+Kv+7lFY+ArK6S7FbU0eu7TnKpn0psSQ2PQ//7XNP
 Leyzagw/8nm2vQsAzjv6hvQOIJSlZuk8JrN/8jiNamkdoJqAS4Gso4KCtKEcIudQ3l
 IFk5MM98qlD5Q==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 1A8A960140;
 Mon, 15 Sep 2025 14:47:41 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 60EC0204FB3; Mon, 15 Sep 2025 14:43:06 +0000 (UTC)
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
Subject: [PATCH net-next v5 09/11] tools: ynl: encode indexed-arrays
Date: Mon, 15 Sep 2025 14:42:54 +0000
Message-ID: <20250915144301.725949-10-ast@fiberby.net>
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

This patch adds support for encoding indexed-array
attributes with sub-type nest in pyynl.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
---
 tools/net/ynl/pyynl/lib/ynl.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 92ff26f34f4d..9fd83f8b091f 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -563,6 +563,11 @@ class YnlFamily(SpecFamily):
             nl_type |= Netlink.NLA_F_NESTED
             sub_space = attr['nested-attributes']
             attr_payload = self._add_nest_attrs(value, sub_space, search_attrs)
+        elif attr['type'] == 'indexed-array' and attr['sub-type'] == 'nest':
+            nl_type |= Netlink.NLA_F_NESTED
+            sub_space = attr['nested-attributes']
+            attr_payload = self._encode_indexed_array(value, sub_space,
+                                                      search_attrs)
         elif attr["type"] == 'flag':
             if not value:
                 # If value is absent or false then skip attribute creation.
@@ -616,6 +621,9 @@ class YnlFamily(SpecFamily):
         else:
             raise Exception(f'Unknown type at {space} {name} {value} {attr["type"]}')
 
+        return self._add_attr_raw(nl_type, attr_payload)
+
+    def _add_attr_raw(self, nl_type, attr_payload):
         pad = b'\x00' * ((4 - len(attr_payload) % 4) % 4)
         return struct.pack('HH', len(attr_payload) + 4, nl_type) + attr_payload + pad
 
@@ -627,6 +635,14 @@ class YnlFamily(SpecFamily):
                                            sub_attrs)
         return attr_payload
 
+    def _encode_indexed_array(self, vals, sub_space, search_attrs):
+        attr_payload = b''
+        for i, val in enumerate(vals):
+            idx = i | Netlink.NLA_F_NESTED
+            val_payload = self._add_nest_attrs(val, sub_space, search_attrs)
+            attr_payload += self._add_attr_raw(idx, val_payload)
+        return attr_payload
+
     def _get_enum_or_unknown(self, enum, raw):
         try:
             name = enum.entries_by_val[raw].name
-- 
2.51.0

