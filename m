Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e1ee160
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 22:52:31 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id B4940F98B
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:55:23 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 30 Jun 2016 18:55:20 -0400
Message-Id: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH 1/4] address:port separation uses colon,
	not comma
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a minor fixup to the wg(8) manpage.
---
 src/tools/wg.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index c9401f0..bffe58b 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -128,7 +128,7 @@ CIDR masks. The catch-all \fI0.0.0.0/0\fP may be specified for matching
 all IPv4 addresses, and \fI::/0\fP may be specified for matching all
 IPv6 addresses. Required.
 .IP \(bu
-Endpoint \(em an endpoint IP or hostname, followed by a comma, and then a
+Endpoint \(em an endpoint IP or hostname, followed by a colon, and then a
 port number. Optional.
 
 .SH CONFIGURATION FILE FORMAT EXAMPLE
-- 
2.8.1
