Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17ABC2FC3F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d1e4d4d;
	Wed, 16 Aug 2023 22:19:11 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8325e90
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 11 Aug 2023 16:05:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3159d5e409dso1974164f8f.0
 for <wireguard@lists.zx2c4.com>; Fri, 11 Aug 2023 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ridge.co; s=google; t=1691769899; x=1692374699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5MuvQhVFKBiX2Np2Arv550qWLNdeCfrrI985du0tg9A=;
 b=elWQlWJaybNfWasU9/XEoer1COLpVTPsWsKkSOkcShyPhypdSa06FnKGrkfZ6UoRRM
 8dWSvSJhbP8LzlKyjWSeGnIG1qFVXwPxFWNkxVWeJrxo3q3kaXXLnsb3lYthkbxmVBNj
 3v6It3PLusqh/zx9Bkg94O5PyZiCt5aTjuFyhPhyxJYP3xF1/K6Z3fR17B7XO7+oeitu
 oyNyARzwEriXMww+Nq2hwBsIyYpzEIfxHR/7PyqRkY9eWyPASPAvk1X50ox4mDnqek5X
 ztHypqJIn0M/cAH7DeSRxPlA1n3YY2t9oaXRd4fgOmAVSq6s9f8JK24ud6QILsR3mzKU
 7Weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691769899; x=1692374699;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5MuvQhVFKBiX2Np2Arv550qWLNdeCfrrI985du0tg9A=;
 b=G8HGzaKssZZmsQBj720lGZBB2Ozfd4hQ5LIniGAU++PT4ci319LAx21AKVRWve1f5N
 +aS+49vS0UdxSXE/G3kVJ+mdLbtMPwcGgnwD1m1fB3ifFuxf5PeCG4lIujfYc2Oj53m4
 WTw4XxYMDvTkaYB2Yn91ayDEUficsapjFZFlEMLe6tS4LbRIqj/fWpGh6P6a/aJ5Yys6
 xygZ6dwIGfIyX8rS+7RjZtBmmzHvSAc7XdUgvNyrJbY1IHa01CEh6ZdIBkAYtlbZxGjA
 bq6+OARtAJ1a6LnnHV3SDWyCWvtXV9+5DQCu6Ie2Q0w0rBTmTcq23LQW32Z9zwuUnUJa
 Waug==
X-Gm-Message-State: AOJu0Yyn0SoRNGxyS59JBG+m9WHPGBR2RMrV0hxl3xjb+eYN2YfOxQtk
 xBUyFif3UkCL63VNwT+IzkvbhAmUBBLorrZZWpY=
X-Google-Smtp-Source: AGHT+IF9fX4doUPFLwv/bJrXxlsYYllzuCyYKw6Dniu8hYhbT7aO5HGk9KaL01EtNiLYEx6E5ZT6hw==
X-Received: by 2002:adf:f8ce:0:b0:314:1228:c4c1 with SMTP id
 f14-20020adff8ce000000b003141228c4c1mr2246049wrq.23.1691769899306; 
 Fri, 11 Aug 2023 09:04:59 -0700 (PDT)
Received: from sandwich.. ([5.59.118.144]) by smtp.gmail.com with ESMTPSA id
 j8-20020a5d4528000000b0031779a6b451sm5826467wra.83.2023.08.11.09.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:04:58 -0700 (PDT)
From: Alexey Feldgendler <alexey@ridge.co>
To: wireguard@lists.zx2c4.com
Cc: Alexey Feldgendler <alexey@ridge.co>
Subject: [PATCH] bump gvisor to release-20230807.0 (brings go 1.21
 compatibility)
Date: Fri, 11 Aug 2023 18:04:23 +0200
Message-Id: <20230811160423.689355-1-alexey@ridge.co>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Aug 2023 22:19:06 +0000
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

wireguard-go depends on a specific version of gvisor.dev/gvisor,
and that version is explicitly incompatible with Go 1.21.
Updating gvisor to its latest release fixes the issue.

gvisor produces and compiles generated code in a way that makes its master
branch unusable as a Go module. They maintain a "go" branch parallel to master
to provide a version that can be imported directly. The new gvisor module
version reference in go.mod is the commit on the "go" branch that corresponds
to release-20230807.0, the latest release that's tagged on the master branch
at the time of this writing.

Trivial fixes were necessary in wireguard-go to accomodate gvisor API changes.

---
 go.mod                        |  4 ++--
 go.sum                        |  8 ++++----
 tun/netstack/tun.go           | 14 +++++++-------
 tun/tcp_offload_linux_test.go | 12 ++++--------
 4 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/go.mod b/go.mod
index c04e1bb..35cfcb6 100644
--- a/go.mod
+++ b/go.mod
@@ -7,10 +7,10 @@ require (
 	golang.org/x/net v0.7.0
 	golang.org/x/sys v0.5.1-0.20230222185716-a3b23cc77e89
 	golang.zx2c4.com/wintun v0.0.0-20230126152724-0fa3db229ce2
-	gvisor.dev/gvisor v0.0.0-20221203005347-703fd9b7fbc0
+	gvisor.dev/gvisor v0.0.0-20230806223740-1b6e502fedca
 )
 
 require (
 	github.com/google/btree v1.0.1 // indirect
-	golang.org/x/time v0.0.0-20191024005414-555d28b269f0 // indirect
+	golang.org/x/time v0.0.0-20220210224613-90d013bbcef8 // indirect
 )
diff --git a/go.sum b/go.sum
index cfeaee6..e9acfe8 100644
--- a/go.sum
+++ b/go.sum
@@ -6,9 +6,9 @@ golang.org/x/net v0.7.0 h1:rJrUqqhjsgNp7KqAIc25s9pZnjU7TUcSY7HcVZjdn1g=
 golang.org/x/net v0.7.0/go.mod h1:2Tu9+aMcznHK/AK1HMvgo6xiTLG5rD5rZLDS+rp2Bjs=
 golang.org/x/sys v0.5.1-0.20230222185716-a3b23cc77e89 h1:260HNjMTPDya+jq5AM1zZLgG9pv9GASPAGiEEJUbRg4=
 golang.org/x/sys v0.5.1-0.20230222185716-a3b23cc77e89/go.mod h1:oPkhp1MJrh7nUepCBck5+mAzfO9JrbApNNgaTdGDITg=
-golang.org/x/time v0.0.0-20191024005414-555d28b269f0 h1:/5xXl8Y5W96D+TtHSlonuFqGHIWVuyCkGJLwGh9JJFs=
-golang.org/x/time v0.0.0-20191024005414-555d28b269f0/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
+golang.org/x/time v0.0.0-20220210224613-90d013bbcef8 h1:vVKdlvoWBphwdxWKrFZEuM0kGgGLxUOYcY4U/2Vjg44=
+golang.org/x/time v0.0.0-20220210224613-90d013bbcef8/go.mod h1:tRJNPiyCQ0inRvYxbN9jk5I+vvW/OXSQhTDSoE431IQ=
 golang.zx2c4.com/wintun v0.0.0-20230126152724-0fa3db229ce2 h1:B82qJJgjvYKsXS9jeunTOisW56dUokqW/FOteYJJ/yg=
 golang.zx2c4.com/wintun v0.0.0-20230126152724-0fa3db229ce2/go.mod h1:deeaetjYA+DHMHg+sMSMI58GrEteJUUzzw7en6TJQcI=
-gvisor.dev/gvisor v0.0.0-20221203005347-703fd9b7fbc0 h1:Wobr37noukisGxpKo5jAsLREcpj61RxrWYzD8uwveOY=
-gvisor.dev/gvisor v0.0.0-20221203005347-703fd9b7fbc0/go.mod h1:Dn5idtptoW1dIos9U6A2rpebLs/MtTwFacjKb8jLdQA=
+gvisor.dev/gvisor v0.0.0-20230806223740-1b6e502fedca h1:7ny3LuaRJFcPuCi2mc9/tv0ybe02o7cKA2qI/edjWuE=
+gvisor.dev/gvisor v0.0.0-20230806223740-1b6e502fedca/go.mod h1:lYEMhXbxgudVhALYsMQrBaUAjM3NMinh8mKL1CJv7rc=
diff --git a/tun/netstack/tun.go b/tun/netstack/tun.go
index 596cfcd..2b73054 100644
--- a/tun/netstack/tun.go
+++ b/tun/netstack/tun.go
@@ -25,7 +25,7 @@ import (
 	"golang.zx2c4.com/wireguard/tun"
 
 	"golang.org/x/net/dns/dnsmessage"
-	"gvisor.dev/gvisor/pkg/bufferv2"
+	"gvisor.dev/gvisor/pkg/buffer"
 	"gvisor.dev/gvisor/pkg/tcpip"
 	"gvisor.dev/gvisor/pkg/tcpip/adapters/gonet"
 	"gvisor.dev/gvisor/pkg/tcpip/header"
@@ -43,7 +43,7 @@ type netTun struct {
 	ep             *channel.Endpoint
 	stack          *stack.Stack
 	events         chan tun.Event
-	incomingPacket chan *bufferv2.View
+	incomingPacket chan *buffer.View
 	mtu            int
 	dnsServers     []netip.Addr
 	hasV4, hasV6   bool
@@ -61,7 +61,7 @@ func CreateNetTUN(localAddresses, dnsServers []netip.Addr, mtu int) (tun.Device,
 		ep:             channel.New(1024, uint32(mtu), ""),
 		stack:          stack.New(opts),
 		events:         make(chan tun.Event, 10),
-		incomingPacket: make(chan *bufferv2.View),
+		incomingPacket: make(chan *buffer.View),
 		dnsServers:     dnsServers,
 		mtu:            mtu,
 	}
@@ -84,7 +84,7 @@ func CreateNetTUN(localAddresses, dnsServers []netip.Addr, mtu int) (tun.Device,
 		}
 		protoAddr := tcpip.ProtocolAddress{
 			Protocol:          protoNumber,
-			AddressWithPrefix: tcpip.Address(ip.AsSlice()).WithPrefix(),
+			AddressWithPrefix: tcpip.AddrFromSlice(ip.AsSlice()).WithPrefix(),
 		}
 		tcpipErr := dev.stack.AddProtocolAddress(1, protoAddr, stack.AddressProperties{})
 		if tcpipErr != nil {
@@ -140,7 +140,7 @@ func (tun *netTun) Write(buf [][]byte, offset int) (int, error) {
 			continue
 		}
 
-		pkb := stack.NewPacketBuffer(stack.PacketBufferOptions{Payload: bufferv2.MakeWithData(packet)})
+		pkb := stack.NewPacketBuffer(stack.PacketBufferOptions{Payload: buffer.MakeWithData(packet)})
 		switch packet[0] >> 4 {
 		case 4:
 			tun.ep.InjectInbound(header.IPv4ProtocolNumber, pkb)
@@ -198,7 +198,7 @@ func convertToFullAddr(endpoint netip.AddrPort) (tcpip.FullAddress, tcpip.Networ
 	}
 	return tcpip.FullAddress{
 		NIC:  1,
-		Addr: tcpip.Address(endpoint.Addr().AsSlice()),
+		Addr: tcpip.AddrFromSlice(endpoint.Addr().AsSlice()),
 		Port: endpoint.Port(),
 	}, protoNumber
 }
@@ -453,7 +453,7 @@ func (pc *PingConn) ReadFrom(p []byte) (n int, addr net.Addr, err error) {
 		return 0, nil, fmt.Errorf("ping read: %s", tcpipErr)
 	}
 
-	remoteAddr, _ := netip.AddrFromSlice([]byte(res.RemoteAddr.Addr))
+	remoteAddr, _ := netip.AddrFromSlice(res.RemoteAddr.Addr.AsSlice())
 	return res.Count, &PingAddr{remoteAddr}, nil
 }
 
diff --git a/tun/tcp_offload_linux_test.go b/tun/tcp_offload_linux_test.go
index 9160e18..ffb4592 100644
--- a/tun/tcp_offload_linux_test.go
+++ b/tun/tcp_offload_linux_test.go
@@ -32,11 +32,9 @@ func tcp4PacketMutateIPFields(srcIPPort, dstIPPort netip.AddrPort, flags header.
 	totalLen := 40 + segmentSize
 	b := make([]byte, offset+int(totalLen), 65535)
 	ipv4H := header.IPv4(b[offset:])
-	srcAs4 := srcIPPort.Addr().As4()
-	dstAs4 := dstIPPort.Addr().As4()
 	ipFields := &header.IPv4Fields{
-		SrcAddr:     tcpip.Address(srcAs4[:]),
-		DstAddr:     tcpip.Address(dstAs4[:]),
+		SrcAddr:     tcpip.AddrFrom4(srcIPPort.Addr().As4()),
+		DstAddr:     tcpip.AddrFrom4(dstIPPort.Addr().As4()),
 		Protocol:    unix.IPPROTO_TCP,
 		TTL:         64,
 		TotalLength: uint16(totalLen),
@@ -69,11 +67,9 @@ func tcp6PacketMutateIPFields(srcIPPort, dstIPPort netip.AddrPort, flags header.
 	totalLen := 60 + segmentSize
 	b := make([]byte, offset+int(totalLen), 65535)
 	ipv6H := header.IPv6(b[offset:])
-	srcAs16 := srcIPPort.Addr().As16()
-	dstAs16 := dstIPPort.Addr().As16()
 	ipFields := &header.IPv6Fields{
-		SrcAddr:           tcpip.Address(srcAs16[:]),
-		DstAddr:           tcpip.Address(dstAs16[:]),
+		SrcAddr:           tcpip.AddrFrom16(srcIPPort.Addr().As16()),
+		DstAddr:           tcpip.AddrFrom16(dstIPPort.Addr().As16()),
 		TransportProtocol: unix.IPPROTO_TCP,
 		HopLimit:          64,
 		PayloadLength:     uint16(segmentSize + 20),
-- 
2.39.2

