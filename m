Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F8CCA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 20fc4e3c;
	Mon, 5 Oct 2026 06:59:59 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 67673571
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:52 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-493e4ccccc2so6861265e9.2
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689772; x=1784294572; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cVx7h9itXB1zXN+d/HBlBz4+s1HpQEy8V546HmMKyYw=;
 b=k+6+8D+rkjcrRZb2as0cJPO1MwAJY7sL6Tv2tTS0V4ES7hCwwEoftp2Z1hKNgEf51K
 r7UgrMdK4EUQDalkr2EBfQkGyEoh2A//3Gag4uJUyiFVEQp1/hF5QbMdgLQCSfGyir3H
 lKejoo30qZ0NKboj6JZwwg/gwYPXzvOaWZv9/ecbZKEZqN1ZQauIJ6FLW+bKkvG/hTVF
 gYFNz7ssuILBS0dc6E9F1yNOSOqK5BWSD6FHATUqYKldN41BdPAPjmSaUKuepz+76F5f
 TrvHR1gjh0W2/og2bmBqGkaGY5M+ZOltrfZhSJ5hhUUpwe1I4PRsINfiDSJeRZoukF04
 kaeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689772; x=1784294572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cVx7h9itXB1zXN+d/HBlBz4+s1HpQEy8V546HmMKyYw=;
 b=BeOxZ/HV+vICqCnSfYcx5c2WZyKZ3KpqaY9kD308u1qfo3aPGB9cbp3o5MYkbsbHro
 H94NM6rqQ6Q2GwVmuexjK/NIglJW2pCVtfvyStlITFMFYxfuXI7mxPuGj95bg8ugOIl8
 90I6KoGh7Jv/ZRoctca+/gpbg4Ivf9m93axOKHaii050n/S7kdbd29R/RnRwI58JtAzU
 HcTwJfCUZYjq56w3de+2LkafOZG7gk1VJfPk3OJFH/o7tjE5mZoSeUgBKXX3nNjsCJBZ
 Ugth6H3aEtphpjh+nrLKKDQxrpergqHEyYdsDyw4e4NDLXdHUzI1rQp2ozBpGwjfb2jB
 XtNA==
X-Gm-Message-State: AOJu0YxdjQsZQDnRmytj1OaPeRnN7Je78nx6KZXR/ATTk9LWX7UNfb0/
 KZVXpgZuJRI0sVty9TvEmtTp8PWHLx6BIKWKiSjCEPhWbRc3lDpY95g3
X-Gm-Gg: AfdE7clsRS4rQmB9+FnSLWSbHh+jDjDtzjHijyfI/NIRNapbasKE+QT9kAw68LXXL1h
 +Lii1Dnqkngww+C4JoeCnWbOQd3sTZQXnYrrENM0E61NTqSmVHyOG6Wing7tM97ua2bnEuRr0pN
 AKzzK7VRwKIAIThYWuQN3SLzxMjwTWZ5ds3hKOUk+6XEsuIynzdg3gt+0UVgcUn7+3v35d2ED96
 0+Ewp2cQ4rvmCgUWqbFTkZv9zhL8kN5LsRskG5lHeP3npH+P+RUPPF6n6pZHdHJWOe4xmxOaS5I
 y86wZavTtXOpMCYAFMuAMn7ccyyWAxlLYMefjwHDsPsLczkYFhY2UQBn3eauSK2M0CxCJD4Mw/G
 unfa/WQJu8Hyi2I5FLEBgl+nUtebPdaHtPEdBHHJnETom2K2zInf/gpcvKXSn353rinHbf+fpz7
 aLe4xRmKFzGjQMTYVJOXCBt6huiNWJSU2MPYkSsFooP0b2SsCnAw==
X-Received: by 2002:a5d:5f50:0:b0:47b:69a5:7263 with SMTP id
 ffacd0b85a97d-47df071c18fmr13320377f8f.5.1783689771708; 
 Fri, 10 Jul 2026 06:22:51 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:51 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 4/7] TunnelsManager: restrict single-tunnel
 activation policy to iOS
Date: Fri, 10 Jul 2026 16:22:36 +0300
Message-ID: <20260710132242.39814-5-razvan.cremenescu@gmail.com>
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

