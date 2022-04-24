Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E19EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 24 Apr 2022 20:19:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 56775897;
	Sun, 24 Apr 2022 20:09:58 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5640d7d3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 24 Apr 2022 09:20:21 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id a15so12132727pfv.11
 for <wireguard@lists.zx2c4.com>; Sun, 24 Apr 2022 02:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=Fzel99rf9gPXVdshDyYzipgn041C/AGkGOwYAflNlPc=;
 b=I9B9o4Cjv8pPovUnoUln+f5JKG8nn5kRntaG710lLMAabquBWW5rZAvA5fi8ZZI7A2
 9dHRfXyT76ySl7FL6okLimdyPqKGu+BDRHLsv5jhgOY4V8Z7zUyBpyZOc931aHQ6tfKD
 8MZCzqiNW1NWh9B2U42b+EB/0QtcRT7f3Z439WmGHqMoyQ8AHw9K2nPC4G3NemfZsbxo
 3BNy6SASh30RbjAb6lj/BoO9+2ykPFOknjWI+IKV4xEUghuW57egOs043RSjadPTnJrT
 pyRZ1WLRLIpYeUw6tZfl+PytS/fLOyo28KGhSUPz/ecPE0MNOxFSnPwKyit105ug16/L
 qsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Fzel99rf9gPXVdshDyYzipgn041C/AGkGOwYAflNlPc=;
 b=Zk9vn0Nto3xkLeo/yNO1MYOn0MYDa9r+6KMucyYOOuJFEbEJIx76L4krd2nZvRYrVl
 lHfezhxjQF9xP1Wuh2Gn5O4o3boxNSMKu36zQ8LwBkb5AuntCW5TfmqAq0j0pvTts9Cx
 JYR683XnnAQxcX88kNPIPeWSgUb5RldGTGImMbqNCwuTBdgf2uZuZvgT7Pyvr3/3Cd8w
 EaFtAeEaSrCeSiQGN5hFQ1J2ijO/aRnBy7GwDShFsW4Fj/SEgPQZbEwCYFxHqiLasaLX
 YSrYPEWHmgLTH/VgUJ7Cne1ovzv8rbTb+SmOWP3pxIdejuwewTDrithj+oxERsW2I0DB
 OjVw==
X-Gm-Message-State: AOAM533M9QbpHBgbXEw0vxa0aD92XulUkE0NcGhWg8f+DF5n+BTW66GU
 CVzeHAGSnXrh6B7xmDFytIQTiu8mYixMbqsTJamXPw8sAbc=
X-Google-Smtp-Source: ABdhPJyqYeP6oYIVsa+LXa+EcWw1YjOk+VInjNvf2uwc6fC2ToeTpMVSzHbcggH2XtXXUllohNWkr8PporuFunfExoo=
X-Received: by 2002:a05:6a00:9a2:b0:505:974f:9fd6 with SMTP id
 u34-20020a056a0009a200b00505974f9fd6mr13618898pfg.12.1650792019694; Sun, 24
 Apr 2022 02:20:19 -0700 (PDT)
MIME-Version: 1.0
From: Natan Elul <elul.natan@gmail.com>
Date: Sun, 24 Apr 2022 12:20:08 +0300
Message-ID: <CALDoV20ghXUW8DGL=yt6a8_cjGstCbEhXO9SbP6QcVLa63t7eA@mail.gmail.com>
Subject: [PATCH] [wireguard-go] Pool for endpoint objects
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 24 Apr 2022 20:09:51 +0000
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

Use sync.pool for endpoints to avoid memory allocations on each receive.
When an endpoint is returned in bind linux, go allocates memory on the heap
By using sync.pool, the allocations can be reused, and can
dramatically be more efficient.

This patch includes the changes for linux bind, and an optimization
for SetEndpointFor packet, that will use the lock only if needed.

Signed-off-by: Natan Elul <elul.natan@gmail.com>
---
 conn/bind_linux.go        | 58 +++++++++++++++++++++++++++++++--------
 conn/bind_std.go          | 15 ++++++++++
 conn/bind_windows.go      | 14 ++++++++++
 conn/bindtest/bindtest.go | 11 ++++++++
 conn/conn.go              |  5 ++++
 device/peer.go            | 11 +++++++-
 device/pools.go           |  1 +
 device/receive.go         |  1 +
 8 files changed, 103 insertions(+), 13 deletions(-)

diff --git a/conn/bind_linux.go b/conn/bind_linux.go
index f11f031..5630481 100644
--- a/conn/bind_linux.go
+++ b/conn/bind_linux.go
@@ -38,6 +38,24 @@ func (endpoint *LinuxSocketEndpoint) Src4()
*ipv4Source         { return endpoin
 func (endpoint *LinuxSocketEndpoint) Dst4() *unix.SockaddrInet4 {
return endpoint.dst4() }
 func (endpoint *LinuxSocketEndpoint) IsV6() bool                {
return endpoint.isV6 }

+func (endpoint *LinuxSocketEndpoint) IsEqual(ep Endpoint) bool {
+ // Protect from mutable sendmsg
+ endpoint.mu.Lock()
+ defer endpoint.mu.Unlock()
+
+ linuxEp := ep.(*LinuxSocketEndpoint)
+ return endpoint.dst == linuxEp.dst && endpoint.src == linuxEp.src
+}
+
+func (endpoint *LinuxSocketEndpoint) Copy() Endpoint {
+ return &LinuxSocketEndpoint{
+ mu:   sync.Mutex{},
+ dst:  endpoint.dst,
+ src:  endpoint.src,
+ isV6: endpoint.isV6,
+ }
+}
+
 func (endpoint *LinuxSocketEndpoint) src4() *ipv4Source {
  return (*ipv4Source)(unsafe.Pointer(&endpoint.src[0]))
 }
@@ -58,13 +76,28 @@ func (endpoint *LinuxSocketEndpoint) dst6()
*unix.SockaddrInet6 {
 type LinuxSocketBind struct {
  // mu guards sock4 and sock6 and the associated fds.
  // As long as someone holds mu (read or write), the associated fds are valid.
- mu    sync.RWMutex
- sock4 int
- sock6 int
+ mu             sync.RWMutex
+ sock4          int
+ sock6          int
+ epElementsPool sync.Pool
+}
+
+func (bind *LinuxSocketBind) GetEndpoint() *LinuxSocketEndpoint {
+ return bind.epElementsPool.Get().(*LinuxSocketEndpoint)
 }

-func NewLinuxSocketBind() Bind { return &LinuxSocketBind{sock4: -1,
sock6: -1} }
-func NewDefaultBind() Bind     { return NewLinuxSocketBind() }
+func (bind *LinuxSocketBind) PutEndpoint(endpoint Endpoint) {
+ bind.epElementsPool.Put(endpoint)
+}
+
+func NewLinuxSocketBind() Bind {
+ return &LinuxSocketBind{sock4: -1, sock6: -1,
+ epElementsPool: sync.Pool{New: func() interface{} {
+ return new(LinuxSocketEndpoint)
+ }}}
+}
+
+func NewDefaultBind() Bind { return NewLinuxSocketBind() }

 var (
  _ Endpoint = (*LinuxSocketEndpoint)(nil)
@@ -224,14 +257,14 @@ func (bind *LinuxSocketBind) Close() error {
 }

 func (bind *LinuxSocketBind) receiveIPv4(buf []byte) (int, Endpoint, error) {
+ end := bind.GetEndpoint()
  bind.mu.RLock()
  defer bind.mu.RUnlock()
  if bind.sock4 == -1 {
  return 0, nil, net.ErrClosed
  }
- var end LinuxSocketEndpoint
- n, err := receive4(bind.sock4, buf, &end)
- return n, &end, err
+ n, err := receive4(bind.sock4, buf, end)
+ return n, end, err
 }

 func (bind *LinuxSocketBind) receiveIPv6(buf []byte) (int, Endpoint, error) {
@@ -448,11 +481,12 @@ func send4(sock int, end *LinuxSocketEndpoint,
buff []byte) error {
  // clear src and retry

  if err == unix.EINVAL {
- end.ClearSrc()
+ // clear source writing to source ip that can collide with isEqual
read. this is a rare execution code, so we will just
+ // create a copy and use it instead. (avoid write)
+ newEndpoint := end.Copy().(*LinuxSocketEndpoint)
+ newEndpoint.ClearSrc()
  cmsg.pktinfo = unix.Inet4Pktinfo{}
- end.mu.Lock()
- _, err = unix.SendmsgN(sock, buff,
(*[unsafe.Sizeof(cmsg)]byte)(unsafe.Pointer(&cmsg))[:], end.dst4(), 0)
- end.mu.Unlock()
+ _, err = unix.SendmsgN(sock, buff,
(*[unsafe.Sizeof(cmsg)]byte)(unsafe.Pointer(&cmsg))[:],
newEndpoint.dst4(), 0)
  }

  return err
diff --git a/conn/bind_std.go b/conn/bind_std.go
index e0f6cdd..4306f7f 100644
--- a/conn/bind_std.go
+++ b/conn/bind_std.go
@@ -27,8 +27,23 @@ type StdNetBind struct {

 func NewStdNetBind() Bind { return &StdNetBind{} }

+func (bind *StdNetBind) PutEndpoint(endpoint Endpoint) {
+}
+
 type StdNetEndpoint netip.AddrPort

+func (e *StdNetEndpoint) IsEqual(endpoint Endpoint) bool {
+ addrPort := (*netip.AddrPort)(e)
+ addrPortParam := (*netip.AddrPort)(endpoint.(*StdNetEndpoint))
+ return addrPort.Port() == addrPortParam.Port() &&
addrPort.Addr().Compare(addrPortParam.Addr()) == 0
+}
+
+func (e *StdNetEndpoint) Copy() Endpoint {
+ addrPortString := (*netip.AddrPort)(e).String()
+ copyEndpoint, _ := netip.ParseAddrPort(addrPortString)
+ return (*StdNetEndpoint)(&copyEndpoint)
+}
+
 var (
  _ Bind     = (*StdNetBind)(nil)
  _ Endpoint = (*StdNetEndpoint)(nil)
diff --git a/conn/bind_windows.go b/conn/bind_windows.go
index 9268bc1..d0a1d66 100644
--- a/conn/bind_windows.go
+++ b/conn/bind_windows.go
@@ -77,6 +77,9 @@ type WinRingBind struct {
  isOpen uint32
 }

+func (bind *WinRingBind) PutEndpoint(endpoint Endpoint) {
+}
+
 func NewDefaultBind() Bind { return NewWinRingBind() }

 func NewWinRingBind() Bind {
@@ -131,6 +134,17 @@ func (*WinRingBind) ParseEndpoint(s string)
(Endpoint, error) {

 func (*WinRingEndpoint) ClearSrc() {}

+func (e *WinRingEndpoint) IsEqual(endpoint Endpoint) bool {
+ winEndpoint := endpoint.(*WinRingEndpoint)
+ return winEndpoint.family == e.family && winEndpoint.data == e.data
+}
+
+func (e *WinRingEndpoint) Copy() Endpoint {
+ return &WinRingEndpoint{
+ family: e.family,
+ data:   e.data,
+ }
+}
 func (e *WinRingEndpoint) DstIP() netip.Addr {
  switch e.family {
  case windows.AF_INET:
diff --git a/conn/bindtest/bindtest.go b/conn/bindtest/bindtest.go
index b38cae6..a04ccc9 100644
--- a/conn/bindtest/bindtest.go
+++ b/conn/bindtest/bindtest.go
@@ -23,8 +23,19 @@ type ChannelBind struct {
  target4, target6 ChannelEndpoint
 }

+func (c *ChannelBind) PutEndpoint(endpoint conn.Endpoint) {
+}
+
 type ChannelEndpoint uint16

+func (c ChannelEndpoint) IsEqual(endpoint conn.Endpoint) bool {
+ return c == endpoint.(ChannelEndpoint)
+}
+
+func (c ChannelEndpoint) Copy() conn.Endpoint {
+ return c
+}
+
 var (
  _ conn.Bind     = (*ChannelBind)(nil)
  _ conn.Endpoint = (*ChannelEndpoint)(nil)
diff --git a/conn/conn.go b/conn/conn.go
index 5a93b2b..c772b25 100644
--- a/conn/conn.go
+++ b/conn/conn.go
@@ -43,6 +43,9 @@ type Bind interface {

  // ParseEndpoint creates a new endpoint from a string.
  ParseEndpoint(s string) (Endpoint, error)
+
+ // PutEndpoint returns endpoint back to pool
+ PutEndpoint(endpoint Endpoint)
 }

 // BindSocketToInterface is implemented by Bind objects that support being
@@ -70,6 +73,8 @@ type Endpoint interface {
  DstToBytes() []byte  // used for mac2 cookie calculations
  DstIP() netip.Addr
  SrcIP() netip.Addr
+ IsEqual(endpoint Endpoint) bool
+ Copy() Endpoint
 }

 var (
diff --git a/device/peer.go b/device/peer.go
index 5bd52df..eb1cc41 100644
--- a/device/peer.go
+++ b/device/peer.go
@@ -271,7 +271,16 @@ func (peer *Peer) SetEndpointFromPacket(endpoint
conn.Endpoint) {
  if peer.disableRoaming {
  return
  }
+
+ peer.RLock()
+ if peer.endpoint.IsEqual(endpoint) {
+ peer.RUnlock()
+ return
+ }
+
+ peer.RUnlock()
+
  peer.Lock()
- peer.endpoint = endpoint
+ peer.endpoint = endpoint.Copy()
  peer.Unlock()
 }
diff --git a/device/pools.go b/device/pools.go
index f40477b..f861c51 100644
--- a/device/pools.go
+++ b/device/pools.go
@@ -70,6 +70,7 @@ func (device *Device) GetInboundElement()
*QueueInboundElement {
 }

 func (device *Device) PutInboundElement(elem *QueueInboundElement) {
+ device.net.bind.PutEndpoint(elem.endpoint)
  elem.clearPointers()
  device.pool.inboundElements.Put(elem)
 }
diff --git a/device/receive.go b/device/receive.go
index cc34498..e6cebcd 100644
--- a/device/receive.go
+++ b/device/receive.go
@@ -390,6 +390,7 @@ func (device *Device) RoutineHandshake(id int) {
  peer.SendKeepalive()
  }
  skip:
+ device.net.bind.PutEndpoint(elem.endpoint)
  device.PutMessageBuffer(elem.buffer)
  }
 }
-- 
2.30.1 (Apple Git-130)
