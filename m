Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797A3CA5FF0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:35:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id da00e1ff;
	Mon, 5 Oct 2026 07:00:38 +0000 (UTC)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3a3ac4f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso12104085e9.3
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160552; x=1788765352; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e8DbLy3F3I4hbA4JWkUsvbW3rOvsY6jvkMfCBMbRMYM=;
 b=TICNoWk9CdwmW6ZXccOYPtEx6XIZyzb9RaEn+xYUII7jvnFTsr7SH+QiAcLHr+e/M9
 u/fh10gncRWkoYsmg558RZYq8bURP2oy7kOtKUI1bcdrnh/RqcFXJ7SF1AurRUWRVScQ
 cjAWsxQH8lDzkSokxWmdleqg1h3t7NHvA0RRMuP28ph/rmmB1J2bW6bVEdjD71ybseHx
 NE92MiPisVrj2mo3K9vA1MA1TjdyHMMDq4xmX2lhFf4auEcXRXqj3nKJl3ph4PkCSbqc
 C5uaykdWPl2ioflOlBBZE+C3W6muODK8kkL+Utvn6axMnYhom3Qt1bMifrf1fJZbuxBB
 Tmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160552; x=1788765352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e8DbLy3F3I4hbA4JWkUsvbW3rOvsY6jvkMfCBMbRMYM=;
 b=oK99wJ/f0TxUyErI+mwkIXUFymoQqZqTA27v19zt/HpBzr7WouFVoLfZ/7bRLViqTI
 fwV96L3VFSqwfJ2L7w9VqTXISisCrcfCkEFEITuHnzXrkAJgO4RFkxBsx/m2yrih48lJ
 YVUiAUe0PMAiuoOgvsvPx95klLKSRQKIlW/trY3x3C1K+A6B5b506f4cbyEZCK6NWKQV
 EcEjRw++IBZeofwdxec2sunKIU7UmlkcvsRCv2myzfTN9bo1pfLvK0JgmiG2AW+qtoxo
 xaCeYRDDUa55a4cv5ubRzx2k7OyMKhOkaxyV1g6Tj5X+7/CiHkUfP0e7XGz2NPjYWX9l
 wbag==
X-Gm-Message-State: AFuF++lv0ezAHCjlydPO/HbZeqCuHVDlEF9VvNW0SknKWKyv1h4FbMBR
 sh9a8s603muObFrtYlZpsQ8i6v+w7J0TkhCWMeRAGcZxMW5Im1z66mqc
X-Gm-Gg: AR+sD10Fr5zGQgh1LFkVAMkcd/1fLGmNjuu+5Ub1dsvmWOFQFC4smNFSDRf5f+9vBBy
 cu6KgdhRkfopfn+FQxVSFBjyZR+AQUVwfi0m/7fX6IOcjd7CZXuKXrvEDGO5hyKsaOfpsiDVwBp
 R7yyCLMzWxl0uAL/OMmzlMfcYjENvaVlTFmFEdyXtmWNtGss9DjlEWclDXc4Qrtqra2B1XDNVNM
 iQ4Is1DRPDb6hpN2QjIIAgBojHjAG2q4/Bm8SM/LmwT6S21spfX4Nqn56k30kjeIDFHespCitez
 l5oynWDyQM2FknHv+pxz9Ehla4DrQGchKmNvoczCFdoWVRMIV7RNIYLwGQgwLieBO3fcq/1iDPl
 UHP1FUcN9c/LhMztVSiiDojv5X2ovdC6hFQSOuZZOkv0tfQjGTueb9S3u65gUb8erjV3lbSuxzq
 L0xZDvvT0xoCAGQnt6/MLkCW+Sk8TZqQDLAGysmeWhFUu9Rxgns7O2TgqwILxpPcTBO+Fny+SjH
 beGutJ9PfC+Z/VpEsbzIYdA6A==
X-Received: by 2002:a05:600c:c08a:b0:49b:9657:e32e with SMTP id
 5b1f17b1804b1-49b9657e6e7mr303063425e9.8.1788160551757; 
 Mon, 31 Aug 2026 00:15:51 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:50 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 07/10] Add opt-in split DNS support
Date: Mon, 31 Aug 2026 10:15:34 +0300
Message-ID: <20260831071537.12966-8-razvan.cremenescu@gmail.com>
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

When a tunnel lists DNS search domains (the non-IP entries of the
wg-quick DNS= line), the tunnel's DNS servers have so far always been
installed as the system-wide resolver (match domains [""]) while the
search domains only served for completing short names. With multiple
simultaneous tunnels this makes concurrently active tunnels fight over
system DNS, and there was no way to use a tunnel's DNS only for the
internal domains behind that tunnel.

Add a per-tunnel Split DNS toggle, stored in the provider
configuration alongside the existing keys so the wg-quick config text
remains untouched and portable. When enabled and the tunnel has search
domains, the DNS servers are installed with the search domains as
match domains, so only queries for those domains go through the
tunnel; everything else stays on the system resolver. The default
remains the current match-everything behavior, so existing full-tunnel
setups keep their leak-free DNS.

The toggle is exposed as a checkbox in the macOS tunnel editor and as
a switch in the iOS tunnel editor, and toggling it restarts an active
tunnel the same way a configuration edit does.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 .../NETunnelProviderProtocol+Extension.swift  | 26 +++++++++++++
 .../Base.lproj/Localizable.strings            |  6 +++
 .../WireGuardApp/Tunnel/TunnelsManager.swift  | 17 +++++++-
 .../TunnelEditTableViewController.swift       | 39 ++++++++++++++++++-
 .../TunnelEditViewController.swift            | 21 +++++++++-
 .../PacketTunnelSettingsGenerator.swift       | 12 +++++-
 Sources/WireGuardKit/WireGuardAdapter.swift   | 13 ++++++-
 .../PacketTunnelProvider.swift                |  2 +-
 8 files changed, 125 insertions(+), 11 deletions(-)

diff --git a/Sources/Shared/Model/NETunnelProviderProtocol+Extension.swift b/Sources/Shared/Model/NETunnelProviderProtocol+Extension.swift
index 0a303f4..8f56434 100644
--- a/Sources/Shared/Model/NETunnelProviderProtocol+Extension.swift
+++ b/Sources/Shared/Model/NETunnelProviderProtocol+Extension.swift
@@ -12,6 +12,21 @@ enum PacketTunnelProviderError: String, Error {
 }
 
 extension NETunnelProviderProtocol {
+    private static let splitDNSKey = "SplitDNS"
+
+    /// When enabled, the tunnel's DNS servers are used only for the tunnel's
+    /// DNS search domains rather than for all queries on the system.
+    var isSplitDNSEnabled: Bool {
+        get {
+            return providerConfiguration?[Self.splitDNSKey] as? Bool ?? false
+        }
+        set {
+            var configuration = providerConfiguration ?? [:]
+            configuration[Self.splitDNSKey] = newValue
+            providerConfiguration = configuration
+        }
+    }
+
     convenience init?(tunnelConfiguration: TunnelConfiguration, previouslyFrom old: NEVPNProtocol? = nil) {
         self.init()
 
@@ -25,6 +40,9 @@ extension NETunnelProviderProtocol {
         #if os(macOS)
         providerConfiguration = ["UID": getuid()]
         #endif
+        if let old = old as? NETunnelProviderProtocol, old.isSplitDNSEnabled {
+            isSplitDNSEnabled = true
+        }
 
         let endpoints = tunnelConfiguration.peers.compactMap { $0.endpoint }
         if endpoints.count == 1 {
@@ -64,6 +82,7 @@ extension NETunnelProviderProtocol {
          * around so that .mobileconfig files are easier.
          */
         if let oldConfig = providerConfiguration?["WgQuickConfig"] as? String {
+            let wasSplitDNSEnabled = isSplitDNSEnabled
             #if os(macOS)
             providerConfiguration = ["UID": getuid()]
             #elseif os(iOS)
@@ -71,6 +90,9 @@ extension NETunnelProviderProtocol {
             #else
             #error("Unimplemented")
             #endif
+            if wasSplitDNSEnabled {
+                isSplitDNSEnabled = true
+            }
             guard passwordReference == nil else { return true }
             wg_log(.info, message: "Migrating tunnel configuration '\(name)'")
             passwordReference = Keychain.makeReference(containing: oldConfig, called: name)
@@ -78,7 +100,11 @@ extension NETunnelProviderProtocol {
         }
         #if os(macOS)
         if passwordReference != nil && providerConfiguration?["UID"] == nil && verifyConfigurationReference() {
+            let wasSplitDNSEnabled = isSplitDNSEnabled
             providerConfiguration = ["UID": getuid()]
+            if wasSplitDNSEnabled {
+                isSplitDNSEnabled = true
+            }
             return true
         }
         #elseif os(iOS)
diff --git a/Sources/WireGuardApp/Base.lproj/Localizable.strings b/Sources/WireGuardApp/Base.lproj/Localizable.strings
index 2e23a91..cacb316 100644
--- a/Sources/WireGuardApp/Base.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/Base.lproj/Localizable.strings
@@ -97,6 +97,12 @@
 "tunnelPeerLastHandshakeTime" = "Latest handshake";
 "tunnelPeerExcludePrivateIPs" = "Exclude private IPs";
 
+"tunnelSectionTitleSplitDNS" = "DNS";
+"tunnelEditSplitDNS" = "Split DNS";
+"tunnelEditSplitDNSTooltip" = "Use the tunnel's DNS servers only for the tunnel's DNS search domains, instead of for all queries on the system.";
+"alertSplitDNSRequiresSearchDomainsTitle" = "Split DNS requires DNS servers and search domains";
+"alertSplitDNSRequiresSearchDomainsMessage" = "To use split DNS, list both the DNS servers and the domains to route through them in the tunnel's DNS entry, e.g.: 'DNS = 10.0.0.53, corp.example.com'";
+
 "tunnelSectionTitleOnDemand" = "On-Demand Activation";
 
 "tunnelOnDemandCellular" = "Cellular";
diff --git a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
index 63e1847..18829fe 100644
--- a/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
+++ b/Sources/WireGuardApp/Tunnel/TunnelsManager.swift
@@ -119,7 +119,7 @@ class TunnelsManager {
         }
     }
 
-    func add(tunnelConfiguration: TunnelConfiguration, onDemandOption: ActivateOnDemandOption = .off, completionHandler: @escaping (Result<TunnelContainer, TunnelsManagerError>) -> Void) {
+    func add(tunnelConfiguration: TunnelConfiguration, onDemandOption: ActivateOnDemandOption = .off, isSplitDNSEnabled: Bool = false, completionHandler: @escaping (Result<TunnelContainer, TunnelsManagerError>) -> Void) {
         let tunnelName = tunnelConfiguration.name ?? ""
         if tunnelName.isEmpty {
             completionHandler(.failure(TunnelsManagerError.tunnelNameEmpty))
@@ -133,6 +133,7 @@ class TunnelsManager {
 
         let tunnelProviderManager = NETunnelProviderManager()
         tunnelProviderManager.setTunnelConfiguration(tunnelConfiguration)
+        (tunnelProviderManager.protocolConfiguration as? NETunnelProviderProtocol)?.isSplitDNSEnabled = isSplitDNSEnabled
         tunnelProviderManager.isEnabled = true
 
         onDemandOption.apply(on: tunnelProviderManager)
@@ -210,6 +211,7 @@ class TunnelsManager {
 
     func modify(tunnel: TunnelContainer, tunnelConfiguration: TunnelConfiguration,
                 onDemandOption: ActivateOnDemandOption,
+                isSplitDNSEnabled: Bool? = nil,
                 shouldEnsureOnDemandEnabled: Bool = false,
                 completionHandler: @escaping (TunnelsManagerError?) -> Void) {
         let tunnelName = tunnelConfiguration.name ?? ""
@@ -224,7 +226,8 @@ class TunnelsManager {
         if isIntroducingOnDemandRules && tunnel.status != .inactive && tunnel.status != .deactivating {
             tunnel.onDeactivated = { [weak self] in
                 self?.modify(tunnel: tunnel, tunnelConfiguration: tunnelConfiguration,
-                             onDemandOption: onDemandOption, shouldEnsureOnDemandEnabled: true,
+                             onDemandOption: onDemandOption, isSplitDNSEnabled: isSplitDNSEnabled,
+                             shouldEnsureOnDemandEnabled: true,
                              completionHandler: completionHandler)
             }
             self.startDeactivation(of: tunnel)
@@ -248,6 +251,12 @@ class TunnelsManager {
             tunnelProviderManager.setTunnelConfiguration(tunnelConfiguration)
             isTunnelConfigurationChanged = true
         }
+        if let isSplitDNSEnabled = isSplitDNSEnabled,
+           let proto = tunnelProviderManager.protocolConfiguration as? NETunnelProviderProtocol,
+           proto.isSplitDNSEnabled != isSplitDNSEnabled {
+            proto.isSplitDNSEnabled = isSplitDNSEnabled
+            isTunnelConfigurationChanged = true
+        }
         tunnelProviderManager.isEnabled = true
 
         let isActivatingOnDemand = !tunnelProviderManager.isOnDemandEnabled && shouldEnsureOnDemandEnabled
@@ -637,6 +646,10 @@ class TunnelContainer: NSObject {
         return ActivateOnDemandOption(from: tunnelProvider)
     }
 
+    var isSplitDNSEnabled: Bool {
+        return (tunnelProvider.protocolConfiguration as? NETunnelProviderProtocol)?.isSplitDNSEnabled ?? false
+    }
+
     #if os(macOS)
     var isTunnelAvailableToUser: Bool {
         return (tunnelProvider.protocolConfiguration as? NETunnelProviderProtocol)?.providerConfiguration?["UID"] as? uid_t == getuid()
diff --git a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController.swift b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController.swift
index dfb35c6..e79686f 100644
--- a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController.swift
+++ b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController.swift
@@ -13,12 +13,14 @@ class TunnelEditTableViewController: UITableViewController {
         case interface
         case peer(_ peer: TunnelViewModel.PeerData)
         case addPeer
+        case splitDNS
         case onDemand
 
         static func == (lhs: Section, rhs: Section) -> Bool {
             switch (lhs, rhs) {
             case (.interface, .interface),
                  (.addPeer, .addPeer),
+                 (.splitDNS, .splitDNS),
                  (.onDemand, .onDemand):
                 return true
             case let (.peer(peerA), .peer(peerB)):
@@ -53,6 +55,7 @@ class TunnelEditTableViewController: UITableViewController {
     let tunnel: TunnelContainer?
     let tunnelViewModel: TunnelViewModel
     var onDemandViewModel: ActivateOnDemandViewModel
+    private var isSplitDNSEnabled: Bool
     private var sections = [Section]()
 
     // Use this initializer to edit an existing tunnel.
@@ -61,6 +64,7 @@ class TunnelEditTableViewController: UITableViewController {
         self.tunnel = tunnel
         tunnelViewModel = TunnelViewModel(tunnelConfiguration: tunnel.tunnelConfiguration)
         onDemandViewModel = ActivateOnDemandViewModel(tunnel: tunnel)
+        isSplitDNSEnabled = tunnel.isSplitDNSEnabled
         super.init(style: .grouped)
         loadSections()
     }
@@ -71,6 +75,7 @@ class TunnelEditTableViewController: UITableViewController {
         tunnel = nil
         tunnelViewModel = TunnelViewModel(tunnelConfiguration: nil)
         onDemandViewModel = ActivateOnDemandViewModel()
+        isSplitDNSEnabled = false
         super.init(style: .grouped)
         loadSections()
     }
@@ -100,6 +105,7 @@ class TunnelEditTableViewController: UITableViewController {
         interfaceFieldsBySection.forEach { _ in sections.append(.interface) }
         tunnelViewModel.peersData.forEach { sections.append(.peer($0)) }
         sections.append(.addPeer)
+        sections.append(.splitDNS)
         sections.append(.onDemand)
     }
 
@@ -113,10 +119,14 @@ class TunnelEditTableViewController: UITableViewController {
             ErrorPresenter.showErrorAlert(title: alertTitle, message: errorMessage, from: self)
             tableView.reloadData() // Highlight erroring fields
         case .saved(let tunnelConfiguration):
+            if isSplitDNSEnabled && (tunnelConfiguration.interface.dns.isEmpty || tunnelConfiguration.interface.dnsSearch.filter({ !$0.isEmpty }).isEmpty) {
+                ErrorPresenter.showErrorAlert(title: tr("alertSplitDNSRequiresSearchDomainsTitle"), message: tr("alertSplitDNSRequiresSearchDomainsMessage"), from: self)
+                return
+            }
             let onDemandOption = onDemandViewModel.toOnDemandOption()
             if let tunnel = tunnel {
                 // We're modifying an existing tunnel
-                tunnelsManager.modify(tunnel: tunnel, tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption) { [weak self] error in
+                tunnelsManager.modify(tunnel: tunnel, tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption, isSplitDNSEnabled: isSplitDNSEnabled) { [weak self] error in
                     if let error = error {
                         ErrorPresenter.showErrorAlert(error: error, from: self)
                     } else {
@@ -126,7 +136,7 @@ class TunnelEditTableViewController: UITableViewController {
                 }
             } else {
                 // We're adding a new tunnel
-                tunnelsManager.add(tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption) { [weak self] result in
+                tunnelsManager.add(tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption, isSplitDNSEnabled: isSplitDNSEnabled) { [weak self] result in
                     switch result {
                     case .failure(let error):
                         ErrorPresenter.showErrorAlert(error: error, from: self)
@@ -161,6 +171,8 @@ extension TunnelEditTableViewController {
             return peerFieldsToShow.count
         case .addPeer:
             return 1
+        case .splitDNS:
+            return 1
         case .onDemand:
             if onDemandViewModel.isWiFiInterfaceEnabled {
                 return 3
@@ -178,11 +190,22 @@ extension TunnelEditTableViewController {
             return tr("tunnelSectionTitlePeer")
         case .addPeer:
             return nil
+        case .splitDNS:
+            return tr("tunnelSectionTitleSplitDNS")
         case .onDemand:
             return tr("tunnelSectionTitleOnDemand")
         }
     }
 
+    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
+        switch sections[section] {
+        case .splitDNS:
+            return tr("tunnelEditSplitDNSTooltip")
+        default:
+            return nil
+        }
+    }
+
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         switch sections[indexPath.section] {
         case .interface:
@@ -191,6 +214,8 @@ extension TunnelEditTableViewController {
             return peerCell(for: tableView, at: indexPath, with: peerData)
         case .addPeer:
             return addPeerCell(for: tableView, at: indexPath)
+        case .splitDNS:
+            return splitDNSCell(for: tableView, at: indexPath)
         case .onDemand:
             return onDemandCell(for: tableView, at: indexPath)
         }
@@ -423,6 +448,16 @@ extension TunnelEditTableViewController {
         return cell
     }
 
+    private func splitDNSCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
+        let cell: SwitchCell = tableView.dequeueReusableCell(for: indexPath)
+        cell.message = tr("tunnelEditSplitDNS")
+        cell.isOn = isSplitDNSEnabled
+        cell.onSwitchToggled = { [weak self] isOn in
+            self?.isSplitDNSEnabled = isOn
+        }
+        return cell
+    }
+
     private func onDemandCell(for tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
         let field = onDemandFields[indexPath.row]
         if indexPath.row < 2 {
diff --git a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelEditViewController.swift b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelEditViewController.swift
index 851498a..8065bdc 100644
--- a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelEditViewController.swift
+++ b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelEditViewController.swift
@@ -60,6 +60,15 @@ class TunnelEditViewController: NSViewController {
         return checkbox
     }()
 
+    let splitDNSCheckbox: NSButton = {
+        let checkbox = NSButton()
+        checkbox.title = tr("tunnelEditSplitDNS")
+        checkbox.toolTip = tr("tunnelEditSplitDNSTooltip")
+        checkbox.setButtonType(.switch)
+        checkbox.state = .off
+        return checkbox
+    }()
+
     let discardButton: NSButton = {
         let button = NSButton()
         button.title = tr("macEditDiscard")
@@ -106,6 +115,7 @@ class TunnelEditViewController: NSViewController {
             // Editing an existing tunnel
             let tunnelConfiguration = tunnel.tunnelConfiguration!
             nameRow.value = tunnel.name
+            splitDNSCheckbox.state = tunnel.isSplitDNSEnabled ? .on : .off
             textView.string = tunnelConfiguration.asWgQuickConfig()
             publicKeyRow.value = tunnelConfiguration.interface.privateKey.publicKey.base64Key
             textView.privateKeyString = tunnelConfiguration.interface.privateKey.base64Key
@@ -163,6 +173,7 @@ class TunnelEditViewController: NSViewController {
 
         let buttonRowStackView = NSStackView()
         buttonRowStackView.setViews([discardButton, saveButton], in: .trailing)
+        buttonRowStackView.addView(splitDNSCheckbox, in: .leading)
         buttonRowStackView.addView(excludePrivateIPsCheckbox, in: .leading)
         buttonRowStackView.orientation = .horizontal
         buttonRowStackView.spacing = internalSpacing
@@ -229,11 +240,17 @@ class TunnelEditViewController: NSViewController {
             }
         }
 
+        let isSplitDNSEnabled = splitDNSCheckbox.state == .on
+        if isSplitDNSEnabled && (tunnelConfiguration.interface.dns.isEmpty || tunnelConfiguration.interface.dnsSearch.filter({ !$0.isEmpty }).isEmpty) {
+            ErrorPresenter.showErrorAlert(title: tr("alertSplitDNSRequiresSearchDomainsTitle"), message: tr("alertSplitDNSRequiresSearchDomainsMessage"), from: self)
+            return
+        }
+
         setUserInteractionEnabled(false)
 
         if let tunnel = tunnel {
             // We're modifying an existing tunnel
-            tunnelsManager.modify(tunnel: tunnel, tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption) { [weak self] error in
+            tunnelsManager.modify(tunnel: tunnel, tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption, isSplitDNSEnabled: isSplitDNSEnabled) { [weak self] error in
                 guard let self = self else { return }
                 self.setUserInteractionEnabled(true)
                 if let error = error {
@@ -245,7 +262,7 @@ class TunnelEditViewController: NSViewController {
             }
         } else {
             // We're creating a new tunnel
-            self.tunnelsManager.add(tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption) { [weak self] result in
+            self.tunnelsManager.add(tunnelConfiguration: tunnelConfiguration, onDemandOption: onDemandOption, isSplitDNSEnabled: isSplitDNSEnabled) { [weak self] result in
                 guard let self = self else { return }
                 self.setUserInteractionEnabled(true)
                 switch result {
diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index 3658956..36c0e06 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -15,10 +15,12 @@ typealias EndpointResolutionResult = Result<(Endpoint, Endpoint), DNSResolutionE
 class PacketTunnelSettingsGenerator {
     let tunnelConfiguration: TunnelConfiguration
     let resolvedEndpoints: [Endpoint?]
+    let isSplitDNSEnabled: Bool
 
-    init(tunnelConfiguration: TunnelConfiguration, resolvedEndpoints: [Endpoint?]) {
+    init(tunnelConfiguration: TunnelConfiguration, resolvedEndpoints: [Endpoint?], isSplitDNSEnabled: Bool = false) {
         self.tunnelConfiguration = tunnelConfiguration
         self.resolvedEndpoints = resolvedEndpoints
+        self.isSplitDNSEnabled = isSplitDNSEnabled
     }
 
     func endpointUapiConfiguration() -> (String, [EndpointResolutionResult?]) {
@@ -88,7 +90,13 @@ class PacketTunnelSettingsGenerator {
             let dnsSettings = NEDNSSettings(servers: dnsServerStrings)
             dnsSettings.searchDomains = tunnelConfiguration.interface.dnsSearch
             if !tunnelConfiguration.interface.dns.isEmpty {
-                dnsSettings.matchDomains = [""] // All DNS queries must first go through the tunnel's DNS
+                let splitDNSMatchDomains = isSplitDNSEnabled ? tunnelConfiguration.interface.dnsSearch.filter { !$0.isEmpty } : []
+                if !splitDNSMatchDomains.isEmpty {
+                    // Use the tunnel's DNS only for the tunnel's search domains
+                    dnsSettings.matchDomains = splitDNSMatchDomains
+                } else {
+                    dnsSettings.matchDomains = [""] // All DNS queries must first go through the tunnel's DNS
+                }
             }
             networkSettings.dnsSettings = dnsSettings
         }
diff --git a/Sources/WireGuardKit/WireGuardAdapter.swift b/Sources/WireGuardKit/WireGuardAdapter.swift
index ba49ec7..82728e4 100644
--- a/Sources/WireGuardKit/WireGuardAdapter.swift
+++ b/Sources/WireGuardKit/WireGuardAdapter.swift
@@ -56,6 +56,10 @@ public class WireGuardAdapter {
     /// Adapter state.
     private var state: State = .stopped
 
+    /// Whether the tunnel's DNS servers should be used only for the tunnel's
+    /// DNS search domains rather than for all queries on the system.
+    private var isSplitDNSEnabled = false
+
     /// Tunnel device file descriptors claimed by the adapters in this process.
     /// When multiple tunnels run in a single extension process, each adapter
     /// must attach to its own utun device rather than to the first one found.
@@ -265,14 +269,18 @@ public class WireGuardAdapter {
     /// Start the tunnel tunnel.
     /// - Parameters:
     ///   - tunnelConfiguration: tunnel configuration.
+    ///   - isSplitDNSEnabled: use the tunnel's DNS servers only for the
+    ///     tunnel's DNS search domains rather than for all queries.
     ///   - completionHandler: completion handler.
-    public func start(tunnelConfiguration: TunnelConfiguration, completionHandler: @escaping (WireGuardAdapterError?) -> Void) {
+    public func start(tunnelConfiguration: TunnelConfiguration, isSplitDNSEnabled: Bool = false, completionHandler: @escaping (WireGuardAdapterError?) -> Void) {
         workQueue.async {
             guard case .stopped = self.state else {
                 completionHandler(.invalidState)
                 return
             }
 
+            self.isSplitDNSEnabled = isSplitDNSEnabled
+
             let networkMonitor = NWPathMonitor()
             networkMonitor.pathUpdateHandler = { [weak self] path in
                 self?.didReceivePathUpdate(path: path)
@@ -486,7 +494,8 @@ public class WireGuardAdapter {
     private func makeSettingsGenerator(with tunnelConfiguration: TunnelConfiguration) throws -> PacketTunnelSettingsGenerator {
         return PacketTunnelSettingsGenerator(
             tunnelConfiguration: tunnelConfiguration,
-            resolvedEndpoints: try self.resolvePeers(for: tunnelConfiguration)
+            resolvedEndpoints: try self.resolvePeers(for: tunnelConfiguration),
+            isSplitDNSEnabled: isSplitDNSEnabled
         )
     }
 
diff --git a/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift b/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
index fe09026..ac8050c 100644
--- a/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
+++ b/Sources/WireGuardNetworkExtension/PacketTunnelProvider.swift
@@ -68,7 +68,7 @@ class PacketTunnelProvider: NEPacketTunnelProvider {
         }
 
         // Start the tunnel
-        adapter.start(tunnelConfiguration: tunnelConfiguration) { adapterError in
+        adapter.start(tunnelConfiguration: tunnelConfiguration, isSplitDNSEnabled: tunnelProviderProtocol.isSplitDNSEnabled) { adapterError in
             guard let adapterError = adapterError else {
                 let interfaceName = self.adapter.interfaceName ?? "unknown"
 
-- 
2.50.1 (Apple Git-155)

