Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d6757b
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 22:52:31 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id C715EF999
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:55:23 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 30 Jun 2016 18:55:22 -0400
Message-Id: <1467327323-8532-3-git-send-email-dkg@fifthhorseman.net>
In-Reply-To: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
References: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH 3/4] Explain the optional nature of
	Peer.EndPoint more clearly
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

In the [Peer] stanza, i think the EndPoint represents an (optional)
additional constraint on where the remote peer is coming from.  If
EndPoint isn't specified, then the assumption is that anyone who can
prove posession of that public key can act as the given peer.

Clarify this in wg(8).
---
 src/tools/wg.8 | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index 77e9b0d..ae2ff1e 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -130,7 +130,9 @@ all IPv4 addresses, and \fI::/0\fP may be specified for matching all
 IPv6 addresses. Required.
 .IP \(bu
 Endpoint \(em an endpoint IP or hostname, followed by a colon, and then a
-port number. Optional.
+port number.  If an Endpoint field is not provided, then any remote address
+that can prove posession of the secret corresponding to the given PublicKey
+can claim addresses in the AllowedIPs range.  Optional.
 
 .SH CONFIGURATION FILE FORMAT EXAMPLE
 This example may be used as a model for writing configuration files.
-- 
2.8.1
