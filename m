Return-Path: <SRS0=HYXs=QB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C8EC282C6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:52:20 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5EB2218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 25 Jan 2019 01:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5EB2218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b13ac8e;
	Fri, 25 Jan 2019 01:47:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79032169
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:47:00 +0000 (UTC)
Received: from telperion.info (2600:3c01::f03c:91ff:fe96:a052
 [IPv6:2600:3c01::f03c:91ff:fe96:a052])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7c262c9
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jan 2019 01:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1]) (uid 500)
 by telperion.info with local; Thu, 24 Jan 2019 17:53:44 -0800
 id 0000000000049044.000000005C4A6C28.00006C5B
From: Derrick Pallas <derrick@pallas.us>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] netdev: reset peer keys when changing private key
Date: Thu, 24 Jan 2019 17:53:39 -0800
Message-Id: <20190125015339.27684-2-derrick@pallas.us>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190125015339.27684-1-derrick@pallas.us>
References: <20190125015339.27684-1-derrick@pallas.us>
Mime-Version: 1.0
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.75
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Without this change, it can take until the handshake timeout period to
reestablish with the peer.  After this change, the handshake occurs as soon
as possible and the link is reestablished much more quickly.

Signed-off-by: Derrick Pallas <derrick@pallas.us>
---
 src/netlink.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/netlink.c b/src/netlink.c
index 3458c81..f6b10ad 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -539,6 +539,8 @@ static int wg_set_device(struct sk_buff *skb, struct genl_info *info)
 					 peer_list) {
 			if (!wg_noise_precompute_static_static(peer))
 				wg_peer_remove(peer);
+			else
+				wg_peer_reset_keys(peer);
 		}
 		wg_cookie_checker_precompute_device_keys(&wg->cookie_checker);
 		up_write(&wg->static_identity.lock);
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
