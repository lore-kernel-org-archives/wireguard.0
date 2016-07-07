Return-Path: jonathan@titanous.com
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8b2238b
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 11:58:34 +0000 (UTC)
From: Jonathan Rudenberg <jonathan@titanous.com>
To: wireguard@lists.zx2c4.com
Date: Thu,  7 Jul 2016 07:58:30 -0400
Message-Id: <20160707115830.97535-1-jonathan@titanous.com>
In-Reply-To: <CAHmME9rgoaw=MzbfgXkDCWFt6sXzD_FKQka9V6JkpqaY1AH4iw@mail.gmail.com>
References: <CAHmME9rgoaw=MzbfgXkDCWFt6sXzD_FKQka9V6JkpqaY1AH4iw@mail.gmail.com>
Subject: [WireGuard] [PATCH] go test: don't rely on undefined append behavior
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 contrib/external-tests/go/main.go | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/contrib/external-tests/go/main.go b/contrib/external-tests/go/main.go
index 8e3c195..c1aa293 100644
--- a/contrib/external-tests/go/main.go
+++ b/contrib/external-tests/go/main.go
@@ -118,15 +118,13 @@ func main() {
 		Dst:      net.IPv4(10, 189, 129, 1),
 	}).Marshal()
 	binary.BigEndian.PutUint16(pingHeader[2:], uint16(ipv4.HeaderLen+len(pingMessage))) // fix the length endianness on BSDs
-	binary.BigEndian.PutUint16(pingHeader[10:], ipChecksum(append(pingHeader, pingMessage...)))
-	if err != nil {
-		panic(err)
-	}
+	pingData := append(pingHeader, pingMessage...)
+	binary.BigEndian.PutUint16(pingData[10:], ipChecksum(pingData))
 	pingPacket := make([]byte, 13)
 	pingPacket[0] = 4 // Type: Data
 	binary.LittleEndian.PutUint32(pingPacket[1:], theirIndex)
 	binary.LittleEndian.PutUint64(pingPacket[5:], 0) // Nonce
-	pingPacket = sendCipher.Encrypt(pingPacket, nil, append(pingHeader, pingMessage...))
+	pingPacket = sendCipher.Encrypt(pingPacket, nil, pingData)
 	if _, err := conn.Write(pingPacket); err != nil {
 		log.Fatalf("error writing ping message: %s", err)
 	}
-- 
2.9.0
