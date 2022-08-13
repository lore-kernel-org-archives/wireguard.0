Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB2C32772
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:35:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 8aacc863;
	Tue, 23 Aug 2022 13:35:58 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b2e97a95
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 Aug 2022 04:35:20 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id jm11so84953plb.13
 for <wireguard@lists.zx2c4.com>; Fri, 12 Aug 2022 21:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VUHCQwlaRdPYc5+96fH2AK8O9hMSpZvPcuLwqBAO7GQ=;
 b=DbqPITAh6lgQPvO8iRa3uqHjy37oFWqdIFpqX5YpaTeFSa9gvbfPa8ouyMvutd/LuW
 ka2BMZndXfiNWXfow9ffrQt2nFRaSV/9YFfeii7/IHng9yehzW/yZ297A2N1C6RfU+ES
 gP6LngMgBEL1JkSigxeKsJQysiofWZ8/etpZ9MY4uEFuTFSHqdlVL+jJ6bfj0Z3tqynK
 yb4oIbwmRKsf8Ki1eaBFEGKXcYM6hrSfRqOJjNJqY9pg9yocPUKxr85qAzee0zUi6lyO
 WgOZZ7KBVGUbxOEwDEEof2WCWLeokyTkWD2mvkkQgqYl8iPWfdGnjzWzlElMvOMFwMZ4
 xpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VUHCQwlaRdPYc5+96fH2AK8O9hMSpZvPcuLwqBAO7GQ=;
 b=dXtrQrplZ4d91ybmIQ9xXnIIaEaVyoj9SIxCNCafVhvfYqaS6KpklLRjgkl8v3tPf2
 Rob005z0wHq39QUDu3qcOR83rxc8JPdAVLu0tNOxrq2F62/Iir6dHr88k9pv2RYhh3Zj
 xPoPY0uBFTjFkFAFusi7pMigjH0rsrNoh7xTP9B3ZuDldo1mKLCG9toFf6iTiMGLSKrX
 TeoxOwo54hldVksSOj5HgG/I7B7a3upmJF3KuEH8NhXxW9woC/62eFnG+7U8msmerrJ8
 JV9FQPQnSc6v97clOrOAbXW6I/3HfB9L8Lg87USFmShrWwdHa9W0TvWUKPd1FmQebGq9
 W6OQ==
X-Gm-Message-State: ACgBeo09iHwolFtu+j+59xrcSyjX6UP5pv8LcBonS2beJ2HmVxBpfO+6
 00gQSD/73mhQVe9AJ1ltva8=
X-Google-Smtp-Source: AA6agR5E1/zUPIeHYwRmzswCgIOXoJuOjoKcs89aA7ZQycOVw8pfa7Exlb/hyVvFnRNXjExarmZJ8A==
X-Received: by 2002:a17:90b:1c8e:b0:1f7:5250:7b44 with SMTP id
 oo14-20020a17090b1c8e00b001f752507b44mr17176314pjb.212.1660365318895; 
 Fri, 12 Aug 2022 21:35:18 -0700 (PDT)
Received: from localhost.localdomain ([223.212.58.71])
 by smtp.gmail.com with ESMTPSA id
 y6-20020aa793c6000000b0052e2a1edab8sm2479425pff.24.2022.08.12.21.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 21:35:18 -0700 (PDT)
From: Yuntao Wang <ytcoode@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yuntao Wang <ytcoode@gmail.com>
Subject: [PATCH] wireguard: send/receive: update function names in comments
Date: Sat, 13 Aug 2022 12:35:08 +0800
Message-Id: <20220813043508.128996-1-ytcoode@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

The functions packet_send_queued_handshakes() and
packet_process_queued_handshake_packets() were renamed to
wg_packet_handshake_send_worker() and wg_packet_handshake_receive_worker()
respectively, but the comments referring to them were not updated
accordingly, let's fix it.

Signed-off-by: Yuntao Wang <ytcoode@gmail.com>
---
 drivers/net/wireguard/receive.c | 2 +-
 drivers/net/wireguard/send.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireguard/receive.c b/drivers/net/wireguard/receive.c
index 7135d51d2d87..5b9cd1841390 100644
--- a/drivers/net/wireguard/receive.c
+++ b/drivers/net/wireguard/receive.c
@@ -566,7 +566,7 @@ void wg_packet_receive(struct wg_device *wg, struct sk_buff *skb)
 		}
 		atomic_inc(&wg->handshake_queue_len);
 		cpu = wg_cpumask_next_online(&wg->handshake_queue.last_cpu);
-		/* Queues up a call to packet_process_queued_handshake_packets(skb): */
+		/* Queues up a call to wg_packet_handshake_receive_worker(skb): */
 		queue_work_on(cpu, wg->handshake_receive_wq,
 			      &per_cpu_ptr(wg->handshake_queue.worker, cpu)->work);
 		break;
diff --git a/drivers/net/wireguard/send.c b/drivers/net/wireguard/send.c
index 5368f7c35b4b..15202c2e91a8 100644
--- a/drivers/net/wireguard/send.c
+++ b/drivers/net/wireguard/send.c
@@ -69,8 +69,8 @@ void wg_packet_send_queued_handshake_initiation(struct wg_peer *peer,
 		goto out;
 
 	wg_peer_get(peer);
-	/* Queues up calling packet_send_queued_handshakes(peer), where we do a
-	 * peer_put(peer) after:
+	/* Queues up calling wg_packet_handshake_send_worker(peer), where we do
+	 * a wg_peer_put(peer) after:
 	 */
 	if (!queue_work(peer->device->handshake_send_wq,
 			&peer->transmit_handshake_work))
-- 
2.37.1

