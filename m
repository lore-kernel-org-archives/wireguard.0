Return-Path: benedikt.morbach@googlemail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73aec56b
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:20:57 +0000 (UTC)
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af24b2c4
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 21:20:57 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u65so2624937wmu.3
 for <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 14:31:30 -0700 (PDT)
Return-Path: <benedikt.morbach@googlemail.com>
From: Benedikt Morbach <benedikt.morbach@googlemail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] contrib: fix out-of-tree build with jerry-rig.sh
Date: Wed, 10 May 2017 23:31:23 +0200
Message-Id: <20170510213123.8147-1-benedikt.morbach@googlemail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

this makes the build system put the objects in ${O}/net/wireguard
instead of ${O}/../../../../../../../../../../../../../../../../../../../../../..${WG}/
(where ${WG} is the full path to wireguard/src), allowing out-of-tree
kernel builds to work with WireGuard jerry-rigged in.
---
 contrib/kernel-tree/jerry-rig.sh | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/contrib/kernel-tree/jerry-rig.sh b/contrib/kernel-tree/jerry-rig.sh
index 3d4139a..afc1d9d 100755
--- a/contrib/kernel-tree/jerry-rig.sh
+++ b/contrib/kernel-tree/jerry-rig.sh
@@ -8,5 +8,6 @@ if [[ ! -e $K/net/Kconfig ]]; then
 	exit 1
 fi
 
-sed -i "/^if INET\$/a source \"$WG/Kconfig\"" "$K/net/Kconfig"
-echo "obj-y += ../../../../../../../../../../../../../../../../../../../../../..$WG/" >> "$K/net/Makefile"
+ln -sfT "../../../../../../../../../../../../../../../../../../../../../..$WG/" "$K/net/wireguard"
+sed -i "/^if INET\$/a source \"net/wireguard/Kconfig\"" "$K/net/Kconfig"
+echo "obj-y += wireguard/" >> "$K/net/Makefile"
-- 
2.12.2
