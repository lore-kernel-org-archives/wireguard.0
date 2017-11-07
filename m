Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1a293a
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:07 +0000 (UTC)
Received: from 5.mo6.mail-out.ovh.net (5.mo6.mail-out.ovh.net [46.105.54.31])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 288b8c69
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:06 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 049EF11CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:17 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 1/4] Add wireguard-go as submodule
Date: Tue,  7 Nov 2017 15:38:12 +1100
Message-Id: <20171107043817.9050-2-aurelien@chabot.fr>
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
 .gitmodules  | 3 +++
 wireguard-go | 1 +
 2 files changed, 4 insertions(+)
 create mode 100644 .gitmodules
 create mode 160000 wireguard-go

diff --git a/.gitmodules b/.gitmodules
new file mode 100644
index 0000000..c7957ea
--- /dev/null
+++ b/.gitmodules
@@ -0,0 +1,3 @@
+[submodule "wireguard-go"]
+	path = wireguard-go
+	url = git@github.com:trishika/wireguard-go.git
diff --git a/wireguard-go b/wireguard-go
new file mode 160000
index 0000000..32d8932
--- /dev/null
+++ b/wireguard-go
@@ -0,0 +1 @@
+Subproject commit 32d8932d1b29effa42fe56822988d3888c496873
-- 
2.15.0
