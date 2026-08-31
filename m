Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE241CA600A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ed692c1a;
	Mon, 5 Oct 2026 07:00:35 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5a343c3d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:47 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-47fd4531020so1855120f8f.3
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160547; x=1788765347; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cVx7h9itXB1zXN+d/HBlBz4+s1HpQEy8V546HmMKyYw=;
 b=VnIigHZShUI+1WNvr77fbi6lCx16pja9bAg8Cwecl13YAgcYZo1QTtJnM6qnyvbBx6
 uuUJRaJSivdA2GcUx5GYT8cuR4vUrt6ZyINKNhcujVkEAwHMF5alsnaBhEypVgBvJiWr
 TKpej85ShQq3+eBrOwo7Vge2Sdt+1r+DUldyss96p1rY2atsng74jtGqNCAWESWrZQSZ
 YqFmqqeZhcta1TaIFxkPBPMVFKpVjP0X7xTVLMHKSX9jf6Z1DuQkMn2fYnIdb6uFokZO
 W32O9C93uIwqfPB29y5cdWO/1V4pCynPY/ygaw6yyRRaejLhUR3MsGJFHuDdnJEkxUHf
 eTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160547; x=1788765347;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cVx7h9itXB1zXN+d/HBlBz4+s1HpQEy8V546HmMKyYw=;
 b=nVmFTXfCo2eAlTfVlGZl2xw2ZcJTXWBXnaQsxosaXIG4/M5tmHYlbOEwEdSQnRor+O
 uSzkPw+RQldssF63Q1Qjvs++lNGyasDf1I6refrc2KI6+4iCAriSIrzTnc+LF5ZU7OmM
 +3GsjFRK3gekopgbcYKciKl2Ji7rs4ZhK8hQwluViXPLVH53zLRoPa2mIkmswS2R8qFi
 zbw7DCCezsTFh3aDGNzxw6BHEkVh5H0f2gNXSoij4mcaMyOketxml1XFoa80ATFwF1TM
 lTN/p1ZQypJrHH4RAcYwUncr2A/lq3X6lDWY6jkWJXzIf8nbrATMhaFZS+yELsgk13De
 qPcg==
X-Gm-Message-State: AFuF++lgOuJ3aeWAIfBEl7CnAOv/HRq+0XBggR3NEekB7dR1NG54zLwl
 e4AX2UF9wT/SQywkovd5klvJ/PbEUFtVQGn0qaDunJ+N90bxKmncOBPA
X-Gm-Gg: AYBFou2zjGbZSb46HlfhgU0pVyqM2H+UPlmR493Mu+8Bq+19XtH1Kz4HnhoIHQabpVA
 a4+2Y9K7pR09zLyKxWN15ZGZOntkF+alTeB8ixa5Pwy8oSpy9rzX46i0Bod767Q8kB0Hrfv6G3M
 6ctPeBDjn/bRIRPhayA3nVURY0IMwhpg7A9yc5qxlDuiH32mE9z18dP/Gd+vORMLu1dzy/NPOwS
 gfbg3qhnmveyNYPjIjn44A+8a8V3G1XO1WoMbmwtHqkbmXRnmhc+K1pqYszI5eg8O7SgiB+6VhS
 wYrJl2sFnbJQjQfl9y+f8JdzXwVteutQwclXsE8IN6pTLNJuuExCkEs5P9WSABdw/Qdk0+lDXz/
 3cKlVR27SqVj71tAaaJki+bUFRqtoRk7HvrGuTrcbBwZGoXKnnj9T7HJ0tTQlp4tp4j9unL/ypi
 4GDjUFSGm1c7vHjYDqEHY2xrtYnuQd8fKS779Nl+K5yz1antZXtqJs65mpBPhNvtJJAiAEIllil
 8HvQTDel0603TCacAb5LDsYAQ==
X-Received: by 2002:a05:6000:46ca:b0:482:e707:f5e8 with SMTP id
 ffacd0b85a97d-482f79b04d6mr27399005f8f.10.1788160546715; 
 Mon, 31 Aug 2026 00:15:46 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:46 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 04/10] TunnelsManager: restrict
 single-tunnel activation policy to iOS
Date: Mon, 31 Aug 2026 10:15:31 +0300
Message-ID: <20260831071537.12966-5-razvan.cremenescu@gmail.com>
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

On iOS the OS allows only one active VPN configuration at a time, so
activating a tunnel first parks it in the .waiting state, deactivates
the tunnel currently in operation, and completes the activation once
the latter is fully down.

On macOS there is no such OS-level restriction: each tunnel is its own
NETunnelProviderManager session and multiple sessions can be active
simultaneously. Make the deactivate-then-activate handoff iOS-only, so
that on macOS activating a tunnel no longer tears down the tunnels
already in operation.

Also add tunnelsInOperation(), returning every non-inactive tunnel,
for use by the macOS UI. On multi-user systems the tunnels list
deliberately retains other users' tunnels; those are excluded, since
they are not this user's to display or deactivate.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 .../WireGuardApp/Tunnel/TunnelsManager.swift  | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
index 365094e..63e1847 100644
--- a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
+++ b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
@@ -24,7 +24,9 @@ class TunnelsManager {
     weak var tunnelsListDelegate: TunnelsManagerListDelegate?
     weak var activationDelegate: TunnelsManagerActivationDelegate?
     private var statusObservationToken: NotificationToken?
+    #if os(iOS)
     private var waiteeObservationToken: NSKeyValueObservation?
+    #endif
     private var configurationsObservationToken: NotificationToken?
 
     init(tunnelProviders: [NETunnelProviderManager]) {
@@ -428,6 +430,16 @@ class TunnelsManager {
         return tunnels.first { $0.status != .inactive }
     }
 
+    func tunnelsInOperation() -> [TunnelContainer] {
+        #if os(macOS)
+        // On multi-user systems the tunnels list retains other users'
+        // tunnels; those are not this user's to display or deactivate.
+        return tunnels.filter { $0.status != .inactive && $0.isTunnelAvailableToUser }
+        #else
+        return tunnels.filter { $0.status != .inactive }
+        #endif
+    }
+
     func startActivation(of tunnel: TunnelContainer) {
         guard tunnels.contains(tunnel) else { return } // Ensure it's not deleted
         guard tunnel.status == .inactive else {
@@ -435,6 +447,12 @@ class TunnelsManager {
             return
         }
 
+        #if os(iOS)
+        // In iOS, the OS allows only one VPN configuration to be active at a
+        // time, so bring down the tunnel in operation and queue this tunnel
+        // for activation once the former is fully deactivated. In macOS,
+        // multiple tunnels can be active simultaneously, so we activate the
+        // tunnel right away.
         if let alreadyWaitingTunnel = tunnels.first(where: { $0.status == .waiting }) {
             alreadyWaitingTunnel.status = .inactive
         }
@@ -458,6 +476,7 @@ class TunnelsManager {
             }
             return
         }
+        #endif
 
         #if targetEnvironment(simulator)
         tunnel.status = .active
@@ -489,6 +508,7 @@ class TunnelsManager {
         tunnels.forEach { $0.refreshStatus() }
     }
 
+    #if os(iOS)
     private func activateWaitingTunnelOnDeactivation(of tunnel: TunnelContainer) {
         waiteeObservationToken = tunnel.observe(\.status) { [weak self] tunnel, _ in
             guard let self = self else { return }
@@ -500,6 +520,7 @@ class TunnelsManager {
             }
         }
     }
+    #endif
 
     private func startObservingTunnelStatuses() {
         statusObservationToken = NotificationCenter.default.observe(name: .NEVPNStatusDidChange, object: nil, queue: OperationQueue.main) { [weak self] statusChangeNotification in
-- 
2.50.1 (Apple Git-155)

