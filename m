Return-Path: <SRS0=ZLx+=WB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F042C433FF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FD6214C6
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Aug 2019 18:45:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lipidity.com header.i=@lipidity.com header.b="N1w7vKWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FD6214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lipidity.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2461580a;
	Mon, 5 Aug 2019 18:45:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f169910
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jul 2019 12:20:36 +0000 (UTC)
Received: from out.migadu.com (out.migadu.com [91.121.223.63])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7aa6c749
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jul 2019 12:20:35 +0000 (UTC)
Received: (Migadu outbound); Sat, 20 Jul 2019 12:20:34 +0000
Authentication-Results: out.migadu.com; auth=pass (plain)
Received: from sapient.be ([167.179.142.93])
 by out.migadu.com (Haraka/2.8.16) with ESMTPSA id
 0F454960-E04A-4C83-BC2E-756B8356D8B1.1
 envelope-from <ankur@lipidity.com> (authenticated bits=0)
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 verify=FAIL);
 Sat, 20 Jul 2019 12:20:33 +0000
From: Ankur Kothari <ankur@lipidity.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick: Fix alternate routing table syntax on OpenBSD
Date: Sat, 20 Jul 2019 22:20:16 +1000
Message-Id: <20190720122016.57765-1-ankur@lipidity.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256;
 bh=k9Zn/acdtA+OSKc1sA2V+TgaIV+vht1EPmidQFAC9mw=; c=relaxed/simple;
 d=lipidity.com; h=from:subject:date:to; s=default;
 b=N1w7vKWxl1BM36Rbmk9ZZc3Hv0wF/LJUXYqqk4t2gjM9PFC9QrTPAQTGG1aWxttZqr5rFJqhVeJyjog/RhX1MvNhlv71AljJkKA2iLj/4y0LkGZsUGL1dHugClOhq2JdQAphOzsdY+bl2SjWgUF0L2qv9uVAeEa2eIK32txNi7c=
X-Mailman-Approved-At: Mon, 05 Aug 2019 20:45:44 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

---
 src/tools/wg-quick/openbsd.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tools/wg-quick/openbsd.bash b/src/tools/wg-quick/openbsd.bash
index b234609..2cadeec 100755
--- a/src/tools/wg-quick/openbsd.bash
+++ b/src/tools/wg-quick/openbsd.bash
@@ -293,7 +293,7 @@ add_route() {
 	fi
 
 	if [[ -n $TABLE && $TABLE != auto ]]; then
-		cmd route -q -n add "-$family" -rdomain "$TABLE" "$1" -iface "$ifaceroute"
+		cmd route -q -n -T "$TABLE" add "-$family" "$1" -iface "$ifaceroute"
 	elif [[ $1 == */0 ]]; then
 		if [[ $1 == *:* ]]; then
 			AUTO_ROUTE6=1
-- 
2.22.0


Sent via Migadu.com, world's easiest email hosting
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
