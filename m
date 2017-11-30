Return-Path: gregkh@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ab78acc1
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:06 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org
 [140.211.169.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 960d9d9c
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 15:18:05 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jason@zx2c4.com
Subject: [PATCH 4/6] src/crypto: add SPDX tags to all files
Date: Thu, 30 Nov 2017 15:23:53 +0000
Message-Id: <20171130152355.25387-5-gregkh@linuxfoundation.org>
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

Update the src/crypto/ files with the correct SPDX license identifier
based on the license text of the project or based on the license in the
file itself.  The SPDX identifier is a legally binding shorthand, which
can be used instead of the full boiler plate text.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 src/crypto/blake2s-x86_64.S    | 1 +
 src/crypto/blake2s.c           | 1 +
 src/crypto/blake2s.h           | 1 +
 src/crypto/chacha20-arm.S      | 1 +
 src/crypto/chacha20-arm64.S    | 1 +
 src/crypto/chacha20-x86_64.S   | 1 +
 src/crypto/chacha20poly1305.c  | 1 +
 src/crypto/chacha20poly1305.h  | 1 +
 src/crypto/curve25519-arm.S    | 1 +
 src/crypto/curve25519-x86_64.S | 1 +
 src/crypto/curve25519.c        | 1 +
 src/crypto/curve25519.h        | 1 +
 src/crypto/poly1305-arm.S      | 1 +
 src/crypto/poly1305-arm64.S    | 1 +
 src/crypto/poly1305-mips64.S   | 1 +
 src/crypto/poly1305-x86_64.S   | 1 +
 16 files changed, 16 insertions(+)

diff --git a/src/crypto/blake2s-x86_64.S b/src/crypto/blake2s-x86_64.S
index d1e0c0390be7..ba31766d3ce0 100644
--- a/src/crypto/blake2s-x86_64.S
+++ b/src/crypto/blake2s-x86_64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Based on algorithms from Samuel Neves <sneves@dei.uc.pt>
diff --git a/src/crypto/blake2s.c b/src/crypto/blake2s.c
index d0a121aaf182..06ce3fc81d45 100644
--- a/src/crypto/blake2s.c
+++ b/src/crypto/blake2s.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Original author: Samuel Neves <sneves@dei.uc.pt>
  *
  * Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
diff --git a/src/crypto/blake2s.h b/src/crypto/blake2s.h
index 9ed53ea2f8a8..636ec3dc4996 100644
--- a/src/crypto/blake2s.h
+++ b/src/crypto/blake2s.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_BLAKE2S_H
diff --git a/src/crypto/chacha20-arm.S b/src/crypto/chacha20-arm.S
index 62b7eeb8ea2b..c16bf655285d 100644
--- a/src/crypto/chacha20-arm.S
+++ b/src/crypto/chacha20-arm.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
  * Redistribution and use in source and binary forms, with or without
diff --git a/src/crypto/chacha20-arm64.S b/src/crypto/chacha20-arm64.S
index 6347adba642a..96b7693b4a93 100644
--- a/src/crypto/chacha20-arm64.S
+++ b/src/crypto/chacha20-arm64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
  * Redistribution and use in source and binary forms, with or without
diff --git a/src/crypto/chacha20-x86_64.S b/src/crypto/chacha20-x86_64.S
index 4a017611e2d8..a9c7d287b3ed 100644
--- a/src/crypto/chacha20-x86_64.S
+++ b/src/crypto/chacha20-x86_64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Samuel Neves <sneves@dei.uc.pt>. All Rights Reserved.
  * Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
diff --git a/src/crypto/chacha20poly1305.c b/src/crypto/chacha20poly1305.c
index e795d2f23829..4f3885eae6da 100644
--- a/src/crypto/chacha20poly1305.c
+++ b/src/crypto/chacha20poly1305.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: (GPL-2.0 OR OpenSSL)
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2015 Martin Willi.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
diff --git a/src/crypto/chacha20poly1305.h b/src/crypto/chacha20poly1305.h
index 991755de79c8..b654800a9986 100644
--- a/src/crypto/chacha20poly1305.h
+++ b/src/crypto/chacha20poly1305.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_CHACHA20POLY1305_H
diff --git a/src/crypto/curve25519-arm.S b/src/crypto/curve25519-arm.S
index 165675a6bc1a..8c903bb00325 100644
--- a/src/crypto/curve25519-arm.S
+++ b/src/crypto/curve25519-arm.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Based on algorithms from Daniel J. Bernstein and Peter Schwabe.
diff --git a/src/crypto/curve25519-x86_64.S b/src/crypto/curve25519-x86_64.S
index 2407ff4ca50d..31c57cf555b7 100644
--- a/src/crypto/curve25519-x86_64.S
+++ b/src/crypto/curve25519-x86_64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (C) 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Based on algorithms from Tung Chou <blueprint@crypto.tw>
diff --git a/src/crypto/curve25519.c b/src/crypto/curve25519.c
index 6dbd74b51100..ee105e894682 100644
--- a/src/crypto/curve25519.c
+++ b/src/crypto/curve25519.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /* Original author: Adam Langley <agl@imperialviolet.org>
  *
  * Copyright 2008 Google Inc. All Rights Reserved.
diff --git a/src/crypto/curve25519.h b/src/crypto/curve25519.h
index 800cefadb001..b76acf7ade45 100644
--- a/src/crypto/curve25519.h
+++ b/src/crypto/curve25519.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2015-2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved. */
 
 #ifndef _WG_CURVE25519_H
diff --git a/src/crypto/poly1305-arm.S b/src/crypto/poly1305-arm.S
index ca2248107e19..2653e864653e 100644
--- a/src/crypto/poly1305-arm.S
+++ b/src/crypto/poly1305-arm.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
  * Redistribution and use in source and binary forms, with or without
diff --git a/src/crypto/poly1305-arm64.S b/src/crypto/poly1305-arm64.S
index 13c7a6bcf120..6a2e0a44ab69 100644
--- a/src/crypto/poly1305-arm64.S
+++ b/src/crypto/poly1305-arm64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
  * Redistribution and use in source and binary forms, with or without
diff --git a/src/crypto/poly1305-mips64.S b/src/crypto/poly1305-mips64.S
index 5275a8c067c0..c2619ef60c66 100644
--- a/src/crypto/poly1305-mips64.S
+++ b/src/crypto/poly1305-mips64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
  * Redistribution and use in source and binary forms, with or without
diff --git a/src/crypto/poly1305-x86_64.S b/src/crypto/poly1305-x86_64.S
index bff1d0e53e55..b0f782fb5b9b 100644
--- a/src/crypto/poly1305-x86_64.S
+++ b/src/crypto/poly1305-x86_64.S
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR OpenSSL) */
 /* Copyright 2017 Samuel Neves <sneves@dei.uc.pt>. All Rights Reserved.
  * Copyright 2017 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  * Copyright 2016 The OpenSSL Project Authors. All Rights Reserved.
-- 
2.15.1
