Return-Path: j@mailb.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06275fd9
 for <wireguard@lists.zx2c4.com>; Wed, 1 Aug 2018 11:54:16 +0000 (UTC)
Received: from mx.mailb.org (mailb.org [IPv6:2a01:4f8:172:120f:1::161])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 007eeda4
 for <wireguard@lists.zx2c4.com>; Wed, 1 Aug 2018 11:54:16 +0000 (UTC)
Received: from authenticated-user (localhost [127.0.0.1])
 by mx.mailb.org (Postfix) with ESMTPSA id 325712543D27
 for <wireguard@lists.zx2c4.com>; Wed,  1 Aug 2018 12:04:26 +0000 (UTC)
From: j@mailb.org
Subject: [PATCH] wg-quick: use resolvectl if present to set dns
To: wireguard@lists.zx2c4.com
Message-ID: <d78ba489-ebc5-4769-610b-51529cc650ca@mailb.org>
Date: Wed, 1 Aug 2018 14:04:25 +0200
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------C48CDC92ECC6909B08EB7E5A"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------C48CDC92ECC6909B08EB7E5A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


only use resolvconf is available, fall back to resolvectl if present
otherwise. don't set dns if both are missing.

---
 src/tools/wg-quick/linux.bash | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)



--------------C48CDC92ECC6909B08EB7E5A
Content-Type: text/x-patch;
 name="0001-use-resolvectl-if-present-to-set-dns.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-use-resolvectl-if-present-to-set-dns.patch"

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 3f1976b..f86f0c8 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -151,13 +151,21 @@ resolvconf_iface_prefix() {
 HAVE_SET_DNS=0
 set_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	if [ -x /usr/bin/resolvconf ]; then
+		printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	elif [ -x /usr/bin/resolvectl ]; then
+		cmd resolvectl dns $INTERFACE "${DNS[@]}"
+	fi
 	HAVE_SET_DNS=1
 }
 
 unset_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
+	if [ -x /usr/bin/resolvconf ]; then
+		cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
+	elif [ -x /usr/bin/resolvectl ]; then
+		cmd resolvectl revert $INTERFACE
+	fi
 }
 
 add_route() {


--------------C48CDC92ECC6909B08EB7E5A--
