Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC70CF58C1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 17:43:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78296430;
	Tue, 18 Nov 2025 17:32:54 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 285f4ee5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Oct 2025 20:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1761771115;
 bh=LOfrWk6ONClCwAMyA52kAi+ma98US5uAFAh1afwodTg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=unybq+cU3lKbzBjiuP2eErccpA1Myxpj+7N3axyMbM8w3GhUh63idw2WV8oCTr2aZ
 1GjoOnv8D3gCCNcW6LtrsU+b1yfOVvGctipt+FJ8wzjjNzo/Ui8TlCQ2a/0iuO4GCJ
 D2h/icTw7XIIA71JGvqNcpH2Uc/k3054QCoLW0Gwy/TeIPG16XwTz2qqxG/4SXLkrP
 AkI9NAI/RdNYcFY9yfu2cyivl92MCas4+j0j95jPlM6rBhPafYCK0rb9w8Ld3zpIo0
 MXyttBLOgruB3wXSAK4vyvVD4YPE3dW7NZIzI7GvQotPCDvzTxUswmuYLcJpdRYtrw
 RhPoDKjlt6L4A==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 3EE3D60114;
 Wed, 29 Oct 2025 20:51:55 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id EA3EF20308B; Wed, 29 Oct 2025 20:51:29 +0000 (UTC)
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
Subject: [PATCH net-next v1 03/11] wireguard: netlink: enable strict genetlink
 validation
Date: Wed, 29 Oct 2025 20:51:11 +0000
Message-ID: <20251029205123.286115-4-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029205123.286115-1-ast@fiberby.net>
References: <20251029205123.286115-1-ast@fiberby.net>
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

Wireguard is a modern enough genetlink family, that it doesn't
need resv_start_op. It already had policies in place when it was
first merged, it has also never used the reserved field, or other
things toggled by resv_start_op.

wireguard-tools have always used zero initialized memory, and
have never touched the reserved field, neither have any other
clients I have checked. Closed-source clients are much more
likely to use the embeddedable library from wireguard-tools,
than a DIY implementation using uninitialized memory.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/wireguard/netlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index d36e94220d2c3..024d4a6cc74c6 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -631,7 +631,6 @@ static const struct genl_ops genl_ops[] = {
 static struct genl_family genl_family __ro_after_init = {
 	.ops = genl_ops,
 	.n_ops = ARRAY_SIZE(genl_ops),
-	.resv_start_op = WG_CMD_SET_DEVICE + 1,
 	.name = WG_GENL_NAME,
 	.version = WG_GENL_VERSION,
 	.maxattr = WGDEVICE_A_MAX,
-- 
2.51.0

