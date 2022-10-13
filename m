Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A332ECAAA1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Oct 2022 14:54:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id a4b5780c;
	Mon, 24 Oct 2022 14:54:49 +0000 (UTC)
Received: from monade.li (monade.li [46.38.232.212])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 00e6d48f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Oct 2022 22:28:37 +0000 (UTC)
From: n+wireguard@monade.li
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monade.li; s=mail;
 t=1665700115; bh=53+vP/+5E/rhYAXmcN0RNXPF/K/Tp0eggU6QA8nkB4M=;
 h=From:To:Cc:Subject:Date;
 b=holR/1oGICPiO5NO8hSmGM1tEmdCv8PZqvY6NhU9bYeRF7g5/p9Iyl9DRu77Zkku8
 J8DRU7kfepIPLWj8h+BXymntg9Xpqspe7JIzBGuqb1x+uHFpAO0ADx+FOmcjEY+UwQ
 Le2cBsC02vdqPH0OBiyXtOV9YePDKEWneHjjQtSQ=
To: wireguard@lists.zx2c4.com
Cc: =?UTF-8?q?Na=C3=AFm=20Favier?= <n@monade.li>
Subject: [PATCH wireguard-tools] wg-quick: linux: improve and document
 rpfilter logic
Date: Fri, 14 Oct 2022 00:28:17 +0200
Message-Id: <20221013222817.2054793-1-n+wireguard@monade.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 24 Oct 2022 14:54:43 +0000
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

From: Naïm Favier <n@monade.li>

Only restore the fwmark from conntrack if it matches the wireguard
mark, so that we don't restore an empty mark. This makes reordering the
PREROUTING rules easier.

Don't check for UDP when restoring the mark. This makes it possible to
use the same mechanism (setting the conntrack mark to the wireguard
mark) for other types of connections that need to be exempt from the
tunnel; for example, forwarded packets (think Internet connection sharing).

Add an example to the man page for this use case.

Document this particularly unobvious bit of logic in the code, so
that future generations won't have to do as much digging around as I did.

Signed-off-by: Naïm Favier <n@monade.li>
---
Tested with both iptables (+ strict rpfilter) and nftables, in a NAT
scenario.

 src/man/wg-quick.8      | 12 ++++++++++--
 src/wg-quick/linux.bash | 22 ++++++++++++++++++----
 2 files changed, 28 insertions(+), 6 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index b84eb64..48d96e5 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -21,7 +21,7 @@ wg-quick - set up a WireGuard interface simply
 
 .SH DESCRIPTION
 
-This is an extremely simple script for easily bringing up a WireGuard interface,
+This is a simple script for easily bringing up a WireGuard interface,
 suitable for a few common use cases.
 
 Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and remove
@@ -87,7 +87,7 @@ MTU \(em if not specified, the MTU is automatically determined from the endpoint
 or the system default route, which is usually a sane choice. However, to manually specify
 an MTU to override this automatic discovery, this value may be specified explicitly.
 .IP \(bu
-Table \(em Controls the routing table to which routes are added. There are two
+Table \(em controls the routing table to which routes are added. There are two
 special values: `off' disables the creation of routes altogether, and `auto'
 (the default) adds routes to the default table and enables special handling of
 default routes.
@@ -165,6 +165,14 @@ that this continues to allow most DHCP traffic through, since most DHCP clients
 sockets, which bypass Netfilter.) When IPv6 is in use, additional similar lines could be added using
 .BR ip6tables (8).
 
+Another possible use case (Linux only) would be to exempt forwarded traffic from going through the tunnel, so that a machine
+with a 0.0.0.0/0 peer can share its Internet connection (for example, using NAT) in a transparent manner:
+
+    \fBPostUp = iptables -t mangle -I PREROUTING -m addrtype ! --dst-type LOCAL -j CONNMARK --set-mark $(wg show %i fwmark)\fP
+.br
+    \fBPreDown = iptables -t mangle -D PREROUTING -m addrtype ! --dst-type LOCAL -j CONNMARK --set-mark $(wg show %i fwmark)\fP
+.br
+
 Or, perhaps it is desirable to store private keys in encrypted form, such as through use of
 .BR pass (1):
 
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 69e5bef..f755c15 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -224,7 +224,7 @@ add_default() {
 	cmd ip $proto rule add table main suppress_prefixlength 0
 	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
 
-	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
+	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s preraw { type filter hook prerouting priority -300; }\n' "$nftcmd" "$pf" "$nftable"
 	printf -v nftcmd '%sadd chain %s %s premangle { type filter hook prerouting priority -150; }\n' "$nftcmd" "$pf" "$nftable"
@@ -234,10 +234,24 @@ add_default() {
 		printf -v restore '%s-I PREROUTING ! -i %s -d %s -m addrtype ! --src-type LOCAL -j DROP %s\n' "$restore" "$INTERFACE" "${BASH_REMATCH[1]}" "$marker"
 		printf -v nftcmd '%sadd rule %s %s preraw iifname != "%s" %s daddr %s fib saddr type != local drop\n' "$nftcmd" "$pf" "$nftable" "$INTERFACE" "$pf" "${BASH_REMATCH[1]}"
 	done < <(ip -o $proto addr show dev "$INTERFACE" 2>/dev/null)
-	printf -v restore '%sCOMMIT\n*mangle\n-I POSTROUTING -m mark --mark %d -p udp -j CONNMARK --save-mark %s\n-I PREROUTING -p udp -j CONNMARK --restore-mark %s\nCOMMIT\n' "$restore" $table "$marker" "$marker"
-	printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" $table
-	printf -v nftcmd '%sadd rule %s %s premangle meta l4proto udp meta mark set ct mark \n' "$nftcmd" "$pf" "$nftable"
+	printf -v restore '%sCOMMIT\n' "$restore"
+
+	# When strict reverse path filtering is enabled, we need to make sure that WireGuard UDP packets
+	# arriving on an external interface would be routed through that same interface with their source
+	# and destination swapped. To do this, we save the fwmark of outgoing WireGuard packets in the
+	# connection tracking module and restore it for incoming packets.
+	# As a convenience, we only check for UDP when setting the connection mark, so that other types of
+	# connections may be exempted from the tunnel using the same mechanism.
+	# Then, we enable src_valid_mark so that the restored fwmark is taken into account for the reverse path lookup.
+	# If the rpfilter netfilter module is used instead, it must be invoked with --validmark in the mangle.PREROUTING chain or later.
+	printf -v restore '%s*mangle\n' "$restore"
+	printf -v restore '%s-I POSTROUTING -m mark --mark %d -p udp -j CONNMARK --save-mark %s\n' "$restore" "$table" "$marker"
+	printf -v restore '%s-I PREROUTING -m connmark --mark %d -j CONNMARK --restore-mark %s\n' "$restore" "$table" "$marker"
+	printf -v restore '%sCOMMIT\n' "$restore"
+	printf -v nftcmd '%sadd rule %s %s postmangle meta l4proto udp mark %d ct mark set mark \n' "$nftcmd" "$pf" "$nftable" "$table"
+	printf -v nftcmd '%sadd rule %s %s premangle ct mark %d meta mark set ct mark \n' "$nftcmd" "$pf" "$nftable" "$table"
 	[[ $proto == -4 ]] && cmd sysctl -q net.ipv4.conf.all.src_valid_mark=1
+
 	if type -p nft >/dev/null; then
 		cmd nft -f <(echo -n "$nftcmd")
 	else
-- 
2.37.2

