Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25e7f28f
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:31 +0000 (UTC)
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net [178.33.42.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c86b0c0d
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:30 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id DBE1C11CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:40 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/2] Put the code in a 'wireguard' go package
Date: Tue,  7 Nov 2017 15:38:16 +1100
Message-Id: <20171107043817.9050-6-aurelien@chabot.fr>
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
References: <20171107043817.9050-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: Aurélien Chabot <aurelien@chabot.fr>
---
 src/Makefile                            |  2 +-
 src/main.go                             | 23 ++++++++++++-----------
 src/{ => wireguard}/conn.go             |  2 +-
 src/{ => wireguard}/conn_default.go     |  2 +-
 src/{ => wireguard}/conn_linux.go       |  2 +-
 src/{ => wireguard}/constants.go        |  2 +-
 src/{ => wireguard}/cookie.go           |  2 +-
 src/{ => wireguard}/cookie_test.go      |  2 +-
 src/{ => wireguard}/daemon_darwin.go    |  2 +-
 src/{ => wireguard}/daemon_linux.go     |  2 +-
 src/{ => wireguard}/daemon_windows.go   |  2 +-
 src/{ => wireguard}/device.go           |  6 +++---
 src/{ => wireguard}/helper_test.go      |  2 +-
 src/{ => wireguard}/index.go            |  2 +-
 src/{ => wireguard}/ip.go               |  2 +-
 src/{ => wireguard}/kdf_test.go         |  2 +-
 src/{ => wireguard}/keypair.go          |  2 +-
 src/{ => wireguard}/logger.go           |  2 +-
 src/{ => wireguard}/misc.go             |  2 +-
 src/{ => wireguard}/noise_helpers.go    |  2 +-
 src/{ => wireguard}/noise_protocol.go   |  4 ++--
 src/{ => wireguard}/noise_test.go       |  2 +-
 src/{ => wireguard}/noise_types.go      |  2 +-
 src/{ => wireguard}/peer.go             |  2 +-
 src/{ => wireguard}/ratelimiter.go      |  2 +-
 src/{ => wireguard}/ratelimiter_test.go |  2 +-
 src/{ => wireguard}/receive.go          | 18 +++++++++---------
 src/{ => wireguard}/replay.go           |  2 +-
 src/{ => wireguard}/replay_test.go      |  2 +-
 src/{ => wireguard}/routing.go          |  2 +-
 src/{ => wireguard}/send.go             | 12 ++++++------
 src/{ => wireguard}/tai64.go            |  2 +-
 src/{ => wireguard}/timers.go           | 12 ++++++------
 src/{ => wireguard}/trie.go             |  2 +-
 src/{ => wireguard}/trie_rand_test.go   |  2 +-
 src/{ => wireguard}/trie_test.go        |  2 +-
 src/{ => wireguard}/tun.go              |  6 +++---
 src/{ => wireguard}/tun_darwin.go       |  2 +-
 src/{ => wireguard}/tun_linux.go        |  2 +-
 src/{ => wireguard}/tun_windows.go      |  2 +-
 src/{ => wireguard}/uapi.go             | 18 +++++++++---------
 src/{ => wireguard}/uapi_darwin.go      |  2 +-
 src/{ => wireguard}/uapi_linux.go       |  2 +-
 src/{ => wireguard}/uapi_windows.go     |  2 +-
 src/{ => wireguard}/xchacha20.go        |  2 +-
 src/{ => wireguard}/xchacha20_test.go   |  2 +-
 46 files changed, 88 insertions(+), 87 deletions(-)
 rename src/{ => wireguard}/conn.go (98%)
 rename src/{ => wireguard}/conn_default.go (85%)
 rename src/{ => wireguard}/conn_linux.go (99%)
 rename src/{ => wireguard}/constants.go (98%)
 rename src/{ => wireguard}/cookie.go (99%)
 rename src/{ => wireguard}/cookie_test.go (99%)
 rename src/{ => wireguard}/daemon_darwin.go (84%)
 rename src/{ => wireguard}/daemon_linux.go (96%)
 rename src/{ => wireguard}/daemon_windows.go (90%)
 rename src/{ => wireguard}/device.go (97%)
 rename src/{ => wireguard}/helper_test.go (98%)
 rename src/{ => wireguard}/index.go (98%)
 rename src/{ => wireguard}/ip.go (93%)
 rename src/{ => wireguard}/kdf_test.go (99%)
 rename src/{ => wireguard}/keypair.go (97%)
 rename src/{ => wireguard}/logger.go (97%)
 rename src/{ => wireguard}/misc.go (98%)
 rename src/{ => wireguard}/noise_helpers.go (99%)
 rename src/{ => wireguard}/noise_protocol.go (99%)
 rename src/{ => wireguard}/noise_test.go (99%)
 rename src/{ => wireguard}/noise_types.go (98%)
 rename src/{ => wireguard}/peer.go (99%)
 rename src/{ => wireguard}/ratelimiter.go (99%)
 rename src/{ => wireguard}/ratelimiter_test.go (99%)
 rename src/{ => wireguard}/receive.go (97%)
 rename src/{ => wireguard}/replay.go (98%)
 rename src/{ => wireguard}/replay_test.go (99%)
 rename src/{ => wireguard}/routing.go (98%)
 rename src/{ => wireguard}/send.go (97%)
 rename src/{ => wireguard}/tai64.go (96%)
 rename src/{ => wireguard}/timers.go (93%)
 rename src/{ => wireguard}/trie.go (99%)
 rename src/{ => wireguard}/trie_rand_test.go (99%)
 rename src/{ => wireguard}/trie_test.go (99%)
 rename src/{ => wireguard}/tun.go (95%)
 rename src/{ => wireguard}/tun_darwin.go (99%)
 rename src/{ => wireguard}/tun_linux.go (99%)
 rename src/{ => wireguard}/tun_windows.go (99%)
 rename src/{ => wireguard}/uapi.go (95%)
 rename src/{ => wireguard}/uapi_darwin.go (98%)
 rename src/{ => wireguard}/uapi_linux.go (99%)
 rename src/{ => wireguard}/uapi_windows.go (98%)
 rename src/{ => wireguard}/xchacha20.go (99%)
 rename src/{ => wireguard}/xchacha20_test.go (99%)

diff --git a/src/Makefile b/src/Makefile
index 5b23ecc..5f47aa7 100644
--- a/src/Makefile
+++ b/src/Makefile
@@ -1,6 +1,6 @@
 all: wireguard-go
 
-wireguard-go: $(wildcard *.go)
+wireguard-go: main.go $(wildcard wireguard/*.go)
 	go build -o $@
 
 clean:
diff --git a/src/main.go b/src/main.go
index 196a4c6..9800c46 100644
--- a/src/main.go
+++ b/src/main.go
@@ -6,6 +6,7 @@ import (
 	"os"
 	"os/signal"
 	"runtime"
+	"wireguard"
 )
 
 func printUsage() {
@@ -46,7 +47,7 @@ func main() {
 	// daemonize the process
 
 	if !foreground {
-		err := Daemonize()
+		err := wireguard.Daemonize()
 		if err != nil {
 			log.Println("Failed to daemonize:", err)
 		}
@@ -59,7 +60,7 @@ func main() {
 
 	// open TUN device
 
-	tun, err := CreateTUN(interfaceName)
+	tun, err := wireguard.CreateTUN(interfaceName)
 	if err != nil {
 		log.Println("Failed to create tun device:", err)
 		return
@@ -70,26 +71,26 @@ func main() {
 	logLevel := func() int {
 		switch os.Getenv("LOG_LEVEL") {
 		case "debug":
-			return LogLevelDebug
+			return wireguard.LogLevelDebug
 		case "info":
-			return LogLevelInfo
+			return wireguard.LogLevelInfo
 		case "error":
-			return LogLevelError
+			return wireguard.LogLevelError
 		}
-		return LogLevelInfo
+		return wireguard.LogLevelInfo
 	}()
 
 	// create wireguard device
 
-	device := NewDevice(tun, logLevel)
+	device := wireguard.NewDevice(tun, logLevel)
 
-	logInfo := device.log.Info
-	logError := device.log.Error
+	logInfo := device.Log.Info
+	logError := device.Log.Error
 	logInfo.Println("Starting device")
 
 	// start configuration lister
 
-	uapi, err := NewUAPIListener(interfaceName)
+	uapi, err := wireguard.NewUAPIListener(interfaceName)
 	if err != nil {
 		logError.Fatal("UAPI listen error:", err)
 	}
@@ -105,7 +106,7 @@ func main() {
 				errs <- err
 				return
 			}
-			go ipcHandle(device, conn)
+			go wireguard.IpcHandle(device, conn)
 		}
 	}()
 
diff --git a/src/conn.go b/src/wireguard/conn.go
similarity index 98%
rename from src/conn.go
rename to src/wireguard/conn.go
index 2cf588d..89b79ba 100644
--- a/src/conn.go
+++ b/src/wireguard/conn.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/conn_default.go b/src/wireguard/conn_default.go
similarity index 85%
rename from src/conn_default.go
rename to src/wireguard/conn_default.go
index e7c60a8..5d7caa3 100644
--- a/src/conn_default.go
+++ b/src/wireguard/conn_default.go
@@ -1,6 +1,6 @@
 // +build !linux
 
-package main
+package wireguard
 
 import (
 	"net"
diff --git a/src/conn_linux.go b/src/wireguard/conn_linux.go
similarity index 99%
rename from src/conn_linux.go
rename to src/wireguard/conn_linux.go
index a349a9e..dafa0ae 100644
--- a/src/conn_linux.go
+++ b/src/wireguard/conn_linux.go
@@ -4,7 +4,7 @@
  * WireGuard's kernelspace implementation.
  */
 
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/constants.go b/src/wireguard/constants.go
similarity index 98%
rename from src/constants.go
rename to src/wireguard/constants.go
index 71dd98e..969ace9 100644
--- a/src/constants.go
+++ b/src/wireguard/constants.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"time"
diff --git a/src/cookie.go b/src/wireguard/cookie.go
similarity index 99%
rename from src/cookie.go
rename to src/wireguard/cookie.go
index a81819b..390aa80 100644
--- a/src/cookie.go
+++ b/src/wireguard/cookie.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"crypto/hmac"
diff --git a/src/cookie_test.go b/src/wireguard/cookie_test.go
similarity index 99%
rename from src/cookie_test.go
rename to src/wireguard/cookie_test.go
index 193a76e..a3488c9 100644
--- a/src/cookie_test.go
+++ b/src/wireguard/cookie_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"net"
diff --git a/src/daemon_darwin.go b/src/wireguard/daemon_darwin.go
similarity index 84%
rename from src/daemon_darwin.go
rename to src/wireguard/daemon_darwin.go
index 913af0e..ef1e3b1 100644
--- a/src/daemon_darwin.go
+++ b/src/wireguard/daemon_darwin.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/daemon_linux.go b/src/wireguard/daemon_linux.go
similarity index 96%
rename from src/daemon_linux.go
rename to src/wireguard/daemon_linux.go
index 730f89e..c5b46dc 100644
--- a/src/daemon_linux.go
+++ b/src/wireguard/daemon_linux.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"os"
diff --git a/src/daemon_windows.go b/src/wireguard/daemon_windows.go
similarity index 90%
rename from src/daemon_windows.go
rename to src/wireguard/daemon_windows.go
index d5ec1e8..56d9034 100644
--- a/src/daemon_windows.go
+++ b/src/wireguard/daemon_windows.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"os"
diff --git a/src/device.go b/src/wireguard/device.go
similarity index 97%
rename from src/device.go
rename to src/wireguard/device.go
index 61c87bc..2928ab5 100644
--- a/src/device.go
+++ b/src/wireguard/device.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"net"
@@ -9,7 +9,7 @@ import (
 )
 
 type Device struct {
-	log       *Logger // collection of loggers for levels
+	Log       *Logger // collection of loggers for levels
 	idCounter uint    // for assigning debug ids to peers
 	fwMark    uint32
 	tun       struct {
@@ -134,7 +134,7 @@ func NewDevice(tun TUNDevice, logLevel int) *Device {
 	device.mutex.Lock()
 	defer device.mutex.Unlock()
 
-	device.log = NewLogger(logLevel, "("+tun.Name()+") ")
+	device.Log = NewLogger(logLevel, "("+tun.Name()+") ")
 	device.peers = make(map[NoisePublicKey]*Peer)
 	device.tun.device = tun
 	device.indices.Init()
diff --git a/src/helper_test.go b/src/wireguard/helper_test.go
similarity index 98%
rename from src/helper_test.go
rename to src/wireguard/helper_test.go
index fc171e8..2689ef9 100644
--- a/src/helper_test.go
+++ b/src/wireguard/helper_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bytes"
diff --git a/src/index.go b/src/wireguard/index.go
similarity index 98%
rename from src/index.go
rename to src/wireguard/index.go
index 1ba040e..1ba3aab 100644
--- a/src/index.go
+++ b/src/wireguard/index.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"crypto/rand"
diff --git a/src/ip.go b/src/wireguard/ip.go
similarity index 93%
rename from src/ip.go
rename to src/wireguard/ip.go
index 752a404..d8ca1c9 100644
--- a/src/ip.go
+++ b/src/wireguard/ip.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"net"
diff --git a/src/kdf_test.go b/src/wireguard/kdf_test.go
similarity index 99%
rename from src/kdf_test.go
rename to src/wireguard/kdf_test.go
index a89dacc..97ff844 100644
--- a/src/kdf_test.go
+++ b/src/wireguard/kdf_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"encoding/hex"
diff --git a/src/keypair.go b/src/wireguard/keypair.go
similarity index 97%
rename from src/keypair.go
rename to src/wireguard/keypair.go
index 7e5297b..78b8369 100644
--- a/src/keypair.go
+++ b/src/wireguard/keypair.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"crypto/cipher"
diff --git a/src/logger.go b/src/wireguard/logger.go
similarity index 97%
rename from src/logger.go
rename to src/wireguard/logger.go
index 0872ef9..317c50a 100644
--- a/src/logger.go
+++ b/src/wireguard/logger.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"io"
diff --git a/src/misc.go b/src/wireguard/misc.go
similarity index 98%
rename from src/misc.go
rename to src/wireguard/misc.go
index bbe0d68..b28e245 100644
--- a/src/misc.go
+++ b/src/wireguard/misc.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"sync/atomic"
diff --git a/src/noise_helpers.go b/src/wireguard/noise_helpers.go
similarity index 99%
rename from src/noise_helpers.go
rename to src/wireguard/noise_helpers.go
index 24302c0..c41d0bd 100644
--- a/src/noise_helpers.go
+++ b/src/wireguard/noise_helpers.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"crypto/hmac"
diff --git a/src/noise_protocol.go b/src/wireguard/noise_protocol.go
similarity index 99%
rename from src/noise_protocol.go
rename to src/wireguard/noise_protocol.go
index 9e5fdd8..b383827 100644
--- a/src/noise_protocol.go
+++ b/src/wireguard/noise_protocol.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
@@ -430,7 +430,7 @@ func (device *Device) ConsumeMessageResponse(msg *MessageResponse) *Peer {
 		aead, _ := chacha20poly1305.New(key[:])
 		_, err := aead.Open(nil, ZeroNonce[:], msg.Empty[:], hash[:])
 		if err != nil {
-			device.log.Debug.Println("failed to open")
+			device.Log.Debug.Println("failed to open")
 			return false
 		}
 		mixHash(&hash, &hash, msg.Empty[:])
diff --git a/src/noise_test.go b/src/wireguard/noise_test.go
similarity index 99%
rename from src/noise_test.go
rename to src/wireguard/noise_test.go
index 48408f9..8cdd96a 100644
--- a/src/noise_test.go
+++ b/src/wireguard/noise_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bytes"
diff --git a/src/noise_types.go b/src/wireguard/noise_types.go
similarity index 98%
rename from src/noise_types.go
rename to src/wireguard/noise_types.go
index 1a944df..3ff9fbc 100644
--- a/src/noise_types.go
+++ b/src/wireguard/noise_types.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"crypto/subtle"
diff --git a/src/peer.go b/src/wireguard/peer.go
similarity index 99%
rename from src/peer.go
rename to src/wireguard/peer.go
index 6fea829..f498ae5 100644
--- a/src/peer.go
+++ b/src/wireguard/peer.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"encoding/base64"
diff --git a/src/ratelimiter.go b/src/wireguard/ratelimiter.go
similarity index 99%
rename from src/ratelimiter.go
rename to src/wireguard/ratelimiter.go
index 4f8227e..3afeb9e 100644
--- a/src/ratelimiter.go
+++ b/src/wireguard/ratelimiter.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
diff --git a/src/ratelimiter_test.go b/src/wireguard/ratelimiter_test.go
similarity index 99%
rename from src/ratelimiter_test.go
rename to src/wireguard/ratelimiter_test.go
index 13b6a23..386f4ec 100644
--- a/src/ratelimiter_test.go
+++ b/src/wireguard/ratelimiter_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"net"
diff --git a/src/receive.go b/src/wireguard/receive.go
similarity index 97%
rename from src/receive.go
rename to src/wireguard/receive.go
index 52c2718..5ec3609 100644
--- a/src/receive.go
+++ b/src/wireguard/receive.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bytes"
@@ -94,7 +94,7 @@ func (device *Device) addToHandshakeQueue(
 
 func (device *Device) RoutineReceiveIncomming() {
 
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, receive incomming, started")
 
 	for {
@@ -225,7 +225,7 @@ func (device *Device) RoutineDecryption() {
 
 	var nonce [chacha20poly1305.NonceSize]byte
 
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, decryption, started for device")
 
 	for {
@@ -270,9 +270,9 @@ func (device *Device) RoutineDecryption() {
  */
 func (device *Device) RoutineHandshake() {
 
-	logInfo := device.log.Info
-	logError := device.log.Error
-	logDebug := device.log.Debug
+	logInfo := device.Log.Info
+	logError := device.Log.Error
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, handshake routine, started for device")
 
 	var temp [MessageHandshakeSize]byte
@@ -469,9 +469,9 @@ func (peer *Peer) RoutineSequentialReceiver() {
 
 	device := peer.device
 
-	logInfo := device.log.Info
-	logError := device.log.Error
-	logDebug := device.log.Debug
+	logInfo := device.Log.Info
+	logError := device.Log.Error
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, sequential receiver, started for peer", peer.id)
 
 	for {
diff --git a/src/replay.go b/src/wireguard/replay.go
similarity index 98%
rename from src/replay.go
rename to src/wireguard/replay.go
index 5d42860..c6469dd 100644
--- a/src/replay.go
+++ b/src/wireguard/replay.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
diff --git a/src/replay_test.go b/src/wireguard/replay_test.go
similarity index 99%
rename from src/replay_test.go
rename to src/wireguard/replay_test.go
index 228fce6..6493bd7 100644
--- a/src/replay_test.go
+++ b/src/wireguard/replay_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"testing"
diff --git a/src/routing.go b/src/wireguard/routing.go
similarity index 98%
rename from src/routing.go
rename to src/wireguard/routing.go
index 2a2e237..45ceb23 100644
--- a/src/routing.go
+++ b/src/wireguard/routing.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/send.go b/src/wireguard/send.go
similarity index 97%
rename from src/send.go
rename to src/wireguard/send.go
index 5c88ead..d781c40 100644
--- a/src/send.go
+++ b/src/wireguard/send.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"encoding/binary"
@@ -134,8 +134,8 @@ func (device *Device) RoutineReadFromTUN() {
 
 	elem := device.NewOutboundElement()
 
-	logDebug := device.log.Debug
-	logError := device.log.Error
+	logDebug := device.Log.Debug
+	logError := device.Log.Error
 
 	logDebug.Println("Routine, TUN Reader started")
 
@@ -201,7 +201,7 @@ func (peer *Peer) RoutineNonce() {
 	var keyPair *KeyPair
 
 	device := peer.device
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, nonce worker, started for peer", peer.String())
 
 	for {
@@ -261,7 +261,7 @@ func (device *Device) RoutineEncryption() {
 
 	var nonce [chacha20poly1305.NonceSize]byte
 
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, encryption worker, started")
 
 	for {
@@ -325,7 +325,7 @@ func (device *Device) RoutineEncryption() {
 func (peer *Peer) RoutineSequentialSender() {
 	device := peer.device
 
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, sequential sender, started for", peer.String())
 
 	for {
diff --git a/src/tai64.go b/src/wireguard/tai64.go
similarity index 96%
rename from src/tai64.go
rename to src/wireguard/tai64.go
index 2299a37..08c1ede 100644
--- a/src/tai64.go
+++ b/src/wireguard/tai64.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bytes"
diff --git a/src/timers.go b/src/wireguard/timers.go
similarity index 93%
rename from src/timers.go
rename to src/wireguard/timers.go
index 99695ba..82fe35d 100644
--- a/src/timers.go
+++ b/src/wireguard/timers.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bytes"
@@ -118,7 +118,7 @@ func (peer *Peer) TimerHandshakeComplete() {
 		time.Now().UnixNano(),
 	)
 	signalSend(peer.signal.handshakeCompleted)
-	peer.device.log.Info.Println("Negotiated new handshake for", peer.String())
+	peer.device.Log.Info.Println("Negotiated new handshake for", peer.String())
 }
 
 /* Event:
@@ -139,7 +139,7 @@ func (peer *Peer) TimerEphemeralKeyCreated() {
 func (peer *Peer) RoutineTimerHandler() {
 	device := peer.device
 
-	logDebug := device.log.Debug
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, timer handler, started for peer", peer.String())
 
 	for {
@@ -228,9 +228,9 @@ func (peer *Peer) RoutineTimerHandler() {
 func (peer *Peer) RoutineHandshakeInitiator() {
 	device := peer.device
 
-	logInfo := device.log.Info
-	logError := device.log.Error
-	logDebug := device.log.Debug
+	logInfo := device.Log.Info
+	logError := device.Log.Error
+	logDebug := device.Log.Debug
 	logDebug.Println("Routine, handshake initator, started for", peer.String())
 
 	var temp [256]byte
diff --git a/src/trie.go b/src/wireguard/trie.go
similarity index 99%
rename from src/trie.go
rename to src/wireguard/trie.go
index 38fcd4a..18ae3d8 100644
--- a/src/trie.go
+++ b/src/wireguard/trie.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/trie_rand_test.go b/src/wireguard/trie_rand_test.go
similarity index 99%
rename from src/trie_rand_test.go
rename to src/wireguard/trie_rand_test.go
index 840d269..48c4dfa 100644
--- a/src/trie_rand_test.go
+++ b/src/wireguard/trie_rand_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"math/rand"
diff --git a/src/trie_test.go b/src/wireguard/trie_test.go
similarity index 99%
rename from src/trie_test.go
rename to src/wireguard/trie_test.go
index 9d53df3..2770eee 100644
--- a/src/trie_test.go
+++ b/src/wireguard/trie_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"math/rand"
diff --git a/src/tun.go b/src/wireguard/tun.go
similarity index 95%
rename from src/tun.go
rename to src/wireguard/tun.go
index 8e8c759..24208e6 100644
--- a/src/tun.go
+++ b/src/wireguard/tun.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"sync/atomic"
@@ -24,8 +24,8 @@ type TUNDevice interface {
 }
 
 func (device *Device) RoutineTUNEventReader() {
-	logInfo := device.log.Info
-	logError := device.log.Error
+	logInfo := device.Log.Info
+	logError := device.Log.Error
 
 	for event := range device.tun.device.Events() {
 		if event&TUNEventMTUUpdate != 0 {
diff --git a/src/tun_darwin.go b/src/wireguard/tun_darwin.go
similarity index 99%
rename from src/tun_darwin.go
rename to src/wireguard/tun_darwin.go
index 87f6af6..8ab8504 100644
--- a/src/tun_darwin.go
+++ b/src/wireguard/tun_darwin.go
@@ -4,7 +4,7 @@
  * Code from https://github.com/songgao/water
  */
 
-package main
+package wireguard
 
 import (
 	"encoding/binary"
diff --git a/src/tun_linux.go b/src/wireguard/tun_linux.go
similarity index 99%
rename from src/tun_linux.go
rename to src/wireguard/tun_linux.go
index accc6c6..4b7fc94 100644
--- a/src/tun_linux.go
+++ b/src/wireguard/tun_linux.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 /* Implementation of the TUN device interface for linux
  */
diff --git a/src/tun_windows.go b/src/wireguard/tun_windows.go
similarity index 99%
rename from src/tun_windows.go
rename to src/wireguard/tun_windows.go
index 0711032..4233326 100644
--- a/src/tun_windows.go
+++ b/src/wireguard/tun_windows.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"encoding/binary"
diff --git a/src/uapi.go b/src/wireguard/uapi.go
similarity index 95%
rename from src/uapi.go
rename to src/wireguard/uapi.go
index 326216b..b3984ad 100644
--- a/src/uapi.go
+++ b/src/wireguard/uapi.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"bufio"
@@ -93,9 +93,9 @@ func ipcGetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
 
 func ipcSetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
 	scanner := bufio.NewScanner(socket)
-	logInfo := device.log.Info
-	logError := device.log.Error
-	logDebug := device.log.Debug
+	logInfo := device.Log.Info
+	logError := device.Log.Error
+	logDebug := device.Log.Debug
 
 	var peer *Peer
 
@@ -332,7 +332,7 @@ func ipcSetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
 	return nil
 }
 
-func ipcHandle(device *Device, socket net.Conn) {
+func IpcHandle(device *Device, socket net.Conn) {
 
 	// create buffered read/writer
 
@@ -357,22 +357,22 @@ func ipcHandle(device *Device, socket net.Conn) {
 
 	switch op {
 	case "set=1\n":
-		device.log.Debug.Println("Config, set operation")
+		device.Log.Debug.Println("Config, set operation")
 		status = ipcSetOperation(device, buffered)
 
 	case "get=1\n":
-		device.log.Debug.Println("Config, get operation")
+		device.Log.Debug.Println("Config, get operation")
 		status = ipcGetOperation(device, buffered)
 
 	default:
-		device.log.Error.Println("Invalid UAPI operation:", op)
+		device.Log.Error.Println("Invalid UAPI operation:", op)
 		return
 	}
 
 	// write status
 
 	if status != nil {
-		device.log.Error.Println(status)
+		device.Log.Error.Println(status)
 		fmt.Fprintf(buffered, "errno=%d\n\n", status.ErrorCode())
 	} else {
 		fmt.Fprintf(buffered, "errno=0\n\n")
diff --git a/src/uapi_darwin.go b/src/wireguard/uapi_darwin.go
similarity index 98%
rename from src/uapi_darwin.go
rename to src/wireguard/uapi_darwin.go
index 63d4d8d..2223b32 100644
--- a/src/uapi_darwin.go
+++ b/src/wireguard/uapi_darwin.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"fmt"
diff --git a/src/uapi_linux.go b/src/wireguard/uapi_linux.go
similarity index 99%
rename from src/uapi_linux.go
rename to src/wireguard/uapi_linux.go
index cb9d858..5f694be 100644
--- a/src/uapi_linux.go
+++ b/src/wireguard/uapi_linux.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"errors"
diff --git a/src/uapi_windows.go b/src/wireguard/uapi_windows.go
similarity index 98%
rename from src/uapi_windows.go
rename to src/wireguard/uapi_windows.go
index a4599a5..38be24d 100644
--- a/src/uapi_windows.go
+++ b/src/wireguard/uapi_windows.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 /* UAPI on windows uses a bidirectional named pipe
  */
diff --git a/src/xchacha20.go b/src/wireguard/xchacha20.go
similarity index 99%
rename from src/xchacha20.go
rename to src/wireguard/xchacha20.go
index 5d963e0..aa5c575 100644
--- a/src/xchacha20.go
+++ b/src/wireguard/xchacha20.go
@@ -2,7 +2,7 @@
 // Use of this source code is governed by a license that can be
 // found in the LICENSE file.
 
-package main
+package wireguard
 
 import (
 	"encoding/binary"
diff --git a/src/xchacha20_test.go b/src/wireguard/xchacha20_test.go
similarity index 99%
rename from src/xchacha20_test.go
rename to src/wireguard/xchacha20_test.go
index 0f41cf8..4acafe8 100644
--- a/src/xchacha20_test.go
+++ b/src/wireguard/xchacha20_test.go
@@ -1,4 +1,4 @@
-package main
+package wireguard
 
 import (
 	"encoding/hex"
-- 
2.15.0
