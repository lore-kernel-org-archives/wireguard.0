Return-Path: j@mailb.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 837d3080
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 21:30:15 +0000 (UTC)
Received: from mx.mailb.org (mailb.org [IPv6:2a01:4f8:172:120f:1::161])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd696152
 for <wireguard@lists.zx2c4.com>; Wed, 8 Aug 2018 21:30:15 +0000 (UTC)
Subject: Re: [PATCH] wg-quick: use resolvectl if present to set dns
To: Nathan Chancellor <natechancellor@gmail.com>
References: <d78ba489-ebc5-4769-610b-51529cc650ca@mailb.org>
 <20180804000112.GA12885@flashbox>
From: j@mailb.org
Message-ID: <d675d1f9-71ac-b7cf-7ac5-714253717e09@mailb.org>
Date: Wed, 8 Aug 2018 22:41:06 +0100
MIME-Version: 1.0
In-Reply-To: <20180804000112.GA12885@flashbox>
Content-Type: multipart/mixed; boundary="------------0D9986CF21B55BA9249397B3"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------0D9986CF21B55BA9249397B3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

On 08/04/2018 01:01 AM, Nathan Chancellor wrote:
> I'd argue a better way to check if a command is available is the command
> built-in:
> 
> if command -v resolvconf >/dev/null; then
>     do stuff
> fi

good point, updated patch and added support for systemd-resolve in case
resolvectl is not present.

j

--------------0D9986CF21B55BA9249397B3
Content-Type: text/x-patch;
 name="0001-use-resolvectl-or-systemd-resolve-to-configure-dns.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-use-resolvectl-or-systemd-resolve-to-configure-dns.patc";
 filename*1="h"

diff --git a/src/tools/wg-quick/linux.bash b/src/tools/wg-quick/linux.bash
index 3f1976b..b8ef60b 100755
--- a/src/tools/wg-quick/linux.bash
+++ b/src/tools/wg-quick/linux.bash
@@ -151,13 +151,23 @@ resolvconf_iface_prefix() {
 HAVE_SET_DNS=0
 set_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	if command -v resolvconf >/dev/null; then
+		printf 'nameserver %s\n' "${DNS[@]}" | cmd resolvconf -a "$(resolvconf_iface_prefix)$INTERFACE" -m 0 -x
+	elif command -v resolvectl >/dev/null; then
+		cmd resolvectl dns $INTERFACE "${DNS[@]}"
+	elif command -v systemd-resolve >/dev/null && systemd-resolve --help | grep -- -set-dns >/dev/null; then
+		cmd systemd-resolve -i $INTERFACE `printf -- ' --set-dns %s' "${DNS[@]}"`
+	else
+		echo "could not configure nameservers" && return 0
+	fi
 	HAVE_SET_DNS=1
 }
 
 unset_dns() {
 	[[ ${#DNS[@]} -gt 0 ]] || return 0
-	cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
+	if [ -x /usr/bin/resolvconf ]; then
+		cmd resolvconf -d "$(resolvconf_iface_prefix)$INTERFACE"
+	fi
 }
 
 add_route() {


--------------0D9986CF21B55BA9249397B3--
