Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9387ACF2582
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 04:41:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e5e72ae;
	Tue, 18 Nov 2025 17:28:49 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 993a3020
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Sep 2025 23:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757545730;
 bh=BXBJfFZ+zTwLVHSQB68jOM4LzO0NIRI61RviYfjsvu0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bBqxdVSi6kSZofaDl44lkOtbNg80c6YNbSYMuAf/AVwIgtPHOnlUkvjG6C+9f/qb/
 n4eJh4JMpEt/CuHjB3UuvkMvSsAqrNZ8ZnrHKL5NM2IZJWygHJYezgIte5L5XJK4T+
 sG7WJwx/nA9z27PkDE5BWAvytDssIibs9UkxXW3Ybq5b0K6pMxFEFy0SuNIGLSKA7g
 sBbv6SugbhobBsrALc3zjxhz54HVei8JvaGYG5GWxHN25rGr/hLr+wYd9Pj/xePqV7
 fIbWxY/BL9W5L1KlIh3b2+ilAFSTMWwblORxPM4FQch3U/h9Nn9tguwN7/PpvpO+a+
 ycqzJ+476TWZA==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id E947960140;
 Wed, 10 Sep 2025 23:08:50 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id C7C10201D12; Wed, 10 Sep 2025 23:08:42 +0000 (UTC)
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
Subject: [PATCH net-next v2 01/12] tools: ynl-gen: allow overriding
 name-prefix for constants
Date: Wed, 10 Sep 2025 23:08:23 +0000
Message-ID: <20250910230841.384545-2-ast@fiberby.net>
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

Allow using custom name-prefix with constants,
just like it is for enum and flags declarations.

This is needed for generating WG_KEY_LEN in
include/uapi/linux/wireguard.h from a spec.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
Reviewed-by: Donald Hunter <donald.hunter@gmail.com>
Reviewed-by: Jakub Kicinski <kuba@kernel.org>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 tools/net/ynl/pyynl/ynl_gen_c.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/net/ynl/pyynl/ynl_gen_c.py b/tools/net/ynl/pyynl/ynl_gen_c.py
index fb7e03805a11..1543d4911bf5 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -3211,8 +3211,9 @@ def render_uapi(family, cw):
             cw.block_end(line=';')
             cw.nl()
         elif const['type'] == 'const':
+            name_pfx = const.get('name-prefix', f"{family.ident_name}-")
             defines.append([c_upper(family.get('c-define-name',
-                                               f"{family.ident_name}-{const['name']}")),
+                                               f"{name_pfx}{const['name']}")),
                             const['value']])
 
     if defines:
-- 
2.51.0

