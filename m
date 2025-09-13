Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD3CCF2590
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 07:07:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3fb3a4c;
	Tue, 18 Nov 2025 17:30:08 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4e6b191d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Sep 2025 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757807953;
 bh=pnz1Z9RsFEA/w79qMxEPA9j3gcVp4d2qUkVblwMqsWk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L/RsZVTfXxK53xZh9BYw91H4z1fUKTKXs+zwXuivg3L874idQG4oILRW0JVnf+IPY
 xlvt9r7xZSMp8FVdA1sUmwyB3KXsGhyuHSdw0ViofxPzbpAgNSXCg3AePedT/ELTg4
 to2R8tYwbjqZUtUXmDLAZFd62Fn5mGRDJ3eRaeLenRLmdWMw+uGBojDkwl4hTtysZ5
 fTPLHc1btgDQsuqvLaHy+TegH1YPJjtGyhHdSSOmDBsH1Ugzx0tqeAUBNp4VvKY7N9
 j3GY938J2cK7qkrGpiQrkJHTocpktmXxTq1v1bJ5ELx25lGqGTZd72CvBNfaujXxhv
 FhLTX8vMQbC7w==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 9D3356013E;
 Sat, 13 Sep 2025 23:59:13 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 315412022B0; Sat, 13 Sep 2025 23:58:57 +0000 (UTC)
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
Subject: [PATCH net-next v4 01/11] tools: ynl-gen: allow overriding
 name-prefix for constants
Date: Sat, 13 Sep 2025 23:58:22 +0000
Message-ID: <20250913235847.358851-2-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250913235847.358851-1-ast@fiberby.net>
References: <20250913235847.358851-1-ast@fiberby.net>
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
index 101d8ba9626f..c8b15569ecc1 100755
--- a/tools/net/ynl/pyynl/ynl_gen_c.py
+++ b/tools/net/ynl/pyynl/ynl_gen_c.py
@@ -3208,8 +3208,9 @@ def render_uapi(family, cw):
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

