Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BAFCA6005
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:15:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3f9fd0cd;
	Mon, 5 Oct 2026 07:00:05 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 1b755145
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Jul 2026 13:22:54 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-493ba701891so7866395e9.3
 for <wireguard@lists.zx2c4.com>; Fri, 10 Jul 2026 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783689774; x=1784294574; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KEvhk9JhPECp6rbYe65oHR2gR/OkwhAGeQaOtCX+ELQ=;
 b=ewsyzwPJ4zN8flXJEyOv346R04s9uW2PWUFSQLoAwmexARcYfc4cRJIiXC6y18vQd1
 yHm1FuxVrWK9V6VJbicXHRCDLPzchRJpYBXuY1pPN/nQ9khQUKYXvvpyNGNCXrl2G0R3
 hN01h/1BGVJRBkw2WiHvCq0j1J5swtJDa8eNqKrOuaDTtIgV5a0zmqWE9AvDGxZSL7wa
 5LRiTnuG7lk2r6xMZ+oKeEehVxFH/VKGWXvCIGdV05l8hwxJIqBwPgEV0bpDHgpXF43l
 Qo3uD16xz0tCYRe7tpNDRDaeGTSWEtVMCSB5A+FII9N7hrfz6WuLVyMlXEWhDCcL7T2F
 e3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783689774; x=1784294574;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KEvhk9JhPECp6rbYe65oHR2gR/OkwhAGeQaOtCX+ELQ=;
 b=VmRI6oXxpExLMpJRJvSPIDypNgUj7CH7NHhLTsepe2ncE/h6soxT7fUd2yDv6bzYHs
 FpbsZQbN7bzDmrO9U1+3rgYN/ttAVekVElT1BoA/b2J9J/YzLm8B0fY3yq88Kz7WOmvX
 /p8cMgRbGfiEw2LJ2Vn9iOAo49v2p3pKuUGLIQWO0LBLXY1NSo8plLDXlvyi0gpov6y0
 n1YlkWKX3ItWl0uEwBTXtFGRpdzfTu/tVTArBIdn7XZaG9gKEU99kW9FkEzvCYcb/bZx
 U5u6/FU/+rwCFfsdg5R6vnZ3k9RVirgRb63MXcYKha71QCstPJvjYMv+UBxqJ8jAKKAH
 Ubuw==
X-Gm-Message-State: AOJu0YxHkk22oZyTjaQCHF3zOxmO0SIBnvLmw3ZSHgQ2jwThqdOe/e5f
 8Flgc/I1mKYrCspnWpn55FmI/zyXS/Tr1MmG6Kv894db0xB/YIkz+tAd
X-Gm-Gg: AfdE7ckCCtoj00o2JYqaeqYDdiFxI/xiHzrakF9c5ZMi7oDIoaD3dNvvjBCQ69BeLEg
 1xVlvq2rL/0nbYwWYo/Ri6PexDcGzkirfR1o0PxzWu/rqYnQAyTZWS9Rh/dZq6GrCR3jr/wCHDC
 bBRQtEHt9N6T+2GrgqeQvzKM66ZM5IffApMR1AMV7n3Hra2kbjh8ucBLrvAsQLOmr4CvpDGRKHI
 oxDAO8g9CKLyxRFDXzUfctTqux9TgSdaOWpYb5CvT4CQ0hJ8Np7PYRWT7xRdi0rtQzYqWfDkbXn
 7x3cMAlimq295yHe0PFUWOVFoE9MISBcsK/AN3/FWg+tGQGXWLrkY1t0YVvT8Pv/74E3F47FImm
 89XCTFajtj4AzCyUUltnpz8by3UCzzmx2G8o2em8gYwcq15akKhnfVWSnUcBX/fjFEX1jdaeaL3
 r3K1uD/csvoLmSdC5Uvo1HNpQaE+9FbgE2BkaGJ4SsSJktDv+k0g==
X-Received: by 2002:a05:600c:c8a:b0:493:c3f9:65a2 with SMTP id
 5b1f17b1804b1-493e688cf81mr122166675e9.5.1783689774165; 
 Fri, 10 Jul 2026 06:22:54 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039bcdasm62653868f8f.21.2026.07.10.06.22.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jul 2026 06:22:53 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [PATCH wireguard-apple 6/7] macOS: support multiple simultaneous
 tunnels in the menu bar UI
Date: Fri, 10 Jul 2026 16:22:38 +0300
Message-ID: <20260710132242.39814-7-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
References: <20260710132242.39814-1-razvan.cremenescu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Now that TunnelsManager no longer serializes tunnel activation on
macOS, generalize the menu bar UI from tracking a single current
tunnel to tracking every tunnel in operation:

- TunnelsTracker publishes the list of non-inactive tunnels instead of
  a single currentTunnel slot.
- StatusMenu keeps the existing presentation when zero or one tunnel
  is in operation. With more than one, the status line shows the
  number of tunnels and the Deactivate item becomes Deactivate All,
  which deactivates every tunnel in operation, including tunnels that
  are still activating or restarting.
- StatusItemController shows the active icon when all tunnels in
  operation are active, and the progress animation while any of them
  is transitioning.
- AppDelegate's quit and App Store update alerts enumerate all active
  tunnels rather than just one; the App Store alert asks to disable
  on-demand only for the tunnels that actually have it enabled.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 .../Base.lproj/Localizable.strings            |  5 +++
 .../WireGuardApp/UI/macOS/AppDelegate.swift   | 31 ++++++++++++++-----
 .../UI/macOS/StatusItemController.swift       | 14 +++------
 .../WireGuardApp/UI/macOS/StatusMenu.swift    | 25 +++++++++++----
 .../UI/macOS/TunnelsTracker.swift             | 31 +++++++++----------
 5 files changed, 68 insertions(+), 38 deletions(-)

diff --git a/Sources/WireGuardApp/Base.lproj/Localizable.strings b/Sources/WireGuardApp/Base.lproj/Localizable.strings
index f181953..2e23a91 100644
--- a/Sources/WireGuardApp/Base.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/Base.lproj/Localizable.strings
@@ -64,6 +64,7 @@
 "macToggleStatusButtonActivate" = "Activate";
 "macToggleStatusButtonActivating" = "Activating…";
 "macToggleStatusButtonDeactivate" = "Deactivate";
+"macToggleStatusButtonDeactivateAll" = "Deactivate All";
 "macToggleStatusButtonDeactivating" = "Deactivating…";
 "macToggleStatusButtonReasserting" = "Reactivating…";
 "macToggleStatusButtonRestarting" = "Restarting…";
@@ -369,6 +370,7 @@
 // Mac status display
 
 "macStatus (%@)" = "Status: %@";
+"macStatusMultipleTunnels (%d)" = "%d tunnels";
 
 // Mac editing config
 
@@ -419,6 +421,7 @@
 "macConfirmAndQuitAlertMessage" = "Do you want to close the tunnels manager or quit WireGuard entirely?";
 "macConfirmAndQuitAlertInfo" = "If you close the tunnels manager, WireGuard will continue to be available from the menu bar icon.";
 "macConfirmAndQuitInfoWithActiveTunnel (%@)" = "If you close the tunnels manager, WireGuard will continue to be available from the menu bar icon.\n\nNote that if you quit WireGuard entirely the currently active tunnel ('%@') will still remain active until you deactivate it from this application or through the Network panel in System Preferences.";
+"macConfirmAndQuitInfoWithMultipleActiveTunnels (%@)" = "If you close the tunnels manager, WireGuard will continue to be available from the menu bar icon.\n\nNote that if you quit WireGuard entirely the currently active tunnels ('%@') will still remain active until you deactivate them from this application or through the Network panel in System Preferences.";
 "macConfirmAndQuitAlertQuitWireGuard" = "Quit WireGuard";
 "macConfirmAndQuitAlertCloseWindow" = "Close Tunnels Manager";
 
@@ -448,6 +451,8 @@
 "macAppStoreUpdatingAlertMessage" = "App Store would like to update WireGuard";
 "macAppStoreUpdatingAlertInfoWithOnDemand (%@)" = "Please disable on-demand for tunnel ‘%@’, deactivate it, and then continue updating in App Store.";
 "macAppStoreUpdatingAlertInfoWithoutOnDemand (%@)" = "Please deactivate tunnel ‘%@’ and then continue updating in App Store.";
+"macAppStoreUpdatingAlertInfoWithOnDemandMultiple (%@)" = "Please disable on-demand for tunnels ‘%@’, deactivate all active tunnels, and then continue updating in App Store.";
+"macAppStoreUpdatingAlertInfoWithoutOnDemandMultiple (%@)" = "Please deactivate tunnels ‘%@’ and then continue updating in App Store.";
 
 // Donation
 
diff --git a/Sources/WireGuardApp/UI/macOS/AppDelegate.swift b/Sources/WireGuardApp/UI/macOS/AppDelegate.swift
index 1dda3e6..b9c3a53 100644
--- a/Sources/WireGuardApp/UI/macOS/AppDelegate.swift
+++ b/Sources/WireGuardApp/UI/macOS/AppDelegate.swift
@@ -65,11 +65,18 @@ class AppDelegate: NSObject, NSApplicationDelegate {
         }
     }
 
+    private var activeTunnels: [TunnelContainer] {
+        return tunnelsTracker?.tunnelsInOperation.filter { $0.status == .active || $0.status == .activating } ?? []
+    }
+
     @objc func confirmAndQuit() {
         let alert = NSAlert()
         alert.messageText = tr("macConfirmAndQuitAlertMessage")
-        if let currentTunnel = tunnelsTracker?.currentTunnel, currentTunnel.status == .active || currentTunnel.status == .activating {
-            alert.informativeText = tr(format: "macConfirmAndQuitInfoWithActiveTunnel (%@)", currentTunnel.name)
+        let activeTunnels = self.activeTunnels
+        if activeTunnels.count == 1 {
+            alert.informativeText = tr(format: "macConfirmAndQuitInfoWithActiveTunnel (%@)", activeTunnels[0].name)
+        } else if activeTunnels.count > 1 {
+            alert.informativeText = tr(format: "macConfirmAndQuitInfoWithMultipleActiveTunnels (%@)", activeTunnels.map { $0.name }.joined(separator: ", "))
         } else {
             alert.informativeText = tr("macConfirmAndQuitAlertInfo")
         }
@@ -99,7 +106,7 @@ class AppDelegate: NSObject, NSApplicationDelegate {
             return
         }
         registerLoginItem(shouldLaunchAtLogin: false)
-        guard let currentTunnel = tunnelsTracker?.currentTunnel, currentTunnel.status == .active || currentTunnel.status == .activating else {
+        guard !activeTunnels.isEmpty else {
             NSApp.terminate(nil)
             return
         }
@@ -119,7 +126,8 @@ class AppDelegate: NSObject, NSApplicationDelegate {
     }
 
     func applicationShouldTerminate(_ sender: NSApplication) -> NSApplication.TerminateReply {
-        guard let currentTunnel = tunnelsTracker?.currentTunnel, currentTunnel.status == .active || currentTunnel.status == .activating else {
+        let activeTunnels = self.activeTunnels
+        guard !activeTunnels.isEmpty else {
             return .terminateNow
         }
         guard let appleEvent = NSAppleEventManager.shared().currentAppleEvent else {
@@ -130,10 +138,19 @@ class AppDelegate: NSObject, NSApplicationDelegate {
         }
         let alert = NSAlert()
         alert.messageText = tr("macAppStoreUpdatingAlertMessage")
-        if currentTunnel.isActivateOnDemandEnabled {
-            alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithOnDemand (%@)", currentTunnel.name)
+        let onDemandTunnels = activeTunnels.filter { $0.isActivateOnDemandEnabled }
+        if activeTunnels.count == 1 {
+            if onDemandTunnels.isEmpty {
+                alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithoutOnDemand (%@)", activeTunnels[0].name)
+            } else {
+                alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithOnDemand (%@)", activeTunnels[0].name)
+            }
         } else {
-            alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithoutOnDemand (%@)", currentTunnel.name)
+            if onDemandTunnels.isEmpty {
+                alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithoutOnDemandMultiple (%@)", activeTunnels.map { $0.name }.joined(separator: ", "))
+            } else {
+                alert.informativeText = tr(format: "macAppStoreUpdatingAlertInfoWithOnDemandMultiple (%@)", onDemandTunnels.map { $0.name }.joined(separator: ", "))
+            }
         }
         NSApp.activate(ignoringOtherApps: true)
         if let manageWindow = manageTunnelsWindowObject {
diff --git a/Sources/WireGuardApp/UI/macOS/StatusItemController.swift b/Sources/WireGuardApp/UI/macOS/StatusItemController.swift
index 3088574..e4ff7a5 100644
--- a/Sources/WireGuardApp/UI/macOS/StatusItemController.swift
+++ b/Sources/WireGuardApp/UI/macOS/StatusItemController.swift
@@ -4,7 +4,7 @@
 import Cocoa
 
 class StatusItemController {
-    var currentTunnel: TunnelContainer? {
+    var tunnelsInOperation: [TunnelContainer] = [] {
         didSet {
             updateStatusItemImage()
         }
@@ -27,20 +27,16 @@ class StatusItemController {
     }
 
     func updateStatusItemImage() {
-        guard let currentTunnel = currentTunnel else {
+        guard !tunnelsInOperation.isEmpty else {
             stopActivatingAnimation()
             statusItem.button?.image = statusBarImageWhenInactive
             return
         }
-        switch currentTunnel.status {
-        case .inactive:
-            stopActivatingAnimation()
-            statusItem.button?.image = statusBarImageWhenInactive
-        case .active:
+        if tunnelsInOperation.contains(where: { $0.status != .active }) {
+            startActivatingAnimation()
+        } else {
             stopActivatingAnimation()
             statusItem.button?.image = statusBarImageWhenActive
-        case .activating, .waiting, .reasserting, .restarting, .deactivating:
-            startActivatingAnimation()
         }
     }
 
diff --git a/Sources/WireGuardApp/UI/macOS/StatusMenu.swift b/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
index 45d2283..9ebdca2 100644
--- a/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
+++ b/Sources/WireGuardApp/UI/macOS/StatusMenu.swift
@@ -23,9 +23,9 @@ class StatusMenu: NSMenu {
     private var numberOfTunnelMenuItems = 0
     private var tunnelsPresentationStyle = StatusMenuTunnelsPresentationStyle.inline
 
-    var currentTunnel: TunnelContainer? {
+    var tunnelsInOperation: [TunnelContainer] = [] {
         didSet {
-            updateStatusMenuItems(with: currentTunnel)
+            updateStatusMenuItems()
         }
     }
     weak var windowDelegate: StatusMenuWindowDelegate?
@@ -73,15 +73,27 @@ class StatusMenu: NSMenu {
         self.deactivateMenuItem = deactivateMenuItem
     }
 
-    func updateStatusMenuItems(with tunnel: TunnelContainer?) {
+    func updateStatusMenuItems() {
         guard let statusMenuItem = statusMenuItem, let networksMenuItem = networksMenuItem, let deactivateMenuItem = deactivateMenuItem else { return }
-        guard let tunnel = tunnel else {
+        guard !tunnelsInOperation.isEmpty else {
             statusMenuItem.title = tr(format: "macStatus (%@)", tr("tunnelStatusInactive"))
             networksMenuItem.title = ""
             networksMenuItem.isHidden = true
+            deactivateMenuItem.title = tr("macToggleStatusButtonDeactivate")
             deactivateMenuItem.isHidden = true
             return
         }
+
+        guard tunnelsInOperation.count == 1 else {
+            statusMenuItem.title = tr(format: "macStatus (%@)", tr(format: "macStatusMultipleTunnels (%d)", tunnelsInOperation.count))
+            networksMenuItem.title = ""
+            networksMenuItem.isHidden = true
+            deactivateMenuItem.title = tr("macToggleStatusButtonDeactivateAll")
+            deactivateMenuItem.isHidden = !tunnelsInOperation.contains { $0.status == .active }
+            return
+        }
+
+        let tunnel = tunnelsInOperation[0]
         var statusText: String
 
         switch tunnel.status {
@@ -115,6 +127,7 @@ class StatusMenu: NSMenu {
             }
             networksMenuItem.isHidden = false
         }
+        deactivateMenuItem.title = tr("macToggleStatusButtonDeactivate")
         deactivateMenuItem.isHidden = tunnel.status != .active
     }
 
@@ -137,8 +150,8 @@ class StatusMenu: NSMenu {
     }
 
     @objc func deactivateClicked() {
-        if let currentTunnel = currentTunnel {
-            tunnelsManager.startDeactivation(of: currentTunnel)
+        for tunnel in tunnelsInOperation {
+            tunnelsManager.startDeactivation(of: tunnel)
         }
     }
 
diff --git a/Sources/WireGuardApp/UI/macOS/TunnelsTracker.swift b/Sources/WireGuardApp/UI/macOS/TunnelsTracker.swift
index 0ab59ee..ab8b478 100644
--- a/Sources/WireGuardApp/UI/macOS/TunnelsTracker.swift
+++ b/Sources/WireGuardApp/UI/macOS/TunnelsTracker.swift
@@ -12,28 +12,28 @@ class TunnelsTracker {
 
     weak var statusMenu: StatusMenu? {
         didSet {
-            statusMenu?.currentTunnel = currentTunnel
+            statusMenu?.tunnelsInOperation = tunnelsInOperation
         }
     }
     weak var statusItemController: StatusItemController? {
         didSet {
-            statusItemController?.currentTunnel = currentTunnel
+            statusItemController?.tunnelsInOperation = tunnelsInOperation
         }
     }
     weak var manageTunnelsRootVC: ManageTunnelsRootViewController?
 
     private var tunnelsManager: TunnelsManager
     private var tunnelStatusObservers = [AnyObject]()
-    private(set) var currentTunnel: TunnelContainer? {
+    private(set) var tunnelsInOperation: [TunnelContainer] {
         didSet {
-            statusMenu?.currentTunnel = currentTunnel
-            statusItemController?.currentTunnel = currentTunnel
+            statusMenu?.tunnelsInOperation = tunnelsInOperation
+            statusItemController?.tunnelsInOperation = tunnelsInOperation
         }
     }
 
     init(tunnelsManager: TunnelsManager) {
         self.tunnelsManager = tunnelsManager
-        currentTunnel = tunnelsManager.tunnelInOperation()
+        tunnelsInOperation = tunnelsManager.tunnelsInOperation()
 
         for index in 0 ..< tunnelsManager.numberOfTunnels() {
             let tunnel = tunnelsManager.tunnel(at: index)
@@ -46,15 +46,11 @@ class TunnelsTracker {
     }
 
     func observeStatus(of tunnel: TunnelContainer) -> AnyObject {
-        return tunnel.observe(\.status) { [weak self] tunnel, _ in
+        return tunnel.observe(\.status) { [weak self] _, _ in
             guard let self = self else { return }
-            if tunnel.status == .deactivating || tunnel.status == .inactive {
-                if self.currentTunnel == tunnel {
-                    self.currentTunnel = self.tunnelsManager.tunnelInOperation()
-                }
-            } else {
-                self.currentTunnel = tunnel
-            }
+            // Always reassign, so that observers get to update their
+            // presentation even when the set of tunnels doesn't change.
+            self.tunnelsInOperation = self.tunnelsManager.tunnelsInOperation()
         }
     }
 }
@@ -62,8 +58,8 @@ class TunnelsTracker {
 extension TunnelsTracker: TunnelsManagerListDelegate {
     func tunnelAdded(at index: Int) {
         let tunnel = tunnelsManager.tunnel(at: index)
-        if tunnel.status != .deactivating && tunnel.status != .inactive {
-            self.currentTunnel = tunnel
+        if tunnel.status != .inactive {
+            tunnelsInOperation = tunnelsManager.tunnelsInOperation()
         }
         let statusObservationToken = observeStatus(of: tunnel)
         tunnelStatusObservers.insert(statusObservationToken, at: index)
@@ -86,6 +82,9 @@ extension TunnelsTracker: TunnelsManagerListDelegate {
 
     func tunnelRemoved(at index: Int, tunnel: TunnelContainer) {
         tunnelStatusObservers.remove(at: index)
+        if tunnelsInOperation.contains(tunnel) {
+            tunnelsInOperation = tunnelsManager.tunnelsInOperation()
+        }
 
         statusMenu?.removeTunnelMenuItem(at: index)
         manageTunnelsRootVC?.tunnelsListVC?.tunnelRemoved(at: index)
-- 
2.50.1 (Apple Git-155)

