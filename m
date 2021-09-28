Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE83C43219
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:43 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD7766139D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 22:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BD7766139D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2fbeea9;
	Tue, 28 Sep 2021 22:13:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 64650d57
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 22:13:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31DB26128E;
 Tue, 28 Sep 2021 22:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632867182;
 bh=DO4R1ntyCuxR411t9Um4s+4nqiBmOq4RrqJ6OCNb2JM=;
 h=Date:From:To:Cc:Subject:From;
 b=Bc7I9Cosp099R+FCix2qg9sJAR4y0Knq51WZuE0ubDjZeGzh/kJxW6T+XXqVgmbV+
 h2hJiLVsViRSXTuZzhSrl+cIir//EntAq8KfWH1skBkzFSV7Kp8I3UJFBwSF1K0kk7
 pYseO7CrOFAta8Y8mv3zmiFkRqRFaLqATxD4w9XihM9NnexAUvaXU+QKCgGPvtIuBT
 W6/dTF5CbqnQKTQ05vOpjPJDmjbCpyRwNHZ86v27OML9A3oJORxj6V64Z2jXLORmeb
 kQntAacQG564yT35SO8tTWn73XLAM1u6N9nhrkdEGabBDhzIVkczr7LHUkNOifHB9r
 4ygVj8Kx1YROA==
Date: Tue, 28 Sep 2021 17:17:05 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
Subject: [PATCH][net-next] net: wireguard: Use kvcalloc() instead of kvzalloc()
Message-ID: <20210928221705.GA279593@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Use 2-factor argument form kvcalloc() instead of kvzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/net/wireguard/ratelimiter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireguard/ratelimiter.c b/drivers/net/wireguard/ratelimiter.c
index 3fedd1d21f5e..dd55e5c26f46 100644
--- a/drivers/net/wireguard/ratelimiter.c
+++ b/drivers/net/wireguard/ratelimiter.c
@@ -176,12 +176,12 @@ int wg_ratelimiter_init(void)
 			(1U << 14) / sizeof(struct hlist_head)));
 	max_entries = table_size * 8;
 
-	table_v4 = kvzalloc(table_size * sizeof(*table_v4), GFP_KERNEL);
+	table_v4 = kvcalloc(table_size, sizeof(*table_v4), GFP_KERNEL);
 	if (unlikely(!table_v4))
 		goto err_kmemcache;
 
 #if IS_ENABLED(CONFIG_IPV6)
-	table_v6 = kvzalloc(table_size * sizeof(*table_v6), GFP_KERNEL);
+	table_v6 = kvcalloc(table_size, sizeof(*table_v6), GFP_KERNEL);
 	if (unlikely(!table_v6)) {
 		kvfree(table_v4);
 		goto err_kmemcache;
-- 
2.27.0

