Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63A6C352A1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  7 Dec 2022 18:04:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44ee0cd1;
	Wed, 7 Dec 2022 18:02:30 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a9e11d1b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2022 18:02:29 +0000 (UTC)
Received: janet.servers.dxld.at; Wed, 07 Dec 2022 19:02:28 +0100
From: =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 =?UTF-8?q?Daniel=20Gr=C3=B6ber?= <dxld@darkboxed.org>
Subject: [PATCH] wg-quick: Allow setting iface VRF in PreUp hook
Date: Wed,  7 Dec 2022 19:00:31 +0100
Message-Id: <20221207180031.301766-1-dxld@darkboxed.org>
X-Mailer: git-send-email 2.30.2
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

Currently PreUp hooks run before the wireguard device is created. This is
problematic for moving the device into a Linux VRFs as this will currently
clear all assigned IPv6 addressess (possibly a bug), so if we did this in
PostUp (i.e. before add_addr) we'll have to manually re-add all assigned
addresses. This is obviously less than ideal.

Instead create the wg device just before running PreUp hooks. We apply this
to all platforms for consistency.

Test case:

    $ ip link add vrf-test type vrf table 1234
    $ ip link add wg-test type wireguard
    $ ip addr add dev wg-test 192.168.42.42/24
    $ ip addr add dev wg-test fe80::/64

    $ ip -br addr show wg-test
    wg-test          DOWN           192.168.42.42/24 fe80::/64

    $ ip link set dev wg-test master vrf-test

    $ ip -br addr show wg-test
    wg-test          DOWN           192.168.42.42/32

Signed-off-by: Daniel Gröber <dxld@darkboxed.org>
---
 src/wg-quick/darwin.bash  | 2 +-
 src/wg-quick/freebsd.bash | 2 +-
 src/wg-quick/linux.bash   | 2 +-
 src/wg-quick/openbsd.bash | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index 8e46818..c938112 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -452,8 +452,8 @@ cmd_up() {
 	local i
 	get_real_interface && die "\`$INTERFACE' already exists as \`$REAL_INTERFACE'"
 	trap 'del_if; del_routes; exit' INT TERM EXIT
-	execute_hooks "${PRE_UP[@]}"
 	add_if
+	execute_hooks "${PRE_UP[@]}"
 	set_config
 	for i in "${ADDRESSES[@]}"; do
 		add_addr "$i"
diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index b529ab2..f72daf6 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -420,8 +420,8 @@ cmd_up() {
 	local i
 	[[ -z $(ifconfig "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERFACE' already exists"
 	trap 'del_if; del_routes; clean_temp; exit' INT TERM EXIT
-	execute_hooks "${PRE_UP[@]}"
 	add_if
+	execute_hooks "${PRE_UP[@]}"
 	set_config
 	for i in "${ADDRESSES[@]}"; do
 		add_addr "$i"
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 69e5bef..4193ce5 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -327,8 +327,8 @@ cmd_up() {
 	local i
 	[[ -z $(ip link show dev "$INTERFACE" 2>/dev/null) ]] || die "\`$INTERFACE' already exists"
 	trap 'del_if; exit' INT TERM EXIT
-	execute_hooks "${PRE_UP[@]}"
 	add_if
+	execute_hooks "${PRE_UP[@]}"
 	set_config
 	for i in "${ADDRESSES[@]}"; do
 		add_addr "$i"
diff --git a/src/wg-quick/openbsd.bash b/src/wg-quick/openbsd.bash
index 2adfe46..b58ecf5 100755
--- a/src/wg-quick/openbsd.bash
+++ b/src/wg-quick/openbsd.bash
@@ -417,8 +417,8 @@ cmd_up() {
 	local i
 	get_real_interface && die "\`$INTERFACE' already exists as \`$REAL_INTERFACE'"
 	trap 'del_if; del_routes; exit' INT TERM EXIT
-	execute_hooks "${PRE_UP[@]}"
 	add_if
+	execute_hooks "${PRE_UP[@]}"
 	set_config
 	for i in "${ADDRESSES[@]}"; do
 		add_addr "$i"
-- 
2.30.2

