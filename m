Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5E9D49223
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:47:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86948b46;
	Mon, 18 Nov 2024 12:39:23 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7c82d179
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Mar 2024 10:34:31 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso2405628a12.2
 for <wireguard@lists.zx2c4.com>; Fri, 08 Mar 2024 02:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709894071; x=1710498871;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NDoFAf/EWOLeF9600iXmBhzVjPZO0aaKJXl+GmInLQk=;
 b=OVhCx7/k6SttQ9OX71fVqg1VfzqDdriZICuYw+SfaE77sJ+eOtwYYlvpdRLK/sBiaZ
 KKDzVSdzbN6IshdlQyC/KaiE4YWBRFWSh6F8Ly0/27B9OFVqT8OzDcgK8pfahKdiBF1K
 IX6IiLOBocsnHfuSdeBqQi5+RYFH0Bx672AsN4X5Yaj9KHqqOsF1AMmd+CuA8qNi3ZP6
 54UmrAS6Z/7PG4dpLAKXfjIckNgeZF9FjEJtxRl94jptV050fLMp3rQayuJ3Kmioxy3x
 ig579uOycSpbJa/QiF/yBS59XaEezCyT1myd6BMYHh4bzI5U7wEnbGha+Ej5KsQpj4U5
 1hAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEu6jgBHNGK3KghiOa1swYsiYp8z01cixnwH/pbZj+msO//8qhfVqmnIRsKGblP/b3aNV7ps9i+s8cfyB47RHNsb675IhAH8Ww
X-Gm-Message-State: AOJu0Yw5kqF5Of22LZgpUS45YtwEcabo7qVEWRrS5Gjn4QYWS1PVzfbH
 Jaf79m9w3YTOOu8WIY+ats1cCVepE+eajhfWk/pFE+F2MBkYQ2Z2
X-Google-Smtp-Source: AGHT+IEJMBNjE1KzZZWYOZbl0RRbmyKgc2oj55yl0Ule29SisD4BdzhDEO1dS4GvHWr++b4B33BelQ==
X-Received: by 2002:a05:6402:5c4:b0:566:b2e1:58f with SMTP id
 n4-20020a05640205c400b00566b2e1058fmr1513116edx.41.1709894070654; 
 Fri, 08 Mar 2024 02:34:30 -0800 (PST)
Received: from localhost (fwdproxy-lla-001.fbsv.net.
 [2a03:2880:30ff:1::face:b00c]) by smtp.gmail.com with ESMTPSA id
 o14-20020aa7c7ce000000b0056742460f68sm5716057eds.66.2024.03.08.02.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Mar 2024 02:34:30 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 wireguard@lists.zx2c4.com (open list:WIREGUARD SECURE NETWORK TUNNEL)
Subject: [PATCH net-next 1/2] wireguard: Leverage core stats allocator
Date: Fri,  8 Mar 2024 02:34:17 -0800
Message-ID: <20240308103419.1771177-1-leitao@debian.org>
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
---
 drivers/net/wireguard/device.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/net/wireguard/device.c b/drivers/net/wireguard/device.c
index deb9636b0ecf..cb025ba8f60d 100644
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
@@ -331,14 +330,10 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
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
@@ -397,8 +392,6 @@ static int wg_newlink(struct net *src_net, struct net_device *dev,
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

