Return-Path: <SRS0=x3Nk=MT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A023C65C1D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F058C20882
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Oct 2018 14:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvwijfLk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F058C20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc3438bb;
	Sun, 7 Oct 2018 14:11:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27288704
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:30 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d191791
 for <wireguard@lists.zx2c4.com>; Sun, 7 Oct 2018 14:11:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a2-v6so10936752wrc.13
 for <wireguard@lists.zx2c4.com>; Sun, 07 Oct 2018 07:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mHfhVgXsAjarJWQDuoBy2cP+/syg8p5ORhgfZZnk2t0=;
 b=TvwijfLkRrMWdCx02120b0bUNbcUVrBpTSUxseiCs31zfC+veuxvKeK5mZrxHAc86B
 1QjR9WtnWninImlhkL2Sh7QjKLVaLcErvfgTYPCPvInOmOpdyu82whkrSZdhbBdhSgjt
 NET/GzNyvOp+PfWgq2P6y8i2unE1FjxYQS1cFl/8MRjXOTeR1m3uHlD/ppV2wWYLnc40
 dd1TO2f1Eb8ca1gXsp3Zx5CxGL4+Ba08hTS1NE1WkEJvAeR5pOcbNfD4as+ltWtY1HDB
 6MY1AcWwZzJ9zKvLrW6PG8atDz0sqvDO2cZdqI/eFTqRYr5m0NVMxDUeofscs9DDR5hF
 WFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mHfhVgXsAjarJWQDuoBy2cP+/syg8p5ORhgfZZnk2t0=;
 b=tXnHNDaCaHai0SGckim7aQFgHgsuMgITWq0Xj8wqovHi2jnn5jcZYm1TnPNk+T9zP3
 6muXtszc0V/Y/qEcF3wGlULcqEW4YC0FFOuZ+m5slbJY+M/r1JRfQWwXLzQyHg3FWlfa
 EbrraZN5Z9zYIK5meZx01dtIInGZjZ6pnQWAvIDpSwkbfHL2sTNSt4o3AESbC0da8rxT
 /DOoY7Kj+b7xfhBVAr2OVZHolJzf+kwaXt8b2dfA2GWpnH8tQCVYXYw/CF/lNIISdsDc
 3ttoBBDYYqbUMcggqK9abWxoYgcylR4/0ry5HwNN+am+SjmIW6mrwZ0PIC5f+FOCcyTM
 wKhg==
X-Gm-Message-State: ABuFfohhpxgbkalIRFp4c6ECrjXuzkopsQONcN1L/KWM85uAcXv7GxQY
 CVy6sbCpSTe93YKK6EBgkIRkEolg
X-Google-Smtp-Source: ACcGV600Gr5UCRgua66jJbw/l97WHhfalwkZxiU/dsTJJ/x5s30wAgVmGVvSJ+beupvNyg2m1NUIUA==
X-Received: by 2002:adf:9e09:: with SMTP id
 u9-v6mr13375230wre.51.1538921517277; 
 Sun, 07 Oct 2018 07:11:57 -0700 (PDT)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id w72-v6sm28940116wrc.52.2018.10.07.07.11.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 07 Oct 2018 07:11:56 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v4 06/12] device: store a copy of the device net
Date: Sun,  7 Oct 2018 16:11:33 +0200
Message-Id: <20181007141139.26310-7-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181007141139.26310-1-ju.orth@gmail.com>
References: <20181007141139.26310-1-ju.orth@gmail.com>
MIME-Version: 1.0
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

This eliminates the need for have_transit_net_ref because
have_transit_net_ref == true if and only if dev_net != transit_net.
---
 src/device.c | 27 +++++++++++++++++----------
 src/device.h |  4 +++-
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/src/device.c b/src/device.c
index ebcd79c..ddb8fd7 100644
--- a/src/device.c
+++ b/src/device.c
@@ -243,7 +243,7 @@ static void destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_transit_net_ref)
+	if (wg->transit_net != wg->dev_net)
 		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
@@ -296,7 +296,9 @@ static int newlink(struct net *src_net, struct net_device *dev,
 	int ret = -ENOMEM;
 	struct wireguard_device *wg = netdev_priv(dev);
 
-	wg->transit_net = src_net;
+	wg->dev_net = NULL;
+	wg->transit_net = NULL;
+	wg_device_set_nets(wg,  dev_net(dev), src_net);
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -397,14 +399,8 @@ static int netdevice_notification(struct notifier_block *nb,
 	if (action != NETDEV_REGISTER || dev->netdev_ops != &netdev_ops)
 		return 0;
 
-	if (dev_net(dev) == wg->transit_net && wg->have_transit_net_ref) {
-		put_net(wg->transit_net);
-		wg->have_transit_net_ref = false;
-	} else if (dev_net(dev) != wg->transit_net &&
-		   !wg->have_transit_net_ref) {
-		wg->have_transit_net_ref = true;
-		get_net(wg->transit_net);
-	}
+	wg_device_set_nets(wg, dev_net(dev), wg->transit_net);
+
 	return 0;
 }
 
@@ -450,3 +446,14 @@ void wg_device_uninit(void)
 #endif
 	rcu_barrier_bh();
 }
+
+void wg_device_set_nets(struct wireguard_device *wg, struct net *dev_net,
+			struct net *transit_net)
+{
+	if (wg->transit_net != wg->dev_net)
+		put_net(wg->transit_net);
+	wg->dev_net = dev_net;
+	wg->transit_net = transit_net;
+	if (wg->transit_net != wg->dev_net)
+		get_net(wg->transit_net);
+}
diff --git a/src/device.h b/src/device.h
index e919789..3419a52 100644
--- a/src/device.h
+++ b/src/device.h
@@ -41,6 +41,7 @@ struct wireguard_device {
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
 	struct net *transit_net;
+	struct net *dev_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
@@ -56,10 +57,11 @@ struct wireguard_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_transit_net_ref;
 };
 
 int wg_device_init(void);
 void wg_device_uninit(void);
+void wg_device_set_nets(struct wireguard_device *wg, struct net *dev_net,
+			struct net *transit_net);
 
 #endif /* _WG_DEVICE_H */
-- 
2.19.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
