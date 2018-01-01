Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d309f4d
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:05 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 966371c0
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:59 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 12/12] timers: log error if handshake sending fails
Date: Mon,  1 Jan 2018 11:53:02 +0100
Message-Id: <8829bb32281db1bf6926b85a4e44b3a58e765fb5.1514803815.git.simon@ruderich.org>
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
 src/timers.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/timers.go b/src/timers.go
index f2fed30..8e8cf22 100644
--- a/src/timers.go
+++ b/src/timers.go
@@ -296,7 +296,7 @@ func (peer *Peer) RoutineTimerHandler(ready *sync.WaitGroup) {
 			err := peer.sendNewHandshake()
 			if err != nil {
 				logInfo.Println(
-					"Failed to send handshake to peer:", peer.String())
+					"Failed to send handshake to peer:", peer.String(), err)
 			}
 
 		case <-peer.timer.handshakeDeadline.Wait():
@@ -322,7 +322,7 @@ func (peer *Peer) RoutineTimerHandler(ready *sync.WaitGroup) {
 			err := peer.sendNewHandshake()
 			if err != nil {
 				logInfo.Println(
-					"Failed to send handshake to peer:", peer.String())
+					"Failed to send handshake to peer:", peer.String(), err)
 			}
 
 			peer.timer.handshakeDeadline.Reset(RekeyAttemptTime)
-- 
2.15.1
