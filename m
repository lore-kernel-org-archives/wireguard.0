Return-Path: <SRS0=JaX8=BG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DAF9C433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:47:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08B7206E7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Jul 2020 15:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bat.fr.eu.org header.i=@bat.fr.eu.org header.b="iyG2ATie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08B7206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bat.fr.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 632cab9a;
	Mon, 27 Jul 2020 15:23:39 +0000 (UTC)
Received: from edna.lautre.net (edna.lautre.net [80.67.160.88])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3d65c228
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Jul 2020 11:51:34 +0000 (UTC)
Received: from localhost (unknown [193.32.127.237])
 by edna.lautre.net (Postfix) with ESMTPA id E8DDD11624D;
 Mon, 27 Jul 2020 14:14:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bat.fr.eu.org;
 s=alternc; t=1595852091;
 bh=tGwSqWpCmZC2O+l7LImIN2JyH14awiLvdA5SusS01cQ=;
 h=From:To:Cc:Subject:Date;
 b=iyG2ATieCthuiDVNmQZ1YWNK4D1WDVzygIPevvO7hbAFcwM4g6fy/TvvNGGW1w3Tn
 +r5KUVCW5xL7yu9bSXgxEiIbYnoCAhWOHVGoaqFtcWUfFVHsmkE2WpKksUjwbpYuEG
 Sq5wqSbY7Uh7GQDWTZtpxz6Ce5QVnvY8OvjLx69o=
From: Baptiste Fouques <baptiste+wg@bat.fr.eu.org>
To: wireguard@lists.zx2c4.com
Cc: Baptiste Fouques <baptiste+wg@bat.fr.eu.org>
Subject: [PATCH 1/1] Network namespace support in wg-quick -- Linux only
Date: Mon, 27 Jul 2020 14:13:57 +0200
Message-Id: <20200727121357.57583-1-baptiste+wg@bat.fr.eu.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 27 Jul 2020 17:23:38 +0200
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

Implement netns support as stated in https://www.wireguard.com/netns/ 
§ Ordinary Containerization.

Create Namespace if necessary. 
Created a specific resolv.conf if necessary

---
 src/wg-quick/linux.bash | 125 +++++++++++++++++++++++++++-------------
 1 file changed, 85 insertions(+), 40 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index e4d4c4f..ed5b9c4 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -18,6 +18,7 @@ MTU=""
 DNS=( )
 DNS_SEARCH=( )
 TABLE=""
+NAMESPACE=""
 PRE_UP=( )
 POST_UP=( )
 PRE_DOWN=( )
@@ -61,6 +62,7 @@ parse_options() {
 				[[ $v =~ (^[0-9.]+$)|(^.*:.*$) ]] && DNS+=( $v ) || DNS_SEARCH+=( $v )
 			done; continue ;;
 			Table) TABLE="$value"; continue ;;
+      Namespace) NAMESPACE="$value"; continue ;;
 			PreUp) PRE_UP+=( "$value" ); continue ;;
 			PreDown) PRE_DOWN+=( "$value" ); continue ;;
 			PostUp) POST_UP+=( "$value" ); continue ;;
@@ -85,6 +87,33 @@ auto_su() {
 	[[ $UID == 0 ]] || exec sudo -p "$PROGRAM must be run as root. Please enter the password for %u to continue: " -- "$BASH" -- "$SELF" "${ARGS[@]}"
 }
 
+HAVE_SET_NAMESPACE=0
+add_ns () {
+	  [[ -z "$NAMESPACE" ]] && return 0
+    if ! ip netns |grep "$NAMESPACE"; then
+        cmd ip netns add "$NAMESPACE";
+				cmd ip -n "$NAMESPACE" link set dev lo up
+        HAVE_SET_NAMESPACE=1
+    fi
+}
+
+del_ns () {
+	  [[ -z "$NAMESPACE" ]] && return 0
+    cmd ip netns del "$NAMESPACE"
+}
+
+option_ns () {
+    [[ -z "$NAMESPACE" ]] && echo "" && return 0
+
+    echo "-netns $NAMESPACE" && return 0
+}
+
+exec_ns () {
+    [[ -z "$NAMESPACE" ]] && echo "" && return 0
+
+    echo "ip netns exec $NAMESPACE" && return 0
+}
+
 add_if() {
 	local ret
 	if ! cmd ip link add "$INTERFACE" type wireguard; then
@@ -93,6 +122,9 @@ add_if() {
 		echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation." >&2
 		cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE"
 	fi
+  if [[ -n "$NAMESPACE" ]]; then
+    cmd ip link set netns "$NAMESPACE" dev "$INTERFACE"
+  fi
 }
 
 del_if() {
@@ -100,45 +132,46 @@ del_if() {
 	[[ $HAVE_SET_DNS -eq 0 ]] || unset_dns
 	[[ $HAVE_SET_FIREWALL -eq 0 ]] || remove_firewall
 	if [[ -z $TABLE || $TABLE == auto ]] && get_fwmark table && [[ $(wg show "$INTERFACE" allowed-ips) =~ /0(\ |$'\n'|$) ]]; then
-		while [[ $(ip -4 rule show 2>/dev/null) == *"lookup $table"* ]]; do
-			cmd ip -4 rule delete table $table
+		while [[ $(ip -4 $(op) rule show 2>/dev/null) == *"lookup $table"* ]]; do
+			  cmd ip -4  $(option_ns) rule delete table $table
 		done
-		while [[ $(ip -4 rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
-			cmd ip -4 rule delete table main suppress_prefixlength 0
+		while [[ $(ip -4  $(option_ns) rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
+			  cmd ip -4  $(option_ns) rule delete table main suppress_prefixlength 0
 		done
-		while [[ $(ip -6 rule show 2>/dev/null) == *"lookup $table"* ]]; do
-			cmd ip -6 rule delete table $table
+		while [[ $(ip -6  $(option_ns) rule show 2>/dev/null) == *"lookup $table"* ]]; do
+			  cmd ip -6  $(option_ns) rule delete table $table
 		done
-		while [[ $(ip -6 rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
-			cmd ip -6 rule delete table main suppress_prefixlength 0
+		while [[ $(ip -6  $(option_ns) rule show 2>/dev/null) == *"from all lookup main suppress_prefixlength 0"* ]]; do
+			  cmd ip -6  $(option_ns) rule delete table main suppress_prefixlength 0
 		done
 	fi
-	cmd ip link delete dev "$INTERFACE"
+	cmd ip  $(option_ns) link delete dev "$INTERFACE"
+	[[ $HAVE_SET_NAMESPACE -eq 0 ]] || del_ns
 }
 
 add_addr() {
 	local proto=-4
 	[[ $1 == *:* ]] && proto=-6
-	cmd ip $proto address add "$1" dev "$INTERFACE"
+	cmd ip  $(option_ns) $proto address add "$1" dev "$INTERFACE"
 }
 
 set_mtu_up() {
 	local mtu=0 endpoint output
 	if [[ -n $MTU ]]; then
-		cmd ip link set mtu "$MTU" up dev "$INTERFACE"
+		  cmd ip  $(option_ns) link set mtu "$MTU" up dev "$INTERFACE"
 		return
 	fi
 	while read -r _ endpoint; do
 		[[ $endpoint =~ ^\[?([a-z0-9:.]+)\]?:[0-9]+$ ]] || continue
-		output="$(ip route get "${BASH_REMATCH[1]}" || true)"
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
-	done < <(wg show "$INTERFACE" endpoints)
+		output="$(ip  $(option_ns) route get "${BASH_REMATCH[1]}" || true)"
+		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip  $(option_ns) link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+	done < <($(exec_ns) wg show "$INTERFACE" endpoints)
 	if [[ $mtu -eq 0 ]]; then
-		read -r output < <(ip route show default || true) || true
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		  read -r output < <(ip $(option_ns) route show default || true) || true
+		  [[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip $(option_ns) link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	fi
 	[[ $mtu -gt 0 ]] || mtu=1500
-	cmd ip link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
+	cmd ip $(option_ns) link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
 }
 
 resolvconf_iface_prefix() {
@@ -153,15 +186,19 @@ resolvconf_iface_prefix() {
 HAVE_SET_DNS=0
 set_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
+	[[ -n "$NAMESPACE" ]] && [[ -f "/etc/netns/$NAMESPACE/resolv.conf" ]] || cmd  mkdir -p "/etc/netns/$NAMESPACE" && cmd touch "/etc/netns/$NAMESPACE/resolv.conf"
 	{ printf 'nameserver %s\n' "${DNS[@]}"
 	  [[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf 'search %s\n' "${DNS_SEARCH[*]}"
-	} | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	} | cmd $(exec_ns) resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	{ printf '    < nameserver %s\n' "${DNS[@]}"
+	  [[ ${#DNS_SEARCH[@]} -eq 0 ]] || printf '    < search %s\n' "${DNS_SEARCH[*]}"
+	} | cat
 	HAVE_SET_DNS=1
 }
 
 unset_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE" -f
+	cmd $(exec_ns) resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE" -f
 }
 
 add_route() {
@@ -170,17 +207,17 @@ add_route() {
 	[[ $TABLE != off ]] || return 0
 
 	if [[ -n $TABLE && $TABLE != auto ]]; then
-		cmd ip $proto route add "$1" dev "$INTERFACE" table "$TABLE"
+		  cmd ip $(option_ns) $proto route add "$1" dev "$INTERFACE" table "$TABLE"
 	elif [[ $1 == */0 ]]; then
 		add_default "$1"
 	else
-		[[ -n $(ip $proto route show dev "$INTERFACE" match "$1" 2>/dev/null) ]] || cmd ip $proto route add "$1" dev "$INTERFACE"
+		  [[ -n $(ip $(option_ns) $proto route show dev "$INTERFACE" match "$1" 2>/dev/null) ]] || cmd ip $(option_ns) $proto route add "$1" dev "$INTERFACE"
 	fi
 }
 
 get_fwmark() {
 	local fwmark
-	fwmark="$(wg show "$INTERFACE" fwmark)" || return 1
+	fwmark="$($(exec_ns) wg show "$INTERFACE" fwmark)" || return 1
 	[[ -n $fwmark && $fwmark != off ]] || return 1
 	printf -v "$1" "%d" "$fwmark"
 	return 0
@@ -191,8 +228,8 @@ remove_firewall() {
 		local table nftcmd
 		while read -r table; do
 			[[ $table == *" wg-quick-$INTERFACE" ]] && printf -v nftcmd '%sdelete %s\n' "$nftcmd" "$table"
-		done < <(nft list tables 2>/dev/null)
-		[[ -z $nftcmd ]] || cmd nft -f <(echo -n "$nftcmd")
+		done < <($(exec_ns) nft list tables 2>/dev/null)
+		[[ -z $nftcmd ]] || cmd $(exec_ns) nft -f <(echo -n "$nftcmd")
 	fi
 	if type -p iptables >/dev/null; then
 		local line iptables found restore
@@ -202,8 +239,8 @@ remove_firewall() {
 				[[ $line == "*"* || $line == COMMIT || $line == "-A "*"-m comment --comment \"wg-quick(8) rule for $INTERFACE\""* ]] || continue
 				[[ $line == "-A"* ]] && found=1
 				printf -v restore '%s%s\n' "$restore" "${line/#-A/-D}"
-			done < <($iptables-save 2>/dev/null)
-			[[ $found -ne 1 ]] || echo -n "$restore" | cmd $iptables-restore -n
+			done < <($(exec_ns) $iptables-save 2>/dev/null)
+			[[ $found -ne 1 ]] || echo -n "$restore" | cmd $(exec_ns) $iptables-restore -n
 		done
 	fi
 }
@@ -213,16 +250,16 @@ add_default() {
 	local table line
 	if ! get_fwmark table; then
 		table=51820
-		while [[ -n $(ip -4 route show table $table 2>/dev/null) || -n $(ip -6 route show table $table 2>/dev/null) ]]; do
+		while [[ -n $(ip $(option_ns) -4 route show table $table 2>/dev/null) || -n $(ip $(option_ns) -6 route show table $table 2>/dev/null) ]]; do
 			((table++))
 		done
-		cmd wg set "$INTERFACE" fwmark $table
+		cmd $(exec_ns) wg set "$INTERFACE" fwmark $table
 	fi
 	local proto=-4 iptables=iptables pf=ip
 	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
-	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
-	cmd ip $proto rule add not fwmark $table table $table
-	cmd ip $proto rule add table main suppress_prefixlength 0
+	cmd ip $(option_ns) $proto route add "$1" dev "$INTERFACE" table $table
+	cmd ip $(option_ns) $proto rule add not fwmark $table table $table
+	cmd ip $(option_ns) $proto rule add table main suppress_prefixlength 0
 
 	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
@@ -239,21 +276,21 @@ add_default() {
 	printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
 	[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
 	if type -p nft >/dev/null; then
-		cmd nft -f <(echo -n "$nftcmd")
+		  cmd $(exec_ns) nft -f <(echo -n "$nftcmd")
 	else
-		echo -n "$restore" | cmd $iptables-restore -n
+		  echo -n "$restore" | cmd $(exec_ns) $iptables-restore -n
 	fi
 	HAVE_SET_FIREWALL=1
 	return 0
 }
 
 set_config() {
-	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
+	  cmd $(exec_ns) wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
 }
 
 save_config() {
 	local old_umask new_config current_config address cmd
-	[[ $(ip -all -brief address show dev "$INTERFACE") =~ ^$INTERFACE\ +\ [A-Z]+\ +(.+)$ ]] || true
+	[[ $(ip $(option_ns) -all -brief address show dev "$INTERFACE") =~ ^$INTERFACE\ +\ [A-Z]+\ +(.+)$ ]] || true
 	new_config=$'[Interface]\n'
 	for address in ${BASH_REMATCH[1]}; do
 		new_config+="Address = $address"$'\n'
@@ -261,8 +298,9 @@ save_config() {
 	while read -r address; do
 		[[ $address =~ ^nameserver\ ([a-zA-Z0-9_=+:%.-]+)$ ]] && new_config+="DNS = ${BASH_REMATCH[1]}"$'\n'
 	done < <(resolvconf -l "$(resolvconf_iface_prefix)$INTERFACE" 2>/dev/null || cat "/etc/resolvconf/run/interface/$(resolvconf_iface_prefix)$INTERFACE" 2>/dev/null)
-	[[ -n $MTU && $(ip link show dev "$INTERFACE") =~ mtu\ ([0-9]+) ]] && new_config+="MTU = ${BASH_REMATCH[1]}"$'\n'
+	[[ -n $MTU && $(ip $(option_ns) link show dev "$INTERFACE") =~ mtu\ ([0-9]+) ]] && new_config+="MTU = ${BASH_REMATCH[1]}"$'\n'
 	[[ -n $TABLE ]] && new_config+="Table = $TABLE"$'\n'
+  [[ -n "$NAMESPACE" ]] && new_config+="Namespace = $NAMESPACE"$'\n'
 	[[ $SAVE_CONFIG -eq 0 ]] || new_config+=$'SaveConfig = true\n'
 	for cmd in "${PRE_UP[@]}"; do
 		new_config+="PreUp = $cmd"$'\n'
@@ -278,7 +316,7 @@ save_config() {
 	done
 	old_umask="$(umask)"
 	umask 077
-	current_config="$(cmd wg showconf "$INTERFACE")"
+	current_config="$(cmd $(exec_ns) wg showconf "$INTERFACE")"
 	trap 'rm -f "$CONFIG_FILE.tmp"; exit' INT TERM EXIT
 	echo "${current_config/\[Interface\]$'\n'/$new_config}" > "$CONFIG_FILE.tmp" || die "Could not write configuration file"
 	sync "$CONFIG_FILE.tmp"
@@ -313,6 +351,10 @@ cmd_usage() {
 	  - Table: an optional routing table to which routes will be added; if
 	    unspecified or \`auto', the default table is used. If \`off', no routes
 	    are added.
+    - Namespace: an optional network namespace to which the interface is added;
+      following https://www.wireguard.com/netns/ "Ordinary Containerization", the
+      UDP socket lives in current namespace, then data is passed unecrypted from
+      targeted namespace to current namespace.
 	  - PreUp, PostUp, PreDown, PostDown: script snippets which will be executed
 	    by bash(1) at the corresponding phases of the link, most commonly used
 	    to configure DNS. The string \`%i' is expanded to INTERFACE.
@@ -326,7 +368,9 @@ cmd_usage() {
 cmd_up() {
 	local i
 	[[ -z $(ip link show dev "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERFACE' already exists"
+	[[ -z $(ip $(option_ns) link show dev "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERFACE' already exists in $NAMESPACE."
 	trap 'del_if; exit' INT TERM EXIT
+  add_ns
 	execute_hooks "${PRE_UP[@]}"
 	add_if
 	set_config
@@ -335,7 +379,7 @@ cmd_up() {
 	done
 	set_mtu_up
 	set_dns
-	for i in $(while read -r _ i; do for i in $i; do [[ $i =~ ^[0-9a-z:.]+/[0-9]+$ ]] && echo "$i"; done; done < <(wg show "$INTERFACE" allowed-ips) | sort -nr -k 2 -t /); do
+	for i in $(while read -r _ i; do for i in $i; do [[ $i =~ ^[0-9a-z:.]+/[0-9]+$ ]] && echo "$i"; done; done < <($(exec_ns) wg show "$INTERFACE" allowed-ips) | sort -nr -k 2 -t /); do
 		add_route "$i"
 	done
 	execute_hooks "${POST_UP[@]}"
@@ -343,17 +387,18 @@ cmd_up() {
 }
 
 cmd_down() {
-	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	[[ " $($(exec_ns) wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	execute_hooks "${PRE_DOWN[@]}"
 	[[ $SAVE_CONFIG -eq 0 ]] || save_config
 	del_if
 	unset_dns || true
 	remove_firewall || true
 	execute_hooks "${POST_DOWN[@]}"
+  del_ns
 }
 
 cmd_save() {
-	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	[[ " $($(exec_ns) wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	save_config
 }
 
-- 
2.27.0

