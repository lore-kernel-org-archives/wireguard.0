Return-Path: daniel@lublin.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52f39a3f
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 11:55:29 +0000 (UTC)
Received: from eltanin.uberspace.de (eltanin.uberspace.de [185.26.156.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a9122ad
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 11:55:28 +0000 (UTC)
From: Daniel Lublin <daniel@lublin.se>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/1] wg(8): rephrase wording on AllowedIPs
Date: Sun, 18 Feb 2018 13:02:38 +0100
Message-Id: <dead030cd0d96f25e6229931c9199b13a90578c4.1518955260.git.daniel@lublin.se>
In-Reply-To: <cover.1518955260.git.daniel@lublin.se>
References: <cover.1518955260.git.daniel@lublin.se>
In-Reply-To: <cover.1518955260.git.daniel@lublin.se>
References: <cover.1518955260.git.daniel@lublin.se>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 src/tools/wg.8 | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index 49dc15b..b49fb7a 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -143,12 +143,12 @@ and may be omitted. This option adds an additional layer of symmetric-key
 cryptography to be mixed into the already existing public-key cryptography,
 for post-quantum resistance.
 .IP \(bu
-AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses with
-CIDR masks from which incoming traffic for this peer is allowed and to
-which outgoing traffic for this peer is directed. The catch-all
-\fI0.0.0.0/0\fP may be specified for matching all IPv4 addresses, and
-\fI::/0\fP may be specified for matching all IPv6 addresses. May be specified
-multiple times. Required.
+AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses with CIDR
+masks, declaring the sources of incoming traffic that are allowed through the
+peer, and as well defining which destinations of outgoing traffic that will be
+directed through the peer. The catch-all \fI0.0.0.0/0\fP may be specified for
+matching all IPv4 addresses, and \fI::/0\fP may be specified for matching all
+IPv6 addresses. May be specified multiple times. Required.
 .IP \(bu
 Endpoint \(em an endpoint IP or hostname, followed by a colon, and then a
 port number. This endpoint will be updated automatically to the most recent
-- 
2.16.1
