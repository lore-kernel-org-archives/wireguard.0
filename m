Return-Path: <SRS0=Mtl/=6L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB6EC4CECC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 20:02:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A9E8206A5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Apr 2020 20:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A9E8206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b0b278b;
	Mon, 27 Apr 2020 19:50:16 +0000 (UTC)
Received: from nautica.notk.org (nautica.notk.org [91.121.71.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4fdf96ee
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Apr 2020 17:15:22 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 1C0DAC009; Mon, 27 Apr 2020 19:26:54 +0200 (CEST)
From: Dominique Martinet <asmadeus@codewreck.org>
To: wireguard@lists.zx2c4.com
Cc: Dominique Martinet <asmadeus@codewreck.org>
Subject: [RFC PATCH] wg-quick: linux: raise priority for mangle nft chain
Date: Mon, 27 Apr 2020 19:26:53 +0200
Message-Id: <1588008413-5667-1-git-send-email-asmadeus@codewreck.org>
X-Mailer: git-send-email 1.7.10.4
X-Mailman-Approved-At: Mon, 27 Apr 2020 21:50:14 +0200
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
---

I've been discussing with firewalld folks about the ipv6_rpfilter rules
they add which block wireguard setup with wg-quick on ipv6 endpoints by
default ; see https://github.com/firewalld/firewalld/issues/603 for
recap issue.
Long story short: they'll move the rpfilter rule to take effect later
(after mark is set) and add mark matching so that it works always with
nft backend, and sometimes with iptables backend.

Sometimes, because the ip6tables rpfilter module can only be used up to
mangle's prerouting table, and that one's priority with nft `hook
prerouting priority mangle` is "random" (depends on module load order?)

Changing the priority to load a bit earlier is harmless in the default
case and should just work for most people once they get a fixed
firewalld; I believe that is easier to change than try to document
the issue (e.g. telling people to use nft backend or disable
ipv6_rpfilter if they have issues as that is hard to debug)

Thanks!


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

