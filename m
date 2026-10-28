Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26031606A31A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Oct 2026 07:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=MXPeBRY5
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id f75e69ec;
	Wed, 28 Oct 2026 07:41:51 +0000 (UTC)
Received: from mail-24425.protonmail.ch (mail-24425.protonmail.ch
 [109.224.244.25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 43e10204
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Oct 2026 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail2; t=1793173309; x=1793432509;
 bh=40x1EdQelAvPCX1VpzevTVLYbdfZHNaPcP6NVt5KJT4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=MXPeBRY5MxpEslW80HczZDQYsv0tUfmBggq7Z4c87xiXa0xEaqJk9ZRwUx/DrQ+Be
 k3VIzWSgOO1AzhoaiWphejAs4bB8wVgIoJANMZTJPYbHCe9YAu0LnIqfvcCKsngZUM
 AJ7XAMoEMBGrolWOYOuhpJBFvZMjWk+iOa0T/hp1Cu6vuSjrKAiII7IV27cBEZeFU3
 QTERs8JKL11Q+qe+L18+Ljn1WC1AFy+7GEiU5v4UNS/Yue91s1r/+gZ3mYQvz5tS5s
 nxf88Lt9LcechUq4oJnHIcMf70Z62zVFzOFP/ofN7Csq+n43bu/Oebl7PqogiXYmSI
 mxC/ueYc/frDw==
Date: Wed, 28 Oct 2026 07:41:43 +0000
To: John <therealgraysky@proton.me>
From: John <therealgraysky@proton.me>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] wireguard-apple: skip bump keepalive when local source is
 unchanged
Message-ID: <u7zJchbB818Tb02A_01zGNnkCBLgp2T_QxdK3h2P_-AkFbFbjT5ZN0bub7XcNNuqh6o9rs62VN5pLuNgrzBv5syUhQd-P32qcge0TlwuHwo=@proton.me>
In-Reply-To: <td4woLomZIZwR883bnvy_IeKSIPaiUjFJPe23JvyUxF-Cg77isf4LT4NH8IFtIURHm053LGIr5JBVe1Hzge-CFl2m0-ZNeM4XCnD4_eidZ4=@proton.me>
References: <td4woLomZIZwR883bnvy_IeKSIPaiUjFJPe23JvyUxF-Cg77isf4LT4NH8IFtIURHm053LGIr5JBVe1Hzge-CFl2m0-ZNeM4XCnD4_eidZ4=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 67719718663b137e5ffaa41ffe853b5c1afb6dd2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tuesday, October 27th, 2026 at 3:59 PM, John <therealgraysky@proton.me> =
wrote:

> This is a proposed fix for the battery drain I reported here:
>=20
>   https://lists.zx2c4.com/pipermail/wireguard/2026-October/009758.html

From 0622d8377654ae36442c7274e0f1df4e87784b45 Mon Sep 17 00:00:00 2001
From: John Audia <therealgraysky@proton.me>
Date: Sun, 25 Oct 2026 13:17:49 +0000
Subject: [PATCH] WireGuardKitGo: skip bump keepalive when local source is
 unchanged

On iOS 27, path updates with the same status and interfaces arrive
every few seconds. Each one sent a keepalive, which keeps the radio
awake and, once the keypair passes REKEY_AFTER_TIME, starts a new
handshake, so an idle tunnel never goes quiet.

Still rebind on every update, but only send the keepalive when the
local source address for a peer endpoint changes, on the first bump,
or when the lookup fails, so roaming still notifies the peer.

Signed-off-by: John Audia <therealgraysky@proton.me>
---
 Sources/WireGuardKitGo/api-apple.go | 54 ++++++++++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Sources/WireGuardKitGo/api-apple.go b/Sources/WireGuardKitGo/a=
pi-apple.go
index 5d24982ac5b7..65c71a3043d1 100644
--- a/Sources/WireGuardKitGo/api-apple.go
+++ b/Sources/WireGuardKitGo/api-apple.go
@@ -16,11 +16,14 @@ import "C"
 import (
 =09"fmt"
 =09"math"
+=09"net"
 =09"os"
 =09"os/signal"
 =09"runtime"
 =09"runtime/debug"
+=09"sort"
 =09"strings"
+=09"sync"
 =09"time"
 =09"unsafe"
=20
@@ -58,6 +61,42 @@ type tunnelHandle struct {
=20
 var tunnelHandles =3D make(map[int32]tunnelHandle)
=20
+var (
+=09lastSourcesMu sync.Mutex
+=09lastSources   =3D make(map[int32]string)
+)
+
+// localSources returns each peer endpoint paired with the local address t=
he OS
+// would use to reach it. A UDP connect only performs a route lookup; noth=
ing is
+// sent.
+func localSources(dev *device.Device) string {
+=09cfg, err :=3D dev.IpcGet()
+=09if err !=3D nil {
+=09=09return ""
+=09}
+=09var srcs []string
+=09for _, line :=3D range strings.Split(cfg, "\n") {
+=09=09if !strings.HasPrefix(line, "endpoint=3D") {
+=09=09=09continue
+=09=09}
+=09=09endpoint :=3D strings.TrimPrefix(line, "endpoint=3D")
+=09=09raddr, err :=3D net.ResolveUDPAddr("udp", endpoint)
+=09=09if err !=3D nil {
+=09=09=09continue
+=09=09}
+=09=09c, err :=3D net.DialUDP("udp", nil, raddr)
+=09=09if err !=3D nil {
+=09=09=09continue
+=09=09}
+=09=09if laddr, ok :=3D c.LocalAddr().(*net.UDPAddr); ok {
+=09=09=09srcs =3D append(srcs, endpoint+">"+laddr.IP.String())
+=09=09}
+=09=09c.Close()
+=09}
+=09sort.Strings(srcs)
+=09return strings.Join(srcs, ",")
+}
+
 func init() {
 =09signals :=3D make(chan os.Signal)
 =09signal.Notify(signals, unix.SIGUSR2)
@@ -140,6 +179,9 @@ func wgTurnOff(tunnelHandle int32) {
 =09=09return
 =09}
 =09delete(tunnelHandles, tunnelHandle)
+=09lastSourcesMu.Lock()
+=09delete(lastSources, tunnelHandle)
+=09lastSourcesMu.Unlock()
 =09dev.Close()
 }
=20
@@ -183,7 +225,17 @@ func wgBumpSockets(tunnelHandle int32) {
 =09=09for i :=3D 0; i < 10; i++ {
 =09=09=09err :=3D dev.BindUpdate()
 =09=09=09if err =3D=3D nil {
-=09=09=09=09dev.SendKeepalivesToPeersWithCurrentKeypair()
+=09=09=09=09src :=3D localSources(dev.Device)
+=09=09=09=09lastSourcesMu.Lock()
+=09=09=09=09changed :=3D src =3D=3D "" || src !=3D lastSources[tunnelHandl=
e]
+=09=09=09=09lastSources[tunnelHandle] =3D src
+=09=09=09=09lastSourcesMu.Unlock()
+=09=09=09=09if changed {
+=09=09=09=09=09dev.Verbosef("Local source addresses changed to %q, sending=
 keepalive", src)
+=09=09=09=09=09dev.SendKeepalivesToPeersWithCurrentKeypair()
+=09=09=09=09} else {
+=09=09=09=09=09dev.Verbosef("Local source address unchanged, skipping keep=
alive")
+=09=09=09=09}
 =09=09=09=09return
 =09=09=09}
 =09=09=09dev.Errorf("Unable to update bind, try %d: %v", i+1, err)
--=20
2.56.0


