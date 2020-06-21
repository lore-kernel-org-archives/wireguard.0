Return-Path: <SRS0=rROn=AC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B347C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 21:50:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DE002075A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 21 Jun 2020 21:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DE002075A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8447a5b;
	Sun, 21 Jun 2020 21:31:34 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 899c256b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 21 Jun 2020 21:31:32 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 4B47CC01A; Sun, 21 Jun 2020 23:50:11 +0200 (CEST)
From: Dominique Martinet <asmadeus@codewreck.org>
To: wireguard@lists.zx2c4.com
Cc: Dominique Martinet <asmadeus@codewreck.org>
Subject: [PATCH RESEND] wg-quick: linux: raise priority for mangle nft chain
Date: Sun, 21 Jun 2020 23:50:02 +0200
Message-Id: <1592776202-25070-1-git-send-email-asmadeus@codewreck.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1588591647-7500-1-git-send-email-asmadeus@codewreck.org>
References: <1588591647-7500-1-git-send-email-asmadeus@codewreck.org>
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

Setting mark must be done as early as possible in case there are
ipv6 rpfilter rules in the mangle table (a nft filter could be done
later but with ip6tables this is the latest it can be checked).
Mark must be set before the return path check for it to work correctly.

priority -160 gets rendered as "mangle - 10" in nft list table,
and will correctly set the mark before other mangle prerouting rules
if there are any and same as before if there aren't.

Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
---
bump ?
I don't mind being plain refused, but no answer is annoying :)

Cheers,

 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..9001c6a 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -222,7 +222,7 @@ add_default() {
 	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting priority -300; }\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
+	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -160; }\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postrouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
 	while read -r line; do
 		[[ $line =~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
-- 
2.26.2

