Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc5743b8
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:24 +0000 (UTC)
Received: from 7.mo6.mail-out.ovh.net (7.mo6.mail-out.ovh.net [46.105.59.196])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7745b112
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:24 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 3B85111CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:34 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 4/4] Add build instruction
Date: Tue,  7 Nov 2017 15:38:15 +1100
Message-Id: <20171107043817.9050-5-aurelien@chabot.fr>
In-Reply-To: <20171107043817.9050-1-aurelien@chabot.fr>
References: <20171107043817.9050-1-aurelien@chabot.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Signed-off-by: Aurélien Chabot <aurelien@chabot.fr>
---
 build.sh | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100755 build.sh

diff --git a/build.sh b/build.sh
new file mode 100755
index 0000000..7fbc2b6
--- /dev/null
+++ b/build.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+cd wireguardbinding
+
+export GOPATH=`pwd`
+export PATH=$PATH:`pwd`/bin
+
+go get golang.org/x/mobile/cmd/gomobile
+go get wireguard
+gomobile init
+gomobile bind -target=android wireguardbinding
+
+cd ..
+
+./gradlew assembleDebug
+
-- 
2.15.0
