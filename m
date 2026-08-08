Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34BF3CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 803778b6;
	Mon, 5 Oct 2026 06:56:30 +0000 (UTC)
Received: from mx01.forststack.de (mx01.forststack.de [5.75.209.129])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 89c30191
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 8 Aug 2026 19:39:51 +0000 (UTC)
Received: from mail.forststack.de (cks-4-agent [178.105.72.158] (AS24940
 Hetzner Online GmbH, DE))
 (using TLSv1.3 with cipher TLS13_AES_256_GCM_SHA384)
 by mx01.forststack.de (Stalwart SMTP) with ESMTPS id 47AED6A51000044;
 Sat, 8 Aug 2026 19:39:50 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=s2026ed; d=moo.gl; c=relaxed/relaxed;
 r=y; 
 h=MIME-Version:Message-ID:Date:Subject:Cc:To:From:Organization
 :Content-Type:In-Reply-To:References:List-Id; t=1786217989; x=1787081989; bh=6
 PDR2fOF6T6C/1qR66ziuOnk8ZqAGV2C9G0He67ci6c=; b=29iS6dze4eeNxl5dDt7FTvtd4S/X
 BCYqrfK1Tfccs4BSZ6prNFFHycOBVgb4q8CUula+92Uqp2K3UpblD3G1AQ==;
DKIM-Signature: v=1; a=rsa-sha256; s=s2026; d=moo.gl; c=relaxed/relaxed; r=y; 
 h=MIME-Version:Message-ID:Date:Subject:Cc:To:From:Organization
 :Content-Type:In-Reply-To:References:List-Id; t=1786217989; x=1787081989; bh=6
 PDR2fOF6T6C/1qR66ziuOnk8ZqAGV2C9G0He67ci6c=; b=l5wg0A3u2ICOP7B18Tq5i7YlHg3F
 UVhlZ8e78XL9iE4nQMWMKi5oBXT3kBQa+GpC+0BFTrZuJSDFtUtxeWPXDZE6+rDdCEhoSrZPbjN
 tWnzsQhnjDSFo+QU3vP/ck/fyBR/7drRPH9dUjrrXoHJ4XSu+tJUdiY52/4xZg0i8SYxRqewVU5
 LhLBXCcAoneUGT0RG8z9dHjxQSdfWNWV9CmhbHmDQsvtwElqlBg9b6ln6ktYg4iZR28IIb5ydMR
 wv25m5Btm2iv5HolhOX4MuoCJjghBsSsGGCwpueNniBdaVg31eUT9kwMv/plfngHqa++hG0a4jP
 7I5spemk3Q1JRQ==;
From: Tim Foerster <github@moo.gl>
To: wireguard@lists.zx2c4.com
Cc: Tim Foerster <github@moo.gl>
Subject: [PATCH] tun/netstack: do not panic when closing with a packet in
 flight
Date: Sat,  8 Aug 2026 21:39:42 +0200
Message-ID: <2e89ef5723ca0cc0c73da31d57b74649040f18d0.1786216842.git.github@moo.gl>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

Close() closes incomingPacket while WriteNotify() may still be parked
on a send to it. RemoveNotify() beforehand narrows the window but
cannot close it: a WriteNotify() that is already past ep.Read() holds a
packet, and when it loses the race the process dies with "send on
closed channel" on a goroutine owned by gvisor, which the caller cannot
recover. The packet that loses is typically one the stack generates by
itself, such as an RST for a refused connection, so the window is not
avoidable from outside the package.

Instead of closing incomingPacket, signal shutdown on a dedicated
closing channel that WriteNotify() and Read() select on. This releases
a pending send instead of turning it into a panic, and Read() still
returns os.ErrClosed. Close() is additionally wrapped in a sync.Once,
matching the other tun implementations, so that closing twice no longer
panics with "close of closed channel".

Signed-off-by: Tim Foerster <github@moo.gl>
---
 tun/netstack/tun.go      | 41 ++++++++++++++++++----------
 tun/netstack/tun_test.go | 59 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 15 deletions(-)
 create mode 100644 tun/netstack/tun_test.go

diff --git a/tun/netstack/tun.go b/tun/netstack/tun.go
index a7aec9e..df12c3c 100644
--- a/tun/netstack/tun.go
+++ b/tun/netstack/tun.go
@@ -19,6 +19,7 @@ import (
 	"regexp"
 	"strconv"
 	"strings"
+	"sync"
 	"syscall"
 	"time"
 
@@ -45,6 +46,8 @@ type netTun struct {
 	events         chan tun.Event
 	notifyHandle   *channel.NotificationHandle
 	incomingPacket chan *buffer.View
+	closeOnce      sync.Once
+	closing        chan struct{}
 	mtu            int
 	dnsServers     []netip.Addr
 	hasV4, hasV6   bool
@@ -63,6 +66,7 @@ func CreateNetTUN(localAddresses, dnsServers []netip.Addr, mtu int) (tun.Device,
 		stack:          stack.New(opts),
 		events:         make(chan tun.Event, 10),
 		incomingPacket: make(chan *buffer.View),
+		closing:        make(chan struct{}),
 		dnsServers:     dnsServers,
 		mtu:            mtu,
 	}
@@ -121,8 +125,10 @@ func (tun *netTun) Events() <-chan tun.Event {
 }
 
 func (tun *netTun) Read(buf [][]byte, sizes []int, offset int) (int, error) {
-	view, ok := <-tun.incomingPacket
-	if !ok {
+	var view *buffer.View
+	select {
+	case view = <-tun.incomingPacket:
+	case <-tun.closing:
 		return 0, os.ErrClosed
 	}
 
@@ -163,22 +169,27 @@ func (tun *netTun) WriteNotify() {
 	view := pkt.ToView()
 	pkt.DecRef()
 
-	tun.incomingPacket <- view
+	select {
+	case tun.incomingPacket <- view:
+	case <-tun.closing:
+	}
 }
 
 func (tun *netTun) Close() error {
-	tun.stack.RemoveNIC(1)
-	tun.stack.Close()
-	tun.ep.RemoveNotify(tun.notifyHandle)
-	tun.ep.Close()
-
-	if tun.events != nil {
-		close(tun.events)
-	}
-
-	if tun.incomingPacket != nil {
-		close(tun.incomingPacket)
-	}
+	tun.closeOnce.Do(func() {
+		// Unblock any WriteNotify parked on a send, and any pending Read.
+		// incomingPacket is never closed, as WriteNotify may be mid-send.
+		close(tun.closing)
+
+		tun.stack.RemoveNIC(1)
+		tun.stack.Close()
+		tun.ep.RemoveNotify(tun.notifyHandle)
+		tun.ep.Close()
+
+		if tun.events != nil {
+			close(tun.events)
+		}
+	})
 
 	return nil
 }
diff --git a/tun/netstack/tun_test.go b/tun/netstack/tun_test.go
new file mode 100644
index 0000000..fd8afe0
--- /dev/null
+++ b/tun/netstack/tun_test.go
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (C) 2017-2025 WireGuard LLC. All Rights Reserved.
+ */
+
+package netstack
+
+import (
+	"net/netip"
+	"os"
+	"testing"
+	"time"
+
+	"gvisor.dev/gvisor/pkg/buffer"
+	"gvisor.dev/gvisor/pkg/tcpip/stack"
+)
+
+// TestClose checks that Close releases a WriteNotify parked on a send, is
+// idempotent, and leaves Read returning os.ErrClosed.
+func TestClose(t *testing.T) {
+	dev, _, err := CreateNetTUN([]netip.Addr{netip.MustParseAddr("192.168.241.1")}, nil, 1280)
+	if err != nil {
+		t.Fatal(err)
+	}
+	tun := dev.(*netTun)
+
+	// Nobody reads the device, so WriteNotify parks on the unbuffered send.
+	done := make(chan struct{})
+	go func() {
+		defer close(done)
+		// The contents are never parsed, only handed to WriteNotify.
+		pkt := stack.NewPacketBuffer(stack.PacketBufferOptions{
+			Payload: buffer.MakeWithData([]byte{0}),
+		})
+		defer pkt.DecRef()
+		var pkts stack.PacketBufferList
+		pkts.PushBack(pkt)
+		tun.ep.WritePackets(pkts)
+	}()
+	time.Sleep(100 * time.Millisecond)
+
+	if err := dev.Close(); err != nil {
+		t.Fatalf("Close: %v", err)
+	}
+	select {
+	case <-done:
+	case <-time.After(time.Second):
+		t.Fatal("WriteNotify still blocked after Close")
+	}
+
+	if err := dev.Close(); err != nil {
+		t.Fatalf("second Close: %v", err)
+	}
+
+	bufs := [][]byte{make([]byte, 1500)}
+	if _, err := dev.Read(bufs, make([]int, 1), 0); err != os.ErrClosed {
+		t.Fatalf("Read after Close: got %v, want os.ErrClosed", err)
+	}
+}
-- 
2.55.0

