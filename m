Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E81C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 08:58:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B652F20733
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 08:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B652F20733
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1f24741;
	Mon, 30 Mar 2020 08:50:10 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01908d56
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 08:50:09 +0000 (UTC)
Received: from wireguard.i.bitbit.net ([2a02:c0:2:6:18:59ff:fe38:da0c]:50088
 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jIpzg-0001Ee-LS; Mon, 30 Mar 2020 10:42:04 +0200
From: Tore Anderson <tore@fud.no>
To: wireguard@lists.zx2c4.com
Cc: Tore Anderson <tore@fud.no>
Subject: [PATCH] wg-quick: add 'reload' command (wrapper for 'wg syncconf')
Date: Mon, 30 Mar 2020 10:41:57 +0200
Message-Id: <20200330084157.51834-1-tore@fud.no>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

Also add an ExecReload statement that uses this in the systemd template unit.

Signed-off-by: Tore Anderson <tore@fud.no>
---
 src/man/wg-quick.8            |  9 ++++++---
 src/systemd/wg-quick@.service |  1 +
 src/wg-quick/darwin.bash      | 17 ++++++++++++++++-
 src/wg-quick/freebsd.bash     | 15 ++++++++++++++-
 src/wg-quick/linux.bash       | 15 ++++++++++++++-
 src/wg-quick/openbsd.bash     | 15 ++++++++++++++-
 6 files changed, 65 insertions(+), 7 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index eca3b48..023805e 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -10,6 +10,8 @@ wg-quick - set up a WireGuard interface simply
 |
 .I down
 |
+.I reload
+|
 .I save
 |
 .I strip
@@ -28,9 +30,10 @@ Use \fIup\fP to add and set up an interface, and use \fIdown\fP to tear down and
 an interface. Running \fIup\fP adds a WireGuard interface, brings up the interface with the
 supplied IP addresses, sets up mtu and routes, and optionally runs pre/post up scripts. Running \fIdown\fP
 optionally saves the current configuration, removes the WireGuard interface, and optionally
-runs pre/post down scripts. Running \fIsave\fP saves the configuration of an existing
-interface without bringing the interface down. Use \fIstrip\fP to output a configuration file
-with all
+runs pre/post down scripts. Running \fIreload\fP synchronises any changes to peers/keys in
+the config file with an already active interfaces. Running \fIsave\fP saves the configuration
+of an existing interface without bringing the interface down. Use \fIstrip\fP to output a
+configuration file with all
 .BR wg-quick (8)-specific
 options removed, suitable for use with
 .BR wg (8).
diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index 7c5f9d1..a3b89d9 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -14,6 +14,7 @@ Type=oneshot
 RemainAfterExit=yes
 ExecStart=/usr/bin/wg-quick up %i
 ExecStop=/usr/bin/wg-quick down %i
+ExecReload=/usr/bin/wg-quick reload %i
 Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
 
 [Install]
diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index d9d07cf..a732d6a 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -350,6 +350,10 @@ set_config() {
 	cmd wg setconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
 }
 
+sync_config() {
+	cmd wg syncconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
+}
+
 save_config() {
 	local old_umask new_config current_config address cmd
 	new_config=$'[Interface]\n'
@@ -398,7 +402,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -458,6 +462,13 @@ cmd_down() {
 	execute_hooks "${POST_DOWN[@]}"
 }
 
+cmd_reload() {
+	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
+		die "\`$INTERFACE' is not a WireGuard interface"
+	fi
+	sync_config
+}
+
 cmd_save() {
 	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
 		die "\`$INTERFACE' is not a WireGuard interface"
@@ -482,6 +493,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == reload ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_reload
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index c390dcc..6eef1f6 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -333,6 +333,10 @@ set_config() {
 	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
 }
 
+sync_config() {
+	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
+}
+
 save_config() {
 	local old_umask new_config current_config address cmd
 	new_config=$'[Interface]\n'
@@ -382,7 +386,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -440,6 +444,11 @@ cmd_down() {
 	execute_hooks "${POST_DOWN[@]}"
 }
 
+cmd_reload() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	sync_config
+}
+
 cmd_save() {
 	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	save_config
@@ -464,6 +473,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == reload ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_reload
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..37d6ba8 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -246,6 +246,10 @@ set_config() {
 	cmd wg setconf "$INTERFACE" <(echo "$WG_CONFIG")
 }
 
+sync_config() {
+	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
+}
+
 save_config() {
 	local old_umask new_config current_config address cmd
 	[[ $(ip -all -brief address show dev "$INTERFACE") =~ ^$INTERFACE\ +\ [A-Z]+\ +(.+)$ ]] || true
@@ -293,7 +297,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -347,6 +351,11 @@ cmd_down() {
 	execute_hooks "${POST_DOWN[@]}"
 }
 
+cmd_reload() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	sync_config
+}
+
 cmd_save() {
 	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
 	save_config
@@ -368,6 +377,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == reload ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_reload
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
diff --git a/src/wg-quick/openbsd.bash b/src/wg-quick/openbsd.bash
index 8d458d1..c509e70 100755
--- a/src/wg-quick/openbsd.bash
+++ b/src/wg-quick/openbsd.bash
@@ -313,6 +313,10 @@ set_config() {
 	cmd wg setconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
 }
 
+sync_config() {
+	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
+}
+
 save_config() {
 	local old_umask new_config current_config address network cmd
 	new_config=$'[Interface]\n'
@@ -361,7 +365,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | reload | save | strip ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -419,6 +423,11 @@ cmd_down() {
 	execute_hooks "${POST_DOWN[@]}"
 }
 
+cmd_reload() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	sync_config
+}
+
 cmd_save() {
 	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
 		die "\`$INTERFACE' is not a WireGuard interface"
@@ -442,6 +451,10 @@ elif [[ $# -eq 2 && $1 == down ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_down
+elif [[ $# -eq 2 && $1 == reload ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_reload
 elif [[ $# -eq 2 && $1 == save ]]; then
 	auto_su
 	parse_options "$2"
-- 
2.25.1

