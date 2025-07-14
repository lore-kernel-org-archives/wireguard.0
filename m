Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD9CC83F17
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 14 Jul 2025 17:13:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03f90bfe;
	Mon, 14 Jul 2025 17:13:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 465eaf65
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Jul 2025 17:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752513179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=DSP3Fzcx4Wu10HLkpqSVUIAj+VuZ78bxyEPiBAJqfJw=;
 b=eTHVVuJ34ciYNZd6KXpAkOz7euXVTwJ4u4aOxVFUxF7ZMwc4O7P3eLl7MmpJRnFz3T+QeS
 eFEXoxADn9U/Ny3C2z/Vr2iu0EHdpMzvjbQfZVrDV0sYJMGBwT3XAsD/zcpQApqnG+u9Tm
 hUnncxGHejLyofhxMQRK0dWV+k0+Cio=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-bIeWGtZpOAa0k2af-YIQDA-1; Mon,
 14 Jul 2025 13:12:58 -0400
X-MC-Unique: bIeWGtZpOAa0k2af-YIQDA-1
X-Mimecast-MFC-AGG-ID: bIeWGtZpOAa0k2af-YIQDA_1752513177
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A292518089B7; Mon, 14 Jul 2025 17:12:56 +0000 (UTC)
Received: from [10.22.80.10] (unknown [10.22.80.10])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92FD318002B1; Mon, 14 Jul 2025 17:12:54 +0000 (UTC)
Date: Mon, 14 Jul 2025 19:12:48 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Sultan Alsawaf <sultan@kerneltoast.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "David S. Miller" <davem@davemloft.net>
cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org
Subject: [PATCH] wireguard: omit need_resched() before cond_resched()
Message-ID: <5da9fced-67f4-3e32-76ca-b8a5be3b962a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

There's no need to call need_resched() because cond_resched() will do
nothing if need_resched() returns false.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/net/wireguard/receive.c |    3 +--
 drivers/net/wireguard/send.c    |    6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

Index: linux-2.6/drivers/net/wireguard/receive.c
===================================================================
--- linux-2.6.orig/drivers/net/wireguard/receive.c	2024-03-30 20:07:03.000000000 +0100
+++ linux-2.6/drivers/net/wireguard/receive.c	2025-07-14 19:09:52.000000000 +0200
@@ -501,8 +501,7 @@ void wg_packet_decrypt_worker(struct wor
 			likely(decrypt_packet(skb, PACKET_CB(skb)->keypair)) ?
 				PACKET_STATE_CRYPTED : PACKET_STATE_DEAD;
 		wg_queue_enqueue_per_peer_rx(skb, state);
-		if (need_resched())
-			cond_resched();
+		cond_resched();
 	}
 }
 
Index: linux-2.6/drivers/net/wireguard/send.c
===================================================================
--- linux-2.6.orig/drivers/net/wireguard/send.c	2024-07-21 17:40:39.000000000 +0200
+++ linux-2.6/drivers/net/wireguard/send.c	2025-07-14 19:10:03.000000000 +0200
@@ -279,8 +279,7 @@ void wg_packet_tx_worker(struct work_str
 
 		wg_noise_keypair_put(keypair, false);
 		wg_peer_put(peer);
-		if (need_resched())
-			cond_resched();
+		cond_resched();
 	}
 }
 
@@ -303,8 +302,7 @@ void wg_packet_encrypt_worker(struct wor
 			}
 		}
 		wg_queue_enqueue_per_peer_tx(first, state);
-		if (need_resched())
-			cond_resched();
+		cond_resched();
 	}
 }
 

