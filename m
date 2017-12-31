Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e53533a
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:10 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef2c8a18
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 5/7] helper_test: adapt to TUNDevice interface change
Date: Sun, 31 Dec 2017 17:16:52 +0100
Message-Id: <64acdac5254004b3c8b08ab3a211505a26c75770.1514726309.git.simon@ruderich.org>
In-Reply-To: <cover.1514726309.git.simon@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
In-Reply-To: <cover.1514726309.git.simon@ruderich.org>
References: <cover.1514726309.git.simon@ruderich.org>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Broken in 996c7c4 ("Removed IFF_NO_PI from TUN linux", 2017-12-04).

---
 src/helper_test.go | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/helper_test.go b/src/helper_test.go
index 46bb782..99eb5d6 100644
--- a/src/helper_test.go
+++ b/src/helper_test.go
@@ -20,14 +20,14 @@ func (tun *DummyTUN) File() *os.File {
 	return nil
 }
 
-func (tun *DummyTUN) Read(d []byte) (int, error) {
+func (tun *DummyTUN) Read(d []byte, offset int) (int, error) {
 	t := <-tun.packets
-	copy(d, t)
+	copy(d[offset:], t)
 	return len(t), nil
 }
 
-func (tun *DummyTUN) Write(d []byte) (int, error) {
-	tun.packets <- d
+func (tun *DummyTUN) Write(d []byte, offset int) (int, error) {
+	tun.packets <- d[offset:]
 	return len(d), nil
 }
 
-- 
2.15.1
