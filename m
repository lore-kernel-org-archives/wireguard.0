Return-Path: <SRS0=EQWa=OY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301E1C43444
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8850206C2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 15 Dec 2018 16:57:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo3RjYgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8850206C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 465cb498;
	Sat, 15 Dec 2018 16:56:31 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c629df4b
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:29 +0000 (UTC)
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 638390ca
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Dec 2018 16:56:28 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id x30so7444972edx.2
 for <wireguard@lists.zx2c4.com>; Sat, 15 Dec 2018 08:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k4v3pJheyGPu7O39qGdzh58TXWzNLSSkvk9Ag3dArDk=;
 b=Fo3RjYgvCVqizSfaXZbFlgVs2DM380H6vcvh26LD9lchtuw4NSAGrUuiXbp/PJ0Bue
 3jywUmKkiEtWI+/f0G1/C6fU/NSq7+XmfmolEMVXfSI7Yhui1QUC8KNX7A/lBHvSb5pS
 XQXtkgyDaZH8FRqhcHORXwbO4aVLNXxDfv+ooc0yTJTvAeWhBH8p63troKIp0wlTShX0
 X9Go+fmFbm4VrMmpWKRdyCm5NMQoCnZF0xf+/GTnM+yVHcT/sZ1ovDC1JgGTv6O5Wkfw
 nd/BjzxP/Jx+BbVGUwptjbJH5dPPTmr7vbxVui+w2V2D4B4nNl1BXIK5AedQ0y+hn6Nq
 zyHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k4v3pJheyGPu7O39qGdzh58TXWzNLSSkvk9Ag3dArDk=;
 b=HCjrLqREWVf/gL0tRKzCBAfjc+kQlqdGJp6StB2IO0ouOW3P9wUS7teShmixntAcEU
 AfV4zQJceM2xfYcDU/tpnpQjmx6KgNSPmsmrD1SddBuVYy5iCO3hgs8hXh/15SKcalcm
 e7nUqj3plr8hM936bBCW6eOyuWn6VWRS4x9a7JO0UTTJxp+pZLYcZtg7VuTvadJk/gwe
 MuhtQsQrnOcq33hKkXp9CouyuIr3T0AJlL7XT5+bXkRynJoLN1DxhtHLR9Y/9+V5SCl5
 cV5RN5BRggCZtmTmH+Ej2LA1nk3DBN3MSO0xZc+G6uyMmoOTB2nFxNnolFatm7HhNb7v
 Zvsw==
X-Gm-Message-State: AA+aEWaF+4sDzIAx2dXklE5XoZTI4GYf9ukwj5iOiyeGqN8EJS9AjhQ6
 8oOcHGeK5fZUuxNW5flNgLIn+JGz
X-Google-Smtp-Source: AFSGD/WmR7kSuVnDvGNhd85LLG0GTwUIX5eu4uK/SBDH5zAQTPo4MrEWBjU5RJQs7PBVMsid9DIivQ==
X-Received: by 2002:a50:ba3d:: with SMTP id g58mr6975313edc.35.1544892993358; 
 Sat, 15 Dec 2018 08:56:33 -0800 (PST)
Received: from localhost.localdomain
 (p200300C55F2A9600228984FFFE70D494.dip0.t-ipconnect.de.
 [2003:c5:5f2a:9600:2289:84ff:fe70:d494])
 by smtp.gmail.com with ESMTPSA id q50sm2356015edd.66.2018.12.15.08.56.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Dec 2018 08:56:32 -0800 (PST)
From: Julian Orth <ju.orth@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH v5 05/11] device: store a copy of the device net
Date: Sat, 15 Dec 2018 17:56:07 +0100
Message-Id: <20181215165613.5486-6-ju.orth@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181215165613.5486-1-ju.orth@gmail.com>
References: <20181215165613.5486-1-ju.orth@gmail.com>
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
index ae4b9ad..0c0c17b 100644
--- a/src/device.c
+++ b/src/device.c
@@ -251,7 +251,7 @@ static void wg_destruct(struct net_device *dev)
 	skb_queue_purge(&wg->incoming_handshakes);
 	free_percpu(dev->tstats);
 	free_percpu(wg->incoming_handshakes_worker);
-	if (wg->have_transit_net_ref)
+	if (wg->transit_net != wg->dev_net)
 		put_net(wg->transit_net);
 	mutex_unlock(&wg->device_update_lock);
 
@@ -304,7 +304,9 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
 	struct wg_device *wg = netdev_priv(dev);
 	int ret = -ENOMEM;
 
-	wg->transit_net = src_net;
+	wg->dev_net = NULL;
+	wg->transit_net = NULL;
+	wg_device_set_nets(wg,  dev_net(dev), src_net);
 	init_rwsem(&wg->static_identity.lock);
 	mutex_init(&wg->socket_update_lock);
 	mutex_init(&wg->device_update_lock);
@@ -406,14 +408,8 @@ static int wg_netdevice_notification(struct notifier_block *nb,
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
 
@@ -459,3 +455,14 @@ void wg_device_uninit(void)
 #endif
 	rcu_barrier_bh();
 }
+
+void wg_device_set_nets(struct wg_device *wg, struct net *dev_net,
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
index be54d4a..e1d4e84 100644
--- a/src/device.h
+++ b/src/device.h
@@ -41,6 +41,7 @@ struct wg_device {
 	struct crypt_queue encrypt_queue, decrypt_queue;
 	struct sock __rcu *sock4, *sock6;
 	struct net *transit_net;
+	struct net *dev_net;
 	struct noise_static_identity static_identity;
 	struct workqueue_struct *handshake_receive_wq, *handshake_send_wq;
 	struct workqueue_struct *packet_crypt_wq;
@@ -56,10 +57,11 @@ struct wg_device {
 	unsigned int num_peers, device_update_gen;
 	u32 fwmark;
 	u16 incoming_port;
-	bool have_transit_net_ref;
 };
 
 int wg_device_init(void);
 void wg_device_uninit(void);
+void wg_device_set_nets(struct wg_device *wg, struct net *dev_net,
+			struct net *transit_net);
 
 #endif /* _WG_DEVICE_H */
-- 
2.19.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
