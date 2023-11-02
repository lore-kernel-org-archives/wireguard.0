Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB107C4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  2 Nov 2023 23:48:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7058f1f7;
	Thu, 2 Nov 2023 23:48:12 +0000 (UTC)
Received: from mailhost.omnigroup.com (mailhost.omnigroup.com [204.128.250.1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0c397df1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 2 Nov 2023 23:48:10 +0000 (UTC)
Received: from imap-bsd.omnigroup.com (imap.omnigroup.com [204.128.250.235])
 by mailhost.omnigroup.com (Postfix) with ESMTP id 7B4D935D6DF1
 for <wireguard@lists.zx2c4.com>; Thu,  2 Nov 2023 16:48:08 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mailhost.omnigroup.com 7B4D935D6DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=omnigroup.com;
 s=default; t=1698968888;
 bh=1hpvlYHEUlHWbyuaQTmETOwhaRmvjeQA9612sdUCFfw=;
 h=From:Subject:Date:To:From;
 b=qMSpaCkX1N29uAoXhwmJlDjImzfTOz5i7jzRBcNumcPLFNv7ijYK6Ga66/wRXK2Yj
 TauM4fLQkA1w7RCuAk+JTYg2A2CFr8YvXcb8L4MkTztulxfxeGM03kaS2LGiubzTpb
 Qx7sdiY+Ox4ojbL54CaMweQMIoDgOFODKr0a2qso=
Received: from smtpclient.apple (pfsense.test.omnigroup.com [204.128.250.121])
 by imap-bsd.omnigroup.com (Postfix) with ESMTPSA id 6D10C4F2B7
 for <wireguard@lists.zx2c4.com>; Thu,  2 Nov 2023 16:48:08 -0700 (PDT)
From: Ken Case <kc@omnigroup.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: [PATCH] Qualify routed DNS queries based on search domains
Message-Id: <E768DF99-9D0B-4D9A-9AB6-35B0BA51DA81@omnigroup.com>
Date: Thu, 2 Nov 2023 16:48:07 -0700
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3731.700.6)
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

Implement support for DNS search domains in the native apps for Apple
platforms (Mac and iOS), matching the search domain support already
implemented for other platforms.

Rather than unconditionally routing all DNS queries through the
associated tunnel's DNS, only route queries when no search domains
have been specified. When search domains _have_ been specified, route
those domains to the tunnel's DNS but let other domains continue to be
routed to other network interfaces.

Signed-off-by: Ken Case <kc@omnigroup.com>
---
 Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift =
b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
index c53a82c..5b7f63c 100644
--- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
+++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
@@ -88,7 +88,13 @@ class PacketTunnelSettingsGenerator {
             let dnsSettings =3D NEDNSSettings(servers: =
dnsServerStrings)
             dnsSettings.searchDomains =3D =
tunnelConfiguration.interface.dnsSearch
             if !tunnelConfiguration.interface.dns.isEmpty {
-                dnsSettings.matchDomains =3D [""] // All DNS queries =
must first go through the tunnel's DNS
+                if tunnelConfiguration.interface.dnsSearch.isEmpty {
+                    // Since no search domains were listed, use this =
tunnel's DNS for all queries
+                    dnsSettings.matchDomains =3D [""]
+                } else {
+                    // Only use this tunnel for the listed search =
domains
+                    dnsSettings.matchDomains =3D =
tunnelConfiguration.interface.dnsSearch
+                }
             }
             networkSettings.dnsSettings =3D dnsSettings
         }
--  2.41.0

