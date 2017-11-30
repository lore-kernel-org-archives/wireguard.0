Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39560502
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:17:59 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dcada2d
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:17:58 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 2/6] src/selftest: add SPDX tags to all files
Date: Thu, 30 Nov 2017 15:23:51 +0000
Message-Id: <20171130152355.25387-3-gregkh@linuxfoundation.org>
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

Update the src/selftest/ files with the correct SPDX license identifier
based on the license text of the project or based on the license in the
file itself.  The SPDX identifier is a legally binding shorthand, which
can be used instead of the full boiler plate text.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/selftest/allowedips.h       | 1 +
 src/selftest/blake2s.h          | 1 +
 src/selftest/chacha20poly1305.h | 1 +
 src/selftest/counter.h          | 1 +
 src/selftest/curve25519.h       | 1 +
 src/selftest/ratelimiter.h      | 1 +
 6 files changed, 6 insertions(+)

diff --git a/src/selftest/allowedips.h b/src/selftest/allowedips.h
index 8a568c8e67a2..26d2591d7c6f 100644
--- a/src/selftest/allowedips.h
+++ b/src/selftest/allowedips.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
diff --git a/src/selftest/blake2s.h b/src/selftest/blake2s.h
index 94dda274cb85..ae00a24eb232 100644
--- a/src/selftest/blake2s.h
+++ b/src/selftest/blake2s.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
diff --git a/src/selftest/chacha20poly1305.h b/src/selftest/chacha20poly1305.h
index a9ccd66ae1a3..e9f89d419b8f 100644
--- a/src/selftest/chacha20poly1305.h
+++ b/src/selftest/chacha20poly1305.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
diff --git a/src/selftest/counter.h b/src/selftest/counter.h
index 56d6006e01ea..7c0d23af4a7a 100644
--- a/src/selftest/counter.h
+++ b/src/selftest/counter.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
diff --git a/src/selftest/curve25519.h b/src/selftest/curve25519.h
index 17ff57a19570..7772e928dd44 100644
--- a/src/selftest/curve25519.h
+++ b/src/selftest/curve25519.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
diff --git a/src/selftest/ratelimiter.h b/src/selftest/ratelimiter.h
index 202c573b2333..607dc7d0f4e3 100644
--- a/src/selftest/ratelimiter.h
+++ b/src/selftest/ratelimiter.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifdef DEBUG
-- 
2.15.1
