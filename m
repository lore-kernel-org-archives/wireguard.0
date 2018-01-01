Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 00d9035e
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:03 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0c6309e
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 07/12] peer: NewPeer(): add missing device.mutex.Unlock() in
 error paths
Date: Mon,  1 Jan 2018 11:52:57 +0100
Message-Id: <d84cf29d3fbcee703b515e5abd4a09871834d664.1514803815.git.simon@ruderich.org>
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

---
 src/peer.go | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/peer.go b/src/peer.go
index 228fe73..244bae0 100644
--- a/src/peer.go
+++ b/src/peer.go
@@ -83,6 +83,7 @@ func (device *Device) NewPeer(pk NoisePublicKey) (*Peer, error) {
 	// check if over limit
 
 	if len(device.peers) >= MaxPeers {
+		device.mutex.Unlock()
 		return nil, errors.New("Too many peers")
 	}
 
@@ -90,6 +91,7 @@ func (device *Device) NewPeer(pk NoisePublicKey) (*Peer, error) {
 
 	_, ok := device.peers[pk]
 	if ok {
+		device.mutex.Unlock()
 		return nil, errors.New("Adding existing peer")
 	}
 	device.peers[pk] = peer
-- 
2.15.1
