Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F87DCF58C6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Nov 2025 18:47:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe00aed5;
	Tue, 18 Nov 2025 17:33:07 +0000 (UTC)
Received: from mail1.fiberby.net (mail1.fiberby.net [193.104.135.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c87c5f70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Oct 2025 16:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fiberby.net;
 s=202008; t=1761926833;
 bh=V1qpp0ij75kE1ods7p/ksE4mY2gQykj4G8kFXbDQACs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kx0ckM+Uu7uqwe9xjHLK9wyHWHhFRK/GPUU45oFX1SFA0vNW1qTUbIn22/OBQUpmZ
 OpAerTw92b3HaInKEDcYGYOOmGxa5ipsWeMClhHsmuFA3G01s+9373OPb66PhifmCp
 6P77bHeTl4ESlVwI1pzopBrlSKWs+2V3PDYGQRGFbkdWZWTlSbjaQ6hs67zp7NdjiD
 yea5hdp4/3C0x1pkEmxr14kiEmxFWbh1mCAa/vcHR/s9PWnZtenvIJ5KN5COoA5my8
 jCiGTbidtXYIPZu0WZgdLXdJDi9ADA8uofDNX5kMv6TdTYY+j/VRjQUQ019/DVeBJi
 5/MQD9Cf+SilQ==
Received: from x201s (193-104-135-243.ip4.fiberby.net [193.104.135.243])
 by mail1.fiberby.net (Postfix) with ESMTPSA id DFA7D6010A;
 Fri, 31 Oct 2025 16:07:11 +0000 (UTC)
Received: by x201s (Postfix, from userid 1000)
 id D2D9020308B; Fri, 31 Oct 2025 16:05:42 +0000 (UTC)
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
Subject: [PATCH net-next v2 02/11] wireguard: netlink: use WG_KEY_LEN in
 policies
Date: Fri, 31 Oct 2025 16:05:28 +0000
Message-ID: <20251031160539.1701943-3-ast@fiberby.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031160539.1701943-1-ast@fiberby.net>
References: <20251031160539.1701943-1-ast@fiberby.net>
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

When converting the netlink policies to YNL, then the constants
used in the policy has to be visible to user-space.

As NOISE_*_KEY_LEN isn't visible for userspace, then change the
policy to use WG_KEY_LEN, as is also documented in the UAPI header:

$ grep WG_KEY_LEN include/uapi/linux/wireguard.h
 *    WGDEVICE_A_PRIVATE_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 *    WGDEVICE_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 *            WGPEER_A_PUBLIC_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 *            WGPEER_A_PRESHARED_KEY: NLA_EXACT_LEN, len WG_KEY_LEN
 [...]

Add a couple of BUILD_BUG_ON() to ensure that they stay in sync.

No behavioural changes intended.

Signed-off-by: Asbjørn Sloth Tønnesen <ast@fiberby.net>
---
 drivers/net/wireguard/netlink.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireguard/netlink.c b/drivers/net/wireguard/netlink.c
index e4416f23d427..db57a74d379b 100644
--- a/drivers/net/wireguard/netlink.c
+++ b/drivers/net/wireguard/netlink.c
@@ -24,8 +24,8 @@ static const struct nla_policy allowedip_policy[WGALLOWEDIP_A_MAX + 1];
 static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 	[WGDEVICE_A_IFINDEX]		= { .type = NLA_U32 },
 	[WGDEVICE_A_IFNAME]		= { .type = NLA_NUL_STRING, .len = IFNAMSIZ - 1 },
-	[WGDEVICE_A_PRIVATE_KEY]	= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
-	[WGDEVICE_A_PUBLIC_KEY]		= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
+	[WGDEVICE_A_PRIVATE_KEY]	= NLA_POLICY_EXACT_LEN(WG_KEY_LEN),
+	[WGDEVICE_A_PUBLIC_KEY]		= NLA_POLICY_EXACT_LEN(WG_KEY_LEN),
 	[WGDEVICE_A_FLAGS]		= NLA_POLICY_MASK(NLA_U32, __WGDEVICE_F_ALL),
 	[WGDEVICE_A_LISTEN_PORT]	= { .type = NLA_U16 },
 	[WGDEVICE_A_FWMARK]		= { .type = NLA_U32 },
@@ -33,8 +33,8 @@ static const struct nla_policy device_policy[WGDEVICE_A_MAX + 1] = {
 };
 
 static const struct nla_policy peer_policy[WGPEER_A_MAX + 1] = {
-	[WGPEER_A_PUBLIC_KEY]				= NLA_POLICY_EXACT_LEN(NOISE_PUBLIC_KEY_LEN),
-	[WGPEER_A_PRESHARED_KEY]			= NLA_POLICY_EXACT_LEN(NOISE_SYMMETRIC_KEY_LEN),
+	[WGPEER_A_PUBLIC_KEY]				= NLA_POLICY_EXACT_LEN(WG_KEY_LEN),
+	[WGPEER_A_PRESHARED_KEY]			= NLA_POLICY_EXACT_LEN(WG_KEY_LEN),
 	[WGPEER_A_FLAGS]				= NLA_POLICY_MASK(NLA_U32, __WGPEER_F_ALL),
 	[WGPEER_A_ENDPOINT]				= NLA_POLICY_MIN_LEN(sizeof(struct sockaddr)),
 	[WGPEER_A_PERSISTENT_KEEPALIVE_INTERVAL]	= { .type = NLA_U16 },
@@ -644,6 +644,9 @@ static struct genl_family genl_family __ro_after_init = {
 
 int __init wg_genetlink_init(void)
 {
+	BUILD_BUG_ON(WG_KEY_LEN != NOISE_PUBLIC_KEY_LEN);
+	BUILD_BUG_ON(WG_KEY_LEN != NOISE_SYMMETRIC_KEY_LEN);
+
 	return genl_register_family(&genl_family);
 }
 
-- 
2.51.0

