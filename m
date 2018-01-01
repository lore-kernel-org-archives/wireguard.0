Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93c34e40
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:01 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6006682f
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 02/12] tun_linux: use getDummySock()
Date: Mon,  1 Jan 2018 11:52:52 +0100
Message-Id: <2d092bdb15813bd1d8dc1bc2bbad680470f72595.1514803815.git.simon@ruderich.org>
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

Using this helper reduces code duplication.
---
 src/tun_linux.go | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/src/tun_linux.go b/src/tun_linux.go
index daa2462..b88426b 100644
--- a/src/tun_linux.go
+++ b/src/tun_linux.go
@@ -156,7 +156,6 @@ func getIFIndex(name string) (int32, error) {
 	if err != nil {
 		return 0, err
 	}
-
 	defer unix.Close(fd)
 
 	var ifr [IFReqSize]byte
@@ -177,19 +176,10 @@ func getIFIndex(name string) (int32, error) {
 }
 
 func (tun *NativeTun) setMTU(n int) error {
-
-	// open datagram socket
-
-	fd, err := unix.Socket(
-		unix.AF_INET,
-		unix.SOCK_DGRAM,
-		0,
-	)
-
+	fd, err := getDummySock()
 	if err != nil {
 		return err
 	}
-
 	defer unix.Close(fd)
 
 	// do ioctl call
@@ -212,19 +202,10 @@ func (tun *NativeTun) setMTU(n int) error {
 }
 
 func (tun *NativeTun) MTU() (int, error) {
-
-	// open datagram socket
-
-	fd, err := unix.Socket(
-		unix.AF_INET,
-		unix.SOCK_DGRAM,
-		0,
-	)
-
+	fd, err := getDummySock()
 	if err != nil {
 		return 0, err
 	}
-
 	defer unix.Close(fd)
 
 	// do ioctl call
-- 
2.15.1
