Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A428EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Mar 2022 19:38:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b2cb8027;
	Mon, 21 Mar 2022 19:34:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2131.outbound.protection.outlook.com [40.107.20.131])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8e57e1b5
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Mar 2022 12:34:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQtR7wUNCqkkGUwoCSzn/ZNsvZ6+787D05j4K7ZHbGBH+yI+CNUoYNqQXopRiV/uhkohoFQfzOow7JUx8/4OxEBEPsaKsCc9OJEL2snOF1b46A9P/OYDd9lC3T/bXJqK6hAn6iHKItCpPb1o1rmVuXSJ7+Ed0E0zS57ZH6QYMH4d2W8VVTPHL6AyCuiJNznqpQsa7l8PR19lKuwDFN2Tp416+nEPtY1ZyYfDwfEZwjT1cCaW/BZGC6gDBzrXKDWxZmafHyMjLZEKUnruTdvWmBa8qGYq+AxvMGs44dW3jKY5r3DgxSrEcjkkYG8XzN9rlsR5/KPEwE8ELjRKRshX5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9WhUYB5dtOFCREJI4DjTvbfclMd3YBfzR0mkVmzRFak=;
 b=cGyTsI6lqLeAGUb6RLcfiJkrNyhPUXbSClzxcDQ0RZOgiCYu6HALMr6+9gK5tM3XpB0XxTVFCZCs5pw8l3w7Hc2XBREDeceDx5O8Lh+g9u1Y0e7CTZGz3F132+5yEKe/ODiv8xksZm1viYi6hhD8naaKWE0Vz3/7t+y6vLoNXCSQ+2NeXWTBTx3WjBjz2HnwXr9W3ey2AC5r9X+oeFe58Q8QqQwWswRI+9u5bBgEUExsaqO8xv7xhpMHGTbUFE63hrAktjFWwdeRbUG5uSyhNM/0LeyaYpTPhvHwyw5EJQmBJv9mt6NSnRI08azTAgOM2WbmFB7xPEBAUeco2ngZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q1.eu; dmarc=pass action=none header.from=q1.eu; dkim=pass
 header.d=q1.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q1.eu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9WhUYB5dtOFCREJI4DjTvbfclMd3YBfzR0mkVmzRFak=;
 b=w/7kc/3P2W/HUzoSJtU73FqHsL2TmH49Czq15C3kslzD2t0J0PBgHKorkIYxcHvnfXMCmCrh7ktHp33MCbOmhJRpQ944y9L68sc0bqeo7cHAXpoF+Dep3nKbwVggkx8B/ofdLNjv4iQoEsbpmyuuAfy8FsuzLNLSTQu/MQiR9K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q1.eu;
Received: from AM9PR04MB8130.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::17)
 by VI1PR0402MB3791.eurprd04.prod.outlook.com (2603:10a6:803:1b::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Fri, 18 Mar
 2022 12:34:37 +0000
Received: from AM9PR04MB8130.eurprd04.prod.outlook.com
 ([fe80::fda7:e3af:e25d:fb56]) by AM9PR04MB8130.eurprd04.prod.outlook.com
 ([fe80::fda7:e3af:e25d:fb56%6]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 12:34:37 +0000
From: Kevin Seidel <k.seidel@q1.eu>
To: wireguard@lists.zx2c4.com
Cc: moogle19 <k.seidel@q1.eu>
Subject: [PATCH] Always show "Last Handshake" and "Rx / Tx Bytes"
Date: Fri, 18 Mar 2022 13:34:26 +0100
Message-Id: <20220318123426.12414-1-k.seidel@q1.eu>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P194CA0064.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::41) To AM9PR04MB8130.eurprd04.prod.outlook.com
 (2603:10a6:20b:3e6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61af6712-ece1-41ef-94c5-08da08dbaa12
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3791:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3791DC62F70D788367F834BFD3139@VI1PR0402MB3791.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +45IUBEfmuqfpb7sY9R4SRdUyjRhmiDxWrF67hMDpnZ2UHSa1zK9VVZzxFolZPJKL9UjJUtYI1Fc3ZEzb/I6vOZklPSceHjCKjULYdecN8A1+iciSvi3MS9TXmlmlQS7CRXp8c12TZoDx/31cD1FOx4WUno84Y7Z6yMHIWhBxvkZLU25EPilJejOcY3lBair4OJj65Brk68tTZU+N70vRWstyIF7fAlCOaPtK/GsFXbExERLSBfKURsD2udk9WTWgTjTmoAgL4vI79CzMQBRsAMOlUqNXb7eLoYoVzKw2Tcny8rwyheF1oqO9UlpD5dY4aBgkb+fsPs34+KUU9B3PkqrWrOfCKr/bqccoL6UCxPeIwhmdz5cm7/HNMjuQed0ZFrO2+yh4a2OmbjtLxzsXwu5ZCxl0gDW2/bl0DLh/2fSNTsL0U9AQYDDT4BBcJvy6Mes18QPDb6PJbZ4gJeUesch0ADnpzoUmVoWJtA9PwwaNj1WoHCT7kUDFgsIb8gxx0/ko+bI2GS4zLyCbKS1U0nnrFpWE1nHL1W0jBJ/jQHXvDgHOGfGPRo20h/kK0bSYKRu1U7Kz4ORTlV0BDuPyneNljx902Vc9WDjEUiEOMI8ukq7a6ZMVKtmdNU4D+yH3rg9iy1F2BD19l8dfHPmcx5F1c7j5yytoBgvKYIt5KWP4m6NACKxIc0pADC8Gy54pAG4RntI1olzXN8eUwQdQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR04MB8130.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(6512007)(316002)(83380400001)(66946007)(508600001)(38100700002)(38350700002)(6666004)(8676002)(6506007)(4326008)(52116002)(86362001)(66476007)(66556008)(2906002)(36756003)(26005)(6916009)(186003)(8936002)(1076003)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7nMGVQhVkLjJP4kn7TCC5XbOjZJvW8wRCY1VTQavfgY671ejCVupeQ38gW8B?=
 =?us-ascii?Q?VQpA4tdq2GGrY4jNOxR1iwoC3okiPWTAmJS9F9kvVb4xaUG01JcS8jrAML6j?=
 =?us-ascii?Q?SClFG+a0+tjGzgtH6xC3DGifAVYODhjBfkh6hSVF67QiDXFFqisY3NqqP87I?=
 =?us-ascii?Q?yWcmTLPQyojE+ZohHVIXJFXwdjmal5A5Jq+iR4TXN4FYW15aQ54CKceWmEsn?=
 =?us-ascii?Q?LY4TdX0K/7SINWomhBnWI+PgTrFVYoCno+sNS/0ybwE3CsN47xWUztD2SM6a?=
 =?us-ascii?Q?ee3z1c9ZJkSv+ZYEyPt5+U2Da09PP3Ql1YfSTbJu98ZR4QbFyAuEQ9ix6I78?=
 =?us-ascii?Q?0Fig8/UvrCwicQTHCZuif+G79Ss01HfWQETmfbp9laxtIsiotVlXTMGX1K5f?=
 =?us-ascii?Q?Zpd4M03cRGDDxSPAIGXcHsWRpsHVDVxArq6qNjh+zgtTmWd/stUbkqhCADko?=
 =?us-ascii?Q?z2jZ39YLg7Yg6kxElQiFamKIwcflyHZ16vPyMwZ2d4hGJB/J7yITjaQNWFt3?=
 =?us-ascii?Q?I7/2LrL3GGMdTuXhYMZ8qJnW7cVGvaSaJT1ocj4qRYqU7zvJiJyaF5xwV5DS?=
 =?us-ascii?Q?C3pbWuDYHm1MLTeHl+wUXA40qAFg76fTIlv2gq+QneZ6PI6i6MI0RrHlR8Rm?=
 =?us-ascii?Q?B39NjoeAld+7LrPMS+bQqKXV+T0P/18WIPMNveWQuL/tjCOdUxH+tV+JzhCE?=
 =?us-ascii?Q?vAZxiL2TwKVcyQ4SEJjZABUy929QII65dZ0dBqFmodtlS9N3o3Ep7DuInYRx?=
 =?us-ascii?Q?jzTK7lmbTyTbnIuRZjcjaBKYp2MWyOWfsGN5WRaLqUjKCD7/mBFwMuw1txlk?=
 =?us-ascii?Q?n2zlDC9Xt2oyIOpMoxHyO+o46sgnDe0fgFEoJfsWMgTab7dsg7b/pZPj+0We?=
 =?us-ascii?Q?mBpDqOa7uTth5LM5DzRtL3XXYlSmi6X/I+zSUdEIfl6MDX66U2K3ATnUS9z/?=
 =?us-ascii?Q?uzf8Wv5RmUxalDkyvbJ/rFXuT8rzQLYxXivoK8CEALCjQ5tE8eNSTM9S9+Em?=
 =?us-ascii?Q?43+XnessqHYIqEYyHEbuD8bBVKz/ggmxSSsf6tjj/CGXVNFXEOPdRF+5utei?=
 =?us-ascii?Q?WHBlBggVPuZ8ThaXoI/xNzc5RXodNmsN2UwrPdlsl7cao1ba0B7ZzA+scp4h?=
 =?us-ascii?Q?YJuT97iJaMSZCDQTrWtlHyHRMcoh+XEaitREs208WOPGG78ejF+ZIa01tHPy?=
 =?us-ascii?Q?TxUB274Wu3A5visT+couIEPP3P8YUj06292X2yeogIDnobjDwf+W5onSU87e?=
 =?us-ascii?Q?TnIEB5EUZriCIvcLVoF8bjtAdH/pFd7p1Mm2jxkEXdiZfOze+0m2hhMlTpKk?=
 =?us-ascii?Q?e6/wEX6gdoOHw1T9GMJJXgrJJBrHotYB+dlgfHQ4muTC9U/SXow5QbGKWyKQ?=
 =?us-ascii?Q?NGudFMTbjLiNJCRutF806YyaioAEpVFliaUvYjwNWI0IY86KIbeUH8zMQMUP?=
 =?us-ascii?Q?3rtGZVXUGESOa2PU0hv8caNcOyqNJzjF?=
X-OriginatorOrg: q1.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 61af6712-ece1-41ef-94c5-08da08dbaa12
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8130.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 12:34:37.2425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b8057dec-01fd-41ab-b876-78ed314808e8
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JECMph/aJNuBnVebb3XPfiSph4Nr4xtBvQ4A+Ql6t/OIKkg4876NGCa81Q/Tm0O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3791
X-Mailman-Approved-At: Mon, 21 Mar 2022 19:34:47 +0000
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

From: moogle19 <k.seidel@q1.eu>

---
 Sources/WireGuardApp/UI/TunnelViewModel.swift | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/Sources/WireGuardApp/UI/TunnelViewModel.swift b/Sources/WireGuardApp/UI/TunnelViewModel.swift
index b65c8cc..1c578c5 100644
--- a/Sources/WireGuardApp/UI/TunnelViewModel.swift
+++ b/Sources/WireGuardApp/UI/TunnelViewModel.swift
@@ -309,7 +309,7 @@ class TunnelViewModel {
                 scratchpad[.preSharedKey] = preSharedKey
             }
             if !config.allowedIPs.isEmpty {
-                scratchpad[.allowedIPs] = config.allowedIPs.map { $0.stringRepresentation }.joined(separator: ", ")
+                scratchpad[.allowedIPs] =  config.allowedIPs.map(\.stringRepresentation).joined(separator: ", ")
             }
             if let endpoint = config.endpoint {
                 scratchpad[.endpoint] = endpoint.stringRepresentation
@@ -317,15 +317,10 @@ class TunnelViewModel {
             if let persistentKeepAlive = config.persistentKeepAlive {
                 scratchpad[.persistentKeepAlive] = String(persistentKeepAlive)
             }
-            if let rxBytes = config.rxBytes {
-                scratchpad[.rxBytes] = prettyBytes(rxBytes)
-            }
-            if let txBytes = config.txBytes {
-                scratchpad[.txBytes] = prettyBytes(txBytes)
-            }
-            if let lastHandshakeTime = config.lastHandshakeTime {
-                scratchpad[.lastHandshakeTime] = prettyTimeAgo(timestamp: lastHandshakeTime)
-            }
+            scratchpad[.rxBytes] = config.rxBytes?.prettyBytes() ?? "-"
+            scratchpad[.txBytes] = config.txBytes?.prettyBytes() ?? "-"
+            scratchpad[.lastHandshakeTime] = config.lastHandshakeTime?.prettyTimeAgo() ?? "-"
+
             return scratchpad
         }
 
@@ -624,30 +619,34 @@ class TunnelViewModel {
     }
 }
 
-private func prettyBytes(_ bytes: UInt64) -> String {
-    switch bytes {
+private extension UInt64 {
+  func prettyBytes() -> String {
+    switch self {
     case 0..<1024:
-        return "\(bytes) B"
+      return "\(self) B"
     case 1024 ..< (1024 * 1024):
-        return String(format: "%.2f", Double(bytes) / 1024) + " KiB"
+      return String(format: "%.2f", Double(self) / 1024) + " KiB"
     case 1024 ..< (1024 * 1024 * 1024):
-        return String(format: "%.2f", Double(bytes) / (1024 * 1024)) + " MiB"
+      return String(format: "%.2f", Double(self) / (1024 * 1024)) + " MiB"
     case 1024 ..< (1024 * 1024 * 1024 * 1024):
-        return String(format: "%.2f", Double(bytes) / (1024 * 1024 * 1024)) + " GiB"
+      return String(format: "%.2f", Double(self) / (1024 * 1024 * 1024)) + " GiB"
     default:
-        return String(format: "%.2f", Double(bytes) / (1024 * 1024 * 1024 * 1024)) + " TiB"
+      return String(format: "%.2f", Double(self) / (1024 * 1024 * 1024 * 1024)) + " TiB"
     }
+  }
 }
 
-private func prettyTimeAgo(timestamp: Date) -> String {
+private extension Date {
+  func prettyTimeAgo() -> String {
     let now = Date()
-    let timeInterval = Int64(now.timeIntervalSince(timestamp))
+    let timeInterval = Int64(now.timeIntervalSince(self))
     switch timeInterval {
     case ..<0: return tr("tunnelHandshakeTimestampSystemClockBackward")
     case 0: return tr("tunnelHandshakeTimestampNow")
     default:
         return tr(format: "tunnelHandshakeTimestampAgo (%@)", prettyTime(secondsLeft: timeInterval))
     }
+  }
 }
 
 private func prettyTime(secondsLeft: Int64) -> String {
-- 
2.35.1

