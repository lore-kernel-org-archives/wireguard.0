Return-Path: <SRS0=q7qE=4U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C913C3F2D1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:14:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9122420870
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Mar 2020 23:14:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wg-ml-rkaofgr.redir.email header.i=@wg-ml-rkaofgr.redir.email header.b="EqC0GRRH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9122420870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wg-ml-rkaofgr.redir.email
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e3b09b4;
	Tue, 3 Mar 2020 23:08:51 +0000 (UTC)
Received: from iedub0.y7.hu (iedub0.y7.hu [54.77.48.44])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26a96fb9
 for <wireguard@lists.zx2c4.com>; Tue, 3 Mar 2020 10:31:27 +0000 (UTC)
X-ME-Sender: <xms:AjNeXrxB19NJ-9R2vhgVegFN_IPw2-pPOan2pzrNUpg5qo43ul5Trg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtiedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefvhffukffffgggtgesmhdtreertd
 efjeenucfhrhhomhepgfhnughrvgcuufiirggsohcuoegvnhgurhgvsegvmhgrihhlrghr
 hidrtghomheqnecukfhppeektddruddtkedrkedtrdeinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepvghnughrvgesvghmrghilhgrrhihrdgt
 ohhm
X-ME-Proxy: <xmx:AjNeXvZJ3lJdQdLguC9Ri82wdaaKu0ZFJbxGWkaQMrqqzVrdH1STaw>
 <xmx:AjNeXhf1le-8sXv0dAfIvDP44pHuZSebqB5bRYeUWXflz8ddhcx4nw>
 <xmx:AjNeXqL47elMtMixxc7UBeb5JFXn-Wex1vMrelvLd3Z9ez8ZssGM5w>
 <xmx:AzNeXsC9BaoT4jpnlZFYbN08KIqZZOdL0kCXUG9M9cSm_hRDxUQw6A>
To: <wireguard@lists.zx2c4.com>
From: <endre.szabo@wg-ml-rkaofgr.redir.email>
Subject: [PATCH 1/1] Added network namespacing support to wq-quick
Message-Id: <xezycvxaj.1@wg-ml-rkaofgr.redir.email>
Date: Tue, 3 Mar 2020 11:35:43 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------C6A221329864EC5403FE6AA5"
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256;
 bh=yaFLdz6qIQMca4VWzHEoIZ0MVaeHCfC2SsrXQNly+eQ=; c=relaxed/simple;
 d=wg-ml-rkaofgr.redir.email;
 h=from:to:date:subject:mime-version:content-type:message-id; s=may2017;
 b=EqC0GRRHuhFRxBGU7ptNmyKQZEuozMzsivZxurSjU0vMGPu0vjQ3I2C5s22H44Lxf3TfeGeoroLndtl/ok44GAKiU9s/DYk9pY7TKEVFfihBzloeLGCTBWhFU0HqvWDyTQfF+GyMSrDvQw+mV/3ixGGt7w9joDqFPVHLlaH5g0j53MQPnOrv00eqDn/PZumS457uRSl7vqnyBg4Fn/D3NWlzwieh2frRPr14K2zuuhUV2sD+HFZyqfLWni3zTxc9bfcTu511G36dmZ2C0sgQ1JOJcfYTctk7UOQXUvqX8NT7MYFXDoVlIoZQtxW7gGsrewFKw+P5RWSql/gze+lMqw==
X-Mailman-Approved-At: Wed, 04 Mar 2020 00:08:45 +0100
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
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--------------C6A221329864EC5403FE6AA5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

I added netns support to wq-quick, works quite well for me. An example:

# wg-quick up s2s
[#] ip -n phy link add s2s type wireguard
[#] ip -n phy link set s2s netns 1
[#] wg setconf s2s /dev/fd/63
[#] ip -4 address add 192.168.0.1/32 dev s2s
[#] ip link set mtu 1420 up dev s2s
...

Please go easy on me, this is my first time sending a patch.

--Endre

---

  contrib/highlighter/gui/highlight.cpp |  1 +
  contrib/highlighter/highlight.c       |  1 +
  contrib/highlighter/highlighter.h     |  1 +
  src/man/wg-quick.8                    |  3 +++
  src/wg-quick/linux.bash               | 16 +++++++++++++++-
  5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/contrib/highlighter/gui/highlight.cpp 
b/contrib/highlighter/gui/highlight.cpp
index a95857b..a698d05 100644
--- a/contrib/highlighter/gui/highlight.cpp
+++ b/contrib/highlighter/gui/highlight.cpp
@@ -25,6 +25,7 @@ static QColor colormap[] = {
      [HighlightDelimiter] = QColor("#7aa6da"),
  #ifndef MOBILE_WGQUICK_SUBSET
      [HighlightTable] = QColor("#c397d8"),
+    [HighlightNetNS] = QColor("#c397d8"),
      [HighlightFwMark] = QColor("#c397d8"),
      [HighlightSaveConfig] = QColor("#c397d8"),
      [HighlightCmd] = QColor("#969896"),
diff --git a/contrib/highlighter/highlight.c 
b/contrib/highlighter/highlight.c
index e9034f7..44b335c 100644
--- a/contrib/highlighter/highlight.c
+++ b/contrib/highlighter/highlight.c
@@ -51,6 +51,7 @@ static const char *colormap[] = {
      [HighlightDelimiter] = TERMINAL_FG_CYAN,
  #ifndef MOBILE_WGQUICK_SUBSET
      [HighlightTable] = TERMINAL_FG_BLUE,
+    [HighlightNetNS] = TERMINAL_FG_BLUE,
      [HighlightFwMark] = TERMINAL_FG_BLUE,
      [HighlightSaveConfig] = TERMINAL_FG_BLUE,
      [HighlightCmd] = TERMINAL_FG_WHITE,
diff --git a/contrib/highlighter/highlighter.h 
b/contrib/highlighter/highlighter.h
index 65cc230..d1ed6d1 100644
--- a/contrib/highlighter/highlighter.h
+++ b/contrib/highlighter/highlighter.h
@@ -21,6 +21,7 @@ enum highlight_type {
      HighlightDelimiter,
  #ifndef MOBILE_WGQUICK_SUBSET
      HighlightTable,
+    HighlightNetNS,
      HighlightFwMark,
      HighlightSaveConfig,
      HighlightCmd,
diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index c38c7d9..3f0565a 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -91,6 +91,9 @@ special values: `off' disables the creation of routes 
altogether, and `auto'
  (the default) adds routes to the default table and enables special 
handling of
  default routes.
  .IP \(bu
+NetNS \(em Controls in which network namespace the WireGuard UDP socket 
is added to. The
+namespace has to be created before WireGuard use.
+.IP \(bu
  PreUp, PostUp, PreDown, PostDown \(em script snippets which will be 
executed by
  .BR bash (1)
  before/after setting up/tearing down the interface, most commonly used
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..6957cba 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -17,6 +17,7 @@ ADDRESSES=( )
  MTU=""
  DNS=( )
  TABLE=""
+NETNS=""
  PRE_UP=( )
  POST_UP=( )
  PRE_DOWN=( )
@@ -58,6 +59,7 @@ parse_options() {
              MTU) MTU="$value"; continue ;;
              DNS) DNS+=( ${value//,/ } ); continue ;;
              Table) TABLE="$value"; continue ;;
+            NetNS) NETNS="$value"; continue ;;
              PreUp) PRE_UP+=( "$value" ); continue ;;
              PreDown) PRE_DOWN+=( "$value" ); continue ;;
              PostUp) POST_UP+=( "$value" ); continue ;;
@@ -84,7 +86,18 @@ auto_su() {

  add_if() {
      local ret
-    if ! cmd ip link add "$INTERFACE" type wireguard; then
+    if [[ -n $NETNS ]]; then
+        if ! ip netns pids "${NETNS}" > /dev/null; then
+            ret=$?
+            echo "[!] Target namespace '${NETNS}' not found"
+            exit $ret
+        elif ! cmd ip -n "${NETNS}" link add "$INTERFACE" type 
wireguard; then
+            ret=$?
+            [[ -e /sys/module/wireguard ]] || ! command -v 
"${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
+            echo "[!] Missing WireGuard kernel module. Falling back to 
slow userspace implementation."
+        fi
+        cmd ip -n "${NETNS}" link set "$INTERFACE" netns 1
+    elif ! cmd ip link add "$INTERFACE" type wireguard; then
          ret=$?
          [[ -e /sys/module/wireguard ]] || ! command -v 
"${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
          echo "[!] Missing WireGuard kernel module. Falling back to 
slow userspace implementation."
@@ -258,6 +271,7 @@ save_config() {
      done < <(resolvconf -l "$(resolvconf_iface_prefix)$INTERFACE" 
2>/dev/null || cat 
"/etc/resolvconf/run/interface/$(resolvconf_iface_prefix)$INTERFACE" 
2>/dev/null)
      [[ -n $MTU && $(ip link show dev "$INTERFACE") =~ mtu\ ([0-9]+) ]] 
&& new_config+="MTU = ${BASH_REMATCH[1]}"$'\n'
      [[ -n $TABLE ]] && new_config+="Table = $TABLE"$'\n'
+    [[ -n $NETNS ]] && new_config+="NetNS = $NETNS"$'\n'
      [[ $SAVE_CONFIG -eq 0 ]] || new_config+=$'SaveConfig = true\n'
      for cmd in "${PRE_UP[@]}"; do
          new_config+="PreUp = $cmd"$'\n'
-- 
2.25.1


--------------C6A221329864EC5403FE6AA5
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Added-network-namespacing-support.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-Added-network-namespacing-support.patch"

From 9af84a9996130691b060da2b04b63564d2993a75 Mon Sep 17 00:00:00 2001
From: Endre Szabo <git@end.re>
Date: Tue, 3 Mar 2020 11:20:35 +0100
Subject: [PATCH 1/1] Added network namespacing support

---
 contrib/highlighter/gui/highlight.cpp |  1 +
 contrib/highlighter/highlight.c       |  1 +
 contrib/highlighter/highlighter.h     |  1 +
 src/man/wg-quick.8                    |  3 +++
 src/wg-quick/linux.bash               | 16 +++++++++++++++-
 5 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/contrib/highlighter/gui/highlight.cpp b/contrib/highlighter/gui/highlight.cpp
index a95857b..a698d05 100644
--- a/contrib/highlighter/gui/highlight.cpp
+++ b/contrib/highlighter/gui/highlight.cpp
@@ -25,6 +25,7 @@ static QColor colormap[] = {
 	[HighlightDelimiter] = QColor("#7aa6da"),
 #ifndef MOBILE_WGQUICK_SUBSET
 	[HighlightTable] = QColor("#c397d8"),
+	[HighlightNetNS] = QColor("#c397d8"),
 	[HighlightFwMark] = QColor("#c397d8"),
 	[HighlightSaveConfig] = QColor("#c397d8"),
 	[HighlightCmd] = QColor("#969896"),
diff --git a/contrib/highlighter/highlight.c b/contrib/highlighter/highlight.c
index e9034f7..44b335c 100644
--- a/contrib/highlighter/highlight.c
+++ b/contrib/highlighter/highlight.c
@@ -51,6 +51,7 @@ static const char *colormap[] = {
 	[HighlightDelimiter] = TERMINAL_FG_CYAN,
 #ifndef MOBILE_WGQUICK_SUBSET
 	[HighlightTable] = TERMINAL_FG_BLUE,
+	[HighlightNetNS] = TERMINAL_FG_BLUE,
 	[HighlightFwMark] = TERMINAL_FG_BLUE,
 	[HighlightSaveConfig] = TERMINAL_FG_BLUE,
 	[HighlightCmd] = TERMINAL_FG_WHITE,
diff --git a/contrib/highlighter/highlighter.h b/contrib/highlighter/highlighter.h
index 65cc230..d1ed6d1 100644
--- a/contrib/highlighter/highlighter.h
+++ b/contrib/highlighter/highlighter.h
@@ -21,6 +21,7 @@ enum highlight_type {
 	HighlightDelimiter,
 #ifndef MOBILE_WGQUICK_SUBSET
 	HighlightTable,
+	HighlightNetNS,
 	HighlightFwMark,
 	HighlightSaveConfig,
 	HighlightCmd,
diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index c38c7d9..3f0565a 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -91,6 +91,9 @@ special values: `off' disables the creation of routes altogether, and `auto'
 (the default) adds routes to the default table and enables special handling of
 default routes.
 .IP \(bu
+NetNS \(em Controls in which network namespace the WireGuard UDP socket is added to. The
+namespace has to be created before WireGuard use.
+.IP \(bu
 PreUp, PostUp, PreDown, PostDown \(em script snippets which will be executed by
 .BR bash (1)
 before/after setting up/tearing down the interface, most commonly used
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 7c2c002..6957cba 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -17,6 +17,7 @@ ADDRESSES=( )
 MTU=""
 DNS=( )
 TABLE=""
+NETNS=""
 PRE_UP=( )
 POST_UP=( )
 PRE_DOWN=( )
@@ -58,6 +59,7 @@ parse_options() {
 			MTU) MTU="$value"; continue ;;
 			DNS) DNS+=( ${value//,/ } ); continue ;;
 			Table) TABLE="$value"; continue ;;
+			NetNS) NETNS="$value"; continue ;;
 			PreUp) PRE_UP+=( "$value" ); continue ;;
 			PreDown) PRE_DOWN+=( "$value" ); continue ;;
 			PostUp) POST_UP+=( "$value" ); continue ;;
@@ -84,7 +86,18 @@ auto_su() {
 
 add_if() {
 	local ret
-	if ! cmd ip link add "$INTERFACE" type wireguard; then
+	if [[ -n $NETNS ]]; then
+		if ! ip netns pids "${NETNS}" > /dev/null; then
+			ret=$?
+			echo "[!] Target namespace '${NETNS}' not found"
+			exit $ret
+		elif ! cmd ip -n "${NETNS}" link add "$INTERFACE" type wireguard; then
+			ret=$?
+			[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
+			echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation."
+		fi
+		cmd ip -n "${NETNS}" link set "$INTERFACE" netns 1
+	elif ! cmd ip link add "$INTERFACE" type wireguard; then
 		ret=$?
 		[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
 		echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation."
@@ -258,6 +271,7 @@ save_config() {
 	done < <(resolvconf -l "$(resolvconf_iface_prefix)$INTERFACE" 2>/dev/null || cat "/etc/resolvconf/run/interface/$(resolvconf_iface_prefix)$INTERFACE" 2>/dev/null)
 	[[ -n $MTU && $(ip link show dev "$INTERFACE") =~ mtu\ ([0-9]+) ]] && new_config+="MTU = ${BASH_REMATCH[1]}"$'\n'
 	[[ -n $TABLE ]] && new_config+="Table = $TABLE"$'\n'
+	[[ -n $NETNS ]] && new_config+="NetNS = $NETNS"$'\n'
 	[[ $SAVE_CONFIG -eq 0 ]] || new_config+=$'SaveConfig = true\n'
 	for cmd in "${PRE_UP[@]}"; do
 		new_config+="PreUp = $cmd"$'\n'
-- 
2.25.1


--------------C6A221329864EC5403FE6AA5
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------C6A221329864EC5403FE6AA5--
