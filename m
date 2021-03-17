Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7AA6C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 07:55:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E794364F8B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 07:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E794364F8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wandera.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e3c51cf;
	Wed, 17 Mar 2021 07:55:30 +0000 (UTC)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1cfd5a69
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 07:55:28 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id ci14so1034399ejc.7
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 00:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wandera.com; s=google;
 h=from:mime-version:subject:message-id:date:to;
 bh=7vbvQV4YfEEntNZf/No1h1xUC7LfBucZGEeF1rQpw/4=;
 b=QnOLk0rtBbIhH2xU6kQ8jDMcew8yNlXaLxAHpSd9h4T3z5oqae14UUKQh3NZdJ2zZA
 LD6A5M9zA0yFXuTYh+zXcP8DgSuDV8W3Dh0Aaoi1OLMYOEIykB0P9/lkhKaST/Y/5K/O
 rLgR6S9pjGUhcQEPDfpBWb2aAUstuLlxBMrs2B/m/Q6wRVktp5WNoAf/hUu/tJ8sHYAk
 +o5qXwE4GZk9HkgJIjtUps07UtQ6mr+QiFcD/SOHYQspanF3YF80qNDU6KONuPGPZftp
 VmVbfyl8Gfgpjfg4O1fK74a5afZP/L/MzCOuo0rQhHl77A5Xp19NxW1R6xwxgf2nVppb
 niDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:subject:message-id:date:to;
 bh=7vbvQV4YfEEntNZf/No1h1xUC7LfBucZGEeF1rQpw/4=;
 b=s153uwAkbbpOluTB4Eu99Xb0eh46zJ3Edw9XB0QM1JazW72t9wtio1zg0CyYKjuj1W
 OYcnreER2+EzGZ+/1MySYAYNpIf4LYE2evCqjvPRB2eu9+hPtQgeLlMXiUMl1zxhE1Tr
 tIm7VwlQJRT2tVchbim/KPwjWphHRNCI8C2m9T8Kn9d35YR4DViEou/N4Hy30yfqBjOe
 7EPke25FB9OLcg2vZD6K0HW8whItg5Kblu5tniyq8pqbsaTRkZv5wmbVTlqjlnjTBtZI
 nzh7oCgrDpfnSzVF6HJx09p9ZG7qfl/uYQXj5//qGA4Y89wJOardp2rvJgNyS00O98mf
 8c4w==
X-Gm-Message-State: AOAM530MFWrnW8CAKUW/4Yk2X7uzpJU2KcsMHLO4eXTG54TzFpCbgE/u
 fL1Wb3gdoadgvtZ8zNyW4M3dhDsXwkCDuvoGT+bLQmbXAApuQ6baR54ni/D1Y5xNs4vLNqXtwhK
 WibOLFNHQJUiBHwWKSJ6hdzsyhNJ1GLBpciv+Y7eZBJyVgxFK/aobk+c2PsR/zM+35FusccxWsl
 X4DPz5xyiz
X-Google-Smtp-Source: ABdhPJzq7hOptP1RmeFFGh7nGShpIwqEfLrUgtVz9jtJB7W65YLs+Tdg5hTl7lx18FzaK6EZ3pIH3g==
X-Received: by 2002:a17:906:5e50:: with SMTP id
 b16mr34624152eju.272.1615967728277; 
 Wed, 17 Mar 2021 00:55:28 -0700 (PDT)
Received: from ?IPv6:fddd:dddd:1000:0:9a12:47ec:bb66:3813?
 (ec2-3-9-67-90.eu-west-2.compute.amazonaws.com. [3.9.67.90])
 by smtp.gmail.com with ESMTPSA id hd8sm10400772ejc.92.2021.03.17.00.55.27
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 00:55:27 -0700 (PDT)
From: Laura Zelenku <laura.zelenku@wandera.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: [PATCH] Respect WG protocol reserved bytes
Message-Id: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>
Date: Wed, 17 Mar 2021 08:55:26 +0100
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Content-Type: text/plain; charset="ISO-8859-1"
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Packet that respects WG protocol contains Type on first byte followed by
three reserved bytes. Because wireguard-go implementation uses element
pools it is required to make sure that reserved bytes are cleared for
outgoing traffic (can get dirty by "bad" clients). Clearing reserved
bytes is also for backwards compatibility.

Signed-off-by: Laura Zelenku <laura.zelenku@wandera.com>
---
 device/noise-protocol.go | 12 ++++++++----
 device/receive.go        |  4 ++--
 device/send.go           |  6 ++++--
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/device/noise-protocol.go b/device/noise-protocol.go
index 0212b7d..b5ef72b 100644
--- a/device/noise-protocol.go
+++ b/device/noise-protocol.go
@@ -82,7 +82,8 @@ const (
  */
 
 type MessageInitiation struct {
-       Type      uint32
+       Type      uint8
+       Reserved  [3]byte
        Sender    uint32
        Ephemeral NoisePublicKey
        Static    [NoisePublicKeySize + poly1305.TagSize]byte
@@ -92,7 +93,8 @@ type MessageInitiation struct {
 }
 
 type MessageResponse struct {
-       Type      uint32
+       Type      uint8
+       Reserved  [3]byte
        Sender    uint32
        Receiver  uint32
        Ephemeral NoisePublicKey
@@ -102,14 +104,16 @@ type MessageResponse struct {
 }
 
 type MessageTransport struct {
-       Type     uint32
+       Type     uint8
+       Reserved [3]byte
        Receiver uint32
        Counter  uint64
        Content  []byte
 }
 
 type MessageCookieReply struct {
-       Type     uint32
+       Type     uint8
+       Reserved [3]byte
        Receiver uint32
        Nonce    [chacha20poly1305.NonceSizeX]byte
        Cookie   [blake2s.Size128 + poly1305.TagSize]byte
diff --git a/device/receive.go b/device/receive.go
index b1959c6..e0d57bc 100644
--- a/device/receive.go
+++ b/device/receive.go
@@ -22,7 +22,7 @@ import (
 )
 
 type QueueHandshakeElement struct {
-       msgType  uint32
+       msgType  uint8
        packet   []byte
        endpoint conn.Endpoint
        buffer   *[MaxMessageSize]byte
@@ -121,7 +121,7 @@ func (device *Device) RoutineReceiveIncoming(IP int, bind conn.Bind) {
                // check size of packet
 
                packet := buffer[:size]
-               msgType := binary.LittleEndian.Uint32(packet[:4])
+               msgType := packet[0]
 
                var okay bool
 
diff --git a/device/send.go b/device/send.go
index a437cf1..dc4a8e2 100644
--- a/device/send.go
+++ b/device/send.go
@@ -373,11 +373,13 @@ func (device *Device) RoutineEncryption() {
                // populate header fields
                header := elem.buffer[:MessageTransportHeaderSize]
 
-               fieldType := header[0:4]
+               fieldType := header[0:1]
+               fieldReserved := header[1:4]
                fieldReceiver := header[4:8]
                fieldNonce := header[8:16]
 
-               binary.LittleEndian.PutUint32(fieldType, MessageTransportType)
+               fieldType[0] = byte(MessageTransportType)
+               copy(fieldReserved, []byte{}) // clear reserved bytes
                binary.LittleEndian.PutUint32(fieldReceiver, elem.keypair.remoteIndex)
                binary.LittleEndian.PutUint64(fieldNonce, elem.nonce)
 
-- 
2.28.0



-- 
*IMPORTANT NOTICE*: This email, its attachments and any rights attaching 
hereto are confidential and intended exclusively for the person to whom the 
email is addressed. If you are not the intended recipient, do not read, 
copy, disclose or use the contents in any way. Wandera accepts no liability 
for any loss, damage or consequence resulting directly or indirectly from 
the use of this email and attachments.
