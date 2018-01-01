Return-Path: simon@ruderich.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe4086a1
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:52:00 +0000 (UTC)
Received: from zucker2.schokokeks.org (zucker2.schokokeks.org [178.63.68.90])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2f344729
 for <wireguard@lists.zx2c4.com>; Mon, 1 Jan 2018 10:51:57 +0000 (UTC)
From: Simon Ruderich <simon@ruderich.org>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 01/12] Fix typos in comments
Date: Mon,  1 Jan 2018 11:52:51 +0100
Message-Id: <97671fd04f82c6f5cac93b24d66ebd5e948152e5.1514803815.git.simon@ruderich.org>
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
 src/conn_linux.go     |  6 +++---
 src/index.go          |  2 +-
 src/keypair.go        |  2 +-
 src/main.go           |  2 +-
 src/noise_protocol.go | 10 +++++-----
 src/peer.go           |  2 +-
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/src/conn_linux.go b/src/conn_linux.go
index cdba74f..63ad2ec 100644
--- a/src/conn_linux.go
+++ b/src/conn_linux.go
@@ -19,7 +19,7 @@ import (
  *
  * Currently there is no way to achieve this within the net package:
  * See e.g. https://github.com/golang/go/issues/17930
- * So this code is remains platform dependent.
+ * So this code remains platform dependent.
  */
 type NativeEndpoint struct {
 	src unix.RawSockaddrInet6
@@ -488,7 +488,7 @@ func send4(sock int, end *NativeEndpoint, buff []byte) error {
 
 func receive4(sock int, buff []byte, end *NativeEndpoint) (int, error) {
 
-	// contruct message header
+	// construct message header
 
 	var iovec unix.Iovec
 	iovec.Base = (*byte)(unsafe.Pointer(&buff[0]))
@@ -536,7 +536,7 @@ func receive4(sock int, buff []byte, end *NativeEndpoint) (int, error) {
 
 func receive6(sock int, buff []byte, end *NativeEndpoint) (int, error) {
 
-	// contruct message header
+	// construct message header
 
 	var iovec unix.Iovec
 	iovec.Base = (*byte)(unsafe.Pointer(&buff[0]))
diff --git a/src/index.go b/src/index.go
index 1ba040e..13e8693 100644
--- a/src/index.go
+++ b/src/index.go
@@ -6,7 +6,7 @@ import (
 	"sync"
 )
 
-/* Index=0 is reserved for unset indecies
+/* Index=0 is reserved for unset indices
  *
  */
 
diff --git a/src/keypair.go b/src/keypair.go
index 7e5297b..92c03c7 100644
--- a/src/keypair.go
+++ b/src/keypair.go
@@ -7,7 +7,7 @@ import (
 )
 
 /* Due to limitations in Go and /x/crypto there is currently
- * no way to ensure that key material is securely ereased in memory.
+ * no way to ensure that key material is securely erased in memory.
  *
  * Since this may harm the forward secrecy property,
  * we plan to resolve this issue; whenever Go allows us to do so.
diff --git a/src/main.go b/src/main.go
index b12bb09..8d1b364 100644
--- a/src/main.go
+++ b/src/main.go
@@ -156,7 +156,7 @@ func main() {
 
 	logger.Info.Println("Device started")
 
-	// start uapi listener
+	// start UAPI listener
 
 	errs := make(chan error)
 	term := make(chan os.Signal)
diff --git a/src/noise_protocol.go b/src/noise_protocol.go
index 2f9e1d5..2bf38fe 100644
--- a/src/noise_protocol.go
+++ b/src/noise_protocol.go
@@ -32,13 +32,13 @@ const (
 )
 
 const (
-	MessageInitiationSize      = 148                                           // size of handshake initation message
+	MessageInitiationSize      = 148                                           // size of handshake initiation message
 	MessageResponseSize        = 92                                            // size of response message
 	MessageCookieReplySize     = 64                                            // size of cookie reply message
-	MessageTransportHeaderSize = 16                                            // size of data preceeding content in transport message
+	MessageTransportHeaderSize = 16                                            // size of data preceding content in transport message
 	MessageTransportSize       = MessageTransportHeaderSize + poly1305.TagSize // size of empty transport
-	MessageKeepaliveSize       = MessageTransportSize                          // size of keepalive
-	MessageHandshakeSize       = MessageInitiationSize                         // size of largest handshake releated message
+	MessageKeepaliveSize       = MessageTransportSize                          // size of keep-alive
+	MessageHandshakeSize       = MessageInitiationSize                         // size of largest handshake related message
 )
 
 const (
@@ -371,7 +371,7 @@ func (device *Device) ConsumeMessageResponse(msg *MessageResponse) *Peer {
 		return nil
 	}
 
-	// lookup handshake by reciever
+	// lookup handshake by receiver
 
 	lookup := device.indices.Lookup(msg.Receiver)
 	handshake := lookup.handshake
diff --git a/src/peer.go b/src/peer.go
index 7c6ad47..228fe73 100644
--- a/src/peer.go
+++ b/src/peer.go
@@ -40,7 +40,7 @@ type Peer struct {
 		// state related to WireGuard timers
 
 		keepalivePersistent Timer // set for persistent keepalives
-		keepalivePassive    Timer // set upon recieving messages
+		keepalivePassive    Timer // set upon receiving messages
 		zeroAllKeys         Timer // zero all key material
 		handshakeNew        Timer // begin a new handshake (stale)
 		handshakeDeadline   Timer // complete handshake timeout
-- 
2.15.1
