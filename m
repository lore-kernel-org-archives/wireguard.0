Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab2a15a7
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 10:57:25 +0000 (UTC)
Received: from 6.mo3.mail-out.ovh.net (6.mo3.mail-out.ovh.net [188.165.43.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf6590e1
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Nov 2017 10:57:25 +0000 (UTC)
Received: from player797.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 469B416FC6E
 for <wireguard@lists.zx2c4.com>; Fri, 10 Nov 2017 12:00:59 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Close the tun fd when closing the device
Date: Fri, 10 Nov 2017 22:00:33 +1100
Message-Id: <20171110110033.24210-2-aurelien@chabot.fr>
In-Reply-To: <20171110110033.24210-1-aurelien@chabot.fr>
References: <20171110110033.24210-1-aurelien@chabot.fr>
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

We also need to listen to the stop signal in the read tun function to
avoid reading a close tun device.

Signed-off-by: Aurélien Chabot <aurelien@chabot.fr>
---
 src/device.go |  1 +
 src/send.go   | 77 ++++++++++++++++++++++++++++++++---------------------------
 2 files changed, 43 insertions(+), 35 deletions(-)

diff --git a/src/device.go b/src/device.go
index 61c87bc..8567a36 100644
--- a/src/device.go
+++ b/src/device.go
@@ -205,6 +205,7 @@ func (device *Device) Close() {
 	device.RemoveAllPeers()
 	close(device.signal.stop)
 	closeUDPConn(device)
+	device.tun.device.Close()
 }
 
 func (device *Device) WaitChannel() chan struct{} {
diff --git a/src/send.go b/src/send.go
index 5c88ead..35ae9a3 100644
--- a/src/send.go
+++ b/src/send.go
@@ -141,53 +141,60 @@ func (device *Device) RoutineReadFromTUN() {
 
 	for {
 
-		// read packet
 
-		elem.packet = elem.buffer[MessageTransportHeaderSize:]
-		size, err := device.tun.device.Read(elem.packet)
-		if err != nil {
-			logError.Println("Failed to read packet from TUN device:", err)
-			device.Close()
-			return
-		}
+		select {
+		case <-device.signal.stop:
+		    logDebug.Println("Routine, TUN Reader worker, stopped")
+		    return
+		default:
+		    // read packet
 
-		if size == 0 || size > MaxContentSize {
-			continue
-		}
+		    elem.packet = elem.buffer[MessageTransportHeaderSize:]
+			size, err := device.tun.device.Read(elem.packet)
+			if err != nil {
+				logError.Println("Failed to read packet from TUN device:", err)
+				device.Close()
+				return
+			}
 
-		elem.packet = elem.packet[:size]
+			if size == 0 || size > MaxContentSize {
+				continue
+			}
 
-		// lookup peer
+			elem.packet = elem.packet[:size]
 
-		var peer *Peer
-		switch elem.packet[0] >> 4 {
-		case ipv4.Version:
-			if len(elem.packet) < ipv4.HeaderLen {
-				continue
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
 			}
-			dst := elem.packet[IPv4offsetDst : IPv4offsetDst+net.IPv4len]
-			peer = device.routingTable.LookupIPv4(dst)
 
-		case ipv6.Version:
-			if len(elem.packet) < ipv6.HeaderLen {
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
 
-- 
2.15.0
