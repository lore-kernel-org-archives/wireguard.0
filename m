Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86909CF256C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 04:41:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 983cbe48;
	Tue, 18 Nov 2025 17:28:51 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 864aca09
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Sep 2025 23:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757545730;
 bh=gPzW3wCV+qM3pD5q/z5sXTnTfFB9BV31CnXtVtDMhXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hyH/WVOoCpQXnsmm/RhKX8w55PKl+c6IaIxkkHUJMtocIu6ROFzZaQLMEtFETOjbC
 T0+1wMFchb6H5DS+dk/blqGvnoEA1XU6E+bG7lxLLEEJ66uspRFdy5lrQcSsqqqIRw
 mePeC3azkYm3GXema0IW58Wb8ccnFg6Q4sovumUjHsyCMIs9s5gtZ36iaOBpJO45yt
 IBpyvFhUKiVSS+6xllPdq0x5iP2KdILcYSH8Zf7kyzpxBiR9ozbhB8rFVKPMcdzGkq
 1VtMH02EGSFLmPC695ZI/uTyG8BW+FEXOx+h0C7Q4rQQJ3FK7ZHbaHxIepgg7sdikq
 3gknIExnuyazA==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id D73AB6013E;
 Wed, 10 Sep 2025 23:08:50 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 3B22F20519B; Wed, 10 Sep 2025 23:08:43 +0000 (UTC)
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
Subject: [PATCH net-next v2 11/12] tools: ynl: decode hex input
Date: Wed, 10 Sep 2025 23:08:33 +0000
Message-ID: <20250910230841.384545-12-ast@fiberby.net>
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

This patch adds support for decoding hex input, so
that binary attributes can be read through --json.

Example (using future wireguard.yaml):
 $ sudo ./tools/net/ynl/pyynl/cli.py --family wireguard \
   --do set-device --json '{"ifindex":3,
     "private-key":"2a ae 6c 35 c9 4f cf <... to 32 bytes>"}'

In order to somewhat mirror what is done in _formatted_string(),
then for non-binary attributes attempt to convert it to an int.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 tools/net/ynl/pyynl/lib/ynl.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/net/ynl/pyynl/lib/ynl.py b/tools/net/ynl/pyynl/lib/ynl.py
index 7ddf689a2a6e..50f4889e721b 100644
--- a/tools/net/ynl/pyynl/lib/ynl.py
+++ b/tools/net/ynl/pyynl/lib/ynl.py
@@ -972,6 +972,11 @@ class YnlFamily(SpecFamily):
                 raw = ip.packed
             else:
                 raw = int(ip)
+        elif attr_spec.display_hint == 'hex':
+            if attr_spec['type'] == 'binary':
+                raw = bytes.fromhex(string)
+            else:
+                raw = int(string, 16)
         else:
             raise Exception(f"Display hint '{attr_spec.display_hint}' not implemented"
                             f" when parsing '{attr_spec['name']}'")
-- 
2.51.0

