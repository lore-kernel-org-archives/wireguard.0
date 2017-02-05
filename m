Return-Path: arti.zirk@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7656de8
 for <wireguard@lists.zx2c4.com>; Sun, 5 Feb 2017 16:09:42 +0000 (UTC)
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcee5f7b
 for <wireguard@lists.zx2c4.com>; Sun, 5 Feb 2017 16:09:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v77so16616157wmv.0
 for <wireguard@lists.zx2c4.com>; Sun, 05 Feb 2017 08:22:47 -0800 (PST)
Return-Path: <arti.zirk@gmail.com>
From: Arti Zirk <arti.zirk@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] Fix wg-tool regex parsing for non en_US locale
Date: Sun,  5 Feb 2017 17:22:33 +0100
Message-Id: <20170205162233.10810-1-arti.zirk@gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On systems that have the default locale set to anything other than en_US
or C will be unable to use wg-quick because regex rules use to make sure
that the input interface name is a valid will fail. Forcing locale
inside the script to C seems to fix that.
---
 src/tools/wg-quick.bash | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/tools/wg-quick.bash b/src/tools/wg-quick.bash
index 5db3485..c4f0cfd 100755
--- a/src/tools/wg-quick.bash
+++ b/src/tools/wg-quick.bash
@@ -6,6 +6,9 @@
 set -e -o pipefail
 shopt -s extglob
 
+# regex will change behavior based on the current locale, so lets set it to somehting that should work on most systems
+export LANG=C
+
 SELF="$(readlink -f "${BASH_SOURCE[0]}")"
 export PATH="${SELF%/*}:$PATH"
 
-- 
2.11.1
