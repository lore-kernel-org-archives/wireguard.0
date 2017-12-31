Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c204cf6
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:09 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e33a05ad
 for <wireguard@lists.zx2c4.com>;
 Sun, 31 Dec 2017 16:16:07 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 4/7] helper_test: reorder DummyTUN functions to follow
 interface order
Date: Sun, 31 Dec 2017 17:16:51 +0100
Message-Id: <329cb0dcf18e6a21b5579eb1c8f9a5855be05617.1514726309.git.simon@ruderich.org>
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

No code change. Makes it easier to compare the implementation with the
interface.

---
 src/helper_test.go | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/src/helper_test.go b/src/helper_test.go
index 8548121..46bb782 100644
--- a/src/helper_test.go
+++ b/src/helper_test.go
@@ -20,12 +20,10 @@ func (tun *DummyTUN) File() *os.File {
 	return nil
 }
 
-func (tun *DummyTUN) Name() string {
-	return tun.name
-}
-
-func (tun *DummyTUN) MTU() (int, error) {
-	return tun.mtu, nil
+func (tun *DummyTUN) Read(d []byte) (int, error) {
+	t := <-tun.packets
+	copy(d, t)
+	return len(t), nil
 }
 
 func (tun *DummyTUN) Write(d []byte) (int, error) {
@@ -33,18 +31,20 @@ func (tun *DummyTUN) Write(d []byte) (int, error) {
 	return len(d), nil
 }
 
-func (tun *DummyTUN) Close() error {
-	return nil
+func (tun *DummyTUN) MTU() (int, error) {
+	return tun.mtu, nil
+}
+
+func (tun *DummyTUN) Name() string {
+	return tun.name
 }
 
 func (tun *DummyTUN) Events() chan TUNEvent {
 	return tun.events
 }
 
-func (tun *DummyTUN) Read(d []byte) (int, error) {
-	t := <-tun.packets
-	copy(d, t)
-	return len(t), nil
+func (tun *DummyTUN) Close() error {
+	return nil
 }
 
 func CreateDummyTUN(name string) (TUNDevice, error) {
-- 
2.15.1
