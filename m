Return-Path: aurelien@chabot.fr
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d09b2f2
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:13 +0000 (UTC)
Received: from 3.mo6.mail-out.ovh.net (3.mo6.mail-out.ovh.net [178.33.253.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47539532
 for <wireguard@lists.zx2c4.com>; Tue, 7 Nov 2017 04:36:12 +0000 (UTC)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 4446511CF4D
 for <wireguard@lists.zx2c4.com>; Tue,  7 Nov 2017 05:39:22 +0100 (CET)
From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/4] Add support for android in wireguard-go
Date: Tue,  7 Nov 2017 15:38:13 +1100
Message-Id: <20171107043817.9050-3-aurelien@chabot.fr>
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
 wireguard-go | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wireguard-go b/wireguard-go
index 32d8932..96053b4 160000
--- a/wireguard-go
+++ b/wireguard-go
@@ -1 +1 @@
-Subproject commit 32d8932d1b29effa42fe56822988d3888c496873
+Subproject commit 96053b4d07e943b252667ccacb1018768fa1e488
-- 
2.15.0
