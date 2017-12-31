Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bcbf5ac
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:11 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f72fb9c4
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 6/7] tun_darwin: adapt to TUNDevice interface change
Date: Sun, 31 Dec 2017 17:16:53 +0100
Message-Id: <9c1d560f51ab084a65c5aee11c770f7885672ea8.1514726309.git.simon@ruderich.org>
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
 src/tun_darwin.go | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/src/tun_darwin.go b/src/tun_darwin.go
index 87f6af6..a984e94 100644
--- a/src/tun_darwin.go
+++ b/src/tun_darwin.go
@@ -184,10 +184,14 @@ func (t *NativeTUN) Events() chan TUNEvent {
 	return t.events
 }
 
-func (t *NativeTUN) Read(to []byte) (int, error) {
+func (t *NativeTUN) Read(to []byte, offset int) (int, error) {
+	to = to[offset:]
+
 	t.rMu.Lock()
 	defer t.rMu.Unlock()
 
+	// TODO: implement in-place read
+
 	if cap(t.rBuf) < len(to)+4 {
 		t.rBuf = make([]byte, len(to)+4)
 	}
@@ -198,15 +202,18 @@ func (t *NativeTUN) Read(to []byte) (int, error) {
 	return n - 4, err
 }
 
-func (t *NativeTUN) Write(from []byte) (int, error) {
+func (t *NativeTUN) Write(from []byte, offset int) (int, error) {
 
-	if len(from) == 0 {
+	if len(from) < offset {
 		return 0, unix.EIO
 	}
+	from := from[offset:]
 
 	t.wMu.Lock()
 	defer t.wMu.Unlock()
 
+	// TODO: implement in-place write
+
 	if cap(t.wBuf) < len(from)+4 {
 		t.wBuf = make([]byte, len(from)+4)
 	}
-- 
2.15.1
