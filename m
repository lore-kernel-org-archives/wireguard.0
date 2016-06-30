Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df75ae9b
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 22:52:31 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id BAA8FF993
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:55:23 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 30 Jun 2016 18:55:23 -0400
Message-Id: <1467327323-8532-4-git-send-email-dkg@fifthhorseman.net>
In-Reply-To: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
References: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH 4/4] Clarify what Peer.AllowedIPs actually
	constrains
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It looks to me like AllowedIPs acts as a filter for traffic sent by
the peer.  To avoid some other confused interpretation (e.g. IP
addresses that are allowed to be configured on this interface),
clarify the meaning in this configuration.

If this isn't correct, please clarify!
---
 src/tools/wg.8 | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index ae2ff1e..6da1770 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -125,9 +125,10 @@ private key, and usually transmitted out of band to the author of the
 configuration file. Required.
 .IP \(bu
 AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses with
-CIDR masks. The catch-all \fI0.0.0.0/0\fP may be specified for matching
-all IPv4 addresses, and \fI::/0\fP may be specified for matching all
-IPv6 addresses. Required.
+CIDR masks that this peer is allowed to produce traffic from.  The
+catch-all \fI0.0.0.0/0\fP may be specified for matching all IPv4
+addresses, and \fI::/0\fP may be specified for matching all IPv6
+addresses. Required.
 .IP \(bu
 Endpoint \(em an endpoint IP or hostname, followed by a colon, and then a
 port number.  If an Endpoint field is not provided, then any remote address
-- 
2.8.1
