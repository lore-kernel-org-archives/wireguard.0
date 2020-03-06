Return-Path: <SRS0=VgS1=4X=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D9A8C10DCE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Mar 2020 23:28:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B89D5206D7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Mar 2020 23:28:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="e8AshXl5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B89D5206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a3eb4a2;
	Fri, 6 Mar 2020 23:23:19 +0000 (UTC)
Received: from sonic308-55.consmr.mail.gq1.yahoo.com
 (sonic308-55.consmr.mail.gq1.yahoo.com [98.137.68.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 812800ef
 for <wireguard@lists.zx2c4.com>; Fri, 6 Mar 2020 17:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1583514851; bh=zlPVN2WNPw2O5pLr5ebGMfch6gX+gPuXHkrxOKT5vhQ=;
 h=From:To:Cc:Subject:Date:References:From:Subject;
 b=e8AshXl59Qxog+upZtz+8m7RxjFxvmir7LrePeiPCIJLUnh3/6taI9ko0ZLKqutObGhBfY9StSe5bRULpQ13j2niQpRiBrjgyzuwlaXTg8CFMug0MK0VKmDNHHEt3kQaXVELdPooSwk6Mz8XLFMaUDsjSvv+fH1xJcThgRpOkyDHHL6k/dgd6EbVHPFNldqw1tHgkjcUG5v/AqVudNjnnc0ViXushOAGt7t/s+f7yGMh/ESoMP6BSQJRo1aH0fbwpR/R+gN40heQknMc1fzYwdvUXURp1/P108aa9l4EvhguoZpM7h1jk4rRzIcTl1ePwy53t7zyB2bD3Fk2O74k3A==
X-YMail-OSG: Gd_yRqIVM1lEI6JodbcjxjJM4XhyVLFDMv2FjLFOff9RzxmgGCdpANMd3xrxGuk
 D6FsyyJQl1ZIY95q9xCDzjTc2QxQiiFIWzru1yeim.DKpCKkSQAAWI1PCRyoY42NyhrrLfBopcr2
 EfXt.S6WssCtRKaoYA6xTYYB6tzhCBbq5Gx2tpOUidL.iJsGdNIvRRso7TT0pBLvrH7meExs123C
 G1nSiF9R03gGTKvvdpOkdtwN7wNnuUQ81wfMhw5eN39pCtG.ja.zSDG2DOjgHEiy8jlVyhItMyp1
 3DGXvDlCLwS6rQrf6bOAm9xJ.AIXvz7k3inPBCrnj_NAeLm67fAnd5mwcu.VGFMH0bxg6Xxgv_rq
 EeJox2siYYe0cUJV6QVUDNHHbc1EXmaVTprSeVDiWVPBTZGHKrpFkDcQ2UQfUAXF.ct_HN99X6Z4
 xnbLKE7K8oAPyjfDbY2x69TjOvQcCojfE.rqxMKcwsA5OedPw_vG8jQz.H9FxbJKIydFR4eKaxZu
 ZrD1wDbPVDVtUgGaZ47CwWvPH2Ypb4GmkZYu0DZtrfMlcYED8DdBn_izVi7eOG30Iqk.cxxPw4dm
 QGzMVqIubqBsvjCFwumU.XyT00gOfi5yQfPpdVQFTqg8HnDyxWMJpDq.eOilF3TvxFSklz.yzMdV
 MVEj3YEo1xKKIhzHNwsP41mQ.Z2QkTLhxDrETWm25gOM4UQH3haxdXZeTJb9M_raD6YE0S5r.hVk
 6jUKBdijLwEvnFZ3H1rwOLRlIA9u3CNupLnoQD2d8QJz3ru7alObnRDKQok7a7PyjpnlksoiI7Hj
 kb6YMaT8sg.2m3i2.eA93NxL67ynuPfEbF7YB7mIgI9MFXcYk80XKsK2Kp5QA04_0pPf.nVscye2
 QVKWf2_uJTn4Qj3ZAOKqyBxK6gJY3bJxc5nxzjjaGbHSRg0_mLRWyUNXccR.jgTan8u3UsGfvMhX
 kAU8acjYatnWR0rrdNFeI9oZ4BClV9Ie4vIw498Cs01GsH4zzNNGKB1bA3TlxRCTcEtBBIQ25Tm3
 hqOqRV_crY83qFrd79h_Oi64.5npEfER_0gdpA.DAtQhyKqi84EA2KVej0gB1N49CLW3FRkHuPrm
 7Up3RAq.gzdRkklAlQ8HqyasXv64RJJA3LBup084UpHj3jyt8Lg8vMQCEeU7PWAR6bNO_xBVn_t.
 3TRrdf7em8026TkVR1UHs5U1L7lFasMXdDmPVXdgPWfnKxwk2tYIcMHXX1jtXMspkGXpAsTFV1LW
 i.ZcexQ90Gz93W0MROE7P1sgCQ3ZvZkzBTV__urAvCp1QTwQYXC9IWltFNLfgt7StxtQat.L1Qxb
 ggqRV34Frh2ul6OGCMi5NjkewHmupjWN2vkYdh0wVD8IPhhB_Ar.fbGE_2iImppAEPik71DKVJ2R
 h
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 6 Mar 2020 17:14:11 +0000
Received: by smtp425.mail.bf1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID 0d2ab631ecdd424434f41b094a820b56; 
 Fri, 06 Mar 2020 17:04:06 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: wireguard@lists.zx2c4.com
Subject: [RFC PATCH] wg-quick/linux: switch to ip rule rp filter
Date: Fri,  6 Mar 2020 12:04:04 -0500
Message-Id: <20200306170404.81788-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
References: <20200306170404.81788-1-alex_y_xu.ref@yahoo.ca>
X-Mailman-Approved-At: Sat, 07 Mar 2020 00:23:18 +0100
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
 src/wg-quick/linux.bash | 113 ++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..7bd2f85 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -22,10 +22,15 @@ POST_UP=( )
 PRE_DOWN=( )
 POST_DOWN=( )
 SAVE_CONFIG=0
+ALLOWEDIPS=( )
 CONFIG_FILE=""
 PROGRAM="${0##*/}"
 ARGS=( "$@" )
 
+# needs to match across all wireguard devices, because only one
+# suppress_ifgroup is supported
+IFGROUP=51820
+
 cmd() {
 	echo "[#] $*" >&2
 	"$@"
@@ -65,6 +70,7 @@ parse_options() {
 			SaveConfig) read_bool SAVE_CONFIG "$value"; continue ;;
 			esac
 		fi
+		[[ $key == "AllowedIPs" ]] && ALLOWEDIPS+=( ${value//,/ } )
 		WG_CONFIG+="$line"$'\n'
 	done < "$CONFIG_FILE"
 	shopt -u nocasematch
@@ -93,21 +99,23 @@ add_if() {
 }
 
 del_if() {
-	local table
+	local table table_local table_drop
 	[[ $HAVE_SET_DNS -eq 0 ]] || unset_dns
-	[[ $HAVE_SET_FIREWALL -eq 0 ]] || remove_firewall
 	if [[ -z $TABLE || $TABLE == auto ]] && get_fwmark table && [[ $(wg show "$INTERFACE" allowed-ips) =~ /0(\ |$'\n'|$) ]]; then
-		while [[ $(ip -4 rule show 2>/dev/null) == *"lookup $table"* ]]; do
-			cmd ip -4 rule delete table $table
-		done
-		while [[ $(ip -4 rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
-			cmd ip -4 rule delete table main suppress_prefixlength 0
-		done
-		while [[ $(ip -6 rule show 2>/dev/null) == *"lookup $table"* ]]; do
-			cmd ip -6 rule delete table $table
-		done
-		while [[ $(ip -6 rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
-			cmd ip -6 rule delete table main suppress_prefixlength 0
+		table_local=$((table + 1))
+		table_drop=$((table + 2))
+		for proto in -4 -6; do
+			for _table in $table $table_local $table_drop; do
+				while [[ $(ip $proto rule show 2>/dev/null) == *"lookup $_table"* ]]; do
+					cmd ip $proto rule delete lookup $_table
+				done
+                                if [[ -n $(ip $proto route show table $_table 2>/dev/null) ]]; then
+                                    cmd ip $proto route flush table $_table
+                                fi
+			done
+			while [[ $(ip $proto rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
+				cmd ip $proto rule delete lookup main suppress_prefixlength 0
+			done
 		done
 	fi
 	cmd ip link delete dev "$INTERFACE"
@@ -181,31 +189,8 @@ get_fwmark() {
 	return 0
 }
 
-remove_firewall() {
-	if type -p nft >/dev/null; then
-		local table nftcmd
-		while read -r table; do
-			[[ $table == *" wg-quick-$INTERFACE" ]] && printf -v nftcmd '%sdelete %s\n' "$nftcmd" "$table"
-		done < <(nft list tables 2>/dev/null)
-		[[ -z $nftcmd ]] || cmd nft -f <(echo -n "$nftcmd")
-	fi
-	if type -p iptables >/dev/null; then
-		local line iptables found restore
-		for iptables in iptables ip6tables; do
-			restore="" found=0
-			while read -r line; do
-				[[ $line == "*"* || $line == COMMIT || $line == "-A "*"-m comment --comment \"wg-quick(8) rule for $INTERFACE\""* ]] || continue
-				[[ $line == "-A"* ]] && found=1
-				printf -v restore '%s%s\n' "$restore" "${line/#-A/-D}"
-			done < <($iptables-save 2>/dev/null)
-			[[ $found -ne 1 ]] || echo -n "$restore" | cmd $iptables-restore -n
-		done
-	fi
-}
-
-HAVE_SET_FIREWALL=0
 add_default() {
-	local table line
+	local table line table_local
 	if ! get_fwmark table; then
 		table=51820
 		while [[ -n $(ip -4 route show table $table 2>/dev/null) || -n $(ip -6 route show table $table 2>/dev/null) ]]; do
@@ -213,32 +198,35 @@ add_default() {
 		done
 		cmd wg set "$INTERFACE" fwmark $table
 	fi
+	table_local=$((table+1))
+	table_drop=$((table+2))
 	local proto=-4 iptables=iptables pf=ip
 	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
 	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
 	cmd ip $proto rule add not fwmark $table table $table
 	cmd ip $proto rule add table main suppress_prefixlength 0
 
-	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
-	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting priority -300; }\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
-	printf -v nftcmd '%sadd chain %s %s postmangle { type filter hook postrouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
-	while read -r line; do
-		[[ $line =~ .*inet6?\ ([0-9a-f:.]+)/[0-9]+.* ]] || continue
-		printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "$marker"
-		printf -v nftcmd '%sadd rule %s %s preraw iifname != "%s" %s daddr %s fib saddr type != local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFACE" "$pf" "${BASH_REMATCH[1]}"
-	done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
-	printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --restore-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
-	printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
-	printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
-	[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
-	if type -p nft >/dev/null; then
-		cmd nft -f <(echo -n "$nftcmd")
-	else
-		echo -n "$restore" | cmd $iptables-restore -n
+	ip link set $INTERFACE group $IFGROUP
+	# this can be done with ip -batch, but this way allows us to use the cmd wrapper
+	ip $proto route show table local dev $INTERFACE | while read route; do
+		cmd ip $proto route add $route dev $INTERFACE table $table_local
+		if [[ "$route" == "local "* ]]; then
+			cmd ip $proto route add blackhole ${route#local} table $table_drop
+		fi
+	done
+	# ip rules are added in reverse priority order, so drop MUST be first
+	cmd ip $proto rule add lookup $table_drop
+	cmd ip $proto rule add iif $INTERFACE lookup $table_local
+	cmd ip $proto rule add iif lo lookup $table_local
+	# pre-state checked in cmd_up
+	if grep -q '^1$' /proc/sys/net/ipv4/conf/*/rp_filter; then
+		cmd sysctl -q net.ipv4.conf.all.rp_filter=2
 	fi
-	HAVE_SET_FIREWALL=1
+	if [[ $(ip rule show priority 0) == $'0:\tfrom all lookup local' ]]; then
+		cmd ip $proto rule add lookup local suppress_ifgroup $IFGROUP priority 0
+		cmd ip $proto rule del lookup local priority 0
+	fi
+
 	return 0
 }
 
@@ -321,6 +309,18 @@ cmd_usage() {
 cmd_up() {
 	local i
 	[[ -z $(ip link show dev "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERFACE' already exists"
+	if [[ "${ROUTES[*]} " == *"/0 "* ]]; then
+		# do some checks first so we don't have to die in add_default later
+		case "$(ip rule show priority 0)" in
+			$'0:\tfrom all lookup local') ;;
+			$'0:\tfrom all lookup local suppress_ifgroup '$IFGROUP) ;;
+			*) die "ip rule priority 0 must be default or suppress_ifgroup $IFGROUP" ;;
+		esac
+		# most mainstream distros (all systemd-based) set rp_filter=2 by default anyways
+		if grep -q '^1$' /proc/sys/net/ipv4/conf/*/rp_filter; then
+			echo "$PROGRAM: warning: setting net.ipv4.conf.all.rp_filter=2 to support /0 route"
+		fi
+	fi
 	trap 'del_if; exit' INT TERM EXIT
 	execute_hooks "${PRE_UP[@]}"
 	add_if
@@ -343,7 +343,6 @@ cmd_down() {
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
 	del_if
 	unset_dns || true
-	remove_firewall || true
 	execute_hooks "${POST_DOWN[@]}"
 }
 
-- 
2.25.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
