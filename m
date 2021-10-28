Return-Path: <SRS0=MnxW=PQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49720C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Oct 2021 07:25:42 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64EDF60FF2
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Oct 2021 07:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64EDF60FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=slarew.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8950702c;
	Thu, 28 Oct 2021 07:25:40 +0000 (UTC)
Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com
 [17.58.23.181])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3925e585
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Oct 2021 07:25:36 +0000 (UTC)
Received: from hilbert.lan (ip68-8-45-126.sd.sd.cox.net [68.8.45.126])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id D5BB64004A0;
 Thu, 28 Oct 2021 07:16:47 +0000 (UTC)
From: Stephen Larew <stephen@slarew.net>
To: wireguard@lists.zx2c4.com
Cc: Stephen Larew <stephen@slarew.net>
Subject: [PATCH] Enable "split DNS" configurations for an interface
Date: Thu, 28 Oct 2021 00:16:38 -0700
Message-Id: <20211028071638.88001-2-stephen@slarew.net>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20211028071638.88001-1-stephen@slarew.net>
References: <20211028071638.88001-1-stephen@slarew.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.790,17.0.607.475.0000000_definitions?=
 =?UTF-8?Q?=3D2021-10-27=5F07:2021-10-25=5F02,2021-10-27=5F07,2020-04-07?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 bulkscore=0
 clxscore=1030 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2110280036
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

By adding a tilde prefix to a domain name entry in the DNS= line, the
domain is interpreted as a "matching domain" for DNS routing instead of
a "search domain."  This corresponds to setting a non-empty
NEDNSSettings.matchDomains property for the network tunnel.  Using tilde
as a prefix is borrowed from systemd-resolved's equivalent usage.

If one or more match domains are specified, then the specified DNS
resolvers are only used for those matching domains instead of acting as
the first resolver before the system's primary DNS resolvers.

Signed-off-by: Stephen Larew <stephen@slarew.net>
---
 .../Shared/Model/TunnelConfiguration+WgQuickConfig.swift | 5 +++++
 .../Tunnel/TunnelConfiguration+UapiConfig.swift          | 1 +
 Sources/WireGuardApp/UI/TunnelViewModel.swift            | 7 ++++++-
 Sources/WireGuardApp/UI/macOS/View/highlighter.c         | 9 ++++++++-
 Sources/WireGuardKit/InterfaceConfiguration.swift        | 4 +++-
 Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift | 7 ++++++-
 6 files changed, 29 insertions(+), 4 deletions(-)

diff --git a/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift b/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
index 5d5216c..87bc93f 100644
--- a/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
+++ b/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
@@ -136,6 +136,7 @@ extension TunnelConfiguration {
         if !interface.dns.isEmpty || !interface.dnsSearch.isEmpty {
             var dnsLine = interface.dns.map { $0.stringRepresentation }
             dnsLine.append(contentsOf: interface.dnsSearch)
+            dnsLine.append(contentsOf: interface.dnsMatchDomains.map { "~" + $0 })
             let dnsString = dnsLine.joined(separator: ", ")
             output.append("DNS = \(dnsString)\n")
         }
@@ -191,15 +192,19 @@ extension TunnelConfiguration {
         if let dnsString = attributes["dns"] {
             var dnsServers = [DNSServer]()
             var dnsSearch = [String]()
+            var dnsMatchDomains = [String]()
             for dnsServerString in dnsString.splitToArray(trimmingCharacters: .whitespacesAndNewlines) {
                 if let dnsServer = DNSServer(from: dnsServerString) {
                     dnsServers.append(dnsServer)
+                } else if dnsServerString.first == "~" && !dnsServerString.dropFirst().isEmpty {
+                    dnsMatchDomains.append(String(dnsServerString.dropFirst()))
                 } else {
                     dnsSearch.append(dnsServerString)
                 }
             }
             interface.dns = dnsServers
             interface.dnsSearch = dnsSearch
+            interface.dnsMatchDomains = dnsMatchDomains
         }
         if let mtuString = attributes["mtu"] {
             guard let mtu = UInt16(mtuString) else {
diff --git a/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift b/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
index cdc81ce..f2ff763 100644
--- a/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
+++ b/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
@@ -75,6 +75,7 @@ extension TunnelConfiguration {
         interfaceConfiguration?.addresses = base?.interface.addresses ?? []
         interfaceConfiguration?.dns = base?.interface.dns ?? []
         interfaceConfiguration?.dnsSearch = base?.interface.dnsSearch ?? []
+        interfaceConfiguration?.dnsMatchDomains = base?.interface.dnsMatchDomains ?? []
         interfaceConfiguration?.mtu = base?.interface.mtu
 
         if let interfaceConfiguration = interfaceConfiguration {
diff --git a/Sources/WireGuardApp/UI/TunnelViewModel.swift b/Sources/WireGuardApp/UI/TunnelViewModel.swift
index b65c8cc..3b3fcda 100644
--- a/Sources/WireGuardApp/UI/TunnelViewModel.swift
+++ b/Sources/WireGuardApp/UI/TunnelViewModel.swift
@@ -139,9 +139,10 @@ class TunnelViewModel {
             if let mtu = config.mtu {
                 scratchpad[.mtu] = String(mtu)
             }
-            if !config.dns.isEmpty || !config.dnsSearch.isEmpty {
+            if !config.dns.isEmpty || !config.dnsSearch.isEmpty || !config.dnsMatchDomains.isEmpty {
                 var dns = config.dns.map { $0.stringRepresentation }
                 dns.append(contentsOf: config.dnsSearch)
+                dns.append(contentsOf: config.dnsMatchDomains.map { "~" + $0 })
                 scratchpad[.dns] = dns.joined(separator: ", ")
             }
             return scratchpad
@@ -197,15 +198,19 @@ class TunnelViewModel {
             if let dnsString = scratchpad[.dns] {
                 var dnsServers = [DNSServer]()
                 var dnsSearch = [String]()
+                var dnsMatchDomains = [String]()
                 for dnsServerString in dnsString.splitToArray(trimmingCharacters: .whitespacesAndNewlines) {
                     if let dnsServer = DNSServer(from: dnsServerString) {
                         dnsServers.append(dnsServer)
+                    } else if dnsServerString.first == "~" && !dnsServerString.dropFirst().isEmpty {
+                        dnsMatchDomains.append(String(dnsServerString.dropFirst()))
                     } else {
                         dnsSearch.append(dnsServerString)
                     }
                 }
                 config.dns = dnsServers
                 config.dnsSearch = dnsSearch
+                config.dnsMatchDomains = dnsMatchDomains
             }
 
             guard errorMessages.isEmpty else { return .error(errorMessages.first!) }
diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.c b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
index d89feda..e005377 100644
--- a/Sources/WireGuardApp/UI/macOS/View/highlighter.c
+++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
@@ -121,6 +121,13 @@ static bool is_valid_hostname(string_span_t s)
 	return num_digit != num_entity;
 }
 
+static bool is_valid_dns_match_hostname(string_span_t s)
+{
+    if (!s.len || s.s[0] != '~')
+        return false;
+    return is_valid_hostname((string_span_t){ s.s + 1, s.len - 1});
+}
+
 static bool is_valid_ipv4(string_span_t s)
 {
 	for (size_t j, i = 0, pos = 0; i < 4 && pos < s.len; ++i) {
@@ -448,7 +455,7 @@ static void highlight_multivalue_value(struct highlight_span_array *ret, const s
 	case DNS:
 		if (is_valid_ipv4(s) || is_valid_ipv6(s))
 			append_highlight_span(ret, parent.s, s, HighlightIP);
-		else if (is_valid_hostname(s))
+		else if (is_valid_hostname(s) || is_valid_dns_match_hostname(s))
 			append_highlight_span(ret, parent.s, s, HighlightHost);
 		else
 			append_highlight_span(ret, parent.s, s, HighlightError);
diff --git a/Sources/WireGuardKit/InterfaceConfiguration.swift b/Sources/WireGuardKit/InterfaceConfiguration.swift
index 4fb8f1b..521d4b8 100644
--- a/Sources/WireGuardKit/InterfaceConfiguration.swift
+++ b/Sources/WireGuardKit/InterfaceConfiguration.swift
@@ -11,6 +11,7 @@ public struct InterfaceConfiguration {
     public var mtu: UInt16?
     public var dns = [DNSServer]()
     public var dnsSearch = [String]()
+    public var dnsMatchDomains = [String]()
 
     public init(privateKey: PrivateKey) {
         self.privateKey = privateKey
@@ -27,6 +28,7 @@ extension InterfaceConfiguration: Equatable {
             lhs.listenPort == rhs.listenPort &&
             lhs.mtu == rhs.mtu &&
             lhs.dns == rhs.dns &&
-            lhs.dnsSearch == rhs.dnsSearch
+            lhs.dnsSearch == rhs.dnsSearch &&
+            lhs.dnsMatchDomains == rhs.dnsMatchDomains
     }
 }
diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index c53a82c..dac7648 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -88,7 +88,12 @@ class PacketTunnelSettingsGenerator {
             let dnsSettings = NEDNSSettings(servers: dnsServerStrings)
             dnsSettings.searchDomains = tunnelConfiguration.interface.dnsSearch
             if !tunnelConfiguration.interface.dns.isEmpty {
-                dnsSettings.matchDomains = [""] // All DNS queries must first go through the tunnel's DNS
+                if tunnelConfiguration.interface.dnsMatchDomains.isEmpty {
+                    // All DNS queries must first go through the tunnel's DNS
+                    dnsSettings.matchDomains = [""]
+                } else {
+                    dnsSettings.matchDomains = tunnelConfiguration.interface.dnsMatchDomains
+                }
             }
             networkSettings.dnsSettings = dnsSettings
         }
-- 
2.30.1 (Apple Git-130)

