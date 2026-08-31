Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FB1CA6002
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 11:35:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a0054f05;
	Mon, 5 Oct 2026 07:00:42 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 446599dd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Aug 2026 07:15:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-482dbe4d247so817570f8f.2
 for <wireguard@lists.zx2c4.com>; Mon, 31 Aug 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788160556; x=1788765356; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L5hJjz0M4NFJeRM7s/RWtJCvLUCft79O18Vd2TvhSAk=;
 b=WaXajINxUNm9A8R1feduhINWLad6u7zn6LOQ5sINmJeorlPvc4owV1zzEStjFm8iBl
 xwqSJ/6s7R1ZE1AhAb5gYKNFrfo1MDRqJh/cujTHobzNujRYoWcUhjyODI02Yj5NnBJW
 MqvkAvvIJXe+x2EDoXtWijDFMIm9xwKkmlSBdOhvOzwlv30uWszQKrOUr8jpLi5SZjLx
 iJl4LDZu21iqPZOo3UldxWGW4D+f+1rgRRsAs4BeJ457dFqStisrVlap7QyFDHtI9CwB
 9sFrXZwfz7NgrHOIDfIs0l0wpUKllC97Kw7mOVcvbkx6goK4fitz7URTah6xJrTy+qNo
 4Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788160556; x=1788765356;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L5hJjz0M4NFJeRM7s/RWtJCvLUCft79O18Vd2TvhSAk=;
 b=jutHChI/41GOPLU8C1ZBuSVWJni2LUxhLtfhZaDZXxdLpbJ+0efi9o3pKqPtaACpBg
 Pw7+Y+XFG3lBUitOVSyRkasjTSdnOof6V4lRumdtNGNCo33lHsN8GD6Mp1FcJJ952gBD
 5ljmY2vONEVfWboHS5c2q76w6h46lsdvSmndv5ZT/H91u4NS4W3k4krne2JOspilZBZ7
 gYRIy6x4f8xksX1fT6U6+iaj5ycxDR9WcdoD9qA3RAkIlsoMLjajggM0KnknFR3ETsNU
 oLTlDfNgCP2hMNc3dQXv+st3fRZUenfLTRkur1yFC0dsOA7OyZI41cv1O00Ok/SLUcGF
 nxlQ==
X-Gm-Message-State: AFuF++nHUxRd2ocCMPsujHlcRTxDzh992nXpzZhOs5O0QzKeKZI3HY/J
 oKMiarxtVjh5haumeQDxsZydpNb2KSrUsndLa/hwZH+wAjKZsMwMpF7e
X-Gm-Gg: AYBFou1A51YH/Q0c3QVxUb20id7YlP+1a5IvSjeMQwCR8BaSBSk5PukLzVbhRHwyEKc
 7p3yfuL6p0dG2HYvs8zepq+SCtHzbS7uHG1fVjggVc7eOruTZAtgf1BJHZwGYcOz9TF+0emNmM+
 chuV5XT66nZBMsSUEiIveOdFhmUpfG+/kCb4jcvHfjmLIMHGZOvZXzfNBavBN++wt76iVsTppWZ
 Yg5IreY4T8l8eYTGHN0gQnnG0F24U3AcGNO3Y2PXnROwtPXGngoCfIeep9Z+BqVhdNtCNu9I3dK
 aKkal7T2ZtF5Ns/k6NziBgxlOaDOMLJWz00loZcxYN5lLmhPxflgMZlRcocB9CSL1OxLzI4XIqY
 r63ulkbPeY8G35SE0lI4Ixk8XgITl2ldYXX1QC8VlFSv60sjEmklZQcy8uA2a10M0oo0jqW3kf0
 TPcuSpay+wnDo1BDUUXRYl90wY8z5LOlCh67EFF87f/OOoqV7aSFBVddW6MSZ4wZd0Drg+eSrSa
 M/YoM/BIoWw7F48jspYRMPK3nuK8pmXDF0=
X-Received: by 2002:a05:6000:41d5:b0:47f:6f9e:1e82 with SMTP id
 ffacd0b85a97d-4843efb0d56mr1894260f8f.9.1788160556056; 
 Mon, 31 Aug 2026 00:15:56 -0700 (PDT)
Received: from localhost.localdomain ([79.118.195.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab3f3asm21026885f8f.3.2026.08.31.00.15.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 31 Aug 2026 00:15:55 -0700 (PDT)
From: Razvan Cremenescu <razvan.cremenescu@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com, Razvan Cremenescu <razvan.cremenescu@gmail.com>
Subject: [RESEND PATCH wireguard-apple 10/10] macOS: reset peer endpoints
 after a network change
Date: Mon, 31 Aug 2026 10:15:37 +0300
Message-ID: <20260831071537.12966-11-razvan.cremenescu@gmail.com>
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

On iOS a network change sets the peer endpoints again before bumping
the sockets, but on macOS the path update handler only bumps the
sockets, leaving whatever endpoint each peer currently has. That breaks
tunnels across a network change in two ways.

A peer configured with a hostname keeps the address the hostname
resolved to on the previous network, so a dynamic DNS record that moved,
or a name that resolves differently per network, is never picked up.

Worse, a peer that roamed keeps the roamed address. A server reached at
an address that only exists on one network - its address inside another
tunnel, or on the LAN it is hosted on - leaves the peer pinned to that
address once the machine moves, and every handshake then fails with 'no
route to host' until the tunnel is deactivated and activated again.

Set the endpoints of all peers again after a network change,
re-resolving the ones configured with a hostname. Resolution failures
keep the address the hostname last resolved to, so a network without
working DNS does not tear the endpoints down.

The work is delayed and coalesced, since a single network change
produces a burst of path updates and resolution blocks the queue. Peers
configured with a literal address need no resolution at all.

Signed-off-by: Razvan Cremenescu <razvan.cremenescu@gmail.com>
---
 .../PacketTunnelSettingsGenerator.swift       | 47 +++++++++++++++-
 Sources/WireGuardKit/WireGuardAdapter.swift   | 53 +++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index 36c0e06..3a8453d 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -14,7 +14,7 @@ typealias EndpointResolutionResult = Result<(Endpoint, Endpoint), DNSResolutionE
 
 class PacketTunnelSettingsGenerator {
     let tunnelConfiguration: TunnelConfiguration
-    let resolvedEndpoints: [Endpoint?]
+    private(set) var resolvedEndpoints: [Endpoint?]
     let isSplitDNSEnabled: Bool
 
     init(tunnelConfiguration: TunnelConfiguration, resolvedEndpoints: [Endpoint?], isSplitDNSEnabled: Bool = false) {
@@ -181,6 +181,51 @@ class PacketTunnelSettingsGenerator {
         return (ipv4IncludedRoutes, ipv6IncludedRoutes)
     }
 
+    /// Return a UAPI configuration setting the endpoint of every peer,
+    /// re-resolving the peers that were configured with a hostname.
+    ///
+    /// The endpoints are set unconditionally, which is what makes this useful
+    /// after a network change: besides picking up a hostname that now resolves
+    /// elsewhere, it resets peers whose endpoint the backend has roamed to an
+    /// address that was only reachable on the previous network.
+    ///
+    /// The initial resolution replaces a configured hostname with the address
+    /// it resolved to, so the hostname is only available from the tunnel
+    /// configuration itself.
+    func endpointUapiConfigurationAfterNetworkChange() -> (String, [EndpointResolutionResult?]) {
+        let configuredEndpoints = tunnelConfiguration.peers.map { $0.endpoint }
+        // Resolution is skipped altogether when every endpoint is an address.
+        let results = DNSResolver.resolveSync(endpoints: configuredEndpoints)
+        assert(results.count == tunnelConfiguration.peers.count)
+        assert(resolvedEndpoints.count == tunnelConfiguration.peers.count)
+
+        var wgSettings = ""
+        var resolutionResults = [EndpointResolutionResult?]()
+
+        for (index, peer) in tunnelConfiguration.peers.enumerated() {
+            if let configuredEndpoint = configuredEndpoints[index], !configuredEndpoint.hasHostAsIPAddress() {
+                switch results[index] {
+                case .success(let resolvedEndpoint)?:
+                    resolutionResults.append(.success((configuredEndpoint, resolvedEndpoint)))
+                    resolvedEndpoints[index] = resolvedEndpoint
+                case .failure(let error)?:
+                    // Keep the address the hostname last resolved to.
+                    resolutionResults.append(.failure(error))
+                case nil:
+                    resolutionResults.append(nil)
+                }
+            } else {
+                resolutionResults.append(nil)
+            }
+
+            guard let endpoint = resolvedEndpoints[index] else { continue }
+            wgSettings.append("public_key=\(peer.publicKey.hexKey)\n")
+            wgSettings.append("endpoint=\(endpoint.stringRepresentation)\n")
+        }
+
+        return (wgSettings, resolutionResults)
+    }
+
     private class func reresolveEndpoint(endpoint: Endpoint) -> EndpointResolutionResult {
         return Result { (endpoint, try endpoint.withReresolvedIP()) }
             .mapError { error -> DNSResolutionError in
diff --git a/Sources/WireGuardKit/WireGuardAdapter.swift b/Sources/WireGuardKit/WireGuardAdapter.swift
index 82728e4..b0864b3 100644
--- a/Sources/WireGuardKit/WireGuardAdapter.swift
+++ b/Sources/WireGuardKit/WireGuardAdapter.swift
@@ -60,6 +60,15 @@ public class WireGuardAdapter {
     /// DNS search domains rather than for all queries on the system.
     private var isSplitDNSEnabled = false
 
+    #if os(macOS)
+    /// Pending endpoint reset after a network change.
+    private var endpointResetWorkItem: DispatchWorkItem?
+
+    /// Delay before resetting endpoints after a network change, so that a
+    /// burst of path updates results in a single reset.
+    private static let endpointResetDelay: DispatchTimeInterval = .seconds(2)
+    #endif
+
     /// Tunnel device file descriptors claimed by the adapters in this process.
     /// When multiple tunnels run in a single extension process, each adapter
     /// must attach to its own utun device rather than to the first one found.
@@ -328,6 +337,11 @@ public class WireGuardAdapter {
             self.networkMonitor?.cancel()
             self.networkMonitor = nil
 
+            #if os(macOS)
+            self.endpointResetWorkItem?.cancel()
+            self.endpointResetWorkItem = nil
+            #endif
+
             self.releaseTunnelFileDescriptor()
             self.state = .stopped
 
@@ -518,12 +532,51 @@ public class WireGuardAdapter {
 
     /// Helper method used by network path monitor.
     /// - Parameter path: new network path
+    #if os(macOS)
+    /// Schedule resetting the peer endpoints to their configured addresses,
+    /// re-resolving the ones configured with a hostname.
+    ///
+    /// Unlike iOS, macOS leaves the endpoints alone across a network change.
+    /// A peer keeps whatever endpoint it has, which is a problem in two ways:
+    /// a hostname that resolves elsewhere on the new network is never picked
+    /// up, and a peer that roamed to an address reachable only on the previous
+    /// network - a server reached at its internal address, say - keeps being
+    /// sent to that address, so the tunnel never handshakes again.
+    ///
+    /// The work is delayed and coalesced, since a single network change
+    /// produces a burst of path updates and resolution blocks the queue.
+    private func scheduleEndpointReset() {
+        endpointResetWorkItem?.cancel()
+
+        let workItem = DispatchWorkItem { [weak self] in
+            guard let self = self else { return }
+            guard case .started(let handle, let settingsGenerator) = self.state else { return }
+
+            let (wgConfig, resolutionResults) = settingsGenerator.endpointUapiConfigurationAfterNetworkChange()
+            self.logEndpointResolutionResults(resolutionResults)
+
+            guard !wgConfig.isEmpty else { return }
+
+            self.logHandler(.verbose, "Resetting peer endpoints after network change")
+            wgSetConfig(handle, wgConfig)
+            wgBumpSockets(handle)
+        }
+
+        endpointResetWorkItem = workItem
+        workQueue.asyncAfter(deadline: .now() + Self.endpointResetDelay, execute: workItem)
+    }
+    #endif
+
     private func didReceivePathUpdate(path: Network.NWPath) {
         self.logHandler(.verbose, "Network change detected with \(path.status) route and interface order \(path.availableInterfaces)")
 
         #if os(macOS)
         if case .started(let handle, _) = self.state {
             wgBumpSockets(handle)
+
+            if path.status.isSatisfiable {
+                self.scheduleEndpointReset()
+            }
         }
         #elseif os(iOS)
         switch self.state {
-- 
2.50.1 (Apple Git-155)

