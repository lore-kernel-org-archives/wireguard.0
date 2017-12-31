Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9ace93a
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:08 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b45dc1c7
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/7] tun: TUNDevice: document behavior of offset parameter
Date: Sun, 31 Dec 2017 17:16:48 +0100
Message-Id: <65ecab64986a830f029fbf52424a022c6ad081f7.1514726309.git.simon@ruderich.org>
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
 src/tun.go | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tun.go b/src/tun.go
index 024f0f0..cb50cd0 100644
--- a/src/tun.go
+++ b/src/tun.go
@@ -17,8 +17,8 @@ const (
 
 type TUNDevice interface {
 	File() *os.File                 // returns the file descriptor of the device
-	Read([]byte, int) (int, error)  // read a packet from the device (without any additional headers)
-	Write([]byte, int) (int, error) // writes a packet to the device (without any additional headers)
+	Read([]byte, int) (int, error)  // read a packet from the device (without any additional headers); packet starts at the given offset (however data preceding offset may be overwritten!)
+	Write([]byte, int) (int, error) // writes a packet to the device (without any additional headers); packet starts at the given offset (however data preceding offset may be overwritten!)
 	MTU() (int, error)              // returns the MTU of the device
 	Name() string                   // returns the current name
 	Events() chan TUNEvent          // returns a constant channel of events related to the device
-- 
2.15.1
