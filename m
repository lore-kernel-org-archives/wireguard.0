Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51313EF06E9
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Feb 2026 17:13:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f9fe34f;
	Sun, 8 Feb 2026 17:10:26 +0000 (UTC)
Received: from smtp85.iad3b.emailsrvr.com (smtp85.iad3b.emailsrvr.com
 [146.20.161.85])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3331b0af
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Oct 2025 14:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=uekermann.me;
 s=20230325-gcqqzkht; t=1760970472;
 bh=9YMSXuPqnI38Fhqs9XlJZsoibC3XPFUduaTXcEZlIOg=;
 h=From:To:Subject:Date:From;
 b=WjnYqb6L/iLoUo0Ms6ivm73A/yh052hhHMgou8zzqq3lIYj9MZVVCRunqpqwM21Cj
 JIpNRVaWtKO2r/msgBdqgH8Xq2tHuj8bogmR/9UndjXSpairS05cueVBOXRuiBQNOw
 dz4QtDCq+5KJSqJ38FosRQuycTCVuEulkICeCqn4=
X-Auth-ID: florian@uekermann.email
Received: by smtp3.relay.iad3b.emailsrvr.com (Authenticated sender:
 florian-AT-uekermann.email) with ESMTPSA id CF332402C6; 
 Mon, 20 Oct 2025 10:27:51 -0400 (EDT)
From: Florian Uekermann <florian@uekermann.me>
To: wireguard@lists.zx2c4.com
Cc: Florian Uekermann <florian@uekermann.me>
Subject: [PATCH] wg-quick: fix darwin MTU detection
Date: Mon, 20 Oct 2025 16:22:55 +0200
Message-ID: <20251020142254.16546-2-florian@uekermann.me>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Classification-ID: 8df7a4f1-876f-42f0-8270-0770306428dc-1-1
X-Mailman-Approved-At: Sun, 08 Feb 2026 17:10:11 +0000
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

Signed-off-by: Florian Uekermann <florian@uekermann.me>
---
On macOS The set_mtu function fails to detect the default interface correctly and always sets the (potentially incorrect) default MTU as a result.

The problem is that netstat -nr -f inet returns the interface name in the 4th column, not the 6th.

I used macOS 15.4 for testing, but I am not particularly familiar with the Apple ecosystem. I'm not sure if this never worked, the netstat shipped by Apple changed at some point and how/which other platforms (iOS?) may be affected. So please keep that in mind before merging.

 src/wg-quick/darwin.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index 1b7fe5e..0467f0e 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -177,7 +177,7 @@ set_mtu() {
 		cmd ifconfig "$REAL_INTERFACE" mtu "$MTU"
 		return
 	fi
-	while read -r destination _ _ _ _ netif _; do
+	while read -r destination _ _ netif _; do
 		if [[ $destination == default ]]; then
 			defaultif="$netif"
 			break
-- 
2.51.0

