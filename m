Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E870C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCB1A64E74
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 15:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCB1A64E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Perennou.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id febcd5fc;
	Wed, 10 Feb 2021 15:00:22 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 83372743
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Feb 2021 15:58:47 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id v15so22556445wrx.4
 for <wireguard@lists.zx2c4.com>; Tue, 09 Feb 2021 07:58:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2fh4R4VBBY5enTbZKCEdBekuxUObmSQKGM5aAnYV2uY=;
 b=BSHM+7o1TncbRyywgW8uLip7v0v+joUU4FkTjIdM21POzjRfrH5RZppRWY9oRtxhIy
 Vx0TJwL/IzHhg46wM0bhhpCOTt3EKYJIsSetwz55M5LHfVHXPuODjzN5Uj8icrtyfIM3
 X+Gn85+rXhQJ8QEdzIDzJb/LJBQOTiETMlWawxjCMr8i3V1q/HtDvwoQCdtKuNTR8N2v
 X3xurlHagohz8eyBwquWnSqi3Az/xXgTgN51Hpbe7OUI1m/Xyc5u2FqY84G026vyLhNJ
 ILv5OX3viGXKqefbIt9mgz/EOKFcWH09ovDFoinMrTMiWY1By18ARlVGxQeJ0WvKMlmy
 uS8w==
X-Gm-Message-State: AOAM533LQqdpqL49XUWenTVKJsE2H4A6R5OVtkkG0EAC9iWcfK5Frurk
 vUweUtdZY3EE3/Ud9C3di2VXv6PYXdoEzRvS
X-Google-Smtp-Source: ABdhPJxHYIvfDF8DRXRGZQQo3A3pDLGLZK69gz5zyAzXHBaBIwm3TFNJHaA3RoAlbW/u4yTY8fnmyA==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr26602412wrx.140.1612886326415; 
 Tue, 09 Feb 2021 07:58:46 -0800 (PST)
Received: from Lou.clvrcld.net ([2a01:e0a:21a:b280:44e1:3d15:1093:f828])
 by smtp.gmail.com with ESMTPSA id 35sm42099690wrn.42.2021.02.09.07.58.45
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 07:58:45 -0800 (PST)
From: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick: add syncconf
Date: Tue,  9 Feb 2021 16:58:43 +0100
Message-Id: <20210209155843.2100191-1-Marc-Antoine@Perennou.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 10 Feb 2021 15:00:18 +0000
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

Simplifies the process to reload an updated configuration, avoid subshells

Signed-off-by: Marc-Antoine Perennou <Marc-Antoine@Perennou.com>
---
 src/man/wg-quick.8            |  4 ++++
 src/systemd/wg-quick@.service |  2 +-
 src/wg-quick/darwin.bash      | 13 ++++++++++++-
 src/wg-quick/freebsd.bash     | 11 ++++++++++-
 src/wg-quick/linux.bash       | 11 ++++++++++-
 src/wg-quick/openbsd.bash     | 11 ++++++++++-
 6 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index b84eb64..f52a3fe 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -256,6 +256,10 @@ sessions:
 
 \fB    # wg syncconf wgnet0 <(wg-quick strip wgnet0)\fP
 
+You can also use the \fIsyncconf\fP command for the same purpose
+
+\fB    # wg-quick syncconf wgnet0\fP
+
 .SH SEE ALSO
 .BR wg (8),
 .BR ip (8),
diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
index dbdab44..cb8b3a9 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -15,7 +15,7 @@ Type=oneshot
 RemainAfterExit=yes
 ExecStart=/usr/bin/wg-quick up %i
 ExecStop=/usr/bin/wg-quick down %i
-ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec /usr/bin/wg-quick strip %i)'
+ExecReload=/usr/bin/wg-quick syncconf %i
 Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
 
 [Install]
diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index cde1b54..94c669e 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -418,7 +418,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | save | strip | syncconf ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -489,6 +489,13 @@ cmd_strip() {
 	echo "$WG_CONFIG"
 }
 
+cmd_syncconf() {
+	if ! get_real_interface || [[ " $(wg show interfaces) " != *" $REAL_INTERFACE "* ]]; then
+		die "\`$INTERFACE' is not a WireGuard interface"
+	fi
+	cmd wg syncconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
+}
+
 # ~~ function override insertion point ~~
 
 if [[ $# -eq 1 && ( $1 == --help || $1 == -h || $1 == help ) ]]; then
@@ -510,6 +517,10 @@ elif [[ $# -eq 2 && $1 == strip ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_strip
+elif [[ $# -eq 2 && $1 == syncconf ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_syncconf
 else
 	cmd_usage
 	exit 1
diff --git a/src/wg-quick/freebsd.bash b/src/wg-quick/freebsd.bash
index e1ee67f..9415926 100755
--- a/src/wg-quick/freebsd.bash
+++ b/src/wg-quick/freebsd.bash
@@ -387,7 +387,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | save | strip | syncconf ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -454,6 +454,11 @@ cmd_strip() {
 	echo "$WG_CONFIG"
 }
 
+cmd_syncconf() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
+}
+
 # ~~ function override insertion point ~~
 
 make_temp
@@ -477,6 +482,10 @@ elif [[ $# -eq 2 && $1 == strip ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_strip
+elif [[ $# -eq 2 && $1 == syncconf ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_syncconf
 else
 	cmd_usage
 	exit 1
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index e4d4c4f..83ae4a8 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -298,7 +298,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | save | strip | syncconf ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -361,6 +361,11 @@ cmd_strip() {
 	echo "$WG_CONFIG"
 }
 
+cmd_syncconf() {
+	[[ " $(wg show interfaces) " == *" $INTERFACE "* ]] || die "\`$INTERFACE' is not a WireGuard interface"
+	cmd wg syncconf "$INTERFACE" <(echo "$WG_CONFIG")
+}
+
 # ~~ function override insertion point ~~
 
 if [[ $# -eq 1 && ( $1 == --help || $1 == -h || $1 == help ) ]]; then
@@ -381,6 +386,10 @@ elif [[ $# -eq 2 && $1 == strip ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_strip
+elif [[ $# -eq 2 && $1 == syncconf ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_syncconf
 else
 	cmd_usage
 	exit 1
diff --git a/src/wg-quick/openbsd.bash b/src/wg-quick/openbsd.bash
index 15550c8..6d0efa8 100755
--- a/src/wg-quick/openbsd.bash
+++ b/src/wg-quick/openbsd.bash
@@ -376,7 +376,7 @@ execute_hooks() {
 
 cmd_usage() {
 	cat >&2 <<-_EOF
-	Usage: $PROGRAM [ up | down | save | strip ] [ CONFIG_FILE | INTERFACE ]
+	Usage: $PROGRAM [ up | down | save | strip | syncconf ] [ CONFIG_FILE | INTERFACE ]
 
 	  CONFIG_FILE is a configuration file, whose filename is the interface name
 	  followed by \`.conf'. Otherwise, INTERFACE is an interface name, with
@@ -441,6 +441,11 @@ cmd_strip() {
 	echo "$WG_CONFIG"
 }
 
+cmd_syncconf() {
+	get_real_interface || die "\`$INTERFACE' is not a WireGuard interface"
+	cmd wg syncconf "$REAL_INTERFACE" <(echo "$WG_CONFIG")
+}
+
 # ~~ function override insertion point ~~
 
 if [[ $# -eq 1 && ( $1 == --help || $1 == -h || $1 == help ) ]]; then
@@ -461,6 +466,10 @@ elif [[ $# -eq 2 && $1 == strip ]]; then
 	auto_su
 	parse_options "$2"
 	cmd_strip
+elif [[ $# -eq 2 && $1 == syncconf ]]; then
+	auto_su
+	parse_options "$2"
+	cmd_syncconf
 else
 	cmd_usage
 	exit 1
-- 
2.30.0

