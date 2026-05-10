Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADF9CD4840
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 10 May 2026 20:10:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id d8d4fc50;
	Sun, 10 May 2026 20:10:52 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 00bba382
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 May 2026 19:58:21 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-8353c9f24d2so1805893b3a.3
 for <wireguard@lists.zx2c4.com>; Sun, 10 May 2026 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778443099; x=1779047899; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S7wJFKucUX3d/+ADYmhzufx79kwTNxWL7CF9uiOkzC8=;
 b=jag6QE0F3nziKYktcjXq3qBqw+eXd7/s4bQvlKgTZwdoj3/oJlUdyfBRe9g7OjQA9p
 fFrH64COniPfoPrWNdo8JB+WO6z6fonyYgcgyWzAlBXCXPClDwaKnr89XayQh9PkgZ+D
 fS/JcrkA2sPuReQ5/0T85m2fEVyPSnuh2jmlnNyrfiqbcxnsxOfgQDcSyMXCSjQzl94X
 BcPYihyXbGvCoczEUMP23sBJz+6AnIy5HqxYS6u3V/PeRYE/ud+akKv3rkqugagoMkpk
 gYHzl0ttRJAbPJHLZjvyEknSCj/EJUjJdZZozV9g1ZBGOJgjcUXEYKyKr1g1AI9UrjUX
 bQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778443099; x=1779047899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S7wJFKucUX3d/+ADYmhzufx79kwTNxWL7CF9uiOkzC8=;
 b=lTS6N5KsUy1XVBxd7TyGEB762KwgnSQchL0owvJ0vEiMPVUOTFixodXStgiQlTBKe0
 P0jrdewVj2zPZer/kRq0BeKZYjEQb/VUzyfqWJ6nj7tsLZbZhYxGv78jIaQlbU36hLRT
 u0pRSQxWoY746UIupPWoFKtM1w/Z5FP4kK3/A/Cu6p1V3jVLyn8XrKXNgh6qkVxO49Cy
 CUIdLFCpIh0ZZ/1R1LkyHzS7f9Uy19BvbtsmepXQI0NxZfxUDZu0npPVy7tkdprhBPHz
 JNRSL6jQ9DtOtjFml9KRLrZu/v773FvLkX0imcIh/pCzWttKtfL22oqIZZZv1dTL3TyM
 gJYw==
X-Gm-Message-State: AOJu0YyjoJTk/cLEwPMNDCy9m9afZjgQSIk5rB7xTogenw/t06aH3HN2
 LdmUmJ1z5dQ7HWMsN95/l6ZYWFFG73uba//A3gClBtKZwnneUen0qtU5TEeSZw==
X-Gm-Gg: Acq92OEAo6Y4wYgJhx7m1IeBs55zlpuIrz4yKXn7t+ranTKs2S3W1jj5jmOtFnqVapS
 SGN4fCJQoRLpJdSSeq5qenLPRvjYS8AaiqyJYquWSKA/eF7DXc5DInTvhe/rQWW1wfBBKSKKjzK
 NaH8MWEE+g+IaR6bQHo6c8wow81RvCmoaQDdiTCFS+oTUHPZ8t8k6vl5NCK1E4+ZgcLhP7vCc+5
 xp5FfhkBr0gowOZcLCBsYG4/1+zinEDmEixhI1TG4jkPUxmLkZ9eFAT1B4Qel/qAIDlic3jOedH
 PD8qb04fNzZsiIE6DfMPit5EdgHbHR7DzWLuIywdsQSnujsuXPcEc5uCQVEDQPjqCqACwyKuEIX
 rP9U+va07CW84oUov0ekTQ+PrHzFt0d32V7tykMqZiEEMK+kqzB82fP48rW2+xJwA4sknePic1i
 ERHQwdfS8HzeiC3+AXHW3mGvDRONHApWkov1W177mt2nOUInRw59UFt6v8+nhg89IqYiz2z0ZEA
 myP2sStxKBS
X-Received: by 2002:a05:6a00:3016:b0:837:e9cc:d46e with SMTP id
 d2e1a72fcca58-83a5c2b8a09mr19600997b3a.21.1778443099084; 
 Sun, 10 May 2026 12:58:19 -0700 (PDT)
Received: from llm.sabharwals.net ([2601:600:9180:73af:642:1aff:fe98:f167])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8396563f11csm22656860b3a.3.2026.05.10.12.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2026 12:58:18 -0700 (PDT)
From: Mukul Sabharwal <mjsabby@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Mukul Sabharwal <mjsabby@gmail.com>
Subject: [PATCH wireguard-go] conn: allow StdNetBind to bind to specific host
 addresses
Date: Sun, 10 May 2026 19:58:10 +0000
Message-ID: <20260510195810.192447-1-mjsabby@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 10 May 2026 20:10:46 +0000
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

Currently StdNetBind opens its IPv4 and IPv6 sockets on the unspecified
address (0.0.0.0 and [::]). Embedders that want the WireGuard listener
restricted to a specific local address — for example an Android
application that wants its inbound peers to reach it only over Wi-Fi
and never over the cellular interface, or a host with multiple
interfaces where listening on a single one is preferable for routing
or security reasons — currently have to reimplement Bind from scratch
just to substitute a different bind address, losing the recvmmsg /
sendmmsg / GSO optimizations along the way.

Add a NewStdNetBindWithBindHost(host4, host6 string) constructor that
records optional per-family bind hosts on the StdNetBind. Open() passes
them through to listenNet, which now uses net.JoinHostPort instead of
the hardcoded ":port" wildcard. Empty strings preserve the existing
any-address behavior, so NewStdNetBind() is unchanged for existing
callers.

Tests verify that an explicit loopback host pins both v4 and v6
listeners to loopback, and that the default constructor still binds to
the unspecified address.

Signed-off-by: Mukul Sabharwal <mjsabby@gmail.com>
---
 conn/bind_std.go      | 35 ++++++++++++++++++++++++++++----
 conn/bind_std_test.go | 46 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/conn/bind_std.go b/conn/bind_std.go
index f5c8816..9291b4b 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -46,10 +46,37 @@ type StdNetBind struct {
 
 	blackhole4 bool
 	blackhole6 bool
+
+	// Optional bind hosts for the IPv4 and IPv6 listeners. An empty
+	// string preserves the historical behavior of binding to the
+	// unspecified address (0.0.0.0 / [::]). These are read in Open()
+	// under mu and not mutated thereafter.
+	bindHost4 string
+	bindHost6 string
 }
 
 func NewStdNetBind() Bind {
+	return newStdNetBind("", "")
+}
+
+// NewStdNetBindWithBindHost returns a StdNetBind whose IPv4 / IPv6 listeners
+// bind to the supplied hosts instead of the unspecified address. An empty
+// string for either argument preserves the default any-address behavior for
+// that family. This is useful on hosts with multiple addresses where the
+// caller wants the WireGuard listener pinned to one of them — e.g. an
+// Android app that wants its inbound peers to reach it only over Wi-Fi
+// and never over the cellular interface.
+//
+// The hosts must parse as literal IP addresses (no DNS lookups are
+// performed). They are not validated until Open() is called.
+func NewStdNetBindWithBindHost(host4, host6 string) Bind {
+	return newStdNetBind(host4, host6)
+}
+
+func newStdNetBind(host4, host6 string) Bind {
 	return &StdNetBind{
+		bindHost4: host4,
+		bindHost6: host6,
 		udpAddrPool: sync.Pool{
 			New: func() any {
 				return &net.UDPAddr{
@@ -119,8 +146,8 @@ func (e *StdNetEndpoint) DstToString() string {
 	return e.AddrPort.String()
 }
 
-func listenNet(network string, port int) (*net.UDPConn, int, error) {
-	conn, err := listenConfig().ListenPacket(context.Background(), network, ":"+strconv.Itoa(port))
+func listenNet(network, host string, port int) (*net.UDPConn, int, error) {
+	conn, err := listenConfig().ListenPacket(context.Background(), network, net.JoinHostPort(host, strconv.Itoa(port)))
 	if err != nil {
 		return nil, 0, err
 	}
@@ -156,13 +183,13 @@ again:
 	var v4pc *ipv4.PacketConn
 	var v6pc *ipv6.PacketConn
 
-	v4conn, port, err = listenNet("udp4", port)
+	v4conn, port, err = listenNet("udp4", s.bindHost4, port)
 	if err != nil && !errors.Is(err, syscall.EAFNOSUPPORT) {
 		return nil, 0, err
 	}
 
 	// Listen on the same port as we're using for ipv4.
-	v6conn, port, err = listenNet("udp6", port)
+	v6conn, port, err = listenNet("udp6", s.bindHost6, port)
 	if uport == 0 && errors.Is(err, syscall.EADDRINUSE) && tries < 100 {
 		v4conn.Close()
 		tries++
diff --git a/conn/bind_std_test.go b/conn/bind_std_test.go
index 34a3c9a..e5d6650 100644
--- a/conn/bind_std_test.go
+++ b/conn/bind_std_test.go
@@ -27,6 +27,52 @@ func TestStdNetBindReceiveFuncAfterClose(t *testing.T) {
 	}
 }
 
+func TestStdNetBindWithBindHost(t *testing.T) {
+	bind := NewStdNetBindWithBindHost("127.0.0.1", "::1").(*StdNetBind)
+	if _, _, err := bind.Open(0); err != nil {
+		t.Fatal(err)
+	}
+	defer bind.Close()
+	if bind.ipv4 == nil {
+		t.Fatal("ipv4 listener not opened")
+	}
+	la4, ok := bind.ipv4.LocalAddr().(*net.UDPAddr)
+	if !ok {
+		t.Fatalf("ipv4 LocalAddr is not *net.UDPAddr: %T", bind.ipv4.LocalAddr())
+	}
+	if !la4.IP.IsLoopback() {
+		t.Errorf("ipv4 listener bound to %v, want loopback", la4.IP)
+	}
+	if bind.ipv6 != nil {
+		la6, ok := bind.ipv6.LocalAddr().(*net.UDPAddr)
+		if !ok {
+			t.Fatalf("ipv6 LocalAddr is not *net.UDPAddr: %T", bind.ipv6.LocalAddr())
+		}
+		if !la6.IP.IsLoopback() {
+			t.Errorf("ipv6 listener bound to %v, want loopback", la6.IP)
+		}
+	}
+}
+
+func TestStdNetBindDefaultBindHost(t *testing.T) {
+	// Empty host strings must preserve the historical wildcard behavior.
+	bind := NewStdNetBind().(*StdNetBind)
+	if _, _, err := bind.Open(0); err != nil {
+		t.Fatal(err)
+	}
+	defer bind.Close()
+	if bind.ipv4 == nil {
+		t.Fatal("ipv4 listener not opened")
+	}
+	la4, ok := bind.ipv4.LocalAddr().(*net.UDPAddr)
+	if !ok {
+		t.Fatalf("ipv4 LocalAddr is not *net.UDPAddr: %T", bind.ipv4.LocalAddr())
+	}
+	if !la4.IP.IsUnspecified() {
+		t.Errorf("ipv4 listener bound to %v, want unspecified", la4.IP)
+	}
+}
+
 func mockSetGSOSize(control *[]byte, gsoSize uint16) {
 	*control = (*control)[:cap(*control)]
 	binary.LittleEndian.PutUint16(*control, gsoSize)
-- 
2.53.0

