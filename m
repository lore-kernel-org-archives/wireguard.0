Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d08e0270
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:35 +0000 (UTC)
Received: from 8.mo6.mail-out.ovh.net (8.mo6.mail-out.ovh.net [178.33.42.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8397bf14
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:35 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3D8BB11CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:45 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] Add android support
Date: Tue,  7 Nov 2017 15:38:17 +1100
Message-Id: <20171107043817.9050-7-aurelien@chabot.fr>
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
 src/wireguard/conn.go      | 16 ++++++++++
 src/wireguard/device.go    |  1 +
 src/wireguard/send.go      | 77 +++++++++++++++++++++++++---------------------
 src/wireguard/tun_linux.go |  2 ++
 src/wireguard/uapi.go      | 36 +++++++++++++---------
 5 files changed, 83 insertions(+), 49 deletions(-)

diff --git a/src/wireguard/conn.go b/src/wireguard/conn.go
index 89b79ba..2706273 100644
--- a/src/wireguard/conn.go
+++ b/src/wireguard/conn.go
@@ -87,3 +87,19 @@ func closeUDPConn(device *Device) {
 	netc.mutex.Unlock()
 	signalSend(device.signal.newUDPConn)
 }
+
+func GetUDPConn(device *Device) (uintptr, error) {
+	netc := &device.net
+	netc.mutex.Lock()
+	defer netc.mutex.Unlock()
+
+	if netc.conn == nil {
+        return 0, nil
+    }
+
+    file, err := netc.conn.File()
+    if err != nil {
+        return 0, err
+    }
+    return file.Fd(), nil
+}
diff --git a/src/wireguard/device.go b/src/wireguard/device.go
index 2928ab5..5400d0e 100644
--- a/src/wireguard/device.go
+++ b/src/wireguard/device.go
@@ -205,6 +205,7 @@ func (device *Device) Close() {
 	device.RemoveAllPeers()
 	close(device.signal.stop)
 	closeUDPConn(device)
+	device.tun.device.Close()
 }
 
 func (device *Device) WaitChannel() chan struct{} {
diff --git a/src/wireguard/send.go b/src/wireguard/send.go
index d781c40..d081b90 100644
--- a/src/wireguard/send.go
+++ b/src/wireguard/send.go
@@ -141,53 +141,60 @@ func (device *Device) RoutineReadFromTUN() {
 
 	for {
 
-		// read packet
-
-		elem.packet = elem.buffer[MessageTransportHeaderSize:]
-		size, err := device.tun.device.Read(elem.packet)
-		if err != nil {
-			logError.Println("Failed to read packet from TUN device:", err)
-			device.Close()
+		select {
+		case <-device.signal.stop:
+			logDebug.Println("Routine, TUN Reader worker, stopped")
 			return
-		}
-
-		if size == 0 || size > MaxContentSize {
-			continue
-		}
 
-		elem.packet = elem.packet[:size]
+		default:
+			// read packet
 
-		// lookup peer
+			elem.packet = elem.buffer[MessageTransportHeaderSize:]
+			size, err := device.tun.device.Read(elem.packet)
+			if err != nil {
+				logError.Println("Failed to read packet from TUN device:", err)
+				device.Close()
+				return
+			}
 
-		var peer *Peer
-		switch elem.packet[0] >> 4 {
-		case ipv4.Version:
-			if len(elem.packet) < ipv4.HeaderLen {
+			if size == 0 || size > MaxContentSize {
 				continue
 			}
-			dst := elem.packet[IPv4offsetDst : IPv4offsetDst+net.IPv4len]
-			peer = device.routingTable.LookupIPv4(dst)
 
-		case ipv6.Version:
-			if len(elem.packet) < ipv6.HeaderLen {
+			elem.packet = elem.packet[:size]
+
+			// lookup peer
+
+			var peer *Peer
+			switch elem.packet[0] >> 4 {
+			case ipv4.Version:
+				if len(elem.packet) < ipv4.HeaderLen {
+					continue
+				}
+				dst := elem.packet[IPv4offsetDst : IPv4offsetDst+net.IPv4len]
+				peer = device.routingTable.LookupIPv4(dst)
+
+			case ipv6.Version:
+				if len(elem.packet) < ipv6.HeaderLen {
+					continue
+				}
+				dst := elem.packet[IPv6offsetDst : IPv6offsetDst+net.IPv6len]
+				peer = device.routingTable.LookupIPv6(dst)
+
+			default:
+				logDebug.Println("Receieved packet with unknown IP version")
+			}
+
+			if peer == nil {
 				continue
 			}
-			dst := elem.packet[IPv6offsetDst : IPv6offsetDst+net.IPv6len]
-			peer = device.routingTable.LookupIPv6(dst)
 
-		default:
-			logDebug.Println("Receieved packet with unknown IP version")
-		}
+			// insert into nonce/pre-handshake queue
 
-		if peer == nil {
-			continue
+			signalSend(peer.signal.handshakeReset)
+			addToOutboundQueue(peer.queue.nonce, elem)
+			elem = device.NewOutboundElement()
 		}
-
-		// insert into nonce/pre-handshake queue
-
-		signalSend(peer.signal.handshakeReset)
-		addToOutboundQueue(peer.queue.nonce, elem)
-		elem = device.NewOutboundElement()
 	}
 }
 
diff --git a/src/wireguard/tun_linux.go b/src/wireguard/tun_linux.go
index 4b7fc94..6f2e036 100644
--- a/src/wireguard/tun_linux.go
+++ b/src/wireguard/tun_linux.go
@@ -1,3 +1,5 @@
+// +build !android
+
 package wireguard
 
 /* Implementation of the TUN device interface for linux
diff --git a/src/wireguard/uapi.go b/src/wireguard/uapi.go
index b3984ad..ea9e29a 100644
--- a/src/wireguard/uapi.go
+++ b/src/wireguard/uapi.go
@@ -24,13 +24,30 @@ func (s *IPCError) ErrorCode() int64 {
 }
 
 func ipcGetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
+	lines := make([]string, 0, 100)
+	GetOperation(device, lines)
+
+	// send lines
+
+	for _, line := range lines {
+		_, err := socket.WriteString(line + "\n")
+		if err != nil {
+			return &IPCError{
+				Code: ipcErrorIO,
+			}
+		}
+	}
+
+	return nil
+}
+
+func GetOperation(device *Device, lines []string) {
 
 	// create lines
 
 	device.mutex.RLock()
 	device.net.mutex.RLock()
 
-	lines := make([]string, 0, 100)
 	send := func(line string) {
 		lines = append(lines, line)
 	}
@@ -76,23 +93,14 @@ func ipcGetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
 
 	device.net.mutex.RUnlock()
 	device.mutex.RUnlock()
-
-	// send lines
-
-	for _, line := range lines {
-		_, err := socket.WriteString(line + "\n")
-		if err != nil {
-			return &IPCError{
-				Code: ipcErrorIO,
-			}
-		}
-	}
-
-	return nil
 }
 
 func ipcSetOperation(device *Device, socket *bufio.ReadWriter) *IPCError {
 	scanner := bufio.NewScanner(socket)
+	return SetOperation(device, scanner)
+}
+
+func SetOperation(device *Device, scanner *bufio.Scanner) *IPCError {
 	logInfo := device.Log.Info
 	logError := device.Log.Error
 	logDebug := device.Log.Debug
-- 
2.15.0
