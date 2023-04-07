Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BA9C76196
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 11 Apr 2023 10:30:28 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 627489a5;
	Tue, 11 Apr 2023 10:27:59 +0000 (UTC)
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [2607:f8b0:4864:20::e2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5b33fecd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Apr 2023 20:26:51 +0000 (UTC)
Received: by mail-vs1-xe2e.google.com with SMTP id h15so37797077vsh.0
 for <wireguard@lists.zx2c4.com>; Fri, 07 Apr 2023 13:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hiramchirino-com.20210112.gappssmtp.com; s=20210112; t=1680899210;
 x=1683491210; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=BtswLEcQ6fv0qr60w80NJt6lEV+Z8BvcP5M8/Tt1rN0=;
 b=gt5vbFB3Lpg3OZxL1zIo1l4kSHTe+hr3tOc8M3RmN82Xzhk4CEbyNXNOThIUIuCRsu
 TyBUqT6xneyGHS019EGadlhPG7+nqaRRl0IqhuYK27fFfR5rCPwdinVYO6lj0xr8nS8y
 AM7U8IaP8BOdvgcbM3Pf+bEZU44iO7FJ0DHzMub8bcmDUrNhnm8X4Ya59Ms/Z9FNaAf0
 REVGFuDzPFZGFyfZ8+LjhNcGO3WxpwQBXuzxLyf9tt9FVxsIUHHoOjCJY5dP+3qupma1
 nxLL6wowlHWkPBaz0NiE9XGmsQ8A8yoZ5YGOj8c9PIFcd36Dq4FQor3U+BnyGrPioOie
 24sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680899210; x=1683491210;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BtswLEcQ6fv0qr60w80NJt6lEV+Z8BvcP5M8/Tt1rN0=;
 b=MgbXRQLRRElcROJef5R7YIQMRwyljUJzvyy7JnOgU8SlSGZEp+BdZAeWTbTSF9iz//
 xjDxIbPOCLCimIf4qY2fsNLPiJnmRD9zdkVbSP8C2E9+4Vhmj1/5HS2NS5dJIrL8x/Gb
 tUgeVQZwoS8iU1/0UckeVJyPgvfV2kMB+6w+giunyF3DpSfTno0APrghHTB2cCkeH+Zf
 RtkMmmKS+WKI1uSZNVDGW8D55VKFkE1UaGEde+KRky6DuYVHvIpmyXknjVXNQDAxHOOx
 JXIRIUDd7763hz6wPPJ8/7DczNoEGQ7xfsY7mNo845sZ2y0kGxRySqXvgN3iHe9bzLBa
 53Dg==
X-Gm-Message-State: AAQBX9fHibdLN/+f/BOvYioQZvlJvQjUCohpaycY42GyjwgfL+sVSItf
 OhGvwoY30ffzqmaj6UUw+QapHNGxc2fJSPvKixOKhJp3AzI=
X-Google-Smtp-Source: AKy350ZZC0qrw8EXcvuuCGmgd2IYwn7ecrearQQRoyedQzyvWoCAN3ToinNQm59L3V0+vXSuEfIeFiVQhm7TrzbiKEs=
X-Received: by 2002:a67:d38e:0:b0:425:d39f:3882 with SMTP id
 b14-20020a67d38e000000b00425d39f3882mr131716vsj.3.1680899209538; Fri, 07 Apr
 2023 13:26:49 -0700 (PDT)
MIME-Version: 1.0
From: Hiram Chirino <hiram@hiramchirino.com>
Date: Fri, 7 Apr 2023 16:26:38 -0400
Message-ID: <CAGZ-RDJVoCz++x9XV3QhcY3zmfJtc7+6kxN2YeY9+3dpzasVeA@mail.gmail.com>
Subject: [PATCH] conn: set the SO_REUSEADDR and SO_REUSEPORT socket options
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 11 Apr 2023 10:27:59 +0000
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

Setting the SO_REUSEADDR and SO_REUSEPORT socket options allows other
applications to reuse the wg UDP port. This can be super handy to do
Things like sending stun requests to stun servers from the wg port.
This lets you discover the wg=E2=80=99s public IP:port mapping if you're be=
hind a
NAT router.

Signed-off-by: Hiram Chirino <hiram@hiramchirino.com>
---
conn/controlfns_reuseport_unix.go | 32 ++++++++++++++++++++++++++++
conn/controlfns_reuseport_windows.go | 24 +++++++++++++++++++++
2 files changed, 56 insertions(+)
create mode 100644 conn/controlfns_reuseport_unix.go
create mode 100644 conn/controlfns_reuseport_windows.go

diff --git a/conn/controlfns_reuseport_unix.go
b/conn/controlfns_reuseport_unix.go
new file mode 100644
index 0000000..44d617b
--- /dev/null
+++ b/conn/controlfns_reuseport_unix.go
@@ -0,0 +1,32 @@
+//go:build !plan9 && !windows && !wasm && !js
+
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (C) 2017-2023 WireGuard LLC. All Rights Reserved.
+ */
+
+package conn
+
+import (
+ "golang.org/x/sys/unix"
+ "syscall"
+)
+
+func init() {
+
+ controlFns =3D append(controlFns,
+ func(network, address string, c syscall.RawConn) error {
+ return c.Control(func(fd uintptr) {
+ _ =3D unix.SetsockoptInt(int(fd), unix.SOL_SOCKET, unix.SO_REUSEADDR, 1)
+ })
+ },
+ )
+ controlFns =3D append(controlFns,
+ func(network, address string, c syscall.RawConn) error {
+ return c.Control(func(fd uintptr) {
+ _ =3D unix.SetsockoptInt(int(fd), unix.SOL_SOCKET, unix.SO_REUSEPORT, 1)
+ })
+ },
+ )
+
+}
diff --git a/conn/controlfns_reuseport_windows.go
b/conn/controlfns_reuseport_windows.go
new file mode 100644
index 0000000..2f8a7bf
--- /dev/null
+++ b/conn/controlfns_reuseport_windows.go
@@ -0,0 +1,24 @@
+//go:build windows
+
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (C) 2017-2023 WireGuard LLC. All Rights Reserved.
+ */
+
+package conn
+
+import (
+ "syscall"
+
+ "golang.org/x/sys/windows"
+)
+
+func init() {
+ controlFns =3D append(controlFns,
+ func(network, address string, c syscall.RawConn) error {
+ return c.Control(func(fd uintptr) {
+ _ =3D windows.SetsockoptInt(windows.Handle(fd), windows.SOL_SOCKET,
windows.SO_REUSEADDR, 1)
+ })
+ },
+ )
+}
--=20
2.37.1 (Apple Git-137.1)
