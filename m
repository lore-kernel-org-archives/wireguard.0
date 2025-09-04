Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC8FCEE34C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 19:46:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b264d4a;
	Tue, 18 Nov 2025 17:25:11 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e9d571f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023398;
 bh=rgolZjPG+XHuMI4WAnndyywf6dHN7deNYLKzBJ40Ug8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Kf+BU0Mbw6te1L3Y0k0/wJuAWt208nEyXV8HTdlhU489vDYjfjqTUGezvTHZ38jnA
 5ueFnP+5W7ERO9HX9DZOUjs6OGIqA2L0WfYSFvIdxaYr7WfsOb0Im3TCSZbjc7JDbg
 amwVSjPtlfc0zjxzue7V6oU8vR8ogXIQkBHpKguqfsHUQ2+gAWoM04EvfTV79oTPU9
 4S/+dXuantJZ0UxrcVAC/bFSghtiXda6Iu17+Noa0R7+6ABjT4aQOitwV/a7DyaZJA
 xcMc042Yu3yy1Covvf6MNeeyTsbgP0lGgLXNI957fsnGgsybcV7N+hGuBmann7ltmJ
 qQW3ShRKa2mIQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 8D9476000C;
 Thu,  4 Sep 2025 22:03:11 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id DFCAC2027BB; Thu, 04 Sep 2025 22:02:09 +0000 (UTC)
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
Subject: [PATCH net-next 10/11] tools: ynl: decode hex input
Date: Thu,  4 Sep 2025 22:01:33 +0000
Message-ID: <20250904220156.1006541-10-ast@fiberby.net>
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

This patch add support for decoding hex input, so
that binary attributes can be read through --json.

Example (using future wireguard.yaml):
 $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
   --do set-device --json '{"ifindex":3,
     "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/lib/ynl.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index a37294a751da..78c0245ca587 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -973,6 +973,8 @@ class YnlFamily(SpecFamily):
                 raw = ip.packed
             else:
                 raw = int(ip)
+        elif attr_spec.display_hint == 'hex':
+            raw = bytes.fromhex(string)
         else:
             raise Exception(f"Display hint '{attr_spec.display_hint}' not implemented"
                             f" when parsing '{attr_spec['name']}'")
-- 
2.51.0

