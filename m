Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80230C3DA4E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9107450;
	Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3974b78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Aug 2023 05:07:23 +0000 (UTC)
Received: from s807.loopia.se (localhost [127.0.0.1])
 by s807.loopia.se (Postfix) with ESMTP id 6445A2FA3547
 for <wireguard@lists.zx2c4.com>; Wed, 16 Aug 2023 07:07:22 +0200 (CEST)
Received: from s980.loopia.se (unknown [172.22.191.6])
 by s807.loopia.se (Postfix) with ESMTP id 554592E278D1;
 Wed, 16 Aug 2023 07:07:22 +0200 (CEST)
Received: from s473.loopia.se (unknown [172.22.191.6])
 by s980.loopia.se (Postfix) with ESMTP id 53ED62201664;
 Wed, 16 Aug 2023 07:07:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s934.loopia.se ([172.22.191.6])
 by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
 with LMTP id P8KCdwp1RGD7; Wed, 16 Aug 2023 07:07:22 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: henrik@eossweden.org
X-Loopia-Originating-IP: 188.150.193.72
Received: from electra.sargeras.net (c188-150-193-72.bredband.tele2.se
 [188.150.193.72]) (Authenticated sender: henrik@eossweden.org)
 by s934.loopia.se (Postfix) with ESMTPSA id E06597CEA65;
 Wed, 16 Aug 2023 07:07:21 +0200 (CEST)
From: Henrik Hautakoski <henrik@eossweden.org>
To: wireguard@lists.zx2c4.com
Cc: Henrik Hautakoski <henrik@eossweden.org>
Subject: [PATCH] wg-quick: linux: add restart command.
Date: Wed, 16 Aug 2023 07:06:53 +0200
Message-ID: <20230816050653.28972-1-henrik@eossweden.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Aug 2023 22:19:06 +0000
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

Add a simple "restart" command that just do cmd_down followed by an cmd_up. Saves abit of typing :)

Signed-off-by: Henrik Hautakoski <henrik@eossweden.org>
---
 src/wg-quick/linux.bash | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 69e5bef..cc9f288 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -298,7 +298,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | restart | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -373,6 +373,11 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == restart ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_down
+    cmd_up
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
-- 
2.40.1

