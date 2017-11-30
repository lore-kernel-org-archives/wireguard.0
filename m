Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40f76f54
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:03 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee20555c
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:02 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 3/6] src/tests: add SPDX tags to all files
Date: Thu, 30 Nov 2017 15:23:52 +0000
Message-Id: <20171130152355.25387-4-gregkh@linuxfoundation.org>
In-Reply-To: <20171130152355.25387-1-gregkh@linuxfoundation.org>
References: <20171130152355.25387-1-gregkh@linuxfoundation.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It's good to have SPDX identifiers in all files as the Linux kernel
developers are working to add these identifiers to all files.

Update the src/tests/ files with the correct SPDX license identifier
based on the license text of the project or based on the license in the
file itself.  The SPDX identifier is a legally binding shorthand, which
can be used instead of the full boiler plate text.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/tests/netns.sh    | 1 +
 src/tests/qemu/init.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/src/tests/netns.sh b/src/tests/netns.sh
index 8118b024aee3..9296cc7b502c 100755
--- a/src/tests/netns.sh
+++ b/src/tests/netns.sh
@@ -1,4 +1,5 @@
 #!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
 
 # Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
diff --git a/src/tests/qemu/init.c b/src/tests/qemu/init.c
index 8bccf3cb9857..0b8efe277271 100644
--- a/src/tests/qemu/init.c
+++ b/src/tests/qemu/init.c
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #define _GNU_SOURCE
-- 
2.15.1
