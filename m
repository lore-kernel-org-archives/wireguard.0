Return-Path: <SRS0=CBQl=5I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,LOTS_OF_MONEY,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595FEC4332E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 18:41:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8744420409
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2020 18:41:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="K2ekarR+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8744420409
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a483b51d;
	Mon, 23 Mar 2020 18:34:28 +0000 (UTC)
Received: from sonic310-21.consmr.mail.gq1.yahoo.com
 (sonic310-21.consmr.mail.gq1.yahoo.com [98.137.69.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6877d8d3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2020 18:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1584988886; bh=CsABhM9w3elufdoqLAqtDWv4cFZO4FOh9tqI18yQ0g0=;
 h=From:To:Cc:Subject:Date:References:From:Subject;
 b=K2ekarR+ASgIIjifOzc0JYpsJM7mgNPEZ6qHzOe6DCqp7QU6kL0yyrNpJlzPbopmNG+LquF3Mtu8s/cPZmw79HjzM6PaF9n6yGGpyYpdHq9CJEp0hNBbm7P+tFkTrionNC/C2S/zu6WTHORVb/HZ8enBFg3CqW9PpDbjBvFcn5k2fThNBqTTbYT7+ziaNYhiyTx5Ma4eW9bZ2yza3YAsNwhIJflj6N+A3r1Vfk6mg2qozF9iRU5SnymPMhHOpvzdGE/vjUKyWFaUS/jwXbCcUOhUvGaIbORAyYkuU8waQxNeQ2c2TU4LokYpkA1TiZ6OTEiNQrVtFVBg2BzNUaD6Hg==
X-YMail-OSG: TBtzFzMVM1m6FIYE8.TvwIlSWpxtI9Wf9AH6tlxGrKALSUjF5MlQ9pBKY2A9znO
 hgWXW7L0GeJyJwofkK5iZArLSvksqGFGqvG8x5pQX9HsPTKLGOsX79KopG7bTqe2cPYyES3riDyx
 GjmlS22X834Sqzq25wd8BVJHE9qFpl9cbGgqtC6BzOnq_5nzXOkzrFSShVlRRSiCqYVj55_tgwDb
 TqV4ud.YcZqDPC8KuVWGZPYzQSYOMpw82n_owsuNdkgsRdsbM8.OyCwL.LbRazfC3GgzIma.WWNE
 S9VPSqpo4VU9EGR.gDlAGrPyvA0fpfXC63LU1z8C2L4fF7jtcNFFInN4DhzyPXcigrpmBmm2Cv3.
 wYiORs2uPraYNAtqFfET7WQXXDU8e0jPpT1VYpFSYkwk9KZmF4g6XCYvlc8KqOJaRHArJ4F3BOry
 jDoqJK8CmwQTY78K71t_JCwzDGEbzA3WfQJmDq8k8tmRr7f5Non2nfaa3lNVQrOJHTRMjCQ4gN7k
 OjzlD9DF7DCrQbhgie5Fk3k3zKjkppz3hWGSJFDu7zjr.OtlNnb9vsZiRM2Dj8oCZuTT4m8O47W0
 JOtImPlhPe1z1DzfqAsBWkT1OJr2jptDLEknNLA8N9.ldiQnh6RBLvvGdFI2L74S5vn.n7VFFeWm
 6QRjHGyJ_Hq2d5N6pTumDdYgdZ1EgfroCqeqEQkhZPc.D77aM8v1uhsQCS2FjnMvVpSYuBIzqD54
 COE1o.VWkmBz9ILmKVcLvsODu75ty1q_yB0Qv5lomvnFctPpYyq9yTOhfNeloN7JUnkH0EUhhtlp
 u2NcHVWvtmQ1vq3Qzs8L6s80sFGMcoOBOCqQy.4Q3BfEXmmd4KULF7NZSaD2QeNmIDdguczGiojx
 0Q.dkXhZqUlMq4wrUzOdxPERmwmSa798HRVsrV6EMSEX3YRiXAcKki_PBU5ucDucpGtofecGZ6c5
 ZrofBmpZwp3M2Mr6M5fv3Gwyz3ZmfElB4Saq16IIJzlbKgaB1PcOHYo6CX5e4l1w6WhldGd7psYz
 5AHXcXOqjp97e46tsjq01WYhLcYPV7hF.E3qO67wd8ZauBVuyfUKzCZXA6ZZLISOTwdQt23ZExhJ
 0U.WcJnh_uX_OrZTfNl9QAJjcgfww0SWH5bgV3ecwPmNsRmPIlMd655VxiBcZSHpKLYvei4CX_FH
 ADh60Pm31XATan_7LCc6oHPpfSmeEW3Y2bfqzAd2cUEaubyESj.ii1P1pfBndvA_xc9Uk87DZVMp
 qdMdG8Bm4RpR9hYV3_RNAcmWcbarbxSjJf4f_bJNIubd0vI1LN0MfILMeORMnrM0ItBnMwekgubA
 aeiFTAUFISGI7xxQyOB09vpgrZwNA7GAcZf8qIlj5QSpTalGyaNeQbVSijkhi18KfkRlM96gI7.q
 r
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Mon, 23 Mar 2020 18:41:26 +0000
Received: by smtp411.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA
 ID f0994cea58d779d7349335ff1ecd386e; 
 Mon, 23 Mar 2020 18:31:18 +0000 (UTC)
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
To: wireguard@lists.zx2c4.com
Cc: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: [RFC PATCH v2] wg-quick/linux: switch to ip rule rp filter
Date: Mon, 23 Mar 2020 14:31:15 -0400
Message-Id: <20200323183115.56304-1-alex_y_xu@yahoo.ca>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20200323183115.56304-1-alex_y_xu.ref@yahoo.ca>
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

---
 src/wg-quick/linux.bash | 170 ++++++++++++++++++++++------------------
 1 file changed, 95 insertions(+), 75 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..a157006 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -26,6 +26,10 @@ CONFIG_FILE=""
 PROGRAM="${0##*/}"
 ARGS=( "$@" )
 
+# needs to match across all wireguard devices, because only one
+# suppress_ifgroup is supported
+IFGROUP=51820
+
 cmd() {
 	echo "[#] $*" >&2
 	"$@"
@@ -93,21 +97,17 @@ add_if() {
 }
 
 del_if() {
-	local table
 	[[ $HAVE_SET_DNS -eq 0 ]] || unset_dns
-	[[ $HAVE_SET_FIREWALL -eq 0 ]] || remove_firewall
-	if [[ -z $TABLE || $TABLE == auto ]] && get_fwmark table && [[ $(wg show "$INTERFACE" allowed-ips) =~ /0(\ |$'\n'|$) ]]; then
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
+	if [[ $TABLE == '' || $TABLE == auto ]]; then
+		for proto in -4 -6; do
+			while read prio rule; do
+				if [[ $rule == *[io]if\ $INTERFACE* || $rule == *"ipproto udp sport $(wg show $INTERFACE listen-port)"* ]]; then
+					if [[ $rule =~ lookup\ ([^ ]*) ]] && [[ ${BASH_REMATCH[1]} != main ]]; then
+						cmd ip $proto route flush table ${BASH_REMATCH[1]}
+					fi
+					cmd ip $proto rule delete priority ${prio%:}
+				fi
+			done < <(ip $proto rule show)
 		done
 	fi
 	cmd ip link delete dev "$INTERFACE"
@@ -173,75 +173,87 @@ add_route() {
 	fi
 }
 
-get_fwmark() {
-	local fwmark
-	fwmark="$(wg show "$INTERFACE" fwmark)" || return 1
-	[[ -n $fwmark && $fwmark != off ]] || return 1
-	printf -v "$1" "%d" "$fwmark"
-	return 0
-}
+allocate_gap() {
+	# allocate a gap from stdin between min and max inclusive
+	local var=$1 min=$2 max=$3
+	local prev_ent=$((min - 1))
 
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
+	# find a gap
+	while read this_ent && (( this_ent <= prev_ent + 1 && this_ent <= max )); do
+		if (( this_ent >= min )); then
+			prev_ent=$this_ent
+		fi
+	done
+
+	# verify gap
+	if (( prev_ent + 1 >= min )) && (( prev_ent + 1 <= max )); then
+		printf -v "$var" "$((prev_ent + 1))"
+		return 0
+	else
+		return 1
 	fi
 }
 
-HAVE_SET_FIREWALL=0
+allocate_table() {
+	allocate_gap $1 51820 4294967295 \
+		< <(ip -N route show table all | sed -n -e 's/.*table \([0-9]*\).*/\1/p' | sort -u) \
+		|| die 'could not allocate routing table'
+}
+
+allocate_rule() {
+	allocate_gap "$@" < <({ ip -4 -N rule show; ip -6 -N rule show; } | sed -e 's/:.*//' | sort -u) \
+		|| die 'could not allocate routing rule'
+}
+
 add_default() {
-	local table line
-	if ! get_fwmark table; then
-		table=51820
-		while [[ -n $(ip -4 route show table $table 2>/dev/null) || -n $(ip -6 route show table $table 2>/dev/null) ]]; do
-			((table++))
-		done
-		cmd wg set "$INTERFACE" fwmark $table
-	fi
-	local proto=-4 iptables=iptables pf=ip
-	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
+	local proto=-4 table rule_main rule_wg
+	[[ $1 == *:* ]] && proto=-6
+	allocate_table table
 	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
-	cmd ip $proto rule add not fwmark $table table $table
-	cmd ip $proto rule add table main suppress_prefixlength 0
-
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
-	fi
-	HAVE_SET_FIREWALL=1
+	allocate_rule rule_main 10000 20000
+	cmd ip $proto rule add priority $rule_main not oif $INTERFACE table main suppress_prefixlength 0
+	allocate_rule rule_wg 10000 20000
+	cmd ip $proto rule add priority $rule_wg not iif lo ipproto udp sport $(wg show $INTERFACE listen-port) lookup $table
 	return 0
 }
 
+set_strong_host() {
+	case "$(ip rule show priority 0)" in
+		$'0:\tfrom all lookup local') ;;
+		$'0:\tfrom all lookup local suppress_ifgroup '$IFGROUP) ;;
+		*) die "strong host rules cannot be applied due to non-default ip rule 0" ;;
+	esac
+	case "$(ip rule show priority 1)" in
+		'') ;;
+		$'1:\tfrom all iif lo lookup local') ;;
+		*) die "strong host rules cannot be applied due to non-default ip rule 1" ;;
+	esac
+	local table_local table_drop rule_iif rule_drop
+
+	ip link set $INTERFACE group $IFGROUP
+	# this can be done with ip -batch, but this way allows us to use the cmd wrapper
+	allocate_table table_local
+	ip $proto route show table local dev $INTERFACE | while read route; do
+		cmd ip $proto route add $route dev $INTERFACE table $table_local
+	done
+	allocate_table table_drop
+	ip $proto route show table local dev $INTERFACE | grep '^local' | while read route; do
+		cmd ip $proto route add blackhole ${route#local} table $table_drop
+	done
+	allocate_rule rule_iif 1000 5000
+	cmd ip $proto rule add priority $rule_iif iif $INTERFACE lookup $table_local
+	allocate_rule rule_drop 1000 5000
+	cmd ip $proto rule add priority $rule_drop not iif $INTERFACE lookup $table_drop
+	if [[ $(ip rule show priority 0) == $'0:\tfrom all lookup local' ]]; then
+		cmd ip $proto rule add lookup local suppress_ifgroup $IFGROUP priority 0
+		cmd ip $proto rule del lookup local priority 0
+	fi
+	if [[ $(ip rule show priority 1) == $'0:\tfrom all lookup local' ]]; then
+		cmd ip $proto rule add iif lo lookup local priority 1
+		cmd ip $proto rule del lookup local priority 1
+	fi
+}
+
 set_config() {
 	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
 }
@@ -330,11 +342,20 @@ cmd_up() {
 	done
 	set_mtu_up
 	set_dns
+	if grep -q -E '0|2' /proc/sys/net/ipv4/conf/*/rp_filter; then
+		rp_filter_is_off=1
+	fi
+	if [[ $TABLE == '' || $TABLE == auto ]] && [[ $rp_filter_is_off == 1 ]]; then
+		set_strong_host
+	fi
 	for i in $(while read -r _ i; do for i in $i; do [[ $i =~ ^[0-9a-z:.]+/[0-9]+$ ]] && echo "$i"; done; done < <(wg show "$INTERFACE" allowed-ips) | sort -nr -k 2 -t /); do
 		add_route "$i"
 	done
 	execute_hooks "${POST_UP[@]}"
 	trap - INT TERM EXIT
+	if [[ $rp_filter_is_off == 1 ]] && grep -q 1 /proc/sys/net/{ipv4,ipv6}/conf/*/forwarding; then
+		echo "$PROGRAM: warning: ensure rp_filter is installed, see https://www.wireguard.com/rp_filter" >&2
+	fi
 }
 
 cmd_down() {
@@ -343,7 +364,6 @@ cmd_down() {
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
 	del_if
 	unset_dns || true
-	remove_firewall || true
 	execute_hooks "${POST_DOWN[@]}"
 }
 
-- 
2.26.0

