Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CEED1118C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Nov 2025 17:43:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a8e54747;
	Wed, 26 Nov 2025 17:36:48 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6e5858d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 17:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1764178585;
 bh=Q4Z3868li/A6eo5IRbSWBw0t5W/8hZllqn00nGowgW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VFfT63/ph1wB57vgLEqoDxil+r+c6Z08EeLhSUQ4Mvfk4X31y8n0CW8zVtdLCuJyC
 5lyCCrUG5ybGLd+tbPxR5OpFzXEhFE7LdP0ZR14jQYnm+FWyDYjDwiWuIB++aaR9Pm
 K+TWIFZY0E98RCCjJUKFkASStPApH14ZsA7xZ8bC5aK/mJ9TVK3Phe/z6+Tr6PUEdr
 P0redFdjRLzc/WOpIXnA7H9jlsyQloRJ2tWA/cCJQafpxgjUp0Z1HwTRZxcbapvnMP
 KUAN8jIEYcpHRn2/ur7qtJ2ywvk4Ub3GXNtW0yVdVFJXz5TuOhf7zlG8VBxQQOqVJw
 p4BwI8KAo+/KQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id A590360112;
 Wed, 26 Nov 2025 17:36:25 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id EFB392032B7; Wed, 26 Nov 2025 17:35:50 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Simon Horman <horms@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: [PATCH wireguard v4 04/10] wireguard: netlink: lower .maxattr for
 WG_CMD_GET_DEVICE
Date: Wed, 26 Nov 2025 17:35:36 +0000
Message-ID: <20251126173546.57681-5-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126173546.57681-1-ast@fiberby.net>
References: <20251126173546.57681-1-ast@fiberby.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Previously .maxattr was shared for both WG_CMD_GET_DEVICE and
WG_CMD_SET_DEVICE. Now that it is split, then we can lower it
for WG_CMD_GET_DEVICE to follow the documentation which defines
.maxattr as WGDEVICE_A_IFNAME for WG_CMD_GET_DEVICE.

$ grep -hC5 'one but not both of:' include/uapi/linux/wireguard.h
 * WG_CMD_GET_DEVICE
 * -----------------
 *
 * May only be called via NLM_F_REQUEST | NLM_F_DUMP. The command
 * should contain one but not both of:
 *
 *    WGDEVICE_A_IFINDEX: NLA_U32
 *    WGDEVICE_A_IFNAME: NLA_NUL_STRING, maxlen IFNAMSIZ - 1
 *
 * The kernel will then return several messages [...]

While other attributes weren't rejected previously, the consensus
is that nobody sends those attributes, so nothing should break.

Link: https://lore.kernel.org/r/aRyLoy2iqbkUipZW@zx2c4.com/
Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/wireguard/netlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index e7efe5f8465dc..c2d0576e96f5f 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -623,7 +623,7 @@ static const struct genl_split_ops wireguard_nl_ops[] = {
 		.dumpit = wg_get_device_dump,
 		.done = wg_get_device_done,
 		.policy = device_policy,
-		.maxattr = WGDEVICE_A_PEERS,
+		.maxattr = WGDEVICE_A_IFNAME,
 		.flags = GENL_UNS_ADMIN_PERM | GENL_CMD_CAP_DUMP,
 	}, {
 		.cmd = WG_CMD_SET_DEVICE,
-- 
2.51.0

