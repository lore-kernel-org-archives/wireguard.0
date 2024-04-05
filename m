Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA621D49228
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 14:13:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa84e506;
	Mon, 18 Nov 2024 12:45:09 +0000 (UTC)
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2b67af33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 5 Apr 2024 12:34:11 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-56c1922096cso2521389a12.0
 for <wireguard@lists.zx2c4.com>; Fri, 05 Apr 2024 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712320450; x=1712925250; darn=lists.zx2c4.com;
 h=to:message-id:resent-to:resent-date:content-transfer-encoding:date
 :resent-from:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zUXVgjpBhTt/rmvg+TkDk5wZ+vIfIfelSzvasSTZMCU=;
 b=Mu6tpC1lKYK9aib/Y91tYfwLbSaKfxSJrOsJCMxKkxxnoeYIwh68B33x7eW5RrCRVC
 8EGVhJecANp5Ku5o6toRDlm2Fs7ynoElYdapOnve6mKWaBjRe/772CvSyoSYLjkCiJEJ
 GrWe7tjs4C6skI29x3q0Ju1iB2Br7gHvX7SfjwFayJizRjUOcMsCZQUsDzD1z+NIYxeN
 Gnd+njfJLyNjOGASRLXZYEUPYUkx0I1LVjxAEQMMWG1D/apBbfZc+rTAMy+Zkw+Ipy8s
 +Dq5HbhNQOY9lPg9HItQhE5/gt6ttX2XisaEhqv0ISI0pF1CXC++TUwdQknwK2nAfI3I
 0QNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712320450; x=1712925250;
 h=to:message-id:resent-to:resent-date:content-transfer-encoding:date
 :resent-from:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zUXVgjpBhTt/rmvg+TkDk5wZ+vIfIfelSzvasSTZMCU=;
 b=cpjd7Fvtd5enap/NSZnQNWimymTXosOMgjUTlbtDdyzoxo8sW91A5wyJvV/bs6GrFM
 RuyhYB+jUOg2xat0YRrrfqfbf0se4HTuX0ygvhb6XGD+CuT+CL5yyeUuCw005RK6YbZD
 iZVfymqyb8aJj/LBadJeiND/jqvklaJQXu/Ru3gXionCuKHMcRQoQhQ1K2fEhZOgtRzC
 5ShX7NPf/klegz1ORF6xlbDr8a+gML0qAcnz5lc3sPzmE3Hfg0oXyvfK4rOU9iMLUPYh
 9+sgemUI4DC+ItehGsoXI8ItDqVvnUjbpU6/lDvGteZZ5vb6pCwoENcs7WVqr/f0Ekp/
 bAnA==
X-Gm-Message-State: AOJu0YxLlibas3HnS9Jrkd7bjWfRSgHF8oE/RDeUFW4h0ZwzEO/2wRdw
 AI1BzqtVcAKJg/Qg1xd/ozRwAEA6v+Ohq64GmSFY4S3GG92AU8DrxCm6P9V7
X-Google-Smtp-Source: AGHT+IE5GIVIeFG9xKY87r5b50Cn0eEXZQmGR44jxL/v18oM+fKl1VTnzFVT4Az/Au+AzxQV/GI50g==
X-Received: by 2002:a17:906:d787:b0:a51:a0e6:1b20 with SMTP id
 pj7-20020a170906d78700b00a51a0e61b20mr907932ejb.55.1712320450531; 
 Fri, 05 Apr 2024 05:34:10 -0700 (PDT)
Received: from smtpclient.apple ([2a02:810d:1300:3eab:383a:7728:19ea:2860])
 by smtp.gmail.com with ESMTPSA id
 my46-20020a1709065a6e00b00a4735e440e1sm795830ejc.97.2024.04.05.05.34.10
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:34:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: [PATCH] Add DNSMatchDomains property to Interface (wireguard-apple)
From: Robert Oschwald <robertoschwald@gmail.com>
Resent-From: Robert Oschwald <robertoschwald@gmail.com>
Date: Fri, 5 Apr 2024 14:22:33 +0200
Content-Transfer-Encoding: quoted-printable
Resent-Date: Fri, 5 Apr 2024 14:33:59 +0200
Resent-To: wireguard@lists.zx2c4.com
Message-Id: <35380CAA-A1E0-47FE-B8E1-C3AD91AB255C@gmail.com>
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Is in the GH mirror as PR since a while. Would be great if one can apply =
it. https://github.com/WireGuard/wireguard-apple/pull/11




=46rom bf396fb47ea5dfca7d86f014281fff0015cee675 Mon Sep 17 00:00:00 2001
From: Frank Riley <fhriley@gmail.com>
Date: Thu, 4 Mar 2021 16:30:01 -0800
Subject: [PATCH] Add DNSMatchDomains property to Interface

Based on the work of Stephen Larew <stephen@slarew.net>.

This adds split DNS capability. MacOS and iOS don't fully support the =
separation of search domains and match domains so a best effort is made =
to implement to what the configuration intends.

Signed-off-by: Frank Riley <fhriley@gmail.com>
---
.../TunnelConfiguration+WgQuickConfig.swift | 11 ++++++++--
.../Base.lproj/Localizable.strings | 1 +
.../TunnelConfiguration+UapiConfig.swift | 1 +
Sources/WireGuardApp/UI/TunnelViewModel.swift | 8 +++++++
.../TunnelDetailTableViewController.swift | 2 +-
.../TunnelEditTableViewController.swift | 5 ++++-
.../WireGuardApp/UI/macOS/View/highlighter.c | 9 ++++++++
.../TunnelDetailTableViewController.swift | 2 +-
.../WireGuardKit/InterfaceConfiguration.swift | 4 +++-
.../PacketTunnelSettingsGenerator.swift | 21 ++++++++++++++++++-
10 files changed, 57 insertions(+), 7 deletions(-)

diff --git =
a/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift =
b/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
index 5d5216cb..368ba1e1 100644
--- a/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
+++ b/Sources/Shared/Model/TunnelConfiguration+WgQuickConfig.swift
@@ -61,7 +61,7 @@ extension TunnelConfiguration {
let keyWithCase =3D trimmedLine[..<equalsIndex].trimmingCharacters(in: =
.whitespacesAndNewlines)
let key =3D keyWithCase.lowercased()
let value =3D trimmedLine[trimmedLine.index(equalsIndex, offsetBy: =
1)...].trimmingCharacters(in: .whitespacesAndNewlines)
- let keysWithMultipleEntriesAllowed: Set<String> =3D ["address", =
"allowedips", "dns"]
+ let keysWithMultipleEntriesAllowed: Set<String> =3D ["address", =
"allowedips", "dns", "dnsmatchdomains"]
if let presentValue =3D attributes[key] {
if keysWithMultipleEntriesAllowed.contains(key) {
attributes[key] =3D presentValue + "," + value
@@ -71,7 +71,7 @@ extension TunnelConfiguration {
} else {
attributes[key] =3D value
}
- let interfaceSectionKeys: Set<String> =3D ["privatekey", "listenport", =
"address", "dns", "mtu"]
+ let interfaceSectionKeys: Set<String> =3D ["privatekey", "listenport", =
"address", "dns", "dnsmatchdomains", "mtu"]
let peerSectionKeys: Set<String> =3D ["publickey", "presharedkey", =
"allowedips", "endpoint", "persistentkeepalive"]
if parserState =3D=3D .inInterfaceSection {
guard interfaceSectionKeys.contains(key) else {
@@ -139,6 +139,10 @@ extension TunnelConfiguration {
let dnsString =3D dnsLine.joined(separator: ", ")
output.append("DNS =3D \(dnsString)\n")
}
+ if !interface.dnsMatchDomains.isEmpty {
+ let dnsMatchString =3D interface.dnsMatchDomains.joined(separator: ", =
")
+ output.append("DNSMatchDomains =3D \(dnsMatchString)\n")
+ }
if let mtu =3D interface.mtu {
output.append("MTU =3D \(mtu)\n")
}
@@ -201,6 +205,9 @@ extension TunnelConfiguration {
interface.dns =3D dnsServers
interface.dnsSearch =3D dnsSearch
}
+ if let dnsMatchString =3D attributes["dnsmatchdomains"] {
+ interface.dnsMatchDomains =3D =
dnsMatchString.splitToArray(trimmingCharacters: .whitespacesAndNewlines)
+ }
if let mtuString =3D attributes["mtu"] {
guard let mtu =3D UInt16(mtuString) else {
throw ParseError.interfaceHasInvalidMTU(mtuString)
diff --git a/Sources/WireGuardApp/Base.lproj/Localizable.strings =
b/Sources/WireGuardApp/Base.lproj/Localizable.strings
index 40023ecb..0eb308c0 100644
--- a/Sources/WireGuardApp/Base.lproj/Localizable.strings
+++ b/Sources/WireGuardApp/Base.lproj/Localizable.strings
@@ -82,6 +82,7 @@
"tunnelInterfaceListenPort" =3D "Listen port";
"tunnelInterfaceMTU" =3D "MTU";
"tunnelInterfaceDNS" =3D "DNS servers";
+"tunnelInterfaceDNSMatchDomains" =3D "DNS match domains";
"tunnelInterfaceStatus" =3D "Status";

"tunnelSectionTitlePeer" =3D "Peer";
diff --git =
a/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift =
b/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
index cdc81cee..f2ff7633 100644
--- a/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
+++ b/Sources/WireGuardApp/Tunnel/TunnelConfiguration+UapiConfig.swift
@@ -75,6 +75,7 @@ extension TunnelConfiguration {
interfaceConfiguration?.addresses =3D base?.interface.addresses ?? []
interfaceConfiguration?.dns =3D base?.interface.dns ?? []
interfaceConfiguration?.dnsSearch =3D base?.interface.dnsSearch ?? []
+ interfaceConfiguration?.dnsMatchDomains =3D =
base?.interface.dnsMatchDomains ?? []
interfaceConfiguration?.mtu =3D base?.interface.mtu

if let interfaceConfiguration =3D interfaceConfiguration {
diff --git a/Sources/WireGuardApp/UI/TunnelViewModel.swift =
b/Sources/WireGuardApp/UI/TunnelViewModel.swift
index b65c8ccf..23b4f4d3 100644
--- a/Sources/WireGuardApp/UI/TunnelViewModel.swift
+++ b/Sources/WireGuardApp/UI/TunnelViewModel.swift
@@ -14,6 +14,7 @@ class TunnelViewModel {
case listenPort
case mtu
case dns
+ case dnsMatchDomains
case status
case toggleStatus

@@ -27,6 +28,7 @@ class TunnelViewModel {
case .listenPort: return tr("tunnelInterfaceListenPort")
case .mtu: return tr("tunnelInterfaceMTU")
case .dns: return tr("tunnelInterfaceDNS")
+ case .dnsMatchDomains: return tr("tunnelInterfaceDNSMatchDomains")
case .status: return tr("tunnelInterfaceStatus")
case .toggleStatus: return ""
}
@@ -144,6 +146,9 @@ class TunnelViewModel {
dns.append(contentsOf: config.dnsSearch)
scratchpad[.dns] =3D dns.joined(separator: ", ")
}
+ if !config.dnsMatchDomains.isEmpty {
+ scratchpad[.dnsMatchDomains] =3D =
config.dnsMatchDomains.joined(separator: ", ")
+ }
return scratchpad
}

@@ -207,6 +212,9 @@ class TunnelViewModel {
config.dns =3D dnsServers
config.dnsSearch =3D dnsSearch
}
+ if let dnsMatchString =3D scratchpad[.dnsMatchDomains] {
+ config.dnsMatchDomains =3D =
dnsMatchString.splitToArray(trimmingCharacters: .whitespacesAndNewlines)
+ }

guard errorMessages.isEmpty else { return .error(errorMessages.first!) }

diff --git =
a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelDetailTableViewControll=
er.swift =
b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelDetailTableViewControll=
er.swift
index 196de0c6..1f2c1f95 100644
--- =
a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelDetailTableViewControll=
er.swift
+++ =
b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelDetailTableViewControll=
er.swift
@@ -15,7 +15,7 @@ class TunnelDetailTableViewController: =
UITableViewController {

static let interfaceFields: [TunnelViewModel.InterfaceField] =3D [
.name, .publicKey, .addresses,
- .listenPort, .mtu, .dns
+ .listenPort, .mtu, .dns, .dnsMatchDomains
]

static let peerFields: [TunnelViewModel.PeerField] =3D [
diff --git =
a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController=
.swift =
b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController=
.swift
index e44cf8d4..508caa6f 100644
--- =
a/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController=
.swift
+++ =
b/Sources/WireGuardApp/UI/iOS/ViewController/TunnelEditTableViewController=
.swift
@@ -34,7 +34,7 @@ class TunnelEditTableViewController: =
UITableViewController {
let interfaceFieldsBySection: [[TunnelViewModel.InterfaceField]] =3D [
[.name],
[.privateKey, .publicKey, .generateKeyPair],
- [.addresses, .listenPort, .mtu, .dns]
+ [.addresses, .listenPort, .mtu, .dns, .dnsMatchDomains]
]

let peerFields: [TunnelViewModel.PeerField] =3D [
@@ -246,6 +246,9 @@ extension TunnelEditTableViewController {
case .dns:
cell.placeholderText =3D tunnelViewModel.peersData.contains(where: { =
$0.shouldStronglyRecommendDNS }) ? =
tr("tunnelEditPlaceholderTextStronglyRecommended") : =
tr("tunnelEditPlaceholderTextOptional")
cell.keyboardType =3D .numbersAndPunctuation
+ case .dnsMatchDomains:
+ cell.placeholderText =3D tr("tunnelEditPlaceholderTextOptional")
+ cell.keyboardType =3D .numbersAndPunctuation
case .listenPort, .mtu:
cell.placeholderText =3D tr("tunnelEditPlaceholderTextAutomatic")
cell.keyboardType =3D .numberPad
diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.c =
b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
index d89feda1..5caa09d3 100644
--- a/Sources/WireGuardApp/UI/macOS/View/highlighter.c
+++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
@@ -343,6 +343,7 @@ enum field {
ListenPort,
Address,
DNS,
+ DNSMatchDomains,
MTU,
#ifndef MOBILE_WGQUICK_SUBSET
FwMark,
@@ -377,6 +378,7 @@ static enum field get_field(string_span_t s)
check_enum(ListenPort);
check_enum(Address);
check_enum(DNS);
+ check_enum(DNSMatchDomains);
check_enum(MTU);
check_enum(PublicKey);
check_enum(PresharedKey);
@@ -453,6 +455,12 @@ static void highlight_multivalue_value(struct =
highlight_span_array *ret, const s
else
append_highlight_span(ret, parent.s, s, HighlightError);
break;
+ case DNSMatchDomains:
+ if (is_valid_hostname(s))
+ append_highlight_span(ret, parent.s, s, HighlightHost);
+ else
+ append_highlight_span(ret, parent.s, s, HighlightError);
+ break;
case Address:
case AllowedIPs: {
size_t slash;
@@ -563,6 +571,7 @@ static void highlight_value(struct =
highlight_span_array *ret, const string_span_
}
case Address:
case DNS:
+ case DNSMatchDomains:
case AllowedIPs:
highlight_multivalue(ret, parent, s, section);
break;
diff --git =
a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewContro=
ller.swift =
b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewContro=
ller.swift
index 6ad8cf3f..2d87659c 100644
--- =
a/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewContro=
ller.swift
+++ =
b/Sources/WireGuardApp/UI/macOS/ViewController/TunnelDetailTableViewContro=
ller.swift
@@ -35,7 +35,7 @@ class TunnelDetailTableViewController: =
NSViewController {

static let interfaceFields: [TunnelViewModel.InterfaceField] =3D [
.name, .status, .publicKey, .addresses,
- .listenPort, .mtu, .dns, .toggleStatus
+ .listenPort, .mtu, .dns, .dnsMatchDomains, .toggleStatus
]

static let peerFields: [TunnelViewModel.PeerField] =3D [
diff --git a/Sources/WireGuardKit/InterfaceConfiguration.swift =
b/Sources/WireGuardKit/InterfaceConfiguration.swift
index 4fb8f1b4..521d4b88 100644
--- a/Sources/WireGuardKit/InterfaceConfiguration.swift
+++ b/Sources/WireGuardKit/InterfaceConfiguration.swift
@@ -11,6 +11,7 @@ public struct InterfaceConfiguration {
public var mtu: UInt16?
public var dns =3D [DNSServer]()
public var dnsSearch =3D [String]()
+ public var dnsMatchDomains =3D [String]()

public init(privateKey: PrivateKey) {
self.privateKey =3D privateKey
@@ -27,6 +28,7 @@ extension InterfaceConfiguration: Equatable {
lhs.listenPort =3D=3D rhs.listenPort &&
lhs.mtu =3D=3D rhs.mtu &&
lhs.dns =3D=3D rhs.dns &&
- lhs.dnsSearch =3D=3D rhs.dnsSearch
+ lhs.dnsSearch =3D=3D rhs.dnsSearch &&
+ lhs.dnsMatchDomains =3D=3D rhs.dnsMatchDomains
}
}
diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift =
b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index c53a82cd..b059510f 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -87,9 +87,28 @@ class PacketTunnelSettingsGenerator {
let dnsServerStrings =3D tunnelConfiguration.interface.dns.map { =
$0.stringRepresentation }
let dnsSettings =3D NEDNSSettings(servers: dnsServerStrings)
dnsSettings.searchDomains =3D tunnelConfiguration.interface.dnsSearch
+=20
if !tunnelConfiguration.interface.dns.isEmpty {
- dnsSettings.matchDomains =3D [""] // All DNS queries must first go =
through the tunnel's DNS
+ dnsSettings.matchDomainsNoSearch =3D true
+ if tunnelConfiguration.interface.dnsMatchDomains.isEmpty {
+ // Add "" so that all DNS queries must first go through the tunnel's =
DNS.
+ // NEDNSSettings.searchDomains does not work so we add the searches to =
matchDomains,
+ // which does work.
+ dnsSettings.matchDomains =3D [""] + =
tunnelConfiguration.interface.dnsSearch
+ dnsSettings.matchDomainsNoSearch =3D false
+ } else {
+ // Don't add dnsSearch here because that would cause domains that =
aren't
+ // in dnsMatchDomains to be matched.
+ dnsSettings.matchDomains =3D =
tunnelConfiguration.interface.dnsMatchDomains
+ for domain in tunnelConfiguration.interface.dnsMatchDomains {
+ if tunnelConfiguration.interface.dnsSearch.contains(domain) {
+ dnsSettings.matchDomainsNoSearch =3D false
+ break
+ }
+ }
+ }
}
+=20
networkSettings.dnsSettings =3D dnsSettings
}

