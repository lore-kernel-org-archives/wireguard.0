Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC03C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 06:38:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7EA2187F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 06:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JQraWRX0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7EA2187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b14a908b;
	Fri, 14 Feb 2020 06:36:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bbc8315
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 06:36:15 +0000 (UTC)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com
 [IPv6:2607:f8b0:4864:20::54a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce31f6e9
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 06:36:15 +0000 (UTC)
Received: by mail-pg1-x54a.google.com with SMTP id 37so5469090pgq.0
 for <wireguard@lists.zx2c4.com>; Thu, 13 Feb 2020 22:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=15Oh/b5UlnlqSbCYGajhNHvD7yZz1G+Vfp01MWjB8G0=;
 b=JQraWRX0aSTtIzEtUDRKFNY6JXU5rRcQC4nto+FbHPwl5b2yCz8hnuV5ew6trIs0R+
 KECa8RU1AAo8QUQOJaVHkgRvYzfaJmJVRUowDZP2XrRgNky9s2TuYHayVqmJ/SXvKtwe
 PzBBWTQYQmYhtsz2rRWwpMgsjQtlCJqwdX3uDkr/D1dvouuM5frNdjmYjt5PBEHmzvPc
 gqq0AC5R+I/eNSmVODe/QnMO9Aj/XZhBNlCMBghi1GzE+GSh/+G20D6utdqzQEmlIAJB
 ZprwE+sPzQk4QaKCk/21ve7xRRbu9cO6yf5r+exL0WUs3JrpH1n/ggjL7E/VnxA9/j+u
 QbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=15Oh/b5UlnlqSbCYGajhNHvD7yZz1G+Vfp01MWjB8G0=;
 b=V5C/pL6jdegYs6J0eTUuw0O10Ddyl13mLmaVSs/OEhTj3cNX7aFC62nTAkHL7eYHBe
 fQSLudfEBZRKhj2YhZ/yWzmqFNllDUbyHsYOXxNAMdrVwzaFL6IViUQgW4QtHdbH8GrY
 0BpLXSuEfsEfu/V1lYZ8Ut+8jAm+T04UfaiYbWRVT1TXaog1G4OTywPW4JafTwtS6kTQ
 vlqOmBUR7wUFeEir0wXYMGa+exM79ikX9bCa9QuLn41LGDCwEuUbTUwDzjAQVdNwhTzv
 g5/RMWRWlwVn3MnoCvoKV9IW5fbbLQER1AfjlPAkvLAZYgBj4Ua7H7um9n1Ha/VqJIAB
 p9dQ==
X-Gm-Message-State: APjAAAVGzBy26GvlTl0Eze1aNHzPswXursqgae65D1QtKv0+YNF3szhv
 2vIbCLLg8epo0G0qRmufRWDFfL9jhkrI/Q==
X-Google-Smtp-Source: APXvYqwWOIGizTHAG6Q+UXlQhrV3mXYkpyApBDFUdM9Mf7R9aHmvn5JUSZHrLul92CsstYdbml93qzMGwgoPMQ==
X-Received: by 2002:a63:3349:: with SMTP id z70mr1837863pgz.408.1581662299323; 
 Thu, 13 Feb 2020 22:38:19 -0800 (PST)
Date: Thu, 13 Feb 2020 22:38:14 -0800
Message-Id: <20200214063814.229451-1-edumazet@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH net] wireguard: device: provide sane limits for mtu setting
From: Eric Dumazet <edumazet@google.com>
To: "David S . Miller" <davem@davemloft.net>
Cc: Eric Dumazet <eric.dumazet@gmail.com>, netdev <netdev@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>, syzbot <syzkaller@googlegroups.com>,
 wireguard@lists.zx2c4.com
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

If wireguard device mtu is set to zero, a divide by zero
crash happens in calculate_skb_padding().

This patch provides dev->min_mtu and dev->max_mtu bounds.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Eric Dumazet <edumazet@google.com>
Reported-by: syzbot <syzkaller@googlegroups.com>
Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com
---
 drivers/net/wireguard/device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index 43db442b1373073eaf5e805cfe6cfee15875437a..c02b84cca122d92ee8a81c5efdcf67aada2554d6 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -271,9 +271,14 @@ static void wg_setup(struct net_device *dev)
 	dev->features |= WG_NETDEV_FEATURES;
 	dev->hw_features |= WG_NETDEV_FEATURES;
 	dev->hw_enc_features |= WG_NETDEV_FEATURES;
+
 	dev->mtu = ETH_DATA_LEN - MESSAGE_MINIMUM_LENGTH -
 		   sizeof(struct udphdr) -
 		   max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
+	dev->min_mtu = MESSAGE_PADDING_MULTIPLE;
+	dev->max_mtu = ETH_MAX_MTU - MESSAGE_MINIMUM_LENGTH -
+		       sizeof(struct udphdr) -
+		       max(sizeof(struct ipv6hdr), sizeof(struct iphdr));
 
 	SET_NETDEV_DEVTYPE(dev, &device_type);
 
-- 
2.25.0.265.gbab2e86ba0-goog

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
