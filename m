Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c23b164
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:02 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id add243d7
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 03/12] receive,
 send: use AtomicBool for dropped in QueueInboundElement, QueueOutboundElement
Date: Mon,  1 Jan 2018 11:52:53 +0100
Message-Id: <19b07517ede8926908b1d827d4e263342e76c292.1514803815.git.simon@ruderich.org>
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

Also remove explicit initialization which defaults to false anyway.

This removes code duplication with AtomicBool.
---
 src/receive.go | 7 +++----
 src/send.go    | 9 ++++-----
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/src/receive.go b/src/receive.go
index dbd2813..2c4f191 100644
--- a/src/receive.go
+++ b/src/receive.go
@@ -20,7 +20,7 @@ type QueueHandshakeElement struct {
 }
 
 type QueueInboundElement struct {
-	dropped  int32
+	dropped  AtomicBool
 	mutex    sync.Mutex
 	buffer   *[MaxMessageSize]byte
 	packet   []byte
@@ -30,11 +30,11 @@ type QueueInboundElement struct {
 }
 
 func (elem *QueueInboundElement) Drop() {
-	atomic.StoreInt32(&elem.dropped, AtomicTrue)
+	elem.dropped.Set(true)
 }
 
 func (elem *QueueInboundElement) IsDropped() bool {
-	return atomic.LoadInt32(&elem.dropped) == AtomicTrue
+	return elem.dropped.Get()
 }
 
 func (device *Device) addToInboundQueue(
@@ -177,7 +177,6 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind Bind) {
 				packet:   packet,
 				buffer:   buffer,
 				keyPair:  keyPair,
-				dropped:  AtomicFalse,
 				endpoint: endpoint,
 			}
 			elem.mutex.Lock()
diff --git a/src/send.go b/src/send.go
index 9537f5e..163b75f 100644
--- a/src/send.go
+++ b/src/send.go
@@ -36,7 +36,7 @@ import (
  */
 
 type QueueOutboundElement struct {
-	dropped int32
+	dropped AtomicBool
 	mutex   sync.Mutex
 	buffer  *[MaxMessageSize]byte // slice holding the packet data
 	packet  []byte                // slice of "buffer" (always!)
@@ -58,17 +58,16 @@ func (peer *Peer) FlushNonceQueue() {
 
 func (device *Device) NewOutboundElement() *QueueOutboundElement {
 	return &QueueOutboundElement{
-		dropped: AtomicFalse,
 		buffer:  device.pool.messageBuffers.Get().(*[MaxMessageSize]byte),
 	}
 }
 
 func (elem *QueueOutboundElement) Drop() {
-	atomic.StoreInt32(&elem.dropped, AtomicTrue)
+	elem.dropped.Set(true)
 }
 
 func (elem *QueueOutboundElement) IsDropped() bool {
-	return atomic.LoadInt32(&elem.dropped) == AtomicTrue
+	return elem.dropped.Get()
 }
 
 func addToOutboundQueue(
@@ -227,7 +226,7 @@ func (peer *Peer) RoutineNonce() {
 			elem.peer = peer
 			elem.nonce = atomic.AddUint64(&keyPair.sendNonce, 1) - 1
 			elem.keyPair = keyPair
-			elem.dropped = AtomicFalse
+			elem.dropped.Set(false)
 			elem.mutex.Lock()
 
 			// add to parallel and sequential queue
-- 
2.15.1
