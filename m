Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3204ede5
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:04 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce48f323
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:58 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 09/12] ratelimiter: Allow(): don't use separate read-lock to
 check if ip is present
Date: Mon,  1 Jan 2018 11:52:59 +0100
Message-Id: <01934e48a02638ca5bc346a10de1aafa710d50c3.1514803815.git.simon@ruderich.org>
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

We have to take the full write-lock immediately afterwards anyway and
there's no costly operation between taking the read-lock and the
write-lock. Taking only one lock should improve the performance and
makes the code easier to read. However I haven't benchmarked this.
---
 src/ratelimiter.go | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/src/ratelimiter.go b/src/ratelimiter.go
index 6e5f005..5b30926 100644
--- a/src/ratelimiter.go
+++ b/src/ratelimiter.go
@@ -89,7 +89,8 @@ func (rate *Ratelimiter) Allow(ip net.IP) bool {
 	IPv4 := ip.To4()
 	IPv6 := ip.To16()
 
-	rate.mutex.RLock()
+	rate.mutex.Lock()
+	defer rate.mutex.Unlock()
 
 	if IPv4 != nil {
 		copy(KeyIPv4[:], IPv4)
@@ -99,12 +100,9 @@ func (rate *Ratelimiter) Allow(ip net.IP) bool {
 		entry = rate.tableIPv6[KeyIPv6]
 	}
 
-	rate.mutex.RUnlock()
-
 	// make new entry if not found
 
 	if entry == nil {
-		rate.mutex.Lock()
 		entry = new(RatelimiterEntry)
 		entry.tokens = RatelimiterMaxTokens - RatelimiterPacketCost
 		entry.lastTime = time.Now()
@@ -113,13 +111,11 @@ func (rate *Ratelimiter) Allow(ip net.IP) bool {
 		} else {
 			rate.tableIPv6[KeyIPv6] = entry
 		}
-		rate.mutex.Unlock()
 		return true
 	}
 
 	// add tokens to entry
 
-	entry.mutex.Lock()
 	now := time.Now()
 	entry.tokens += now.Sub(entry.lastTime).Nanoseconds()
 	entry.lastTime = now
@@ -131,9 +127,7 @@ func (rate *Ratelimiter) Allow(ip net.IP) bool {
 
 	if entry.tokens > RatelimiterPacketCost {
 		entry.tokens -= RatelimiterPacketCost
-		entry.mutex.Unlock()
 		return true
 	}
-	entry.mutex.Unlock()
 	return false
 }
-- 
2.15.1
