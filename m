Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89cafdbc
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:05 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1adf080f
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:58 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 10/12] receive, send: specialize addTo*Queue() functions
Date: Mon,  1 Jan 2018 11:53:00 +0100
Message-Id: <c7aee3fff3e7b0c0845b19efb4ecd84ff94f8a6f.1514803815.git.simon@ruderich.org>
In-Reply-To: <cover.1514803815.git.simon@ruderich.org>
References: <cover.1514803815.git.simon@ruderich.org>
In-Reply-To: <cover.1514803815.git.simon@ruderich.org>
References: <cover.1514803815.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

As each function is only used with a single queue, this removes an
unnecessary argument and prevents passing the wrong queue.
---
 src/receive.go | 23 ++++++++---------------
 src/send.go    |  8 +++-----
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/src/receive.go b/src/receive.go
index 2c4f191..f5cbe74 100644
--- a/src/receive.go
+++ b/src/receive.go
@@ -37,10 +37,8 @@ func (elem *QueueInboundElement) IsDropped() bool {
 	return elem.dropped.Get()
 }
 
-func (device *Device) addToInboundQueue(
-	queue chan *QueueInboundElement,
-	element *QueueInboundElement,
-) {
+func (peer *Peer) addToInboundQueue(element *QueueInboundElement) {
+	queue := peer.queue.inbound
 	for {
 		select {
 		case queue <- element:
@@ -55,10 +53,8 @@ func (device *Device) addToInboundQueue(
 	}
 }
 
-func (device *Device) addToDecryptionQueue(
-	queue chan *QueueInboundElement,
-	element *QueueInboundElement,
-) {
+func (device *Device) addToDecryptionQueue(element *QueueInboundElement) {
+	queue := device.queue.decryption
 	for {
 		select {
 		case queue <- element:
@@ -75,10 +71,8 @@ func (device *Device) addToDecryptionQueue(
 	}
 }
 
-func (device *Device) addToHandshakeQueue(
-	queue chan QueueHandshakeElement,
-	element QueueHandshakeElement,
-) {
+func (device *Device) addToHandshakeQueue(element QueueHandshakeElement) {
+	queue := device.queue.handshake
 	for {
 		select {
 		case queue <- element:
@@ -183,8 +177,8 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind Bind) {
 
 			// add to decryption queues
 
-			device.addToDecryptionQueue(device.queue.decryption, elem)
-			device.addToInboundQueue(peer.queue.inbound, elem)
+			device.addToDecryptionQueue(elem)
+			peer.addToInboundQueue(elem)
 			buffer = device.GetMessageBuffer()
 
 			continue
@@ -203,7 +197,6 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind Bind) {
 
 		if okay {
 			device.addToHandshakeQueue(
-				device.queue.handshake,
 				QueueHandshakeElement{
 					msgType:  msgType,
 					buffer:   buffer,
diff --git a/src/send.go b/src/send.go
index 163b75f..7f1f25c 100644
--- a/src/send.go
+++ b/src/send.go
@@ -88,10 +88,8 @@ func addToOutboundQueue(
 	}
 }
 
-func addToEncryptionQueue(
-	queue chan *QueueOutboundElement,
-	element *QueueOutboundElement,
-) {
+func (device *Device) addToEncryptionQueue(element *QueueOutboundElement) {
+	queue := device.queue.encryption
 	for {
 		select {
 		case queue <- element:
@@ -231,7 +229,7 @@ func (peer *Peer) RoutineNonce() {
 
 			// add to parallel and sequential queue
 
-			addToEncryptionQueue(device.queue.encryption, elem)
+			device.addToEncryptionQueue(elem)
 			addToOutboundQueue(peer.queue.outbound, elem)
 		}
 	}
-- 
2.15.1
