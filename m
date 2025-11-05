Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476E4CF6484
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 21:45:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id beeeed30;
	Tue, 18 Nov 2025 17:33:43 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6b0a50c1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 5 Nov 2025 18:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1762367571;
 bh=He5ET711S02oLtc1y7hWh0ZqphfBwv5k6IK3wRuetZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fPnHcsKGpgjl5LvoLcpe5btPLBZhSoeeFnjchYikr0K5rIMN7d/pzEdjIFRe/2WWU
 09cP3yJRMBCy/mZ0M0um80Yvvyr9860M5aZdh/NdisCP8/zxBBPRmv5us1cF9211de
 wHg0Z3OUEB2xVd5wLPf0fE0nw4oFrFBy5ZoZ6RTn/BbBQa185kHYnKhXjaAERu6kin
 Mti+BO0dxh+z+WZcOC0UmrbIWmNtNhYZe1K5vkh3N+iE7h61fvtYZUBDZucOx13EZf
 RzbtiJdnYVqH9GKQ3DwRX3hq0sl/uS6pvCh8u5L02oluQy4L1pMmBeEHSLrHxuRINs
 J2XmG7OkAP4MA==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id EC7AB6010A;
 Wed,  5 Nov 2025 18:32:50 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id 17CD82050AD; Wed, 05 Nov 2025 18:32:25 +0000 (UTC)
From: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: =?UTF-8?q?Asbj=C3=B8rn=20Sloth=20T=C3=B8nnesen?= <ast@fiberby.net>,
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jordan Rife <jordan@jrife.io>
Subject: [PATCH net-next v3 01/11] wireguard: netlink: validate nested arrays
 in policy
Date: Wed,  5 Nov 2025 18:32:10 +0000
Message-ID: <20251105183223.89913-2-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105183223.89913-1-ast@fiberby.net>
References: <20251105183223.89913-1-ast@fiberby.net>
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

Use NLA_POLICY_NESTED_ARRAY() to perform nested array validation
in the policy validation step.

The nested policy was already enforced through nla_parse_nested(),
however extack wasn't passed previously.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/wireguard/netlink.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index 67f962eb8b46..e4416f23d427 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -18,6 +18,8 @@
 #include <crypto/utils.h>
 
 static struct genl_family genl_family;
+static const struct nla_policy peer_policy[WGPEER_A_MAX + 1];
+static const struct nla_policy allowedip_policy[WGALLOWEDIP_A_MAX + 1];
 
 static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_IFINDEX]		= { .type = NLA_U32 },
@@ -27,7 +29,7 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_FLAGS]		= NLA_POLICY_MASK(NLA_U32, __WGDEVICE_F_ALL),
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
-	[WGDEVICE_A_PEERS]		= { .type = NLA_NESTED }
+	[WGDEVICE_A_PEERS]		= NLA_POLICY_NESTED_ARRAY(peer_policy),
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
@@ -39,7 +41,7 @@ static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
 	[WGPEER_A_LAST_HANDSHAKE_TIME]			= NLA_POLICY_EXACT_LEN(sizeof(struct __kernel_timespec)),
 	[WGPEER_A_RX_BYTES]				= { .type = NLA_U64 },
 	[WGPEER_A_TX_BYTES]				= { .type = NLA_U64 },
-	[WGPEER_A_ALLOWEDIPS]				= { .type = NLA_NESTED },
+	[WGPEER_A_ALLOWEDIPS]				= NLA_POLICY_NESTED_ARRAY(allowedip_policy),
 	[WGPEER_A_PROTOCOL_VERSION]			= { .type = NLA_U32 }
 };
 
@@ -467,7 +469,7 @@ static int set_peer(struct wg_device *wg, struct nlattr **attrs)
 
 		nla_for_each_nested(attr, attrs[WGPEER_A_ALLOWEDIPS], rem) {
 			ret = nla_parse_nested(allowedip, WGALLOWEDIP_A_MAX,
-					       attr, allowedip_policy, NULL);
+					       attr, NULL, NULL);
 			if (ret < 0)
 				goto out;
 			ret = set_allowedip(peer, allowedip);
@@ -593,7 +595,7 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 
 		nla_for_each_nested(attr, info->attrs[WGDEVICE_A_PEERS], rem) {
 			ret = nla_parse_nested(peer, WGPEER_A_MAX, attr,
-					       peer_policy, NULL);
+					       NULL, NULL);
 			if (ret < 0)
 				goto out;
 			ret = set_peer(wg, peer);
-- 
2.51.0

