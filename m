Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E270BC6FD20
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Mar 2023 13:47:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 070a26c6;
	Fri, 24 Mar 2023 13:45:31 +0000 (UTC)
Received: from dfw.source.kernel.org (<unknown> [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6c862f2a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Mar 2023 13:45:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A7BB62A3D;
 Fri, 24 Mar 2023 13:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F6DFC4339B;
 Fri, 24 Mar 2023 13:45:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="fVai2CGl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1679665523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLTwBT4dVejHLHSOrJlAYn5Ig4Hozmp9typIrz4oknE=;
 b=fVai2CGlJAYlVutlQQr2CrGvk+d8Jgs6BeLheW93Z5/saY8cFVzO6lx91CMLlXm9ik4Zpq
 eq4TBG162eLLz2JJe6uREuq9Woq/ar/pAgCIoJxwrOuZ7lN+TQIFokK4P9eptWEbu/yhQc
 smEp8oUmTzIyZ6n8ZbhwbgfAPj4Yb1M=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 44085089
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 24 Mar 2023 13:45:23 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Cc: Jordan Whited <jordan@tailscale.com>, lsc <lsc@lv6.tw>,
 Josh Bleecher Snyder <josharian@gmail.com>,
 James Tucker <james@tailscale.com>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH wireguard-go] conn: fix StdNetEndpoint data race by
 dynamically allocating endpoints
Date: Fri, 24 Mar 2023 14:45:05 +0100
Message-Id: <20230324134505.3597572-1-Jason@zx2c4.com>
In-Reply-To: <CAHmME9pbN4b115-dnqsMaqGMYq+xzLxDYyAv7xFTPZT6AU_39Q@mail.gmail.com>
References: <CAHmME9pbN4b115-dnqsMaqGMYq+xzLxDYyAv7xFTPZT6AU_39Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Jordan Whited <jordan@tailscale.com>

In 9e2f386 ("conn, device, tun: implement vectorized I/O on Linux"), the
Linux-specific Bind implementation was collapsed into StdNetBind. This
introduced a race on StdNetEndpoint from getSrcFromControl() and
setSrcControl().

Remove the sync.Pool involved in the race, and simplify StdNetBind's
receive path to allocate StdNetEndpoint on the heap instead, with the
intent for it to be cleaned up by the GC, later. This essentially
reverts ef5c587 ("conn: remove the final alloc per packet receive"),
adding back that allocation, unfortunately.

This does slightly increase resident memory usage in higher throughput
scenarios. StdNetBind is the only Bind implementation that was using
this Endpoint recycling technique prior to this commit.

This is considered a stop-gap solution, and there are plans to replace
the allocation with a better mechanism.

Reported-by: lsc <lsc@lv6.tw>
Link: https://lore.kernel.org/wireguard/ac87f86f-6837-4e0e-ec34-1df35f52540e@lv6.tw/
Fixes: 9e2f386 ("conn, device, tun: implement vectorized I/O on Linux")
Cc: Josh Bleecher Snyder <josharian@gmail.com>
Reviewed-by: James Tucker <james@tailscale.com>
Signed-off-by: Jordan Whited <jordan@tailscale.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 conn/bind_std.go | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/conn/bind_std.go b/conn/bind_std.go
index e8cf7b8..491e571 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -93,7 +93,12 @@ var (
 
 func (*StdNetBind) ParseEndpoint(s string) (Endpoint, error) {
 	e, err := netip.ParseAddrPort(s)
-	return asEndpoint(e), err
+	if err != nil {
+		return nil, err
+	}
+	return &StdNetEndpoint{
+		AddrPort: e,
+	}, nil
 }
 
 func (e *StdNetEndpoint) ClearSrc() {
@@ -228,7 +233,7 @@ func (s *StdNetBind) makeReceiveIPv4(pc *ipv4.PacketConn, conn *net.UDPConn) Rec
 			msg := &(*msgs)[i]
 			sizes[i] = msg.N
 			addrPort := msg.Addr.(*net.UDPAddr).AddrPort()
-			ep := asEndpoint(addrPort)
+			ep := &StdNetEndpoint{AddrPort: addrPort} // TODO: remove allocation
 			getSrcFromControl(msg.OOB[:msg.NN], ep)
 			eps[i] = ep
 		}
@@ -261,7 +266,7 @@ func (s *StdNetBind) makeReceiveIPv6(pc *ipv6.PacketConn, conn *net.UDPConn) Rec
 			msg := &(*msgs)[i]
 			sizes[i] = msg.N
 			addrPort := msg.Addr.(*net.UDPAddr).AddrPort()
-			ep := asEndpoint(addrPort)
+			ep := &StdNetEndpoint{AddrPort: addrPort} // TODO: remove allocation
 			getSrcFromControl(msg.OOB[:msg.NN], ep)
 			eps[i] = ep
 		}
@@ -408,24 +413,3 @@ func (s *StdNetBind) send6(conn *net.UDPConn, pc *ipv6.PacketConn, ep Endpoint,
 	s.ipv6MsgsPool.Put(msgs)
 	return err
 }
-
-// endpointPool contains a re-usable set of mapping from netip.AddrPort to Endpoint.
-// This exists to reduce allocations: Putting a netip.AddrPort in an Endpoint allocates,
-// but Endpoints are immutable, so we can re-use them.
-var endpointPool = sync.Pool{
-	New: func() any {
-		return make(map[netip.AddrPort]*StdNetEndpoint)
-	},
-}
-
-// asEndpoint returns an Endpoint containing ap.
-func asEndpoint(ap netip.AddrPort) *StdNetEndpoint {
-	m := endpointPool.Get().(map[netip.AddrPort]*StdNetEndpoint)
-	defer endpointPool.Put(m)
-	e, ok := m[ap]
-	if !ok {
-		e = &StdNetEndpoint{AddrPort: ap}
-		m[ap] = e
-	}
-	return e
-}
-- 
2.40.0

