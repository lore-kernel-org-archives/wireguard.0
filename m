Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 854cf08e
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:02 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2819b411
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 04/12] device: move removePeerUnsafe() into Device
Date: Mon,  1 Jan 2018 11:52:54 +0100
Message-Id: <5c6ca08513069a75d454b2d879618e185b558728.1514803815.git.simon@ruderich.org>
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

Feels more natural as it operates on a Device's state and is just one
more private helper function.
---
 src/device.go | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/src/device.go b/src/device.go
index f4a087c..537af67 100644
--- a/src/device.go
+++ b/src/device.go
@@ -70,7 +70,7 @@ func (device *Device) Down() {
 /* Warning:
  * The caller must hold the device mutex (write lock)
  */
-func removePeerUnsafe(device *Device, key NoisePublicKey) {
+func (device *Device) removePeerUnsafe(key NoisePublicKey) {
 	peer, ok := device.peers[key]
 	if !ok {
 		return
@@ -109,7 +109,7 @@ func (device *Device) SetPrivateKey(sk NoisePrivateKey) error {
 		h := &peer.handshake
 		h.mutex.RLock()
 		if h.remoteStatic.Equals(publicKey) {
-			removePeerUnsafe(device, key)
+			device.removePeerUnsafe(key)
 		}
 		h.mutex.RUnlock()
 	}
@@ -132,7 +132,7 @@ func (device *Device) SetPrivateKey(sk NoisePrivateKey) error {
 		} else {
 			h.precomputedStaticStatic = device.privateKey.sharedSecret(h.remoteStatic)
 			if isZero(h.precomputedStaticStatic[:]) {
-				removePeerUnsafe(device, key)
+				device.removePeerUnsafe(key)
 			}
 		}
 		h.mutex.Unlock()
@@ -214,14 +214,14 @@ func (device *Device) LookupPeer(pk NoisePublicKey) *Peer {
 func (device *Device) RemovePeer(key NoisePublicKey) {
 	device.mutex.Lock()
 	defer device.mutex.Unlock()
-	removePeerUnsafe(device, key)
+	device.removePeerUnsafe(key)
 }
 
 func (device *Device) RemoveAllPeers() {
 	device.mutex.Lock()
 	defer device.mutex.Unlock()
 	for key := range device.peers {
-		removePeerUnsafe(device, key)
+		device.removePeerUnsafe(key)
 	}
 }
 
-- 
2.15.1
