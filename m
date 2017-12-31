Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bdb4e45
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:10 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb9e9edc
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 7/7] tun_darwin: adapt to TUNDevice interface change
Date: Sun, 31 Dec 2017 17:16:54 +0100
Message-Id: <33cfb3925304d5047a6e9e81eef0900329aad3b5.1514726309.git.simon@ruderich.org>
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

Untested!
---
 src/tun_windows.go | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/tun_windows.go b/src/tun_windows.go
index 0711032..8bb8a66 100644
--- a/src/tun_windows.go
+++ b/src/tun_windows.go
@@ -123,7 +123,9 @@ func (f *NativeTUN) Close() error {
 	return windows.Close(f.fd)
 }
 
-func (f *NativeTUN) Write(b []byte) (int, error) {
+func (f *NativeTUN) Write(b []byte, offset int) (int, error) {
+	b := b[offset:]
+
 	f.wl.Lock()
 	defer f.wl.Unlock()
 
@@ -138,7 +140,9 @@ func (f *NativeTUN) Write(b []byte) (int, error) {
 	return getOverlappedResult(f.fd, f.wo)
 }
 
-func (f *NativeTUN) Read(b []byte) (int, error) {
+func (f *NativeTUN) Read(b []byte, offset int) (int, error) {
+	b := b[offset:]
+
 	f.rl.Lock()
 	defer f.rl.Unlock()
 
-- 
2.15.1
