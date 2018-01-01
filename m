Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a35c0e19
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:02 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dda2468
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 05/12] index: NewIndex(): don't use separate read-lock to
 check if index is present
Date: Mon,  1 Jan 2018 11:52:55 +0100
Message-Id: <219744f9235934288b3fc2b65e071dc3b8e57c6f.1514803815.git.simon@ruderich.org>
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

The new index is random making collisions very unlikely, therefore
taking a separate read-only lock before taking the full lock in most
cases anyway will not improve performance and only makes the code more
complicated. However I didn't benchmark this change.
---
 src/index.go | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/src/index.go b/src/index.go
index 13e8693..bf8f0a0 100644
--- a/src/index.go
+++ b/src/index.go
@@ -63,21 +63,15 @@ func (table *IndexTable) NewIndex(peer *Peer) (uint32, error) {
 
 		// check if index used
 
-		table.mutex.RLock()
-		_, ok := table.table[index]
-		table.mutex.RUnlock()
-		if ok {
-			continue
-		}
-
-		// map index to handshake
-
 		table.mutex.Lock()
 		_, found := table.table[index]
 		if found {
 			table.mutex.Unlock()
 			continue
 		}
+
+		// map index to handshake
+
 		table.table[index] = IndexTableEntry{
 			peer:      peer,
 			handshake: &peer.handshake,
-- 
2.15.1
