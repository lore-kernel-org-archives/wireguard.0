Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E751C5478C
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Feb 2024 12:52:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a38e69d8;
	Tue, 27 Feb 2024 12:52:40 +0000 (UTC)
Received: from klaus.reldeif.de (<unknown>
 [2a03:4000:21:a0d:a84b:bbff:fea3:805c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5e0109ec
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Feb 2024 12:52:38 +0000 (UTC)
Received: from [130.75.33.138] (idefix-hs.sra.uni-hannover.de [130.75.33.138])
 by klaus.reldeif.de (Postfix) with ESMTPSA id 438C8872CB
 for <wireguard@lists.zx2c4.com>; Tue, 27 Feb 2024 13:52:38 +0100 (CET)
Message-ID: <a34c95ff-c053-49fd-8ffc-d9cca49c11b2@reldeif.de>
Date: Tue, 27 Feb 2024 13:52:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wireguard@lists.zx2c4.com
Content-Language: de-DE
From: =?UTF-8?Q?Bj=C3=B6rn_Fiedler?= <bjoern@reldeif.de>
Subject: [PATCH] wg-quick: linux: introduce BirthNamespace parameter
Content-Type: text/plain; charset=UTF-8; format=flowed
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

This allows the interface to be created in another network namespace
and be moved into the current one afterwards. As the interface
remembers it's birth namespace, encrypted packets are sent and
received using the birth namespace. Use case is to route all the
traffic via the "New Namespace Solution" as described on
https://www.wireguard.com/netns/

Signed-off-by Björn Fiedler <bjoern@reldeif.de>
---
  src/man/wg-quick.8      | 3 +++
  src/wg-quick/linux.bash | 7 ++++++-
  2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index bc9e145..b141041 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -92,6 +92,9 @@ special values: `off' disables the creation of routes altogether, and `auto'
  (the default) adds routes to the default table and enables special handling of
  default routes.
  .IP \(bu
+BirthNamespace \(em on Linux, if specified, the interface is created inside that namespace and
+afterwards moved into the current network namespace.
+.IP \(bu
  PreUp, PostUp, PreDown, PostDown \(em script snippets which will be executed by
  .BR bash (1)
  before/after setting up/tearing down the interface, most commonly used
diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..b0d1b70 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -18,6 +18,7 @@ MTU=""
  DNS=( )
  DNS_SEARCH=( )
  TABLE=""
+BIRTH_NAMESPACE=""
  PRE_UP=( )
  POST_UP=( )
  PRE_DOWN=( )
@@ -61,6 +62,7 @@ parse_options() {
                                 [[ $v =~ (^[0-9.]+$)|(^.*:.*$) ]] && DNS+=( $v ) || DNS_SEARCH+=( $v )
                         done; continue ;;
                         Table) TABLE="$value"; continue ;;
+                       BirthNamespace) BIRTH_NAMESPACE="$value"; continue ;;
                         PreUp) PRE_UP+=( "$value" ); continue ;;
                         PreDown) PRE_DOWN+=( "$value" ); continue ;;
                         PostUp) POST_UP+=( "$value" ); continue ;;
@@ -87,12 +89,15 @@ auto_su() {

  add_if() {
         local ret
-       if ! cmd ip link add "$INTERFACE" type wireguard; then
+       local namespace_arg=""
+       [[ -z $BIRTH_NAMESPACE ]] || namespace_arg="-n ${BIRTH_NAMESPACE}"
+       if ! cmd ip $namespace_arg link add "$INTERFACE" type wireguard; then
                 ret=$?
                 [[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
                 echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation." >&2
                 cmd "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" "$INTERFACE"
         fi
+    [[ -z $BIRTH_NAMESPACE ]] || cmd ip $namespace_arg link set "$INTERFACE" netns $BASHPID
  }

  del_if() {
-- 
2.43.0

