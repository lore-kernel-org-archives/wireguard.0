Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D57D49224
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea650f56;
	Mon, 18 Nov 2024 12:39:27 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a863d86c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2024 11:27:55 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-56647babfe6so1030855a12.3
 for <wireguard@lists.zx2c4.com>; Fri, 08 Mar 2024 03:27:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709897275; x=1710502075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qI+9EY7tzIYxs5Vpyz3cprJUSGJAHgHmPUUQiiDZ9PQ=;
 b=JRCZIp/Y+hTY7C3BJzvviLbsRG1QL/wGoNHuvJic/WOhNn3HhD2YXO1vCiXX0/brrC
 UOA38jK/FOzR4qU2ODmkAdURCP1hH9Z+ClePGl+OoW5XHADDPjHqBY4Oe15qVv6PBBFh
 obTu3SDDcsUktRsUiQVd0i/GxHLa8z39AZRZ2HVHJiZivJsC8IW/Ylezd4Y5wWe1VM3E
 P591sorfzuQuGY3GDd8KxDgPBzWulQh+imIPoB6YvnQ5PgSxbnkxh7Yg3AFjz7IsDDRR
 8PZnCYFeiNz6QMNFGw5ZdMBT1odHWv24x++4yECpwOEi0d5xxbJZVdFqN/CkMrd8LVTL
 +Hsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJTq5BGaPy3fQmviZbdwLDZo74XmptKnKmhP0qYIqR+Rv2V7frTNsYidkeXmO/yS06ksEa7cUSd7tGJXKG5O47ZsFzeGSCclZA
X-Gm-Message-State: AOJu0YxaTgdeD1ia8SWiMtD8sVabYKJfh6o0Rbe8kxEm+z2LGVRp1NTX
 +3dyV5sjWI2QLs+D/ic544G4LBYr3FlHSNBHEFJJpenbcv0F4b7s
X-Google-Smtp-Source: AGHT+IGdfwim53dOX/d0wdKqBpr8eVBgLopTYvjp5ZHw8PeZ2UdHS3kSBFamwUgpLKpuECK067aZsQ==
X-Received: by 2002:a17:907:11c1:b0:a44:1b9e:b977 with SMTP id
 va1-20020a17090711c100b00a441b9eb977mr14202779ejb.19.1709897274658; 
 Fri, 08 Mar 2024 03:27:54 -0800 (PST)
Received: from localhost (fwdproxy-lla-002.fbsv.net.
 [2a03:2880:30ff:2::face:b00c]) by smtp.gmail.com with ESMTPSA id
 gb42-20020a170907962a00b00a441a7a75b5sm9146201ejc.209.2024.03.08.03.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 03:27:54 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 wireguard@lists.zx2c4.com (open list:WIREGUARD SECURE NETWORK TUNNEL)
Subject: [PATCH net-next v2 1/2] wireguard: Leverage core stats allocator
Date: Fri,  8 Mar 2024 03:27:44 -0800
Message-ID: <20240308112746.2290505-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:39:22 +0000
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

With commit 34d21de99cea9 ("net: Move {l,t,d}stats allocation to core and
convert veth & vrf"), stats allocation could be done on net core
instead of in this driver.

With this new approach, the driver doesn't have to bother with error
handling (allocation failure checking, making sure free happens in the
right spot, etc). This is core responsibility now.

Remove the allocation in the wireguard driver and leverage the network
core allocation instead.

Signed-off-by: Breno Leitao <leitao@debian.org>
--
Changelog:

v2:
	* Setting dev->pcpu_stat_type was missing in v1 patch.
---
 drivers/net/wireguard/device.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index deb9636b0ecf..6aa071469e1c 100644
--- a/drivers/net/wireguard/device.c
+++ b/drivers/net/wireguard/device.c
@@ -262,7 +262,6 @@ static void wg_destruct(struct net_device *dev)
 	rcu_barrier(); /* Wait for all the peers to be actually freed. */
 	wg_ratelimiter_uninit();
 	memzero_explicit(&wg->static_identity, sizeof(wg->static_identity));
-	free_percpu(dev->tstats);
 	kvfree(wg->index_hashtable);
 	kvfree(wg->peer_hashtable);
 	mutex_unlock(&wg->device_update_lock);
@@ -297,6 +296,7 @@ static void wg_setup(struct net_device *dev)
 	dev->hw_enc_features |= WG_NETDEV_FEATURES;
 	dev->mtu = ETH_DATA_LEN - overhead;
 	dev->max_mtu = round_down(INT_MAX, MESSAGE_PADDING_MULTIPLE) - overhead;
+	dev->pcpu_stat_type = NETDEV_PCPU_STAT_TSTATS;
 
 	SET_NETDEV_DEVTYPE(dev, &device_type);
 
@@ -331,14 +331,10 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
 	if (!wg->index_hashtable)
 		goto err_free_peer_hashtable;
 
-	dev->tstats = netdev_alloc_pcpu_stats(struct pcpu_sw_netstats);
-	if (!dev->tstats)
-		goto err_free_index_hashtable;
-
 	wg->handshake_receive_wq = alloc_workqueue("wg-kex-%s",
 			WQ_CPU_INTENSIVE | WQ_FREEZABLE, 0, dev->name);
 	if (!wg->handshake_receive_wq)
-		goto err_free_tstats;
+		goto err_free_index_hashtable;
 
 	wg->handshake_send_wq = alloc_workqueue("wg-kex-%s",
 			WQ_UNBOUND | WQ_FREEZABLE, 0, dev->name);
@@ -397,8 +393,6 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
 	destroy_workqueue(wg->handshake_send_wq);
 err_destroy_handshake_receive:
 	destroy_workqueue(wg->handshake_receive_wq);
-err_free_tstats:
-	free_percpu(dev->tstats);
 err_free_index_hashtable:
 	kvfree(wg->index_hashtable);
 err_free_peer_hashtable:
-- 
2.43.0

