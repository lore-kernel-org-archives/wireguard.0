Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48814CEE343
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 18:25:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e269d91;
	Tue, 18 Nov 2025 17:24:13 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68d624ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Sep 2025 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1756738334;
 bh=APyzJaKTB6ST0FmLzhCiqv/pck8FVVt3+BQEdNx2Pcg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R6g1/hga27RqGOi1Hn35l6Z9Os5REV0aAX34b2TJmLJAy7sMy5DeyPgDzFMA/kVd4
 MPI3/YGcwRc0xey3IsjZkPsOpNf74oc+YOXJxGmIPBWyafs4gfGYuVFuv6kzI+SrVs
 3gkUmnSEf0rqQ37E5sQ+EAJLf7zi43bUqXNNtCwFXEKNzC5ukQsh0/pkRxwG416Y+X
 9tpNoox0nHLEv7BU8dvHf3o8FHP1PB8mP0Un8ai9p21/pqBEJrIDIkCA/xFibG8Yfw
 4g1MX/7RxhWyCu1OXj+Ji/V5p7LsAF9tdDdIiNi2+A63K0USYwacMwrVwVHSoTszBB
 8ZzAt9O8aazBQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id D8E986000C;
 Mon,  1 Sep 2025 14:51:16 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id BFCD72022B0; Mon, 01 Sep 2025 14:50:56 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>,
 David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH net 3/4] tools: ynl-gen: fix nested array counting
Date: Mon,  1 Sep 2025 14:50:22 +0000
Message-ID: <20250901145034.525518-4-ast@fiberby.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250901145034.525518-1-ast@fiberby.net>
References: <20250901145034.525518-1-ast@fiberby.net>
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

The blamed commit introduced the concept of split attribute
counting, and later allocating an array to hold them, however
TypeArrayNest wasn't updated to use the new counting variable.

Abbreviated example from tools/net/ynl/generated/nl80211-user.c:
nl80211_if_combination_attributes_parse(...):
  unsigned int n_limits = 0;
  [...]
  ynl_attr_for_each(attr, nlh, yarg->ys->family->hdr_len)
	if (type == NL80211_IFACE_COMB_LIMITS)
		ynl_attr_for_each_nested(attr2, attr)
			dst->_count.limits++;
  if (n_limits) {
	dst->_count.limits = n_limits;
	/* allocate and parse attributes */
  }

In the above example n_limits is guaranteed to always be 0,
hence the conditional is unsatisfiable and is optimized out.

This patch changes the attribute counting to use n_limits++ in the
attribute counting loop in the above example.

Fixes: 58da455b31ba ("tools: ynl-gen: improve unwind on parsing errors")
Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index 52f955ed84a7f..fb7e03805a113 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -830,7 +830,7 @@ class TypeArrayNest(Type):
                      'ynl_attr_for_each_nested(attr2, attr) {',
                      '\tif (ynl_attr_validate(yarg, attr2))',
                      '\t\treturn YNL_PARSE_CB_ERROR;',
-                     f'\t{var}->_count.{self.c_name}++;',
+                     f'\tn_{self.c_name}++;',
                      '}']
         return get_lines, None, local_vars
 
-- 
2.50.1

