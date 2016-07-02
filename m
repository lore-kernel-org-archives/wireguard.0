Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4756aa79
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 14:28:17 +0000 (UTC)
Received: from fifthhorseman.net (c-174-62-194-216.hsd1.ct.comcast.net
 [174.62.194.216])
 by che.mayfirst.org (Postfix) with ESMTPSA id C8C4BF98B
 for <wireguard@lists.zx2c4.com>; Sat,  2 Jul 2016 10:31:21 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat,  2 Jul 2016 10:31:21 -0400
Message-Id: <1467469881-30885-1-git-send-email-dkg@fifthhorseman.net>
Subject: [WireGuard] [PATCH] add a style guide for emacs users
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

---
 .dir-locals.el | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 .dir-locals.el

diff --git a/.dir-locals.el b/.dir-locals.el
new file mode 100644
index 0000000..dd5a4ec
--- /dev/null
+++ b/.dir-locals.el
@@ -0,0 +1,14 @@
+;; emacs local configuration settings for wireguard source
+;; surmised by dkg on 2016-07-02
+
+((c-mode
+  (indent-tabs-mode . t)
+  (tab-width . 4)
+  (c-basic-offset . 4)
+  (c-file-style . "linux"))
+ (shell-mode
+  (indent-tabs-mode . t)
+  (tab-width . 4)
+  (sh-basic-offset . 4)
+  (sh-indentation . 4))
+ )
-- 
2.8.1
