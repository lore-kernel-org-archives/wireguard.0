Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F826D49223
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:53:39 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 520207db;
	Mon, 18 Nov 2024 12:45:00 +0000 (UTC)
Received: from smtp04-ext3.udag.de (smtp04-ext3.udag.de [62.146.106.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8292f96e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Jan 2024 21:03:05 +0000 (UTC)
Received: from Til-Desktop.lan (p54aa3bb3.dip0.t-ipconnect.de [84.170.59.179])
 by smtp04-ext3.udag.de (Postfix) with ESMTPA id 8737EE0165;
 Wed, 17 Jan 2024 22:03:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tk154.de;
 s=uddkim-202310; t=1705525384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=LXNxy0v+VDNL40Q2zD5zdLJG1F2xd0WrvT1EdcLjIZg=;
 b=JEFx+FUWm0JHj+T7Xx4T3HkaD9zajBrdUvmM8JUZP7BHqDqPUUn0VBiJ+de9NSo89AWqQI
 3L6sxAS7EWxr1GAj1ziFU9vpAxKAHLY+ZsJMD0AzfeOBQSqqIcLKZ5helh7ZjqXxzDr1ky
 a5eYaNgERUrj7/wPeSH+d2XP7p+ZVvkFJ+im6W5mDQIt3Oz4ytkGnbe5k8xg8cOl/9f1Nc
 m0qrTPDflg9k74cej1AKp0BHGfAdlux5wJjcgwfCh5SCDfNdTIIC3z4wg+tHKonTImQF5N
 hfBrzPSBh2ztZjxyivp9g0nXK3RHudwFYPKCXlDA3EMngOwx3XRoJnI8cpHu8A==
From: Til Kaiser <mail@tk154.de>
To: wireguard@lists.zx2c4.com
Cc: Til Kaiser <mail@tk154.de>
Subject: [PATCH] wg-quick: replace ip route add with ip route append
Date: Wed, 17 Jan 2024 22:01:51 +0100
Message-Id: <20240117210151.315819-1-mail@tk154.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp04-ext3.udag.de;
 auth=pass smtp.auth=mail@tk154.de smtp.mailfrom=mail@tk154.de
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:44:56 +0000
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

Adding a WireGuard interface with an IPv6 link-local address
isn't possible when there is a route for another interface
with the same IPv6 prefix length on the system, assuming that
the "ip route add" command chooses the same metric value.

The Manpage of ip-route states: "With IPv6, further nexthops
may be appended to the same route via 'ip route append' command."

So this patch replaces all occurrences of "ip route add"
with "ip route append."

Steps to reproduce:
    $ ip link add ip6-test-if type dummy
    $ ip address add fe80::2/64 dev ip6-test-if
    $ ip link set ip6-test-if up

    $ ip -6 route flush dev ip6-test-if
    $ ip -6 route add fe80::/64 dev ip6-test-if

    $ wg-quick up ip6-test-wg
    [#] ip link add ip6-test-wg type wireguard
    [#] wg setconf ip6-test-wg /dev/fd/63
    [#] ip -6 address add fe80::3/128 dev ip6-test-wg
    [#] ip link set mtu 1420 up dev ip6-test-wg
    [#] ip -6 route add fe80::/64 dev ip6-test-wg
    RTNETLINK answers: File exists
    [#] ip link delete dev ip6-test-wg

/etc/wireguard/ip6-test-wg.conf:
    [Interface]
    Address = fe80::3/128
    ...

    [Peer]
    AllowedIPs = fe80::/64
    ...

Signed-off-by: Til Kaiser <mail@tk154.de>
---
 src/wg-quick/linux.bash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..f324762 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -170,11 +170,11 @@ add_route() {
 	[[ $TABLE != off ]] || return 0
 
 	if [[ -n $TABLE && $TABLE != auto ]]; then
-		cmd ip $proto route add "$1" dev "$INTERFACE" table "$TABLE"
+		cmd ip $proto route append "$1" dev "$INTERFACE" table "$TABLE"
 	elif [[ $1 == */0 ]]; then
 		add_default "$1"
 	else
-		[[ -n $(ip $proto route show dev "$INTERFACE" match "$1" 2>/dev/null) ]] || cmd ip $proto route add "$1" dev "$INTERFACE"
+		[[ -n $(ip $proto route show dev "$INTERFACE" match "$1" 2>/dev/null) ]] || cmd ip $proto route append "$1" dev "$INTERFACE"
 	fi
 }
 
@@ -222,7 +222,7 @@ add_default() {
 	[[ $1 == *:* ]] && proto=-6 iptables=ip6tables pf=ip6
 	cmd ip $proto rule add not fwmark $table table $table
 	cmd ip $proto rule add table main suppress_prefixlength 0
-	cmd ip $proto route add "$1" dev "$INTERFACE" table $table
+	cmd ip $proto route append "$1" dev "$INTERFACE" table $table
 
 	local marker="-m comment --comment \"wg-quick(8) rule for $INTERFACE\"" restore=$'*raw\n' nftable="wg-quick-$INTERFACE" nftcmd 
 	printf -v nftcmd '%sadd table %s %s\n' "$nftcmd" "$pf" "$nftable"
-- 
2.40.1

