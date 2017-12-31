Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 83472ee0
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1c68633
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/7] tun_linux: add PIHeaderSize constant instead of magic
 value
Date: Sun, 31 Dec 2017 17:16:49 +0100
Message-Id: <f06b445c8ffa02db5e8ef5dfade456489c5a0f63.1514726309.git.simon@ruderich.org>
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

---
 src/tun_linux.go | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/src/tun_linux.go b/src/tun_linux.go
index daa2462..7fcbe00 100644
--- a/src/tun_linux.go
+++ b/src/tun_linux.go
@@ -48,6 +48,7 @@ import "C"
 const (
 	CloneDevicePath = "/dev/net/tun"
 	IFReqSize       = unix.IFNAMSIZ + 64
+	PIHeaderSize    = 4 // packet information of each frame (if IFF_NO_PI unset)
 )
 
 type NativeTun struct {
@@ -254,7 +255,7 @@ func (tun *NativeTun) Write(buff []byte, offset int) (int, error) {
 
 	// reserve space for header
 
-	buff = buff[offset-4:]
+	buff = buff[offset-PIHeaderSize:]
 
 	// add packet information header
 
@@ -279,12 +280,12 @@ func (tun *NativeTun) Read(buff []byte, offset int) (int, error) {
 	case err := <-tun.errors:
 		return 0, err
 	default:
-		buff := buff[offset-4:]
+		buff := buff[offset-PIHeaderSize:]
 		n, err := tun.fd.Read(buff[:])
-		if n < 4 {
+		if n < PIHeaderSize {
 			return 0, err
 		}
-		return n - 4, err
+		return n - PIHeaderSize, err
 	}
 }
 
-- 
2.15.1
