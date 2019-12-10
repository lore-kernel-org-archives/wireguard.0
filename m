Return-Path: <SRS0=o99y=2A=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED5FC00454
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 15:49:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FD42077B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Dec 2019 15:49:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="b0cP6iE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FD42077B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aab1a4ac;
	Tue, 10 Dec 2019 15:49:04 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 46067263
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:49:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e16f4838
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Dec 2019 15:49:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76e44554;
 Tue, 10 Dec 2019 14:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-transfer-encoding;
 s=mail; bh=V2X68MouuHlKcBt7uoAwK/LqtMc=; b=b0cP6iE63xK0AAccPK7y
 nQrfudUe4M4X8P9An5HlR4bgK3Wi7bQEDXTSjOkFg5yBAag/gjv4GJslceGvBXBd
 iauagOV9zdFPEO54ZcfRKkGK2SQl7RrSvZUOkD+kHjB3lC0G4IAPMLipuK04Xl1S
 K5NZHPnTdlxmmW0eUQHwq9/YdtnZsxck1hW1ea221Q8RqpRr+wtE58+++2KrV7d+
 HsNJg72mBltwflHcBQ1/7PLIKvwx1UT3JWl8RH9++JY8Jeq3WwalCUlBcv1NqMVJ
 7Nh0Cb+IRbbBBK19dO1JnMeW7gGagpvMKNsmvgRaC6UQFFx3YkBWrtraAqOmFAjM
 rQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3de23cb8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Tue, 10 Dec 2019 14:53:27 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com, jwollrath@web.de, dkg@fifthhorseman.net,
 diggest@gmail.com
Subject: [PATCH] wg-quick: linux: add support for nft and prefer it
Date: Tue, 10 Dec 2019 16:48:50 +0100
Message-Id: <20191210154850.577745-1-Jason@zx2c4.com>
MIME-Version: 1.0
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

If nft(8) is installed, use it. These rules should be identical to the
iptables-restore(8) ones, with the advantage that cleanup is easy
because we use custom table names.
---
Hey folks,

I'd appreciate a review from some of the nftables experts on this list
who requested this.

Thanks,
Jason

 src/tools/wg-quick/linux.bash | 59 +++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 20 deletions(-)

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 9bfeed1b..dde02951 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -95,7 +95,7 @@ add_if() {
 del_if() {
 	local table
 	[[ $HAVE_SET_DNS -eq 0 ]] || unset_dns
-	[[ $HAVE_SET_IPTABLES -eq 0 ]] || remove_iptables
+	[[ $HAVE_SET_FIREWALL -eq 0 ]] || remove_firewall
 	if [[ -z $TABLE || $TABLE == auto ]] && get_fwmark table && [[ $(wg show "$INTERFACE" allowed-ips) =~ /0(\ |$'\n'|$) ]]; then
 		while [[ $(ip -4 rule show 2>/dev/null) == *"lookup $table"* ]]; do
 			cmd ip -4 rule delete table $table
@@ -181,22 +181,30 @@ get_fwmark() {
 	return 0
 }
 
-remove_iptables() {
-	local line iptables found restore
-	for iptables in iptables ip6tables; do
-		restore="" found=0
-		while read -r line; do
-			[[ $line == "*"* || $line == COMMIT || $line == "-A "*"-m comment --comment \"wg-quick(8) rule for $INTERFACE\""* ]] || continue
-			[[ $line == "-A"* ]] && found=1
-			printf -v restore '%s%s\n' "$restore" "${line/#-A/-D}"
-		done < <($iptables-save 2>/dev/null)
-		[[ $found -ne 1 ]] || echo -n "$restore" | cmd $iptables-restore -n
-	done
+remove_firewall() {
+	if type -p nft >/dev/null; then
+		local table nftcmd
+		while read -r table; do
+			[[ $table == *" wg-quick-$INTERFACE" ]] && printf -v nftcmd '%sdelete %s\n' "$nftcmd" "$table"
+		done < <(nft list tables 2>/dev/null)
+		[[ -z $nftcmd ]] || echo -n "$nftcmd" | cmd nft -f -
+	else
+		local line iptables found restore
+		for iptables in iptables ip6tables; do
+			restore="" found=0
+			while read -r line; do
+				[[ $line == "*"* || $line == COMMIT || $line == "-A "*"-m comment --comment \"wg-quick(8) rule for $INTERFACE\""* ]] || continue
+				[[ $line == "-A"* ]] && found=1
+				printf -v restore '%s%s\n' "$restore" "${line/#-A/-D}"
+			done < <($iptables-save 2>/dev/null)
+			[[ $found -ne 1 ]] || echo -n "$restore" | cmd $iptables-restore -n
+		done
+	fi
 }
 
-HAVE_SET_IPTABLES=0
+HAVE_SET_FIREWALL=0
 add_default() {
-	local table proto i iptables
+	local table i
 	if ! get_fwmark table; then
 		table=51820
 		while [[ -n $(ip -4 route show table $table 2>/dev/null) || -n $(ip -6 route show table $table 2>/dev/null) ]]; do
@@ -204,21 +212,32 @@ add_default() {
 		done
 		cmd wg set "$INTERFACE" fwmark $table
 	fi
-	proto=-4 iptables=iptables
-	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables
+	local proto=-4 iptables=iptables pf=ip
+	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
 	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
 	cmd ip $proto rule add not fwmark $table table $table
 	cmd ip $proto rule add table main suppress_prefixlength 0
 
-	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n'
+	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
+	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
+	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting priority raw; }\n' "$nftcmd" "$pf" "$nftable"
+	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority mangle; }\n' "$nftcmd" "$pf" "$nftable"
+	printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postrouting priority mangle; }\n' "$nftcmd" "$pf" "$nftable"
 	for i in "${ADDRESSES[@]}"; do
 		[[ ( $proto == -4 && $i != *:* ) || ( $proto == -6 && $i == *:* ) ]] || continue
 		printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${i%/*}" "$marker"
+		printf -v nftcmd '%sadd rule %s %s preraw iifname != %s %s daddr %s fib saddr type != local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFACE" "$pf" "${i%/*}"
 	done
 	printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --restore-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
+	printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
+	printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
 	[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
-	echo -n "$restore" | cmd $iptables-restore -n
-	HAVE_SET_IPTABLES=1
+	if type -p nft >/dev/null; then
+		echo -n "$nftcmd" | cmd nft -f -
+	else
+		echo -n "$restore" | cmd $iptables-restore -n
+	fi
+	HAVE_SET_FIREWALL=1
 	return 0
 }
 
@@ -323,7 +342,7 @@ cmd_down() {
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
 	del_if
 	unset_dns || true
-	remove_iptables || true
+	remove_firewall || true
 	execute_hooks "${POST_DOWN[@]}"
 }
 
-- 
2.24.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
