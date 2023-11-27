Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105C5C4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Nov 2023 17:38:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7dca6c58;
	Mon, 27 Nov 2023 17:38:28 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at
 [2001:678:4d8:200::1a57])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ba6c550
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Nov 2023 17:38:25 +0000 (UTC)
Received: janet.servers.dxld.at; Mon, 27 Nov 2023 18:38:24 +0100
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH] wg-quick: Pick smallest MTU of any endpoint route
Date: Mon, 27 Nov 2023 18:38:09 +0100
Message-Id: <20231127173809.2050198-1-dxld@darkboxed.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

If the goal is to avoid fragmentation picking the largest MTU of any
endpoint route doesn't make sense. Users with networks supporting jumbo
frames (MTU>1500) can still set MTU=, but most users will want to avoid
fratmentation by default.

Incidentally android.c already had the correct behaviour:

    next_mtu = get_route_mtu(endpoint);
    if (next_mtu > 0 && next_mtu < endpoint_mtu)
    	endpoint_mtu = next_mtu;

only the shell implementations were problematic.

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/man/wg-quick.8        | 14 +++++++++++---
 src/wg-quick/freebsd.bash |  4 ++--
 src/wg-quick/linux.bash   |  4 ++--
 src/wg-quick/openbsd.bash |  4 ++--
 4 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index bc9e145..391a095 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -83,9 +83,17 @@ specified multiple times. Upon bringing the interface up, this runs
 .BR resolvconf (8)
 are undesirable, the PostUp and PostDown keys below may be used instead.
 .IP \(bu
-MTU \(em if not specified, the MTU is automatically determined from the endpoint addresses
-or the system default route, which is usually a sane choice. However, to manually specify
-an MTU to override this automatic discovery, this value may be specified explicitly.
+MTU \(em wg tunnel interface MTU. If not specified, the MTU is set to the
+lowest route MTU of any peer endpoint or if route lookups don't return an
+explicit MTU the system default route's MTU less encapsulation overhead.
+
+Note that matching the tunnel MTU to the underlying network MTU is normally
+only a performance concern. WireGuard allows encapsulated (UDP) packets to
+be fragmented through PMTUD (IPv4/IPv6) or in-network fragmentation (IPv4)
+depending on system behaviour.
+ 
+However, to forgoe this automatic behaviour, a static value may may be
+specified here.
 .IP \(bu
 Table \(em Controls the routing table to which routes are added. There are two
 special values: `off' disables the creation of routes altogether, and `auto'
diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index f72daf6..3886f47 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -191,11 +191,11 @@ set_mtu() {
 		family=inet
 		[[ ${BASH_REMATCH[1]} == *:* ]] && family=inet6
 		output="$(route -n get "-$family" "${BASH_REMATCH[1]}" || true)"
-		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	done < <(wg show "$INTERFACE" endpoints)
 	if [[ $mtu -eq 0 ]]; then
 		read -r output < <(route -n get default || true) || true
-		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	fi
 	[[ $mtu -gt 0 ]] || mtu=1500
 	cmd ifconfig "$INTERFACE" mtu $(( mtu - 80 ))
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..eab411c 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -131,11 +131,11 @@ set_mtu_up() {
 	while read -r _ endpoint; do
 		[[ $endpoint =~ ^\[?([a-z0-9:.]+)\]?:[0-9]+$ ]] || continue
 		output="$(ip route get "${BASH_REMATCH[1]}" || true)"
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	done < <(wg show "$INTERFACE" endpoints)
 	if [[ $mtu -eq 0 ]]; then
 		read -r output < <(ip route show default || true) || true
-		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ ( $output =~ mtu\ ([0-9]+) || ( $output =~ dev\ ([^ ]+) && $(ip link show dev "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) ) ) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	fi
 	[[ $mtu -gt 0 ]] || mtu=1500
 	cmd ip link set mtu $(( mtu - 80 )) up dev "$INTERFACE"
diff --git a/src/wg-quick/openbsd.bash b/src/wg-quick/openbsd.bash
index b58ecf5..14f26ff 100755
--- a/src/wg-quick/openbsd.bash
+++ b/src/wg-quick/openbsd.bash
@@ -174,11 +174,11 @@ set_mtu() {
 		family=inet
 		[[ ${BASH_REMATCH[1]} == *:* ]] && family=inet6
 		output="$(route -n get "-$family" "${BASH_REMATCH[1]}" || true)"
-		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	done < <(wg show "$REAL_INTERFACE" endpoints)
 	if [[ $mtu -eq 0 ]]; then
 		read -r output < <(route -n get default || true) || true
-		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -gt $mtu ]] && mtu="${BASH_REMATCH[1]}"
+		[[ $output =~ interface:\ ([^ ]+)$'\n' && $(ifconfig "${BASH_REMATCH[1]}") =~ mtu\ ([0-9]+) && ${BASH_REMATCH[1]} -lt $mtu ]] && mtu="${BASH_REMATCH[1]}"
 	fi
 	[[ $mtu -gt 0 ]] || mtu=1500
 	cmd ifconfig "$REAL_INTERFACE" mtu $(( mtu - 80 ))
-- 
2.39.2

