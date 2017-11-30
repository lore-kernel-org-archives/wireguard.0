Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5aab7b42
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:10 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40a5fe3d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:09 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 5/6] src: add SPDX tags to all files
Date: Thu, 30 Nov 2017 15:23:54 +0000
Message-Id: <20171130152355.25387-6-gregkh@linuxfoundation.org>
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

Update the src/ files with the correct SPDX license identifier based on
the license text of the project or based on the license in the file
itself.  The SPDX identifier is a legally binding shorthand, which can
be used instead of the full boiler plate text.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/allowedips.c  | 1 +
 src/allowedips.h  | 1 +
 src/cookie.c      | 1 +
 src/cookie.h      | 1 +
 src/device.c      | 1 +
 src/device.h      | 1 +
 src/hashtables.c  | 1 +
 src/hashtables.h  | 1 +
 src/main.c        | 1 +
 src/messages.h    | 1 +
 src/netlink.c     | 1 +
 src/netlink.h     | 1 +
 src/noise.c       | 1 +
 src/noise.h       | 1 +
 src/peer.c        | 1 +
 src/peer.h        | 1 +
 src/queueing.c    | 1 +
 src/queueing.h    | 1 +
 src/ratelimiter.c | 1 +
 src/ratelimiter.h | 1 +
 src/receive.c     | 1 +
 src/send.c        | 1 +
 src/socket.c      | 1 +
 src/socket.h      | 1 +
 src/timers.c      | 1 +
 src/timers.h      | 1 +
 src/version.h     | 1 +
 27 files changed, 27 insertions(+)

diff --git a/src/allowedips.c b/src/allowedips.c
index 8ad3291d7380..c20c158a360d 100644
--- a/src/allowedips.c
+++ b/src/allowedips.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "allowedips.h"
diff --git a/src/allowedips.h b/src/allowedips.h
index 53e674bee19f..0d5c5f885913 100644
--- a/src/allowedips.h
+++ b/src/allowedips.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_ALLOWEDIPS_H
diff --git a/src/cookie.c b/src/cookie.c
index 7dffb8601260..8a75078b30cb 100644
--- a/src/cookie.c
+++ b/src/cookie.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "cookie.h"
diff --git a/src/cookie.h b/src/cookie.h
index e264e354d1c7..61a2a1f60b32 100644
--- a/src/cookie.h
+++ b/src/cookie.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_COOKIE_H
diff --git a/src/device.c b/src/device.c
index d5dc93cde8b7..f6be267b90ae 100644
--- a/src/device.c
+++ b/src/device.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "queueing.h"
diff --git a/src/device.h b/src/device.h
index 7b305a3eba1c..bc6e42337c04 100644
--- a/src/device.h
+++ b/src/device.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_DEVICE_H
diff --git a/src/hashtables.c b/src/hashtables.c
index 8d61f4c8a740..8554d3f4fb95 100644
--- a/src/hashtables.c
+++ b/src/hashtables.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "hashtables.h"
diff --git a/src/hashtables.h b/src/hashtables.h
index 55f608a908dc..d5f5826ca68c 100644
--- a/src/hashtables.h
+++ b/src/hashtables.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_HASHTABLES_H
diff --git a/src/main.c b/src/main.c
index fea8c652e6e1..249ea5b01bf9 100644
--- a/src/main.c
+++ b/src/main.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "version.h"
diff --git a/src/messages.h b/src/messages.h
index 927b487043bf..6a183d279b00 100644
--- a/src/messages.h
+++ b/src/messages.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
diff --git a/src/netlink.c b/src/netlink.c
index 7faaa1a74d3c..7a5951438b54 100644
--- a/src/netlink.c
+++ b/src/netlink.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "netlink.h"
diff --git a/src/netlink.h b/src/netlink.h
index 750b87452542..fdda823e7161 100644
--- a/src/netlink.h
+++ b/src/netlink.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_NETLINK_H
diff --git a/src/noise.c b/src/noise.c
index 9d99bfa3cd12..8587027d4e67 100644
--- a/src/noise.c
+++ b/src/noise.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "noise.h"
diff --git a/src/noise.h b/src/noise.h
index 01026a4aee3b..6754d3b8d14f 100644
--- a/src/noise.h
+++ b/src/noise.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
diff --git a/src/peer.c b/src/peer.c
index 78ba5b0eb08b..24338d5185a1 100644
--- a/src/peer.c
+++ b/src/peer.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "peer.h"
diff --git a/src/peer.h b/src/peer.h
index 1e3c1ae8bf86..db4671e3351a 100644
--- a/src/peer.h
+++ b/src/peer.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_PEER_H
diff --git a/src/queueing.c b/src/queueing.c
index bce406adce69..fb52bfcba0e5 100644
--- a/src/queueing.c
+++ b/src/queueing.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "queueing.h"
diff --git a/src/queueing.h b/src/queueing.h
index a385d67f1b86..b84dd83883bf 100644
--- a/src/queueing.h
+++ b/src/queueing.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_QUEUEING_H
diff --git a/src/ratelimiter.c b/src/ratelimiter.c
index 8a73dd170e0b..5eb7ddb05b93 100644
--- a/src/ratelimiter.c
+++ b/src/ratelimiter.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "ratelimiter.h"
diff --git a/src/ratelimiter.h b/src/ratelimiter.h
index d2fcb64a90fb..1cb264e65e17 100644
--- a/src/ratelimiter.h
+++ b/src/ratelimiter.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_RATELIMITER_H
diff --git a/src/receive.c b/src/receive.c
index 080f6ba39178..62b5ad45c897 100644
--- a/src/receive.c
+++ b/src/receive.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "queueing.h"
diff --git a/src/send.c b/src/send.c
index 180d90988f60..6056dc1abd8f 100644
--- a/src/send.c
+++ b/src/send.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "queueing.h"
diff --git a/src/socket.c b/src/socket.c
index 5bf5a9220429..f39653780e26 100644
--- a/src/socket.c
+++ b/src/socket.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "device.h"
diff --git a/src/socket.h b/src/socket.h
index 161bd0b0f9f9..c3483b4dda77 100644
--- a/src/socket.h
+++ b/src/socket.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_SOCKET_H
diff --git a/src/timers.c b/src/timers.c
index 5f2570f7f51a..6b453f4fa02f 100644
--- a/src/timers.c
+++ b/src/timers.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #include "timers.h"
diff --git a/src/timers.h b/src/timers.h
index 105193edca50..465fcbed4002 100644
--- a/src/timers.h
+++ b/src/timers.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_TIMERS_H
diff --git a/src/version.h b/src/version.h
index 8ed54477cdfc..da18820bf3b2 100644
--- a/src/version.h
+++ b/src/version.h
@@ -1 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 #define WIREGUARD_VERSION "0.0.20171127"
-- 
2.15.1
