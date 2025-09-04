Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329EECEE358
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Nov 2025 20:47:15 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 901d35fb;
	Tue, 18 Nov 2025 17:25:27 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 86ffd031
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Sep 2025 22:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1757023398;
 bh=ECNMbXl3XLvGt4tALH0EaehkGJdjFoR5BhZ1oyO4DKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bzZnJJFp7x0TGcadOB6VkbUDx+lay5/40mepR8zc6VCVjxCiyGL1QiULRw/Qu5U+Q
 8sw45x379bEcIu1SInV5H3yjZMonFjOgEljmG1gq8bpwpUi5lt9gXhx9oaNJap74aw
 xWxmOt1wAzXn2jCnjUrYVRCXC0ONm++TMeUForqMPkyncIpBCWgA0n503NU1oX9F+P
 qdHIz3R6B70msIoQIgUHFK43EypLTIZpH/2F52eMyojuHzFplUukL6A/shfIw4ufK3
 oz542vZ+n5Scvs0qw08/EUJGQXtIPQSyQcyv307bYeSa6mp4iF6leJdXNOWyHBZI+5
 DRPwypK2RjabQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id 5D3096013C;
 Thu,  4 Sep 2025 22:03:18 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id B6C0E202B2F; Thu, 04 Sep 2025 22:02:58 +0000 (UTC)
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
Subject: [RFC net-next 13/14] wireguard: netlink: enable strict genetlink
 validation
Date: Thu,  4 Sep 2025 22:02:47 +0000
Message-ID: <20250904220255.1006675-13-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904-wg-ynl-rfc@fiberby.net>
References: <20250904-wg-ynl-rfc@fiberby.net>
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
first merged, it has also never used reserved fields, or other
things toggled by resv_start_op.

[TODO: before v1, also test with ancient wireguard-tools versions]

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/wireguard/netlink.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 0e34817126b9..67c448eef25d 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -592,7 +592,6 @@ int wireguard_nl_set_device_doit(struct sk_buff *skb,
 static struct genl_family genl_family __ro_after_init = {
 	.split_ops = wireguard_nl_ops,
 	.n_split_ops = ARRAY_SIZE(wireguard_nl_ops),
-	.resv_start_op = WG_CMD_SET_DEVICE + 1,
 	.name = WG_GENL_NAME,
 	.version = WG_GENL_VERSION,
 	.module = THIS_MODULE,
-- 
2.51.0

