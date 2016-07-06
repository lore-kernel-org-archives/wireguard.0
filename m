Return-Path: jonathan@titanous.com
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b346851
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jul 2016 23:49:45 +0000 (UTC)
From: Jonathan Rudenberg <jonathan@titanous.com>
To: wireguard@lists.zx2c4.com
Date: Wed,  6 Jul 2016 19:49:30 -0400
Message-Id: <20160706234930.88979-1-jonathan@titanous.com>
Subject: [WireGuard] [PATCH] contrib: update Go interop test to be idiomatic
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

- gofmt
- Give config struct one line per field
- Use camel case
- Check errors
- Log invariants with detail
- Use consistent pronouns
---
 contrib/external-tests/go/main.go | 105 +++++++++++++++++++++++---------------
 1 file changed, 65 insertions(+), 40 deletions(-)

diff --git a/contrib/external-tests/go/main.go b/contrib/external-tests/go/main.go
index de7337b..86fe192 100644
--- a/contrib/external-tests/go/main.go
+++ b/contrib/external-tests/go/main.go
@@ -3,61 +3,86 @@
 package main
 
 import (
-	"github.com/titanous/noise"
-	"net"
-	"time"
-	"bytes"
 	"crypto/rand"
 	"encoding/base64"
 	"encoding/binary"
+	"log"
+	"net"
+	"time"
+
 	"github.com/dchest/blake2s"
+	"github.com/titanous/noise"
 )
 
-func assert(exp bool) {
-	if !exp {
-		panic("Assertion failed.")
-	}
-}
-
 func main() {
-	my_private, _ := base64.StdEncoding.DecodeString("WAmgVYXkbT2bCtdcDwolI88/iVi/aV3/PHcUBTQSYmo=")
-	my_public, _ := base64.StdEncoding.DecodeString("K5sF9yESrSBsOXPd6TcpKNgqoy1Ik3ZFKl4FolzrRyI=")
+	ourPrivate, _ := base64.StdEncoding.DecodeString("WAmgVYXkbT2bCtdcDwolI88/iVi/aV3/PHcUBTQSYmo=")
+	ourPublic, _ := base64.StdEncoding.DecodeString("K5sF9yESrSBsOXPd6TcpKNgqoy1Ik3ZFKl4FolzrRyI=")
 	preshared, _ := base64.StdEncoding.DecodeString("FpCyhws9cxwWoV4xELtfJvjJN+zQVRPISllRWgeopVE=")
-	their_public, _ := base64.StdEncoding.DecodeString("qRCwZSKInrMAq5sepfCdaCsRJaoLe5jhtzfiw7CjbwM=")
+	theirPublic, _ := base64.StdEncoding.DecodeString("qRCwZSKInrMAq5sepfCdaCsRJaoLe5jhtzfiw7CjbwM=")
 	cs := noise.NewCipherSuite(noise.DH25519, noise.CipherChaChaPoly, noise.HashBLAKE2s)
-	hs := noise.NewHandshakeState(noise.Config{CipherSuite: cs, Random: rand.Reader, Pattern: noise.HandshakeIK, Initiator: true, Prologue: []byte("WireGuard v0 zx2c4 Jason@zx2c4.com"), PresharedKey: preshared, StaticKeypair: noise.DHKey{Private: my_private, Public: my_public}, PeerStatic: their_public})
-	conn, _ := net.Dial("udp", "test.wireguard.io:51820")
+	hs := noise.NewHandshakeState(noise.Config{
+		CipherSuite:   cs,
+		Random:        rand.Reader,
+		Pattern:       noise.HandshakeIK,
+		Initiator:     true,
+		Prologue:      []byte("WireGuard v0 zx2c4 Jason@zx2c4.com"),
+		PresharedKey:  preshared,
+		StaticKeypair: noise.DHKey{Private: ourPrivate, Public: ourPublic},
+		PeerStatic:    theirPublic,
+	})
+	conn, err := net.Dial("udp", "test.wireguard.io:51820")
+	if err != nil {
+		log.Fatalf("error dialing udp socket: %s", err)
+	}
+	defer conn.Close()
 
 	now := time.Now()
 	tai64n := make([]byte, 12)
 	binary.BigEndian.PutUint64(tai64n[:], uint64(now.Unix()))
 	binary.BigEndian.PutUint32(tai64n[8:], uint32(now.UnixNano()))
-	initiation_packet := make([]byte, 5)
-	initiation_packet[0] = 1 /* Type: Initiation */
-	binary.LittleEndian.PutUint32(initiation_packet[1:], 28) /* Sender index: 28 (arbitrary) */
-	initiation_packet, _, _ = hs.WriteMessage(initiation_packet, tai64n)
+	initiationPacket := make([]byte, 5)
+	initiationPacket[0] = 1                                 // Type: Initiation
+	binary.LittleEndian.PutUint32(initiationPacket[1:], 28) // Sender index: 28 (arbitrary)
+	initiationPacket, _, _ = hs.WriteMessage(initiationPacket, tai64n)
 	hasher, _ := blake2s.New(&blake2s.Config{Size: 16, Key: preshared})
-	hasher.Write(their_public)
-	hasher.Write(initiation_packet)
-	initiation_packet = append(initiation_packet, hasher.Sum(nil)[:16]...)
-	initiation_packet = append(initiation_packet, bytes.Repeat([]byte{ 0 }, 16)...)
-	conn.Write(initiation_packet)
-
-	response_packet := make([]byte, 89)
-	conn.Read(response_packet)
-	assert(response_packet[0] == 2 /* Type: Response */)
-	their_index := binary.LittleEndian.Uint32(response_packet[1:])
-	our_index := binary.LittleEndian.Uint32(response_packet[5:])
-	assert(our_index == 28)
-	payload, send_cs, _, err := hs.ReadMessage(nil, response_packet[9:57])
-	assert(len(payload) == 0 && err == nil)
+	hasher.Write(theirPublic)
+	hasher.Write(initiationPacket)
+	initiationPacket = append(initiationPacket, hasher.Sum(nil)[:16]...)
+	initiationPacket = append(initiationPacket, make([]byte, 16)...)
+	if _, err := conn.Write(initiationPacket); err != nil {
+		log.Fatalf("error writing initiation packet: %s", err)
+	}
 
-	keepalive_packet := make([]byte, 13)
-	keepalive_packet[0] = 4 /* Type: Data */
-	binary.LittleEndian.PutUint32(keepalive_packet[1:], their_index)
-	binary.LittleEndian.PutUint64(keepalive_packet[3:], 0) /* Nonce */
-	keepalive_packet = send_cs.Encrypt(keepalive_packet, nil, nil)
-	conn.Write(keepalive_packet)
+	responsePacket := make([]byte, 89)
+	n, err := conn.Read(responsePacket)
+	if err != nil {
+		log.Fatalf("error reading response packet: %s", err)
+	}
+	if n != len(responsePacket) {
+		log.Fatalf("response packet too short: want %d, got %d", len(responsePacket), n)
+	}
+	if responsePacket[0] != 2 { // Type: Response
+		log.Fatalf("response packet type wrong: want %d, got %d", 2, responsePacket[0])
+	}
+	theirIndex := binary.LittleEndian.Uint32(responsePacket[1:])
+	ourIndex := binary.LittleEndian.Uint32(responsePacket[5:])
+	if ourIndex != 28 {
+		log.Fatalf("response packet index wrong: want %d, got %d", 28, ourIndex)
+	}
+	payload, sendCipher, _, err := hs.ReadMessage(nil, responsePacket[9:57])
+	if err != nil {
+		log.Fatalf("error reading handshake message: %s", err)
+	}
+	if len(payload) > 0 {
+		log.Fatalf("unexpected payload: %x", payload)
+	}
 
-	conn.Close()
+	keepalivePacket := make([]byte, 13)
+	keepalivePacket[0] = 4 // Type: Data
+	binary.LittleEndian.PutUint32(keepalivePacket[1:], theirIndex)
+	binary.LittleEndian.PutUint64(keepalivePacket[3:], 0) // Nonce
+	keepalivePacket = sendCipher.Encrypt(keepalivePacket, nil, nil)
+	if _, err := conn.Write(keepalivePacket); err != nil {
+		log.Fatalf("error writing keepalive packet: %s", err)
+	}
 }
-- 
2.9.0
