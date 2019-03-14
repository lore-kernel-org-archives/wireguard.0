Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CBDC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 404E6218AE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 404E6218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=colinfinck.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d26b3ee0;
	Wed, 20 Mar 2019 22:45:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34498a7f
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 11:45:18 +0000 (UTC)
Received: from wp221.webpack.hosteurope.de (wp221.webpack.hosteurope.de
 [IPv6:2a01:488:42:1000:50ed:84e4::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 298b4c00
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2019 11:45:18 +0000 (UTC)
Received: from [195.14.245.218] (helo=localhost.localdomain); authenticated
 by wp221.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1h4Oyb-0006NO-OE; Thu, 14 Mar 2019 12:56:45 +0100
From: Colin Finck <mail@colinfinck.de>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick: Unset the DNS first,
 then delete the WireGuard interface.
Date: Thu, 14 Mar 2019 12:56:12 +0100
Message-Id: <20190314115612.2412-1-mail@colinfinck.de>
X-Mailer: git-send-email 2.17.1.windows.2
X-bounce-key: webpack.hosteurope.de;mail@colinfinck.de;1552564607;1ee5defc;
X-HE-SMSGID: 1h4Oyb-0006NO-OE
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:45:39 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This prevents an "Unknown interface 'wg0': No such device" error on the command line.

Signed-off-by: Colin Finck <mail@colinfinck.de>
---
 src/tools/wg-quick/freebsd.bash | 2 +-
 src/tools/wg-quick/linux.bash   | 2 +-
 src/tools/wg-quick/openbsd.bash | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/tools/wg-quick/freebsd.bash b/src/tools/wg-quick/freebsd.bash
index e83dbef..3b2d95b 100755
--- a/src/tools/wg-quick/freebsd.bash
+++ b/src/tools/wg-quick/freebsd.bash
@@ -420,8 +420,8 @@ cmd_down() {
 	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	execute_hooks "${PRE_DOWN[@]}"
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
-	del_if
 	unset_dns
+	del_if
 	execute_hooks "${POST_DOWN[@]}"
 }
 
diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 84643c4..d3d4fb0 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -295,8 +295,8 @@ cmd_down() {
 	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	execute_hooks "${PRE_DOWN[@]}"
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
-	del_if
 	unset_dns
+	del_if
 	execute_hooks "${POST_DOWN[@]}"
 }
 
diff --git a/src/tools/wg-quick/openbsd.bash b/src/tools/wg-quick/openbsd.bash
index 9996162..d701ae1 100755
--- a/src/tools/wg-quick/openbsd.bash
+++ b/src/tools/wg-quick/openbsd.bash
@@ -414,8 +414,8 @@ cmd_down() {
 	fi
 	execute_hooks "${PRE_DOWN[@]}"
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
-	del_if
 	unset_dns
+	del_if
 	execute_hooks "${POST_DOWN[@]}"
 }
 
-- 
2.17.1.windows.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
