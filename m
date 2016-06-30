Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 157e26a1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 22:52:31 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id C0E7EF997
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 18:55:23 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Thu, 30 Jun 2016 18:55:21 -0400
Message-Id: <1467327323-8532-2-git-send-email-dkg@fifthhorseman.net>
In-Reply-To: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
References: <1467327323-8532-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH 2/4] explain "security reasons"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It's generally preferable to avoid vague "security reasons" if there
is a specific concern.

I think the reason we don't want the secret key material directly on
the command line is because of the command line's argument exposure in
the process table.

If there is another reason, i'd be happy to see a different patch
explaining it.
---
 src/tools/wg.8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/src/tools/wg.8 b/src/tools/wg.8
index bffe58b..77e9b0d 100644
--- a/src/tools/wg.8
+++ b/src/tools/wg.8
@@ -55,7 +55,8 @@ Sets configuration values for the specified \fI<interface>\fP. Multiple
 for a peer, that peer is removed, not configured. If \fIlisten-port\fP
 is not specified, the port will be automatically generated when the
 interface comes up. Both \fIprivate-key\fP and \fIpreshared-key\fP must
-be a files, for security reasons, but if you're using
+be files to avoid exposing secret material via the process table's view
+of the command line.  However, if you're using
 .BR bash (1),
 you may safely pass in a string by specifying as \fIprivate-key\fP or
 \fIpreshared-key\fP the expression: <(echo PRIVATEKEYSTRING). If
-- 
2.8.1
