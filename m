Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89CD5CA600C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 336de90e;
	Mon, 5 Oct 2026 07:00:37 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id be6e2b8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:48 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-482fc3327fdso1364525f8f.2
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160548; x=1788765348; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+2JeTnA/dAs2wr2jW+iYqpZ6huku8khR5II7eemIcWs=;
 b=argByVYxTsyfDIfOMtMZzQWxL5fmFENgVq8HV6RN3i4sfdfz4KxXDkdIs7HtwBQW2/
 T8HZ2jQ+vztlNS21Q47phfR1fvbhnPIhORAiwx8uS3wEm3xIVt2pnxxyHtOn/Gd2snZn
 4s2pRkF7OhkTsZs403oGyo8kGSkv5NMZPAkxUy2v4kwOIiorNFRfy2p3QVOL7pLEIzBR
 cT9Ntl59UGNwQCm+TaJFFAcaenzrhtAsPIqrAGKtJODjFpCjrnTwF8As2wtTk8feFyaB
 rua8rsXMPBoIV1kuu5tApHcsLiyOyLKyVHoeAndeyD4BAo60z5Wioo5EEfekBtdrsPKs
 smUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160548; x=1788765348;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+2JeTnA/dAs2wr2jW+iYqpZ6huku8khR5II7eemIcWs=;
 b=KQR6vpkyDwMWCPmTAwsVwnN0DnWxSbmZDrYQ3pXntVsw8k/+VuJM8ahDZJc7RQAmXM
 P9vCwIo+4lN6Lc6Lxi0gw9G2h0qWrmZtBTbZxl7Ehs3Hv4b6yTjkdlNigkKeFoDQKbhN
 xO9gKrj9V0DkH5z0nHPXUdXaOC0LLmOxHXWoCgmqBz4Mc2jrTPs7sPE923/a4qLqLa5u
 Kjo/E/HMTjlqJ7rlKp61ZwRd0jQbiMF9rO9ByCjQyNKT/N1k3RN9m0B3v0DkbCvk8iQv
 HBU1RUjF4hIDJGnzxS7Wls5NOTG/rtCntQci425nBjJMKBOJNeRiFB3fA04o/QSgOo+z
 Y+7g==
X-Gm-Message-State: AFuF++lnhxB5zx8gmUeekk095OqXDH/765JGbCe4gvH6Z62dQImDuIKQ
 MGhlMaCreQvFFQ86sIZvDdT425ZyySzgGXVBG+OU8lj9TJCD19cp03FK
X-Gm-Gg: AYBFou1uPqJ0J+JB2EC0yzUFtNfnY0Pu4zosjyBTjuWUDVfO/GTZMfVvvIxefJCdv58
 LPUo7ldnLsOSRsQOk83eHesa29a9CU9b7eEhzIQIQcV52ieWoMlp/ynAK7Zrgh7vJLv4BGlc9yH
 BPp5LqGOBTI1ARIYoFLxsOkk1fDXziUaC+gsswSLeqC9z4xSQeW9tV8yGBB5fY9UvlC5/LoxVQE
 6nY5y644HS0fydq+eRkUW8+r8fe2eyceE6dDxb0ShW/1kWepJCzcf7mrOhFSs0yVwFUylTQ5Ek9
 Egl0wUQ/3WvKr3g5H8r3vm7o19DOrkL1Q3ElfhAxkTZHOSdNQ+57JDW7p4VTr0YG5MbNzVb1ueG
 sOc0In6XrQd/9srcvNoPjI/DIxCdGXaIa2rUIBrUt0w7x1dPJfY0VhtoYxRN46mMRRvJNDzwcK1
 BtZd0XpxqUvFp0CRLIekgGfypjE1KFBthNSsKSZ3uPBbhyOpKjPEHYht7u1i2sdD36Z0U6Rw4L6
 C1zAYhGwbp2mP9dvu4haL/s5/5BNuytNGs=
X-Received: by 2002:a05:6000:288c:b0:484:3bb9:25ca with SMTP id
 ffacd0b85a97d-4843bb92758mr7670629f8f.12.1788160547942; 
 Mon, 31 Aug 2026 00:15:47 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:47 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 05/10] PacketTunnelProvider: only exit
 on stop of last tunnel in the process
Date: Mon, 31 Aug 2026 10:15:32 +0300
Message-ID: <20260831071537.12966-6-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
References: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:59:44 +0000
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

stopTunnel() works around Apple bug 32073323 by calling exit(0) on
macOS. If the OS runs multiple simultaneous tunnel sessions in a
single extension process, exiting on the first stop would tear down
the remaining sessions too.

Keep a process-wide count of tunnels and only exit once the last one
is being stopped. The count covers the whole duration of a start
attempt - the adapter can spend seconds in DNS resolution and
interface setup - so that a tunnel stopping meanwhile doesn't consider
itself the last one in the process and kill a concurrent activation;
the failure paths of startTunnel() remove the tunnel from the count
again. When each session runs in its own process, the count is always
0 or 1 and the behavior is unchanged.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 .../PacketTunnelProvider.swift                | 50 ++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift b/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
index 913b7e6..fe09026 100644
--- a/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
+++ b/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
@@ -7,6 +7,38 @@ import os
 
 class PacketTunnelProvider: NEPacketTunnelProvider {
 
+    #if os(macOS)
+    // Number of tunnels starting or started in this process, used to ensure
+    // the exit(0) hack in stopTunnel() doesn't tear down other tunnels in
+    // case the OS runs multiple simultaneous tunnels in a single extension
+    // process. Tunnels are counted for the entire duration of the start
+    // attempt, so that another tunnel stopping meanwhile doesn't consider
+    // itself the last one in the process.
+    private static var startedTunnelCount = 0
+    private static let startedTunnelCountLock = NSLock()
+    private var hasStartedTunnel = false
+
+    private func registerStartedTunnel() {
+        PacketTunnelProvider.startedTunnelCountLock.lock()
+        PacketTunnelProvider.startedTunnelCount += 1
+        hasStartedTunnel = true
+        PacketTunnelProvider.startedTunnelCountLock.unlock()
+    }
+
+    // Returns true if this was the last starting or started tunnel in the
+    // process, i.e. the process is free to exit.
+    @discardableResult
+    private func unregisterStartedTunnel() -> Bool {
+        PacketTunnelProvider.startedTunnelCountLock.lock()
+        defer { PacketTunnelProvider.startedTunnelCountLock.unlock() }
+        if hasStartedTunnel {
+            hasStartedTunnel = false
+            PacketTunnelProvider.startedTunnelCount -= 1
+        }
+        return PacketTunnelProvider.startedTunnelCount == 0
+    }
+    #endif
+
     private lazy var adapter: WireGuardAdapter = {
         return WireGuardAdapter(with: self) { logLevel, message in
             wg_log(logLevel.osLogLevel, message: message)
@@ -21,9 +53,16 @@ class PacketTunnelProvider: NEPacketTunnelProvider {
 
         wg_log(.info, message: "Starting tunnel from the " + (activationAttemptId == nil ? "OS directly, rather than the app" : "app"))
 
+        #if os(macOS)
+        registerStartedTunnel()
+        #endif
+
         guard let tunnelProviderProtocol = self.protocolConfiguration as? NETunnelProviderProtocol,
               let tunnelConfiguration = tunnelProviderProtocol.asTunnelConfiguration() else {
             errorNotifier.notify(PacketTunnelProviderError.savedProtocolConfigurationIsInvalid)
+            #if os(macOS)
+            unregisterStartedTunnel()
+            #endif
             completionHandler(PacketTunnelProviderError.savedProtocolConfigurationIsInvalid)
             return
         }
@@ -39,6 +78,10 @@ class PacketTunnelProvider: NEPacketTunnelProvider {
                 return
             }
 
+            #if os(macOS)
+            self.unregisterStartedTunnel()
+            #endif
+
             switch adapterError {
             case .cannotLocateTunnelFileDescriptor:
                 wg_log(.error, staticMessage: "Starting tunnel failed: could not determine file descriptor")
@@ -84,7 +127,12 @@ class PacketTunnelProvider: NEPacketTunnelProvider {
             // HACK: This is a filthy hack to work around Apple bug 32073323 (dup'd by us as 47526107).
             // Remove it when they finally fix this upstream and the fix has been rolled out to
             // sufficient quantities of users.
-            exit(0)
+            // Since multiple tunnels may be active simultaneously, only exit
+            // once the last starting or started tunnel in this process is
+            // being stopped.
+            if self.unregisterStartedTunnel() {
+                exit(0)
+            }
             #endif
         }
     }
-- 
2.50.1 (Apple Git-155)

