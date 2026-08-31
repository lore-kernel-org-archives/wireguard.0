Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9C2CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:35:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7f496797;
	Mon, 5 Oct 2026 07:00:40 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 13a094ae
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:51 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49557167508so32864925e9.1
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160551; x=1788765351; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=KEvhk9JhPECp6rbYe65oHR2gR/OkwhAGeQaOtCX+ELQ=;
 b=CQBU6fXnvWpl1pms/ldMBdyEdm18/R+1eKl+YnQJKMe5EXT+3jl4X1DPN0bd2KK6Lm
 8eXaBGIP2u5X4FbeIUuxK6Bpsucgop4/+HrjdUGY0T3iaXG2PKSZLhPlMSkO3tTqhZXB
 cbPHsmzwePAcptIqtq0fDrN7NOYeiG4pQpybGBd7lAq1MRBCnrAiKQ2N0vizwI5UlsBf
 r0ShkRIFw+4+TwM3erpctHBLcW+0OX5wJtQz1SKdMl71xm4qQDEtibSruMXLjag4anqm
 DAVHMl+qdYYStBiW1Y7/R1J1kUom6/A5gOJiBV2yiNerdWPGF0Xl9DLUm9h69sKuuyej
 QR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160551; x=1788765351;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=KEvhk9JhPECp6rbYe65oHR2gR/OkwhAGeQaOtCX+ELQ=;
 b=Cz8hHRyD6PgbnDDvqRYBcCfX0/DRxmz+N2RWF5+kEv0wMmtXMc8e2qxLYZlO43LMd6
 F7LN2bEf7k9wXIIfEtNLvyqw/Q4ZlRL0uA/jmNgOUOS7huljgdKiNyDpw6p7A8+HH5Ju
 qvp+i0Ker3CtV/ZNAL341npZTz9D5L+hywIQJtQfEgYedMLE8J5uEEgwaYgTYlHCLSiE
 t6c+xQxetwIpE9C0bgOJmulphQznEzRaRl9pmBvljEQ8EkxFWt3bZn9KNM0u7VN4IzPJ
 oUm5bBeq/Jck+edAOnhrfhp2slIBGl569Ooj1sJQwzR/ARkTz/6W5t/B8zhIFjmuTTNW
 diXw==
X-Gm-Message-State: AFuF++mHxbkhZaZSOmxTZdmXbOvseAET+z3JeHVg5wuRLg+rTe90nAK+
 //gIpLpnROmxtQbq6G69eoUVxE7NwTXBtNP6485iViYofzRdyAdhXEhLQBXPew==
X-Gm-Gg: AR+sD11ZJ5PKn7HncIgWV8fSQ57FVIgF9n2kjJbC4f71qLG4wH6VVyp7EuG1EShxZf7
 AetUYhhDuoj49L4mzHVKZ3L7Abw54iL/bwTnzwhgjIQWcsTVDKuU620QuGXDYVj/ZBAuOtmT4SE
 yW116LvAYYSuRyMCohLYBsoEUYPX3jq3faVrgyXJlbBw4X0cAiHQ1mbpEq46C9XJAGVCU60s5gR
 GZcTO0/m/goNc/GkpfIfAoTJVT9/uE9KjAEm1hIZX/dkxwpWOhK3HeK3s5QCV6qwp6kZFMphhgA
 rRs78oneoJfSbfp8CBa11c/FgYH36UBEC41YkBt4UVI7vvOBkOxGPx6JmfVJj6bg9ByNxaVAyXb
 r+v3dcOZYiHYH5HtghVU0yxB/9Wx3zFk+Oa2eFt8/09c4sJzLVYnwiKmCRqbqOFgi9Uof0dScQt
 jCDNRvKWrYMiX4uN4UV1CzjQ50WM+GyPhRBGAbdn0Q6XaQOU0zJVdsJa/3A3c1Lo8nvfoaRaHlf
 EvdS7yy3XRevYiw6FVwc6csIA==
X-Received: by 2002:a05:600c:c172:b0:499:dbba:9859 with SMTP id
 5b1f17b1804b1-49cd948532emr22961595e9.5.1788160550117; 
 Mon, 31 Aug 2026 00:15:50 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:48 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 06/10] macOS: support multiple
 simultaneous tunnels in the menu bar UI
Date: Mon, 31 Aug 2026 10:15:33 +0300
Message-ID: <20260831071537.12966-7-razvan.cremenescu@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
References: <20260831071537.12966-1-razvan.cremenescu@gmail.com>
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

