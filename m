Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D949C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 12:55:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41F172224C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 12:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="igwoGBDn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41F172224C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5463fc5;
	Wed, 18 Nov 2020 12:50:24 +0000 (UTC)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [2607:f8b0:4864:20::52e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2355d936
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 12:50:22 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 34so1125878pgp.10
 for <wireguard@lists.zx2c4.com>; Wed, 18 Nov 2020 04:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=PK95BOAesX8i/KtbaszOqWYHdE+ZEB5hzaJ/PwIglj4=;
 b=igwoGBDntD27tMVuCSFtmux/9bpoiAkX9FpTTDK9d1FR8gt6LVFqzcMXwPMXuj5pW1
 0FHMe67JT+8uK78yBSoV0MKJUHM9+7vYxDxU6uCAB27ozcvOoEDCF/1fjj05igSWNe8e
 og1+EJQAW1ZdifMCTyBPSJMH8nia7vj8yDnVMboUzy5yUvUF4+bSScM4YvJnCtOs32iF
 Nh0CFoctKM5BQYjsAr5wpIX4T67bxiral7FcwwIfoM2WZZ680lvPdFZaIZBc3hF9vZv+
 50Oi0smQmtwoBDOQp7iLzKuicrGWqPQC2x1oSLbuG4ryMyOd/5Vw7JFbRV7de4s4oLqs
 1+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=PK95BOAesX8i/KtbaszOqWYHdE+ZEB5hzaJ/PwIglj4=;
 b=Q/uuEFyWAYkjVK2+DEJdd2fEQnp0ArqPCpdRcnSk7VbE822J0+UkSpd+wipEkOGxP8
 YnBMnr5p/qgRRAxixW6ePP2eM1lAq+r2qFtDIEvgvoYqRhaOPVxI2jl1fT4tkXbl25bX
 cP1YfXfMMnuDD5AgTNHPa+G8SYXbPETJ72t+IkEe7WyTexf40tcn1Xw+JssVtWXfAXrI
 JeaqiNG1Wicuw65gM/4+5XL+LOj8nPe+OE7jthb5v/qh4U6297VRoWEYvCxQ8GKdMAP8
 hszwsfWRlyFn2dQ+RdKXdBPgaLzWXgky6GMqQlJ6MKNZdkb9H+KCYLeTof+H27OwEImo
 zBhA==
X-Gm-Message-State: AOAM533PG6xGR/q9opvgCg6MY50ZVoHJEz/ZhsW/tS07t4MHhF0sGmt9
 fRnYgyw4dHOSuMOwest4a+1+JFkd7EB6K1I7
X-Google-Smtp-Source: ABdhPJxDayXq2KyZtX48IV6AlKKYMHHveYohQTCwdLdtoOQH4+MMx8ZGZzcxXJF/cnaycVsN3exz7g==
X-Received: by 2002:a63:5625:: with SMTP id k37mr7788394pgb.136.1605704105182; 
 Wed, 18 Nov 2020 04:55:05 -0800 (PST)
Received: from liuhaichaodeMacBook-Pro.local.net ([61.120.150.73])
 by smtp.gmail.com with ESMTPSA id 144sm26091824pfb.71.2020.11.18.04.55.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:55:04 -0800 (PST)
Message-ID: <5fb519a8.1c69fb81.9867a.7fef@mx.google.com>
X-Google-Original-Message-ID: <20201118125322.1304-1-liuhaichao>
From: liuhaichao@bytedance.com
X-Google-Original-From: liuhaichao
To: wireguard@lists.zx2c4.com
Cc: Haichao Liu <liuhaichao@bytedance.com>
Subject: [PATCH] device: add write queue mutex for peer
Date: Wed, 18 Nov 2020 20:53:22 +0800
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Haichao Liu <liuhaichao@bytedance.com>

fix panic: send on closed channel when remove peer

Change-Id: Ica0e2447cd941bd3a26948aacafc837904ea18b2
Signed-off-by: Haichao Liu <liuhaichao@bytedance.com>
---
 device/peer.go    | 6 +++++-
 device/receive.go | 2 ++
 device/send.go    | 4 ++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/device/peer.go b/device/peer.go
index ef6c010..78204bb 100644
--- a/device/peer.go
+++ b/device/peer.go
@@ -58,6 +58,7 @@ type Peer struct {
 	}
 
 	queue struct {
+		sync.RWMutex
 		nonce                           chan *QueueOutboundElement // nonce / pre-handshake queue
 		outbound                        chan *QueueOutboundElement // sequential ordering of work
 		inbound                         chan *QueueInboundElement  // sequential ordering of work
@@ -195,10 +196,11 @@ func (peer *Peer) Start() {
 	peer.routines.stopping.Add(PeerRoutineNumber)
 
 	// prepare queues
-
+	peer.queue.Lock()
 	peer.queue.nonce = make(chan *QueueOutboundElement, QueueOutboundSize)
 	peer.queue.outbound = make(chan *QueueOutboundElement, QueueOutboundSize)
 	peer.queue.inbound = make(chan *QueueInboundElement, QueueInboundSize)
+	peer.queue.Unlock()
 
 	peer.timersInit()
 	peer.handshake.lastSentHandshake = time.Now().Add(-(RekeyTimeout + time.Second))
@@ -284,9 +286,11 @@ func (peer *Peer) Stop() {
 
 	// close queues
 
+	peer.queue.Lock()
 	close(peer.queue.nonce)
 	close(peer.queue.outbound)
 	close(peer.queue.inbound)
+	peer.queue.Unlock()
 
 	peer.ZeroAndFlushAll()
 }
diff --git a/device/receive.go b/device/receive.go
index b53c9c0..e4a94b5 100644
--- a/device/receive.go
+++ b/device/receive.go
@@ -184,11 +184,13 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind conn.Bind) {
 
 			// add to decryption queues
 
+			peer.queue.RLock()
 			if peer.isRunning.Get() {
 				if device.addToInboundAndDecryptionQueues(peer.queue.inbound, device.queue.decryption, elem) {
 					buffer = device.GetMessageBuffer()
 				}
 			}
+			peer.queue.RUnlock()
 
 			continue
 
diff --git a/device/send.go b/device/send.go
index c0bdba3..d202b62 100644
--- a/device/send.go
+++ b/device/send.go
@@ -107,6 +107,8 @@ func addToOutboundAndEncryptionQueues(outboundQueue chan *QueueOutboundElement,
 /* Queues a keepalive if no packets are queued for peer
  */
 func (peer *Peer) SendKeepalive() bool {
+	peer.queue.RLock()
+	defer peer.queue.RUnlock()
 	if len(peer.queue.nonce) != 0 || peer.queue.packetInNonceQueueIsAwaitingKey.Get() || !peer.isRunning.Get() {
 		return false
 	}
@@ -310,6 +312,7 @@ func (device *Device) RoutineReadFromTUN() {
 
 		// insert into nonce/pre-handshake queue
 
+		peer.queue.RLock()
 		if peer.isRunning.Get() {
 			if peer.queue.packetInNonceQueueIsAwaitingKey.Get() {
 				peer.SendHandshakeInitiation(false)
@@ -317,6 +320,7 @@ func (device *Device) RoutineReadFromTUN() {
 			addToNonceQueue(peer.queue.nonce, elem, device)
 			elem = nil
 		}
+		peer.queue.RUnlock()
 	}
 }
 
-- 
2.19.1

