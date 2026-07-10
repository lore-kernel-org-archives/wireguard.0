Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55113CA6004
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 9a6e8ba1;
	Mon, 5 Oct 2026 07:00:02 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id eb38f21f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:53 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493d92b7db3so8745955e9.2
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689773; x=1784294573; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+2JeTnA/dAs2wr2jW+iYqpZ6huku8khR5II7eemIcWs=;
 b=LNJYV8LyF2rDwIn+lM2xI13hTWBW7UP1GGT+/yN0R84QPLR4/pLEUX/i+yhoNzYBzS
 zSmVxhgyQsktl3nEqKWS/rBvJcPgqQNi8CSQJS69MPJthWmCxf7mQu4fNv/JIqESWAYf
 Sgl3p2A1GulxtldDOQwPOW/OoXd1xGJEhsGi73rzpNdTJ4EgX8cyVCJjBMrvKnG4ARRf
 FdqGWmYA7AQRARe/Sd7ZkiBdnNiRBhY0O1uqqE+hQaNc66vX7RyVgMuFzMVVMe9jP83v
 SG7vLnYAUz3c85/WrkY30Jtje5RmxEbwVIgx4mKe7iapaZxUTn++dsxX+EdCZnYhPzjR
 PSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689773; x=1784294573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+2JeTnA/dAs2wr2jW+iYqpZ6huku8khR5II7eemIcWs=;
 b=QYsD4T8mGx8Wx9bJoudjWnhYEcIGRqJhYwfBjcmagSlh326XFaSRLllP36qHVSjWCP
 kVDZ40w6eB7MGrCdzM63c1PFbKIYbda/lDCH6y/7d08EglMfVzF1utJ2ZmRAA6uLEg6E
 0mwYByJ4DwmmCBmPJpaHIW0JaL2r1Ixfch3/B2NO5bJxPu/xwanU1tkBVfxj8PqMb+jH
 P4Kug+9O2DnPXIlRo6IxYL3e2FszfubEhvEkeuppy/ygiL3Ciuxr+gnNnOv/vnp1qTTt
 BsSpWtkUqaepuLi4oh17c9H6Yjwea6miI9bV/jbMKGef6iJiSumMpfZn0LmL9ZhjENMv
 w9sg==
X-Gm-Message-State: AOJu0Yxvr/rdAdiak4vffJJhwJ+8bgUi6d7YrKPerXFy8VuLALYQyTtH
 KRykRxSWwVlIk2c4hCXUgBJm7zdPE7v9+rX8o1tv/1NfMA/9NKgh0Hwa5YPekyIX
X-Gm-Gg: AfdE7clcGO/M/5Z/z1GzLhvV/0tSJtt8MkuNS9asWxL7ea1i1E0bqEVDL4Gy+IbjSH7
 KZuwE7Hdv6LIiXhGqCd0dWPxlSUcHEqXkrD1DxxZqkeUMfVoRo/WwcJPviW+vlcXnpIVeg9zpso
 wVAkxuk/S5DXfRlwUVuToKdXh0wR5J2D6e50z418taAdbkKcknTtE26e4W486lJYbSlraJLUW7Y
 lPRLhxAQvwvEpYaZgoUH/0Lfb3zfVX8UHBSSKSzHgKw/lEto0lz7kiXuyZjwcW3ZDOPKq3e9VzX
 hUQHJEJ+TFAZsRR0/JNMPylSNnf6MGmOgrfvWOZ/L8GLCxbpFjDl16G7wmDO80SSLUmVtFwQCx1
 1F4h3fk4zHVj9G2cQZ9fyZG3evuBdlXyxtlQ9iLHqzPsKtSKTXMskOkIteootwljX32j/oCIqch
 pGwOUImv37hXOSU3C+Vst1xLxe/Az3FXAXwg43pthL/D1tJIaJL2xJgPrXs2hY
X-Received: by 2002:a05:6000:4709:b0:475:f0d1:eb60 with SMTP id
 ffacd0b85a97d-47df07c6075mr13231408f8f.59.1783689772895; 
 Fri, 10 Jul 2026 06:22:52 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:52 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 5/7] PacketTunnelProvider: only exit on stop
 of last tunnel in the process
Date: Fri, 10 Jul 2026 16:22:37 +0300
Message-ID: <20260710132242.39814-6-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
References: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
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

