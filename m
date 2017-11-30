Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a72ff03
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:16 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65a24f7d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:15 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 1/6] src/tools: add SPDX tags to all files
Date: Thu, 30 Nov 2017 15:23:50 +0000
Message-Id: <20171130152355.25387-2-gregkh@linuxfoundation.org>
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

Update the src/tools/ files with the correct SPDX license identifier
based on the license text of the project or based on the license in the
file itself.  The SPDX identifier is a legally binding shorthand, which
can be used instead of the full boiler plate text.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/tools/completion/wg-quick.bash-completion | 1 +
 src/tools/completion/wg.bash-completion       | 1 +
 src/tools/config.c                            | 1 +
 src/tools/config.h                            | 1 +
 src/tools/containers.h                        | 1 +
 src/tools/curve25519.c                        | 1 +
 src/tools/curve25519.h                        | 1 +
 src/tools/encoding.c                          | 1 +
 src/tools/encoding.h                          | 1 +
 src/tools/genkey.c                            | 1 +
 src/tools/ipc.c                               | 1 +
 src/tools/ipc.h                               | 1 +
 src/tools/mnlg.c                              | 1 +
 src/tools/mnlg.h                              | 1 +
 src/tools/pubkey.c                            | 1 +
 src/tools/set.c                               | 1 +
 src/tools/setconf.c                           | 1 +
 src/tools/show.c                              | 1 +
 src/tools/showconf.c                          | 1 +
 src/tools/subcommands.h                       | 1 +
 src/tools/terminal.c                          | 1 +
 src/tools/terminal.h                          | 1 +
 src/tools/wg-quick.bash                       | 1 +
 src/tools/wg.c                                | 1 +
 24 files changed, 24 insertions(+)

diff --git a/src/tools/completion/wg-quick.bash-completion b/src/tools/completion/wg-quick.bash-completion
index b9313236b0c1..a05e60dc4aec 100644
--- a/src/tools/completion/wg-quick.bash-completion
+++ b/src/tools/completion/wg-quick.bash-completion
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
 _wg_quick_completion() {
diff --git a/src/tools/completion/wg.bash-completion b/src/tools/completion/wg.bash-completion
index 5401bc332163..090daa0a66f6 100644
--- a/src/tools/completion/wg.bash-completion
+++ b/src/tools/completion/wg.bash-completion
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 # Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 
 _wg_completion() {
diff --git a/src/tools/config.c b/src/tools/config.c
index 6ff03767f9e6..312cbcdd7a85 100644
--- a/src/tools/config.c
+++ b/src/tools/config.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <arpa/inet.h>
diff --git a/src/tools/config.h b/src/tools/config.h
index 63a272cc1285..e3ad9f87404b 100644
--- a/src/tools/config.h
+++ b/src/tools/config.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef CONFIG_H
diff --git a/src/tools/containers.h b/src/tools/containers.h
index 31eabea2ce4b..8ccc183f63d5 100644
--- a/src/tools/containers.h
+++ b/src/tools/containers.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 
diff --git a/src/tools/curve25519.c b/src/tools/curve25519.c
index 71bd09564b5b..98ed4af5ce33 100644
--- a/src/tools/curve25519.c
+++ b/src/tools/curve25519.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0 OR OpenSSL)
 /* Original author: Adam Langley <agl@imperialviolet.org>
  *
  * Copyright 2008 Google Inc. All Rights Reserved.
diff --git a/src/tools/curve25519.h b/src/tools/curve25519.h
index 6e651e9f498a..458c5f156ef1 100644
--- a/src/tools/curve25519.h
+++ b/src/tools/curve25519.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef CURVE25519_H
diff --git a/src/tools/encoding.c b/src/tools/encoding.c
index da5ccef6715e..11ba885e6321 100644
--- a/src/tools/encoding.c
+++ b/src/tools/encoding.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
  * This is a specialized constant-time base64/hex implementation that resists side-channel attacks.
diff --git a/src/tools/encoding.h b/src/tools/encoding.h
index 1f79a2a7d1c7..f43a026a9376 100644
--- a/src/tools/encoding.h
+++ b/src/tools/encoding.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef ENCODING_H
diff --git a/src/tools/genkey.c b/src/tools/genkey.c
index 9a6206029470..fee7e0673459 100644
--- a/src/tools/genkey.c
+++ b/src/tools/genkey.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <errno.h>
diff --git a/src/tools/ipc.c b/src/tools/ipc.c
index a88672fd2eb8..dd226a671947 100644
--- a/src/tools/ipc.c
+++ b/src/tools/ipc.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef __linux__
diff --git a/src/tools/ipc.h b/src/tools/ipc.h
index cb660bb121c4..cfba8a79e530 100644
--- a/src/tools/ipc.h
+++ b/src/tools/ipc.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef IPC_H
diff --git a/src/tools/mnlg.c b/src/tools/mnlg.c
index 8a2b4cc98e76..7efd40237e19 100644
--- a/src/tools/mnlg.c
+++ b/src/tools/mnlg.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
  * Original author: Jiri Pirko <jiri@mellanox.com>
diff --git a/src/tools/mnlg.h b/src/tools/mnlg.h
index b27a18cca77a..ebfc1ec79a3a 100644
--- a/src/tools/mnlg.h
+++ b/src/tools/mnlg.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
  * Original author: Jiri Pirko <jiri@mellanox.com>
diff --git a/src/tools/pubkey.c b/src/tools/pubkey.c
index 6cced491ae0c..b1e406462a9b 100644
--- a/src/tools/pubkey.c
+++ b/src/tools/pubkey.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <errno.h>
diff --git a/src/tools/set.c b/src/tools/set.c
index 57a64288fa34..3c895cdd2fb1 100644
--- a/src/tools/set.c
+++ b/src/tools/set.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <stdio.h>
diff --git a/src/tools/setconf.c b/src/tools/setconf.c
index 1857ff606cce..e65f5e6e38cb 100644
--- a/src/tools/setconf.c
+++ b/src/tools/setconf.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <stddef.h>
diff --git a/src/tools/show.c b/src/tools/show.c
index ebfdf5b7f406..1a6646f25b83 100644
--- a/src/tools/show.c
+++ b/src/tools/show.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <arpa/inet.h>
diff --git a/src/tools/showconf.c b/src/tools/showconf.c
index e780d784b8e7..15e63ec08372 100644
--- a/src/tools/showconf.c
+++ b/src/tools/showconf.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <arpa/inet.h>
diff --git a/src/tools/subcommands.h b/src/tools/subcommands.h
index 7bbf70a58c98..b6dc0a87bbd6 100644
--- a/src/tools/subcommands.h
+++ b/src/tools/subcommands.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef SUBCOMMANDS_H
diff --git a/src/tools/terminal.c b/src/tools/terminal.c
index 703c75f4cf11..b450889b2dec 100644
--- a/src/tools/terminal.c
+++ b/src/tools/terminal.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <ctype.h>
diff --git a/src/tools/terminal.h b/src/tools/terminal.h
index 2c1fb3711c02..6b8dea62fe1b 100644
--- a/src/tools/terminal.h
+++ b/src/tools/terminal.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef TERMINAL_H
diff --git a/src/tools/wg-quick.bash b/src/tools/wg-quick.bash
index 42bf26514315..b2acbff041cd 100755
--- a/src/tools/wg-quick.bash
+++ b/src/tools/wg-quick.bash
@@ -1,4 +1,5 @@
 #!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
 #
 # Copyright (C) 2016-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
 #
diff --git a/src/tools/wg.c b/src/tools/wg.c
index 98342719a14f..7a3776874f5d 100644
--- a/src/tools/wg.c
+++ b/src/tools/wg.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include <stddef.h>
-- 
2.15.1
