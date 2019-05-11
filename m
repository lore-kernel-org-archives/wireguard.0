Return-Path: <SRS0=YdU4=TN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47B5C04A6B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:14:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AED208C0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 May 2019 00:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AED208C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=git.icu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id daddabec;
	Mon, 13 May 2019 00:14:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6520c27f
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 18:03:42 +0000 (UTC)
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
 [209.85.221.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d70ffa7f
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 May 2019 18:03:41 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id q189so2288765vkq.11
 for <wireguard@lists.zx2c4.com>; Sat, 11 May 2019 11:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1KnFKAq55gAfZuWP5uoj3hE3/VdGpYVOLbnnAqpKV5k=;
 b=Kw7A0CInazj2JQeGIujWmaNpYZnb1unspg4XfMCUamcg/wPwwzPfCIzz8DZrfOxHjr
 5jmi3RqsTfc64tZX+XUhh5Gae17VyTjFE9mBIazAoR65N1QTYeqL96WMJQ56LuN3NrmI
 y0U9IVFP62BT3rV//paBs4Wn1VHfsvlUZyhVZYK3DlCBWf3eiM6GKhloztzEavVwlCwY
 pQ/ie6ngde+Ah/q5bIEn3ifHL9jSDrlx2Ai5U4NSIPkQQCPPoCaV9F0FlRzu6OwiKn/o
 Qpb4E5UGSE2GhFdL3gVfktvPAscpVAWdqfoStNuPpI9me8UN5ogfikXO2PgBuF8ic64M
 W+kQ==
X-Gm-Message-State: APjAAAXgfrgZzLqU5XXjoaJS2aiF0eWPGzMgjgdNolYxD8ip9h41w5iu
 6dNvFVKFIIAyrR1Q+TA4sPsdL63e
X-Google-Smtp-Source: APXvYqzGp+UTBcoxBsDjn6+jBbrHap2ITYlLqyiZDgD/aTvYlDLKgMXs3GsZCDwAFDpppk89qN33Gg==
X-Received: by 2002:a1f:e185:: with SMTP id y127mr8479511vkg.20.1557597819406; 
 Sat, 11 May 2019 11:03:39 -0700 (PDT)
Received: from localhost.localdomain ([132.251.3.46])
 by smtp.gmail.com with ESMTPSA id p8sm2376744vsd.14.2019.05.11.11.03.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 11 May 2019 11:03:38 -0700 (PDT)
From: Shawn Landden <shawn@git.icu>
To: wireguard@lists.zx2c4.com
Subject: [PATCH 2/2] [zinc] add accelerated poly1305 from openssl/cryptograms
Date: Sat, 11 May 2019 13:03:29 -0500
Message-Id: <20190511180329.10674-2-shawn@git.icu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190511180329.10674-1-shawn@git.icu>
References: <20190511131017.4061-1-shawn@git.icu>
 <20190511180329.10674-1-shawn@git.icu>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 13 May 2019 02:14:49 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Unfortunately I am not seeing a speed up with this patch,
but it does decrease CPU usage.

Again, this will not work until ppc has its own version of the
may_use_simd() function that allows simd in the softirq context
that WireGuard runs in.

Signed-off-by: Shawn Landden <shawn@git.icu>
---
 src/crypto/Kbuild.include                     |   10 +-
 src/crypto/zinc/chacha20/chacha20-ppc.pl      |    3 +
 .../zinc/{chacha20 => perlasm}/ppc-xlate.pl   |    0
 src/crypto/zinc/poly1305/poly1305-arm-glue.c  |   65 -
 src/crypto/zinc/poly1305/poly1305-ppc-glue.c  |   94 +
 src/crypto/zinc/poly1305/poly1305-ppc.pl      | 1989 +++++++++++++++++
 src/crypto/zinc/poly1305/poly1305-ppcfp.pl    |  749 +++++++
 src/crypto/zinc/poly1305/poly1305.c           |   69 +
 8 files changed, 2910 insertions(+), 69 deletions(-)
 rename src/crypto/zinc/{chacha20 => perlasm}/ppc-xlate.pl (100%)
 create mode 100644 src/crypto/zinc/poly1305/poly1305-ppc-glue.c
 create mode 100644 src/crypto/zinc/poly1305/poly1305-ppc.pl
 create mode 100755 src/crypto/zinc/poly1305/poly1305-ppcfp.pl

diff --git a/src/crypto/Kbuild.include b/src/crypto/Kbuild.include
index 4e05181..ea18ce5 100644
--- a/src/crypto/Kbuild.include
+++ b/src/crypto/Kbuild.include
@@ -34,30 +34,32 @@ zinc-$(CONFIG_ZINC_ARCH_X86_64) += poly1305/poly1305-x86_64.o
 zinc-$(CONFIG_ZINC_ARCH_ARM) += poly1305/poly1305-arm.o
 zinc-$(CONFIG_ZINC_ARCH_ARM64) += poly1305/poly1305-arm64.o
 zinc-$(CONFIG_ZINC_ARCH_MIPS) += poly1305/poly1305-mips.o
 AFLAGS_poly1305-mips.o += -O2 # This is required to fill the branch delay slots
 zinc-$(CONFIG_ZINC_ARCH_MIPS64) += poly1305/poly1305-mips64.o
+zinc-$(CONFIG_ZINC_ARCH_PPC32) += poly1305/poly1305-ppc.o poly1305/poly1305-ppcfp.o
+zinc-$(CONFIG_ZINC_ARCH_PPC64) += poly1305/poly1305-ppc.o poly1305/poly1305-ppcfp.o
 
 zinc-y += chacha20poly1305.o
 
 zinc-y += blake2s/blake2s.o
 zinc-$(CONFIG_ZINC_ARCH_X86_64) += blake2s/blake2s-x86_64.o
 
 zinc-y += curve25519/curve25519.o
 zinc-$(CONFIG_ZINC_ARCH_ARM) += curve25519/curve25519-arm.o
 
 quiet_cmd_perlasm = PERLASM $@
-      cmd_perlasm = $(PERL) $< $(perlflags-y) > $@
+      cmd_perlasm = $(PERL) $(perlflags-y) $< $(perlargs-y) > $@
 $(obj)/%.S: $(src)/%.pl FORCE
 	$(call if_changed,perlasm)
 kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
 targets := $(patsubst $(kbuild-dir)/%.pl,%.S,$(wildcard $(patsubst %.o,$(kbuild-dir)/crypto/zinc/%.pl,$(zinc-y) $(zinc-m) $(zinc-))))
 
-perlflags-$(CONFIG_ZINC_ARCH_PPC32) += linux32
+perlargs-$(CONFIG_ZINC_ARCH_PPC32) += linux32
 ifeq ($(CONFIG_ZINC_ARCH_PPC64),y)
-perlflags-$(CONFIG_CPU_BIG_ENDIAN) += linux64
-perlflags-$(CONFIG_CPU_LITTLE_ENDIAN) += linux64le
+perlargs-$(CONFIG_CPU_BIG_ENDIAN) += linux64
+perlargs-$(CONFIG_CPU_LITTLE_ENDIAN) += linux64le
 endif
 
 # Old kernels don't set this, which causes trouble.
 .SECONDARY:
 
diff --git a/src/crypto/zinc/chacha20/chacha20-ppc.pl b/src/crypto/zinc/chacha20/chacha20-ppc.pl
index 07468c8..fa8f6bc 100644
--- a/src/crypto/zinc/chacha20/chacha20-ppc.pl
+++ b/src/crypto/zinc/chacha20/chacha20-ppc.pl
@@ -4,10 +4,12 @@
 # This code is taken from the OpenSSL project but the author, Andy Polyakov,
 # has relicensed it under the licenses specified in the SPDX header above.
 # The original headers, including the original license headers, are
 # included below for completeness.
 #
+# Changes: search in more places for ppc-xlate.pl
+#
 # Copyright 2016-2018 The OpenSSL Project Authors. All Rights Reserved.
 #
 # Licensed under the Apache License 2.0 (the "License").  You may not use
 # this file except in compliance with the License.  You can obtain a copy
 # in the file LICENSE in the source distribution or at
@@ -71,10 +73,11 @@ if ($flavour =~ /64/) {
 
 $LITTLE_ENDIAN = ($flavour=~/le$/) ? 1 : 0;
 
 $0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
 ( $xlate="${dir}ppc-xlate.pl" and -f $xlate ) or
+( $xlate="${dir}../perlasm/ppc-xlate.pl" and -f $xlate) or
 ( $xlate="${dir}../../perlasm/ppc-xlate.pl" and -f $xlate) or
 die "can't locate ppc-xlate.pl";
 
 open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
 
diff --git a/src/crypto/zinc/chacha20/ppc-xlate.pl b/src/crypto/zinc/perlasm/ppc-xlate.pl
similarity index 100%
rename from src/crypto/zinc/chacha20/ppc-xlate.pl
rename to src/crypto/zinc/perlasm/ppc-xlate.pl
diff --git a/src/crypto/zinc/poly1305/poly1305-arm-glue.c b/src/crypto/zinc/poly1305/poly1305-arm-glue.c
index a80f046..6100700 100644
--- a/src/crypto/zinc/poly1305/poly1305-arm-glue.c
+++ b/src/crypto/zinc/poly1305/poly1305-arm-glue.c
@@ -24,75 +24,10 @@ static void __init poly1305_fpu_init(void)
 #elif defined(CONFIG_ZINC_ARCH_ARM)
 	poly1305_use_neon = elf_hwcap & HWCAP_NEON;
 #endif
 }
 
-#if defined(CONFIG_ZINC_ARCH_ARM64)
-struct poly1305_arch_internal {
-	union {
-		u32 h[5];
-		struct {
-			u64 h0, h1, h2;
-		};
-	};
-	u64 is_base2_26;
-	u64 r[2];
-};
-#elif defined(CONFIG_ZINC_ARCH_ARM)
-struct poly1305_arch_internal {
-	union {
-		u32 h[5];
-		struct {
-			u64 h0, h1;
-			u32 h2;
-		} __packed;
-	};
-	u32 r[4];
-	u32 is_base2_26;
-};
-#endif
-
-/* The NEON code uses base 2^26, while the scalar code uses base 2^64 on 64-bit
- * and base 2^32 on 32-bit. If we hit the unfortunate situation of using NEON
- * and then having to go back to scalar -- because the user is silly and has
- * called the update function from two separate contexts -- then we need to
- * convert back to the original base before proceeding. The below function is
- * written for 64-bit integers, and so we have to swap words at the end on
- * big-endian 32-bit. It is possible to reason that the initial reduction below
- * is sufficient given the implementation invariants. However, for an avoidance
- * of doubt and because this is not performance critical, we do the full
- * reduction anyway.
- */
-static void convert_to_base2_64(void *ctx)
-{
-	struct poly1305_arch_internal *state = ctx;
-	u32 cy;
-
-	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !state->is_base2_26)
-		return;
-
-	cy = state->h[0] >> 26; state->h[0] &= 0x3ffffff; state->h[1] += cy;
-	cy = state->h[1] >> 26; state->h[1] &= 0x3ffffff; state->h[2] += cy;
-	cy = state->h[2] >> 26; state->h[2] &= 0x3ffffff; state->h[3] += cy;
-	cy = state->h[3] >> 26; state->h[3] &= 0x3ffffff; state->h[4] += cy;
-	state->h0 = ((u64)state->h[2] << 52) | ((u64)state->h[1] << 26) | state->h[0];
-	state->h1 = ((u64)state->h[4] << 40) | ((u64)state->h[3] << 14) | (state->h[2] >> 12);
-	state->h2 = state->h[4] >> 24;
-	if (IS_ENABLED(CONFIG_ZINC_ARCH_ARM) && IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
-		state->h0 = rol64(state->h0, 32);
-		state->h1 = rol64(state->h1, 32);
-	}
-#define ULT(a, b) ((a ^ ((a ^ b) | ((a - b) ^ b))) >> (sizeof(a) * 8 - 1))
-	cy = (state->h2 >> 2) + (state->h2 & ~3ULL);
-	state->h2 &= 3;
-	state->h0 += cy;
-	state->h1 += (cy = ULT(state->h0, cy));
-	state->h2 += ULT(state->h1, cy);
-#undef ULT
-	state->is_base2_26 = 0;
-}
-
 static inline bool poly1305_init_arch(void *ctx,
 				      const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_init_arm(ctx, key);
 	return true;
diff --git a/src/crypto/zinc/poly1305/poly1305-ppc-glue.c b/src/crypto/zinc/poly1305/poly1305-ppc-glue.c
new file mode 100644
index 0000000..ae6c7fb
--- /dev/null
+++ b/src/crypto/zinc/poly1305/poly1305-ppc-glue.c
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
+ */
+
+#include <asm/cpufeature.h>
+
+asmlinkage void poly1305_init_int(void *ctx, const u8 key[16]);
+asmlinkage void poly1305_blocks_int(void *ctx, const u8 *inp, size_t len,
+				    u32 padbit);
+asmlinkage void poly1305_emit_int(void *ctx, u8 mac[16],
+				  const u32 nonce[4]);
+asmlinkage void poly1305_init_fpu(void *ctx, const u8 key[16]);
+asmlinkage void poly1305_blocks_fpu(void *ctx, const u8 *inp, size_t len,
+				    u32 padbit);
+asmlinkage void poly1305_emit_fpu(void *ctx, u8 mac[16],
+				  const u32 nonce[4]);
+asmlinkage void poly1305_blocks_vsx(void *ctx, const u8 *inp, size_t len,
+				    u32 padbit);
+static void (*poly1305_init_ppc)(void *ctx, const u8 key[16]) __ro_after_init;
+static void (*poly1305_emit_ppc)(void *ctx, u8 mac[16],
+				 const u32 nonce[4]) __ro_after_init;
+static void (*poly1305_blocks_ppc)(void *ctx, const u8 *inp, size_t len,
+				   u32 padbit) __ro_after_init;
+static bool *const poly1305_nobs[] __initconst = {};
+
+static void inline do_invalid_op(void) {
+	BUG();
+}
+
+static void __init poly1305_fpu_init(void)
+{
+	if (cpu_have_feature(PPC_MODULE_FEATURE_VEC_CRYPTO)) {
+		poly1305_init_ppc = &poly1305_init_int;	/* No special init */
+		poly1305_emit_ppc = &poly1305_emit_int;	/* No special emit */
+		poly1305_blocks_ppc = &poly1305_blocks_vsx;
+	} else if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE)) {
+		poly1305_init_ppc = &poly1305_init_fpu;
+		poly1305_emit_ppc = &poly1305_emit_fpu;
+		poly1305_blocks_ppc = &poly1305_blocks_fpu;
+	} else {
+		poly1305_init_ppc = &poly1305_init_int;
+		poly1305_emit_ppc = &poly1305_emit_int;
+		poly1305_blocks_ppc = (void (*)(void *ctx, const u8 *inp, size_t len, u32 padbit))&do_invalid_op;
+	}
+}
+
+static inline bool poly1305_init_arch(void *ctx,
+				      const u8 key[POLY1305_KEY_SIZE])
+{
+	poly1305_init_ppc(ctx, key);
+	return true;
+}
+
+static inline bool poly1305_blocks_arch(void *ctx, const u8 *inp,
+					size_t len, const u32 padbit,
+					simd_context_t *simd_context)
+{
+	/* SIMD disables preemption, so relax after processing each page. */
+	BUILD_BUG_ON(PAGE_SIZE < POLY1305_BLOCK_SIZE ||
+		     PAGE_SIZE % POLY1305_BLOCK_SIZE);
+
+	if (!IS_ENABLED(CONFIG_PPC_FPU) ||
+	    !simd_use(simd_context)) {
+		convert_to_base2_64(ctx);
+		poly1305_blocks_int(ctx, inp, len, padbit);
+		return true;
+	}
+
+	for (;;) {
+		const size_t bytes = min_t(size_t, len, PAGE_SIZE);
+
+		poly1305_blocks_ppc(ctx, inp, bytes, padbit);
+		len -= bytes;
+		if (!len)
+			break;
+		inp += bytes;
+		simd_relax(simd_context);
+	}
+	return true;
+}
+
+static inline bool poly1305_emit_arch(void *ctx, u8 mac[POLY1305_MAC_SIZE],
+				      const u32 nonce[4],
+				      simd_context_t *simd_context)
+{
+	if (!IS_ENABLED(CONFIG_PPC_FPU) ||
+	    !simd_use(simd_context)) {
+		convert_to_base2_64(ctx);
+		poly1305_emit_int(ctx, mac, nonce);
+	} else
+		poly1305_emit_ppc(ctx, mac, nonce);
+	return true;
+}
diff --git a/src/crypto/zinc/poly1305/poly1305-ppc.pl b/src/crypto/zinc/poly1305/poly1305-ppc.pl
new file mode 100644
index 0000000..dd4e3fb
--- /dev/null
+++ b/src/crypto/zinc/poly1305/poly1305-ppc.pl
@@ -0,0 +1,1989 @@
+#! /usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# This code is taken from the OpenSSL project but the author, Andy Polyakov,
+# has relicensed it under the licenses specified in the SPDX header above.
+# The original headers, including the original license headers, are
+# included below for completeness.
+#
+# Changes: renamed poly1305_emit to poly1305_emit_int,
+#          renamed poly1305_blocks to poly1305_blocks_int
+#          Look in more places for ppc-xlate.pl
+#
+# Copyright 2016-2018 The OpenSSL Project Authors. All Rights Reserved.
+#
+# Licensed under the Apache License 2.0 (the "License").  You may not use
+# this file except in compliance with the License.  You can obtain a copy
+# in the file LICENSE in the source distribution or at
+# https://www.openssl.org/source/license.html
+
+#
+# ====================================================================
+# Written by Andy Polyakov, @dot-asm, initially for use in the OpenSSL
+# project. The module is dual licensed under OpenSSL and CRYPTOGAMS
+# licenses depending on where you obtain it. For further details see
+# https://github.com/dot-asm/cryptogams/.
+# ====================================================================
+#
+# This module implements Poly1305 hash for PowerPC.
+#
+# June 2015
+#
+# Numbers are cycles per processed byte with poly1305_blocks alone,
+# and improvement coefficients relative to gcc-generated code.
+#
+#			-m32		-m64
+#
+# Freescale e300	14.8/+80%	-
+# PPC74x0		7.60/+60%	-
+# PPC970		7.00/+114%	3.51/+205%
+# POWER7		3.75/+260%	1.93/+100%
+# POWER8		-		2.03/+200%
+# POWER9		-		2.00/+150%
+#
+# Do we need floating-point implementation for PPC? Results presented
+# in poly1305_ieee754.c are tricky to compare to, because they are for
+# compiler-generated code. On the other hand it's known that floating-
+# point performance can be dominated by FPU latency, which means that
+# there is limit even for ideally optimized (and even vectorized) code.
+# And this limit is estimated to be higher than above -m64 results. Or
+# in other words floating-point implementation can be meaningful to
+# consider only in 32-bit application context. We probably have to
+# recognize that 32-bit builds are getting less popular on high-end
+# systems and therefore tend to target embedded ones, which might not
+# even have FPU...
+#
+# On side note, Power ISA 2.07 enables vector base 2^26 implementation,
+# and POWER8 might have capacity to break 1.0 cycle per byte barrier...
+#
+# January 2019
+#
+# ... Unfortunately not:-( Estimate was a projection of ARM result,
+# but ARM has vector multiply-n-add instruction, while PowerISA does
+# not, not one usable in the context. Improvement is ~40% over -m64
+# result above and is ~1.43 on little-endian systems.
+
+$flavour = shift;
+
+if ($flavour =~ /64/) {
+	$SIZE_T	=8;
+	$LRSAVE	=2*$SIZE_T;
+	$UCMP	="cmpld";
+	$STU	="stdu";
+	$POP	="ld";
+	$PUSH	="std";
+} elsif ($flavour =~ /32/) {
+	$SIZE_T	=4;
+	$LRSAVE	=$SIZE_T;
+	$UCMP	="cmplw";
+	$STU	="stwu";
+	$POP	="lwz";
+	$PUSH	="stw";
+} else { die "nonsense $flavour"; }
+
+# Define endianness based on flavour
+# i.e.: linux64le
+$LITTLE_ENDIAN = ($flavour=~/le$/) ? $SIZE_T : 0;
+
+$0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
+( $xlate="${dir}ppc-xlate.pl" and -f $xlate ) or
+( $xlate="${dir}../perlasm/ppc-xlate.pl" and -f $xlate) or
+( $xlate="${dir}../../perlasm/ppc-xlate.pl" and -f $xlate) or
+die "can't locate ppc-xlate.pl";
+
+open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
+
+$FRAME=24*$SIZE_T;
+
+$sp="r1";
+my ($ctx,$inp,$len,$padbit) = map("r$_",(3..6));
+my ($mac,$nonce)=($inp,$len);
+my $mask = "r0";
+
+$code=<<___;
+.machine	"any"
+.text
+___
+							if ($flavour =~ /64/) {
+###############################################################################
+# base 2^64 implementation
+
+my ($h0,$h1,$h2,$d0,$d1,$d2, $r0,$r1,$s1, $t0,$t1) = map("r$_",(7..12,27..31));
+
+$code.=<<___;
+.globl	.poly1305_init_int
+.align	4
+.poly1305_init_int:
+	xor	r0,r0,r0
+	std	r0,0($ctx)		# zero hash value
+	std	r0,8($ctx)
+	std	r0,16($ctx)
+	stw	r0,24($ctx)		# clear is_base2_26
+
+	$UCMP	$inp,r0
+	beq-	Lno_key
+___
+$code.=<<___	if ($LITTLE_ENDIAN);
+	ld	$d0,0($inp)		# load key material
+	ld	$d1,8($inp)
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	li	$h0,4
+	lwbrx	$d0,0,$inp		# load key material
+	li	$d1,8
+	lwbrx	$h0,$h0,$inp
+	li	$h1,12
+	lwbrx	$d1,$d1,$inp
+	lwbrx	$h1,$h1,$inp
+	insrdi	$d0,$h0,32,0
+	insrdi	$d1,$h1,32,0
+___
+$code.=<<___;
+	lis	$h1,0xfff		# 0x0fff0000
+	ori	$h1,$h1,0xfffc		# 0x0ffffffc
+	insrdi	$h1,$h1,32,0		# 0x0ffffffc0ffffffc
+	ori	$h0,$h1,3		# 0x0ffffffc0fffffff
+
+	and	$d0,$d0,$h0
+	and	$d1,$d1,$h1
+
+	std	$d0,32($ctx)		# store key
+	std	$d1,40($ctx)
+
+Lno_key:
+	xor	r3,r3,r3
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,2,0
+.size	.poly1305_init_int,.-.poly1305_init_int
+
+.globl	.poly1305_blocks_int
+.align	4
+.poly1305_blocks_int:
+Lpoly1305_blocks:
+	srdi.	$len,$len,4
+	beq-	Labort
+
+	$STU	$sp,-$FRAME($sp)
+	mflr	r0
+	$PUSH	r27,`$FRAME-$SIZE_T*5`($sp)
+	$PUSH	r28,`$FRAME-$SIZE_T*4`($sp)
+	$PUSH	r29,`$FRAME-$SIZE_T*3`($sp)
+	$PUSH	r30,`$FRAME-$SIZE_T*2`($sp)
+	$PUSH	r31,`$FRAME-$SIZE_T*1`($sp)
+	$PUSH	r0,`$FRAME+$LRSAVE`($sp)
+
+	ld	$r0,32($ctx)		# load key
+	ld	$r1,40($ctx)
+
+	ld	$h0,0($ctx)		# load hash value
+	ld	$h1,8($ctx)
+	ld	$h2,16($ctx)
+
+	srdi	$s1,$r1,2
+	mtctr	$len
+	add	$s1,$s1,$r1		# s1 = r1 + r1>>2
+	li	$mask,3
+	b	Loop
+
+.align	4
+Loop:
+___
+$code.=<<___	if ($LITTLE_ENDIAN);
+	ld	$t0,0($inp)		# load input
+	ld	$t1,8($inp)
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	li	$d0,4
+	lwbrx	$t0,0,$inp		# load input
+	li	$t1,8
+	lwbrx	$d0,$d0,$inp
+	li	$d1,12
+	lwbrx	$t1,$t1,$inp
+	lwbrx	$d1,$d1,$inp
+	insrdi	$t0,$d0,32,0
+	insrdi	$t1,$d1,32,0
+___
+$code.=<<___;
+	addi	$inp,$inp,16
+
+	addc	$h0,$h0,$t0		# accumulate input
+	adde	$h1,$h1,$t1
+
+	mulld	$d0,$h0,$r0		# h0*r0
+	mulhdu	$d1,$h0,$r0
+	adde	$h2,$h2,$padbit
+
+	mulld	$t0,$h1,$s1		# h1*5*r1
+	mulhdu	$t1,$h1,$s1
+	addc	$d0,$d0,$t0
+	adde	$d1,$d1,$t1
+
+	mulld	$t0,$h0,$r1		# h0*r1
+	mulhdu	$d2,$h0,$r1
+	addc	$d1,$d1,$t0
+	addze	$d2,$d2
+
+	mulld	$t0,$h1,$r0		# h1*r0
+	mulhdu	$t1,$h1,$r0
+	addc	$d1,$d1,$t0
+	adde	$d2,$d2,$t1
+
+	mulld	$t0,$h2,$s1		# h2*5*r1
+	mulld	$t1,$h2,$r0		# h2*r0
+	addc	$d1,$d1,$t0
+	adde	$d2,$d2,$t1
+
+	andc	$t0,$d2,$mask		# final reduction step
+	and	$h2,$d2,$mask
+	srdi	$t1,$t0,2
+	add	$t0,$t0,$t1
+	addc	$h0,$d0,$t0
+	addze	$h1,$d1
+	addze	$h2,$h2
+
+	bdnz	Loop
+
+	std	$h0,0($ctx)		# store hash value
+	std	$h1,8($ctx)
+	std	$h2,16($ctx)
+
+	$POP	r27,`$FRAME-$SIZE_T*5`($sp)
+	$POP	r28,`$FRAME-$SIZE_T*4`($sp)
+	$POP	r29,`$FRAME-$SIZE_T*3`($sp)
+	$POP	r30,`$FRAME-$SIZE_T*2`($sp)
+	$POP	r31,`$FRAME-$SIZE_T*1`($sp)
+	addi	$sp,$sp,$FRAME
+Labort:
+	blr
+	.long	0
+	.byte	0,12,4,1,0x80,5,4,0
+.size	.poly1305_blocks_int,.-.poly1305_blocks_int
+___
+{
+my ($h0,$h1,$h2,$h3,$h4,$t0) = map("r$_",(7..12));
+
+$code.=<<___;
+.globl	.poly1305_emit_int
+.align	5
+.poly1305_emit_int:
+	lwz	$h0,0($ctx)	# load hash value base 2^26
+	lwz	$h1,4($ctx)
+	lwz	$h2,8($ctx)
+	lwz	$h3,12($ctx)
+	lwz	$h4,16($ctx)
+	lwz	r0,24($ctx)	# is_base2_26
+
+	sldi	$h1,$h1,26	# base 2^26 -> base 2^64
+	sldi	$t0,$h2,52
+	srdi	$h2,$h2,12
+	sldi	$h3,$h3,14
+	add	$h0,$h0,$h1
+	addc	$h0,$h0,$t0
+	sldi	$t0,$h4,40
+	srdi	$h4,$h4,24
+	adde	$h1,$h2,$h3
+	addc	$h1,$h1,$t0
+	addze	$h2,$h4
+
+	ld	$h3,0($ctx)	# load hash value base 2^64
+	ld	$h4,8($ctx)
+	ld	$t0,16($ctx)
+
+	neg	r0,r0
+	xor	$h0,$h0,$h3	# choose between radixes
+	xor	$h1,$h1,$h4
+	xor	$h2,$h2,$t0
+	and	$h0,$h0,r0
+	and	$h1,$h1,r0
+	and	$h2,$h2,r0
+	xor	$h0,$h0,$h3
+	xor	$h1,$h1,$h4
+	xor	$h2,$h2,$t0
+
+	addic	$h3,$h0,5	# compare to modulus
+	addze	$h4,$h1
+	addze	$t0,$h2
+
+	srdi	$t0,$t0,2	# see if it carried/borrowed
+	neg	$t0,$t0
+
+	andc	$h0,$h0,$t0
+	and	$h3,$h3,$t0
+	andc	$h1,$h1,$t0
+	and	$h4,$h4,$t0
+	or	$h0,$h0,$h3
+	or	$h1,$h1,$h4
+
+	lwz	$t0,4($nonce)
+	lwz	$h2,12($nonce)
+	lwz	$h3,0($nonce)
+	lwz	$h4,8($nonce)
+
+	insrdi	$h3,$t0,32,0
+	insrdi	$h4,$h2,32,0
+
+	addc	$h0,$h0,$h3	# accumulate nonce
+	adde	$h1,$h1,$h4
+
+	addi	$ctx,$mac,-1
+	addi	$mac,$mac,7
+
+	stbu	$h0,1($ctx)	# write [little-endian] result
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	srdi	$h0,$h0,8
+	stbu	$h1,1($mac)
+	srdi	$h1,$h1,8
+
+	stbu	$h0,1($ctx)
+	stbu	$h1,1($mac)
+
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,3,0
+.size	.poly1305_emit_int,.-.poly1305_emit_int
+___
+}							} else {
+###############################################################################
+# base 2^32 implementation
+
+my ($h0,$h1,$h2,$h3,$h4, $r0,$r1,$r2,$r3, $s1,$s2,$s3,
+    $t0,$t1,$t2,$t3, $D0,$D1,$D2,$D3, $d0,$d1,$d2,$d3
+   ) = map("r$_",(7..12,14..31));
+
+$code.=<<___;
+.globl	.poly1305_init_int
+.align	4
+.poly1305_init_int:
+	xor	r0,r0,r0
+	stw	r0,0($ctx)		# zero hash value
+	stw	r0,4($ctx)
+	stw	r0,8($ctx)
+	stw	r0,12($ctx)
+	stw	r0,16($ctx)
+	stw	r0,24($ctx)		# clear is_base2_26
+
+	$UCMP	$inp,r0
+	beq-	Lno_key
+___
+$code.=<<___	if ($LITTLE_ENDIAN);
+	lw	$h0,0($inp)		# load key material
+	lw	$h1,4($inp)
+	lw	$h2,8($inp)
+	lw	$h3,12($inp)
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	li	$h1,4
+	lwbrx	$h0,0,$inp		# load key material
+	li	$h2,8
+	lwbrx	$h1,$h1,$inp
+	li	$h3,12
+	lwbrx	$h2,$h2,$inp
+	lwbrx	$h3,$h3,$inp
+___
+$code.=<<___;
+	lis	$mask,0xf000		# 0xf0000000
+	li	$r0,-4
+	andc	$r0,$r0,$mask		# 0x0ffffffc
+
+	andc	$h0,$h0,$mask
+	and	$h1,$h1,$r0
+	and	$h2,$h2,$r0
+	and	$h3,$h3,$r0
+
+	stw	$h0,32($ctx)		# store key
+	stw	$h1,36($ctx)
+	stw	$h2,40($ctx)
+	stw	$h3,44($ctx)
+
+Lno_key:
+	xor	r3,r3,r3
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,2,0
+.size	.poly1305_init_int,.-.poly1305_init_int
+
+.globl	.poly1305_blocks_int
+.align	4
+.poly1305_blocks_int:
+Lpoly1305_blocks:
+	srwi.	$len,$len,4
+	beq-	Labort
+
+	$STU	$sp,-$FRAME($sp)
+	mflr	r0
+	$PUSH	r14,`$FRAME-$SIZE_T*18`($sp)
+	$PUSH	r15,`$FRAME-$SIZE_T*17`($sp)
+	$PUSH	r16,`$FRAME-$SIZE_T*16`($sp)
+	$PUSH	r17,`$FRAME-$SIZE_T*15`($sp)
+	$PUSH	r18,`$FRAME-$SIZE_T*14`($sp)
+	$PUSH	r19,`$FRAME-$SIZE_T*13`($sp)
+	$PUSH	r20,`$FRAME-$SIZE_T*12`($sp)
+	$PUSH	r21,`$FRAME-$SIZE_T*11`($sp)
+	$PUSH	r22,`$FRAME-$SIZE_T*10`($sp)
+	$PUSH	r23,`$FRAME-$SIZE_T*9`($sp)
+	$PUSH	r24,`$FRAME-$SIZE_T*8`($sp)
+	$PUSH	r25,`$FRAME-$SIZE_T*7`($sp)
+	$PUSH	r26,`$FRAME-$SIZE_T*6`($sp)
+	$PUSH	r27,`$FRAME-$SIZE_T*5`($sp)
+	$PUSH	r28,`$FRAME-$SIZE_T*4`($sp)
+	$PUSH	r29,`$FRAME-$SIZE_T*3`($sp)
+	$PUSH	r30,`$FRAME-$SIZE_T*2`($sp)
+	$PUSH	r31,`$FRAME-$SIZE_T*1`($sp)
+	$PUSH	r0,`$FRAME+$LRSAVE`($sp)
+
+	lwz	$r0,32($ctx)		# load key
+	lwz	$r1,36($ctx)
+	lwz	$r2,40($ctx)
+	lwz	$r3,44($ctx)
+
+	lwz	$h0,0($ctx)		# load hash value
+	lwz	$h1,4($ctx)
+	lwz	$h2,8($ctx)
+	lwz	$h3,12($ctx)
+	lwz	$h4,16($ctx)
+
+	srwi	$s1,$r1,2
+	srwi	$s2,$r2,2
+	srwi	$s3,$r3,2
+	add	$s1,$s1,$r1		# si = ri + ri>>2
+	add	$s2,$s2,$r2
+	add	$s3,$s3,$r3
+	mtctr	$len
+	li	$mask,3
+	b	Loop
+
+.align	4
+Loop:
+___
+$code.=<<___	if ($LITTLE_ENDIAN);
+	lwz	$d0,0($inp)		# load input
+	lwz	$d1,4($inp)
+	lwz	$d2,8($inp)
+	lwz	$d3,12($inp)
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	li	$d1,4
+	lwbrx	$d0,0,$inp		# load input
+	li	$d2,8
+	lwbrx	$d1,$d1,$inp
+	li	$d3,12
+	lwbrx	$d2,$d2,$inp
+	lwbrx	$d3,$d3,$inp
+___
+$code.=<<___;
+	addi	$inp,$inp,16
+
+	addc	$h0,$h0,$d0		# accumulate input
+	adde	$h1,$h1,$d1
+	adde	$h2,$h2,$d2
+
+	mullw	$d0,$h0,$r0		# h0*r0
+	mulhwu	$D0,$h0,$r0
+
+	mullw	$d1,$h0,$r1		# h0*r1
+	mulhwu	$D1,$h0,$r1
+
+	mullw	$d2,$h0,$r2		# h0*r2
+	mulhwu	$D2,$h0,$r2
+
+	 adde	$h3,$h3,$d3
+	 adde	$h4,$h4,$padbit
+
+	mullw	$d3,$h0,$r3		# h0*r3
+	mulhwu	$D3,$h0,$r3
+
+	mullw	$t0,$h1,$s3		# h1*s3
+	mulhwu	$t1,$h1,$s3
+
+	mullw	$t2,$h1,$r0		# h1*r0
+	mulhwu	$t3,$h1,$r0
+	 addc	$d0,$d0,$t0
+	 adde	$D0,$D0,$t1
+
+	mullw	$t0,$h1,$r1		# h1*r1
+	mulhwu	$t1,$h1,$r1
+	 addc	$d1,$d1,$t2
+	 adde	$D1,$D1,$t3
+
+	mullw	$t2,$h1,$r2		# h1*r2
+	mulhwu	$t3,$h1,$r2
+	 addc	$d2,$d2,$t0
+	 adde	$D2,$D2,$t1
+
+	mullw	$t0,$h2,$s2		# h2*s2
+	mulhwu	$t1,$h2,$s2
+	 addc	$d3,$d3,$t2
+	 adde	$D3,$D3,$t3
+
+	mullw	$t2,$h2,$s3		# h2*s3
+	mulhwu	$t3,$h2,$s3
+	 addc	$d0,$d0,$t0
+	 adde	$D0,$D0,$t1
+
+	mullw	$t0,$h2,$r0		# h2*r0
+	mulhwu	$t1,$h2,$r0
+	 addc	$d1,$d1,$t2
+	 adde	$D1,$D1,$t3
+
+	mullw	$t2,$h2,$r1		# h2*r1
+	mulhwu	$t3,$h2,$r1
+	 addc	$d2,$d2,$t0
+	 adde	$D2,$D2,$t1
+
+	mullw	$t0,$h3,$s1		# h3*s1
+	mulhwu	$t1,$h3,$s1
+	 addc	$d3,$d3,$t2
+	 adde	$D3,$D3,$t3
+
+	mullw	$t2,$h3,$s2		# h3*s2
+	mulhwu	$t3,$h3,$s2
+	 addc	$d0,$d0,$t0
+	 adde	$D0,$D0,$t1
+
+	mullw	$t0,$h3,$s3		# h3*s3
+	mulhwu	$t1,$h3,$s3
+	 addc	$d1,$d1,$t2
+	 adde	$D1,$D1,$t3
+
+	mullw	$t2,$h3,$r0		# h3*r0
+	mulhwu	$t3,$h3,$r0
+	 addc	$d2,$d2,$t0
+	 adde	$D2,$D2,$t1
+
+	mullw	$t0,$h4,$s1		# h4*s1
+	 addc	$d3,$d3,$t2
+	 adde	$D3,$D3,$t3
+	addc	$d1,$d1,$t0
+
+	mullw	$t1,$h4,$s2		# h4*s2
+	 addze	$D1,$D1
+	addc	$d2,$d2,$t1
+	addze	$D2,$D2
+
+	mullw	$t2,$h4,$s3		# h4*s3
+	addc	$d3,$d3,$t2
+	addze	$D3,$D3
+
+	mullw	$h4,$h4,$r0		# h4*r0
+
+	addc	$h1,$d1,$D0
+	adde	$h2,$d2,$D1
+	adde	$h3,$d3,$D2
+	adde	$h4,$h4,$D3
+
+	andc	$D0,$h4,$mask		# final reduction step
+	and	$h4,$h4,$mask
+	srwi	$D1,$D0,2
+	add	$D0,$D0,$D1
+	addc	$h0,$d0,$D0
+	addze	$h1,$h1
+	addze	$h2,$h2
+	addze	$h3,$h3
+	addze	$h4,$h4
+
+	bdnz	Loop
+
+	stw	$h0,0($ctx)		# store hash value
+	stw	$h1,4($ctx)
+	stw	$h2,8($ctx)
+	stw	$h3,12($ctx)
+	stw	$h4,16($ctx)
+
+	$POP	r14,`$FRAME-$SIZE_T*18`($sp)
+	$POP	r15,`$FRAME-$SIZE_T*17`($sp)
+	$POP	r16,`$FRAME-$SIZE_T*16`($sp)
+	$POP	r17,`$FRAME-$SIZE_T*15`($sp)
+	$POP	r18,`$FRAME-$SIZE_T*14`($sp)
+	$POP	r19,`$FRAME-$SIZE_T*13`($sp)
+	$POP	r20,`$FRAME-$SIZE_T*12`($sp)
+	$POP	r21,`$FRAME-$SIZE_T*11`($sp)
+	$POP	r22,`$FRAME-$SIZE_T*10`($sp)
+	$POP	r23,`$FRAME-$SIZE_T*9`($sp)
+	$POP	r24,`$FRAME-$SIZE_T*8`($sp)
+	$POP	r25,`$FRAME-$SIZE_T*7`($sp)
+	$POP	r26,`$FRAME-$SIZE_T*6`($sp)
+	$POP	r27,`$FRAME-$SIZE_T*5`($sp)
+	$POP	r28,`$FRAME-$SIZE_T*4`($sp)
+	$POP	r29,`$FRAME-$SIZE_T*3`($sp)
+	$POP	r30,`$FRAME-$SIZE_T*2`($sp)
+	$POP	r31,`$FRAME-$SIZE_T*1`($sp)
+	addi	$sp,$sp,$FRAME
+Labort:
+	blr
+	.long	0
+	.byte	0,12,4,1,0x80,18,4,0
+.size	.poly1305_blocks_int,.-.poly1305_blocks_int
+___
+{
+my ($h0,$h1,$h2,$h3,$h4,$t0,$t1) = map("r$_",(6..12));
+
+$code.=<<___;
+.globl	.poly1305_emit_int
+.align	5
+.poly1305_emit_int:
+	lwz	r0,24($ctx)	# is_base2_26
+	lwz	$h0,0($ctx)	# load hash value
+	lwz	$h1,4($ctx)
+	lwz	$h2,8($ctx)
+	lwz	$h3,12($ctx)
+	lwz	$h4,16($ctx)
+	cmplwi	r0,0
+	beq	Lemit_base2_32
+
+	slwi	$t0,$h1,26	# base 2^26 -> base 2^32
+	srwi	$h1,$h1,6
+	slwi	$t1,$h2,20
+	srwi	$h2,$h2,12
+	addc	$h0,$h0,$t0
+	slwi	$t0,$h3,14
+	srwi	$h3,$h3,18
+	adde	$h1,$h1,$t1
+	slwi	$t1,$h4,8
+	srwi	$h4,$h4,24
+	adde	$h2,$h2,$t0
+	adde	$h3,$h3,$t1
+	addze	$h4,$h4
+
+Lemit_base2_32:
+	addic	r0,$h0,5	# compare to modulus
+	addze	r0,$h1
+	addze	r0,$h2
+	addze	r0,$h3
+	addze	r0,$h4
+
+	srwi	r0,r0,2		# see if it carried/borrowed
+	neg	r0,r0
+	andi.	r0,r0,5
+
+	addc	$h0,$h0,r0
+	lwz	r0,0($nonce)
+	addze	$h1,$h1
+	lwz	$t0,4($nonce)
+	addze	$h2,$h2
+	lwz	$t1,8($nonce)
+	addze	$h3,$h3
+	lwz	$h4,12($nonce)
+
+	addc	$h0,$h0,r0	# accumulate nonce
+	adde	$h1,$h1,$t0
+	adde	$h2,$h2,$t1
+	adde	$h3,$h3,$h4
+
+	addi	$ctx,$mac,-1
+	addi	$mac,$mac,7
+
+	stbu	$h0,1($ctx)	# write [little-endian] result
+	srwi	$h0,$h0,8
+	stbu	$h2,1($mac)
+	srwi	$h2,$h2,8
+
+	stbu	$h0,1($ctx)
+	srwi	$h0,$h0,8
+	stbu	$h2,1($mac)
+	srwi	$h2,$h2,8
+
+	stbu	$h0,1($ctx)
+	srwi	$h0,$h0,8
+	stbu	$h2,1($mac)
+	srwi	$h2,$h2,8
+
+	stbu	$h0,1($ctx)
+	stbu	$h2,1($mac)
+
+	stbu	$h1,1($ctx)
+	srwi	$h1,$h1,8
+	stbu	$h3,1($mac)
+	srwi	$h3,$h3,8
+
+	stbu	$h1,1($ctx)
+	srwi	$h1,$h1,8
+	stbu	$h3,1($mac)
+	srwi	$h3,$h3,8
+
+	stbu	$h1,1($ctx)
+	srwi	$h1,$h1,8
+	stbu	$h3,1($mac)
+	srwi	$h3,$h3,8
+
+	stbu	$h1,1($ctx)
+	stbu	$h3,1($mac)
+
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,3,0
+.size	.poly1305_emit_int,.-.poly1305_emit_int
+___
+}							}
+{{{
+########################################################################
+# PowerISA 2.07/VSX section                                            #
+########################################################################
+
+my $LOCALS= 6*$SIZE_T;
+my $VSXFRAME = $LOCALS + 6*$SIZE_T;
+   $VSXFRAME += 128;	# local variables
+   $VSXFRAME += 13*16;	# v20-v31 offload
+
+my $BIG_ENDIAN = ($flavour !~ /le/) ? 4 : 0;
+
+########################################################################
+# Layout of opaque area is following:
+#
+#	unsigned __int32 h[5];		# current hash value base 2^26
+#	unsigned __int32 pad;
+#	unsigned __int32 is_base2_26, pad;
+#	unsigned __int64 r[2];		# key value base 2^64
+#	struct { unsigned __int32 r^2, r^4, r^1, r^3; } r[9];
+#
+# where r^n are base 2^26 digits of powers of multiplier key. There are
+# 5 digits, but last four are interleaved with multiples of 5, totalling
+# in 9 elements: r0, r1, 5*r1, r2, 5*r2, r3, 5*r3, r4, 5*r4. Order of
+# powers is as they appear in register, not memory.
+
+my ($H0, $H1, $H2, $H3, $H4) = map("v$_",(0..4));
+my ($I0, $I1, $I2, $I3, $I4) = map("v$_",(5..9));
+my ($R0, $R1, $S1, $R2, $S2) = map("v$_",(10..14));
+my      ($R3, $S3, $R4, $S4) = ($R1, $S1, $R2, $S2);
+my ($ACC0, $ACC1, $ACC2, $ACC3, $ACC4) = map("v$_",(15..19));
+my ($T0, $T1, $T2, $T3, $T4) = map("v$_",(20..24));
+my ($_26,$_4,$_40,$_14,$mask26,$padbits,$I2perm) = map("v$_",(25..31));
+my ($x00,$x60,$x70,$x10,$x20,$x30,$x40,$x50) = (0, map("r$_",(7,8,27..31)));
+my ($ctx_,$_ctx,$const) = map("r$_",(10..12));
+
+							if ($flavour =~ /64/) {
+###############################################################################
+# setup phase of poly1305_blocks_vsx is different on 32- and 64-bit platforms,
+# but the base 2^26 computational part is same...
+
+my ($h0,$h1,$h2,$d0,$d1,$d2, $r0,$r1,$s1, $t0,$t1) = map("r$_",(6..11,27..31));
+my $mask = "r0";
+
+$code.=<<___;
+.globl	.poly1305_blocks_vsx
+.align	5
+.poly1305_blocks_vsx:
+	lwz	r7,24($ctx)		# is_base2_26
+	cmpldi	$len,128
+	bge	__poly1305_blocks_vsx
+
+	neg	r0,r7			# is_base2_26 as mask
+	lwz	r7,0($ctx)		# load hash base 2^26
+	lwz	r8,4($ctx)
+	lwz	r9,8($ctx)
+	lwz	r10,12($ctx)
+	lwz	r11,16($ctx)
+
+	sldi	r8,r8,26		# base 2^26 -> base 2^64
+	sldi	r12,r9,52
+	add	r7,r7,r8
+	srdi	r9,r9,12
+	sldi	r10,r10,14
+	addc	r7,r7,r12
+	sldi	r8,r11,40
+	adde	r9,r9,r10
+	srdi	r11,r11,24
+	addc	r9,r9,r8
+	addze	r11,r11
+
+	ld	r8,0($ctx)		# load hash base 2^64
+	ld	r10,8($ctx)
+	ld	r12,16($ctx)
+
+	xor	r7,r7,r8		# select between radixes
+	xor	r9,r9,r10
+	xor	r11,r11,r12
+	and	r7,r7,r0
+	and	r9,r9,r0
+	and	r11,r11,r0
+	xor	r7,r7,r8
+	xor	r9,r9,r10
+	xor	r11,r11,r12
+
+	li	r0,0
+	std	r7,0($ctx)		# store hash base 2^64
+	std	r9,8($ctx)
+	std	r11,16($ctx)
+	stw	r0,24($ctx)		# clear is_base2_26
+
+	b	Lpoly1305_blocks
+	.long	0
+	.byte	0,12,0x14,0,0,0,4,0
+.size	.poly1305_blocks_vsx,.-.poly1305_blocks_vsx
+
+.align	5
+__poly1305_mul:
+	mulld	$d0,$h0,$r0		# h0*r0
+	mulhdu	$d1,$h0,$r0
+
+	mulld	$t0,$h1,$s1		# h1*5*r1
+	mulhdu	$t1,$h1,$s1
+	addc	$d0,$d0,$t0
+	adde	$d1,$d1,$t1
+
+	mulld	$t0,$h0,$r1		# h0*r1
+	mulhdu	$d2,$h0,$r1
+	addc	$d1,$d1,$t0
+	addze	$d2,$d2
+
+	mulld	$t0,$h1,$r0		# h1*r0
+	mulhdu	$t1,$h1,$r0
+	addc	$d1,$d1,$t0
+	adde	$d2,$d2,$t1
+
+	mulld	$t0,$h2,$s1		# h2*5*r1
+	mulld	$t1,$h2,$r0		# h2*r0
+	addc	$d1,$d1,$t0
+	adde	$d2,$d2,$t1
+
+	andc	$t0,$d2,$mask		# final reduction step
+	and	$h2,$d2,$mask
+	srdi	$t1,$t0,2
+	add	$t0,$t0,$t1
+	addc	$h0,$d0,$t0
+	addze	$h1,$d1
+	addze	$h2,$h2
+
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,0,0
+.size	__poly1305_mul,.-__poly1305_mul
+
+.align	5
+__poly1305_splat:
+	extrdi	$d0,$h0,26,38
+	extrdi	$d1,$h0,26,12
+	stw	$d0,0x00($t1)
+
+	extrdi	$d2,$h0,12,0
+	slwi	$d0,$d1,2
+	stw	$d1,0x10($t1)
+	add	$d0,$d0,$d1		# * 5
+	stw	$d0,0x20($t1)
+
+	insrdi	$d2,$h1,14,38
+	slwi	$d0,$d2,2
+	stw	$d2,0x30($t1)
+	add	$d0,$d0,$d2		# * 5
+	stw	$d0,0x40($t1)
+
+	extrdi	$d1,$h1,26,24
+	extrdi	$d2,$h1,24,0
+	slwi	$d0,$d1,2
+	stw	$d1,0x50($t1)
+	add	$d0,$d0,$d1		# * 5
+	stw	$d0,0x60($t1)
+
+	insrdi	$d2,$h2,3,37
+	slwi	$d0,$d2,2
+	stw	$d2,0x70($t1)
+	add	$d0,$d0,$d2		# * 5
+	stw	$d0,0x80($t1)
+
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,0,0
+.size	__poly1305_splat,.-__poly1305_splat
+
+.align	5
+__poly1305_blocks_vsx:
+	$STU	$sp,-$VSXFRAME($sp)
+	mflr	r0
+	li	r10,`15+$LOCALS+128`
+	li	r11,`31+$LOCALS+128`
+	mfspr	r12,256
+	stvx	v20,r10,$sp
+	addi	r10,r10,32
+	stvx	v21,r11,$sp
+	addi	r11,r11,32
+	stvx	v22,r10,$sp
+	addi	r10,r10,32
+	stvx	v23,r10,$sp
+	addi	r10,r10,32
+	stvx	v24,r11,$sp
+	addi	r11,r11,32
+	stvx	v25,r10,$sp
+	addi	r10,r10,32
+	stvx	v26,r10,$sp
+	addi	r10,r10,32
+	stvx	v27,r11,$sp
+	addi	r11,r11,32
+	stvx	v28,r10,$sp
+	addi	r10,r10,32
+	stvx	v29,r11,$sp
+	addi	r11,r11,32
+	stvx	v30,r10,$sp
+	stvx	v31,r11,$sp
+	stw	r12,`$VSXFRAME-$SIZE_T*5-4`($sp)# save vrsave
+	li	r12,-1
+	mtspr	256,r12			# preserve all AltiVec registers
+	$PUSH	r27,`$VSXFRAME-$SIZE_T*5`($sp)
+	$PUSH	r28,`$VSXFRAME-$SIZE_T*4`($sp)
+	$PUSH	r29,`$VSXFRAME-$SIZE_T*3`($sp)
+	$PUSH	r30,`$VSXFRAME-$SIZE_T*2`($sp)
+	$PUSH	r31,`$VSXFRAME-$SIZE_T*1`($sp)
+	$PUSH	r0,`$VSXFRAME+$LRSAVE`($sp)
+
+	bl	LPICmeup
+
+	li	$x10,0x10
+	li	$x20,0x20
+	li	$x30,0x30
+	li	$x40,0x40
+	li	$x50,0x50
+	lvx_u	$mask26,$x00,$const
+	lvx_u	$_26,$x10,$const
+	lvx_u	$_40,$x20,$const
+	lvx_u	$I2perm,$x30,$const
+	lvx_u	$padbits,$x40,$const
+
+	cmplwi	r7,0			# is_base2_26?
+	bne	Lskip_init_vsx
+
+	ld	$r0,32($ctx)		# load key base 2^64
+	ld	$r1,40($ctx)
+	srdi	$s1,$r1,2
+	li	$mask,3
+	add	$s1,$s1,$r1		# s1 = r1 + r1>>2
+
+	mr	$h0,$r0			# "calculate" r^1
+	mr	$h1,$r1
+	li	$h2,0
+	addi	$t1,$ctx,`48+(12^$BIG_ENDIAN)`
+	bl	__poly1305_splat
+
+	bl	__poly1305_mul		# caclulate r^2
+	addi	$t1,$ctx,`48+(4^$BIG_ENDIAN)`
+	bl	__poly1305_splat
+
+	bl	__poly1305_mul		# caclulate r^3
+	addi	$t1,$ctx,`48+(8^$BIG_ENDIAN)`
+	bl	__poly1305_splat
+
+	bl	__poly1305_mul		# caclulate r^4
+	addi	$t1,$ctx,`48+(0^$BIG_ENDIAN)`
+	bl	__poly1305_splat
+
+	ld	$h0,0($ctx)		# load hash
+	ld	$h1,8($ctx)
+	ld	$h2,16($ctx)
+
+	extrdi	$d0,$h0,26,38		# base 2^64 -> base 2^26
+	extrdi	$d1,$h0,26,12
+	extrdi	$d2,$h0,12,0
+	mtvrwz	$H0,$d0
+	insrdi	$d2,$h1,14,38
+	mtvrwz	$H1,$d1
+	extrdi	$d1,$h1,26,24
+	mtvrwz	$H2,$d2
+	extrdi	$d2,$h1,24,0
+	mtvrwz	$H3,$d1
+	insrdi	$d2,$h2,3,37
+	mtvrwz	$H4,$d2
+___
+							} else {
+###############################################################################
+# 32-bit initialization
+
+my ($h0,$h1,$h2,$h3,$h4,$t0,$t1) = map("r$_",(7..11,0,12));
+my ($R3,$S3,$R4,$S4)=($I1,$I2,$I3,$I4);
+
+$code.=<<___;
+.globl	.poly1305_blocks_vsx
+.align	5
+.poly1305_blocks_vsx:
+	lwz	r7,24($ctx)		# is_base2_26
+	cmplwi	$len,128
+	bge	__poly1305_blocks_vsx
+	cmplwi	r7,0
+	beq	Lpoly1305_blocks
+
+	lwz	$h0,0($ctx)		# load hash
+	lwz	$h1,4($ctx)
+	lwz	$h2,8($ctx)
+	lwz	$h3,12($ctx)
+	lwz	$h4,16($ctx)
+
+	slwi	$t0,$h1,26		# base 2^26 -> base 2^32
+	srwi	$h1,$h1,6
+	slwi	$t1,$h2,20
+	srwi	$h2,$h2,12
+	addc	$h0,$h0,$t0
+	slwi	$t0,$h3,14
+	srwi	$h3,$h3,18
+	adde	$h1,$h1,$t1
+	slwi	$t1,$h4,8
+	srwi	$h4,$h4,24
+	adde	$h2,$h2,$t0
+	li	$t0,0
+	adde	$h3,$h3,$t1
+	addze	$h4,$h4
+
+	stw	$h0,0($ctx)		# store hash base 2^32
+	stw	$h1,4($ctx)
+	stw	$h2,8($ctx)
+	stw	$h3,12($ctx)
+	stw	$h4,16($ctx)
+	stw	$t0,24($ctx)		# clear is_base2_26
+
+	b	Lpoly1305_blocks
+	.long	0
+	.byte	0,12,0x14,0,0,0,4,0
+.size	.poly1305_blocks_vsx,.-.poly1305_blocks_vsx
+
+.align	5
+__poly1305_mul:
+	vmulouw		$ACC0,$H0,$R0
+	vmulouw		$ACC1,$H1,$R0
+	vmulouw		$ACC2,$H2,$R0
+	vmulouw		$ACC3,$H3,$R0
+	vmulouw		$ACC4,$H4,$R0
+
+	vmulouw		$T0,$H4,$S1
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H0,$R1
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H1,$R1
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H2,$R1
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H3,$R1
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmulouw		$T0,$H3,$S2
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H4,$S2
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H0,$R2
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H1,$R2
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H2,$R2
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmulouw		$T0,$H2,$S3
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H3,$S3
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H4,$S3
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H0,$R3
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H1,$R3
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmulouw		$T0,$H1,$S4
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H2,$S4
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H3,$S4
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H4,$S4
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H0,$R4
+	vaddudm		$ACC4,$ACC4,$T0
+
+	################################################################
+	# lazy reduction
+
+	vspltisb	$T0,2
+	vsrd		$H4,$ACC3,$_26
+	vsrd		$H1,$ACC0,$_26
+	vand		$H3,$ACC3,$mask26
+	vand		$H0,$ACC0,$mask26
+	vaddudm		$H4,$H4,$ACC4		# h3 -> h4
+	vaddudm		$H1,$H1,$ACC1		# h0 -> h1
+
+	vsrd		$ACC4,$H4,$_26
+	vsrd		$ACC1,$H1,$_26
+	vand		$H4,$H4,$mask26
+	vand		$H1,$H1,$mask26
+	vaddudm		$H0,$H0,$ACC4
+	vaddudm		$H2,$ACC2,$ACC1		# h1 -> h2
+
+	vsld		$ACC4,$ACC4,$T0		# <<2
+	vsrd		$ACC2,$H2,$_26
+	vand		$H2,$H2,$mask26
+	vaddudm		$H0,$H0,$ACC4		# h4 -> h0
+	vaddudm		$H3,$H3,$ACC2		# h2 -> h3
+
+	vsrd		$ACC0,$H0,$_26
+	vsrd		$ACC3,$H3,$_26
+	vand		$H0,$H0,$mask26
+	vand		$H3,$H3,$mask26
+	vaddudm		$H1,$H1,$ACC0		# h0 -> h1
+	vaddudm		$H4,$H4,$ACC3		# h3 -> h4
+
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,0,0
+.size	__poly1305_mul,.-__poly1305_mul
+
+.align	5
+__poly1305_blocks_vsx:
+	$STU	$sp,-$VSXFRAME($sp)
+	mflr	r0
+	li	r10,`15+$LOCALS+128`
+	li	r11,`31+$LOCALS+128`
+	mfspr	r12,256
+	stvx	v20,r10,$sp
+	addi	r10,r10,32
+	stvx	v21,r11,$sp
+	addi	r11,r11,32
+	stvx	v22,r10,$sp
+	addi	r10,r10,32
+	stvx	v23,r10,$sp
+	addi	r10,r10,32
+	stvx	v24,r11,$sp
+	addi	r11,r11,32
+	stvx	v25,r10,$sp
+	addi	r10,r10,32
+	stvx	v26,r10,$sp
+	addi	r10,r10,32
+	stvx	v27,r11,$sp
+	addi	r11,r11,32
+	stvx	v28,r10,$sp
+	addi	r10,r10,32
+	stvx	v29,r11,$sp
+	addi	r11,r11,32
+	stvx	v30,r10,$sp
+	stvx	v31,r11,$sp
+	stw	r12,`$VSXFRAME-$SIZE_T*5-4`($sp)# save vrsave
+	li	r12,-1
+	mtspr	256,r12			# preserve all AltiVec registers
+	$PUSH	r27,`$VSXFRAME-$SIZE_T*5`($sp)
+	$PUSH	r28,`$VSXFRAME-$SIZE_T*4`($sp)
+	$PUSH	r29,`$VSXFRAME-$SIZE_T*3`($sp)
+	$PUSH	r30,`$VSXFRAME-$SIZE_T*2`($sp)
+	$PUSH	r31,`$VSXFRAME-$SIZE_T*1`($sp)
+	$PUSH	r0,`$VSXFRAME+$LRSAVE`($sp)
+
+	bl	LPICmeup
+
+	li	$x10,0x10
+	li	$x20,0x20
+	li	$x30,0x30
+	li	$x40,0x40
+	li	$x50,0x50
+	lvx_u	$mask26,$x00,$const
+	lvx_u	$_26,$x10,$const
+	lvx_u	$_40,$x20,$const
+	lvx_u	$I2perm,$x30,$const
+	lvx_u	$padbits,$x40,$const
+
+	cmplwi	r7,0			# is_base2_26?
+	bne	Lskip_init_vsx
+
+	lwz	$h1,32($ctx)		# load key base 2^32
+	lwz	$h2,36($ctx)
+	lwz	$h3,40($ctx)
+	lwz	$h4,44($ctx)
+
+	extrwi	$h0,$h1,26,6		# base 2^32 -> base 2^26
+	extrwi	$h1,$h1,6,0
+	insrwi	$h1,$h2,20,6
+	extrwi	$h2,$h2,12,0
+	insrwi	$h2,$h3,14,6
+	extrwi	$h3,$h3,18,0
+	insrwi	$h3,$h4,8,6
+	extrwi	$h4,$h4,24,0
+
+	mtvrwz	$R0,$h0
+	slwi	$h0,$h1,2
+	mtvrwz	$R1,$h1
+	add	$h1,$h1,$h0
+	mtvrwz	$S1,$h1
+	slwi	$h1,$h2,2
+	mtvrwz	$R2,$h2
+	add	$h2,$h2,$h1
+	mtvrwz	$S2,$h2
+	slwi	$h2,$h3,2
+	mtvrwz	$R3,$h3
+	add	$h3,$h3,$h2
+	mtvrwz	$S3,$h3
+	slwi	$h3,$h4,2
+	mtvrwz	$R4,$h4
+	add	$h4,$h4,$h3
+	mtvrwz	$S4,$h4
+
+	vmr	$H0,$R0
+	vmr	$H1,$R1
+	vmr	$H2,$R2
+	vmr	$H3,$R3
+	vmr	$H4,$R4
+
+	bl	__poly1305_mul		# r^1:- * r^1:-
+
+	vpermdi	$R0,$H0,$R0,0b00
+	vpermdi	$R1,$H1,$R1,0b00
+	vpermdi	$R2,$H2,$R2,0b00
+	vpermdi	$R3,$H3,$R3,0b00
+	vpermdi	$R4,$H4,$R4,0b00
+	vpermdi	$H0,$H0,$H0,0b00
+	vpermdi	$H1,$H1,$H1,0b00
+	vpermdi	$H2,$H2,$H2,0b00
+	vpermdi	$H3,$H3,$H3,0b00
+	vpermdi	$H4,$H4,$H4,0b00
+	vsld	$S1,$R1,$T0		# <<2
+	vsld	$S2,$R2,$T0
+	vsld	$S3,$R3,$T0
+	vsld	$S4,$R4,$T0
+	vaddudm	$S1,$S1,$R1
+	vaddudm	$S2,$S2,$R2
+	vaddudm	$S3,$S3,$R3
+	vaddudm	$S4,$S4,$R4
+
+	bl	__poly1305_mul		# r^2:r^2 * r^2:r^1
+
+	addi	$h0,$ctx,0x60
+	lwz	$h1,0($ctx)		# load hash
+	lwz	$h2,4($ctx)
+	lwz	$h3,8($ctx)
+	lwz	$h4,12($ctx)
+	lwz	$t0,16($ctx)
+
+	vmrgow	$R0,$R0,$H0		# r^2:r^4:r^1:r^3
+	vmrgow	$R1,$R1,$H1
+	vmrgow	$R2,$R2,$H2
+	vmrgow	$R3,$R3,$H3
+	vmrgow	$R4,$R4,$H4
+	vslw	$S1,$R1,$T0		# <<2
+	vslw	$S2,$R2,$T0
+	vslw	$S3,$R3,$T0
+	vslw	$S4,$R4,$T0
+	vadduwm	$S1,$S1,$R1
+	vadduwm	$S2,$S2,$R2
+	vadduwm	$S3,$S3,$R3
+	vadduwm	$S4,$S4,$R4
+
+	stvx_u	$R0,$x30,$ctx
+	stvx_u	$R1,$x40,$ctx
+	stvx_u	$S1,$x50,$ctx
+	stvx_u	$R2,$x00,$h0
+	stvx_u	$S2,$x10,$h0
+	stvx_u	$R3,$x20,$h0
+	stvx_u	$S3,$x30,$h0
+	stvx_u	$R4,$x40,$h0
+	stvx_u	$S4,$x50,$h0
+
+	extrwi	$h0,$h1,26,6		# base 2^32 -> base 2^26
+	extrwi	$h1,$h1,6,0
+	mtvrwz	$H0,$h0
+	insrwi	$h1,$h2,20,6
+	extrwi	$h2,$h2,12,0
+	mtvrwz	$H1,$h1
+	insrwi	$h2,$h3,14,6
+	extrwi	$h3,$h3,18,0
+	mtvrwz	$H2,$h2
+	insrwi	$h3,$h4,8,6
+	extrwi	$h4,$h4,24,0
+	mtvrwz	$H3,$h3
+	insrwi	$h4,$t0,3,5
+	mtvrwz	$H4,$h4
+___
+							}
+$code.=<<___;
+	li	r0,1
+	stw	r0,24($ctx)		# set is_base2_26
+	b	Loaded_vsx
+
+.align	4
+Lskip_init_vsx:
+	li		$x10,4
+	li		$x20,8
+	li		$x30,12
+	li		$x40,16
+	lvwzx_u		$H0,$x00,$ctx
+	lvwzx_u		$H1,$x10,$ctx
+	lvwzx_u		$H2,$x20,$ctx
+	lvwzx_u		$H3,$x30,$ctx
+	lvwzx_u		$H4,$x40,$ctx
+
+Loaded_vsx:
+	li		$x10,0x10
+	li		$x20,0x20
+	li		$x30,0x30
+	li		$x40,0x40
+	li		$x50,0x50
+	li		$x60,0x60
+	li		$x70,0x70
+	addi		$ctx_,$ctx,64		# &ctx->r[1]
+	addi		$_ctx,$sp,`$LOCALS+15`	# &ctx->r[1], r^2:r^4 shadow
+
+	vxor		$T0,$T0,$T0		# ensure second half is zero
+	vpermdi		$H0,$H0,$T0,0b00
+	vpermdi		$H1,$H1,$T0,0b00
+	vpermdi		$H2,$H2,$T0,0b00
+	vpermdi		$H3,$H3,$T0,0b00
+	vpermdi		$H4,$H4,$T0,0b00
+
+	be?lvx_u	$_4,$x50,$const		# byte swap mask
+	lvx_u		$T1,$x00,$inp		# load first input block
+	lvx_u		$T2,$x10,$inp
+	lvx_u		$T3,$x20,$inp
+	lvx_u		$T4,$x30,$inp
+	be?vperm	$T1,$T1,$T1,$_4
+	be?vperm	$T2,$T2,$T2,$_4
+	be?vperm	$T3,$T3,$T3,$_4
+	be?vperm	$T4,$T4,$T4,$_4
+
+	vpermdi		$I0,$T1,$T2,0b00	# smash input to base 2^26
+	vspltisb	$_4,4
+	vperm		$I2,$T1,$T2,$I2perm	# 0x...0e0f0001...1e1f1011
+	vspltisb	$_14,14
+	vpermdi		$I3,$T1,$T2,0b11
+
+	vsrd		$I1,$I0,$_26
+	vsrd		$I2,$I2,$_4
+	vsrd		$I4,$I3,$_40
+	vsrd		$I3,$I3,$_14
+	vand		$I0,$I0,$mask26
+	vand		$I1,$I1,$mask26
+	vand		$I2,$I2,$mask26
+	vand		$I3,$I3,$mask26
+
+	vpermdi		$T1,$T3,$T4,0b00
+	vperm		$T2,$T3,$T4,$I2perm	# 0x...0e0f0001...1e1f1011
+	vpermdi		$T3,$T3,$T4,0b11
+
+	vsrd		$T0,$T1,$_26
+	vsrd		$T2,$T2,$_4
+	vsrd		$T4,$T3,$_40
+	vsrd		$T3,$T3,$_14
+	vand		$T1,$T1,$mask26
+	vand		$T0,$T0,$mask26
+	vand		$T2,$T2,$mask26
+	vand		$T3,$T3,$mask26
+
+	# inp[2]:inp[0]:inp[3]:inp[1]
+	vmrgow		$I4,$T4,$I4
+	vmrgow		$I0,$T1,$I0
+	vmrgow		$I1,$T0,$I1
+	vmrgow		$I2,$T2,$I2
+	vmrgow		$I3,$T3,$I3
+	vor		$I4,$I4,$padbits
+
+	lvx_splt	$R0,$x30,$ctx		# taking lvx_vsplt out of loop
+	lvx_splt	$R1,$x00,$ctx_		# gives ~8% improvement
+	lvx_splt	$S1,$x10,$ctx_
+	lvx_splt	$R2,$x20,$ctx_
+	lvx_splt	$S2,$x30,$ctx_
+	lvx_splt	$T1,$x40,$ctx_
+	lvx_splt	$T2,$x50,$ctx_
+	lvx_splt	$T3,$x60,$ctx_
+	lvx_splt	$T4,$x70,$ctx_
+	stvx		$R1,$x00,$_ctx
+	stvx		$S1,$x10,$_ctx
+	stvx		$R2,$x20,$_ctx
+	stvx		$S2,$x30,$_ctx
+	stvx		$T1,$x40,$_ctx
+	stvx		$T2,$x50,$_ctx
+	stvx		$T3,$x60,$_ctx
+	stvx		$T4,$x70,$_ctx
+
+	addi		$inp,$inp,0x40
+	addi		$const,$const,0x50
+	addi		r0,$len,-64
+	srdi		r0,r0,6
+	mtctr		r0
+	b		Loop_vsx
+
+.align	4
+Loop_vsx:
+	################################################################
+	## ((inp[0]*r^4+inp[2]*r^2+inp[4])*r^4+inp[6]*r^2
+	## ((inp[1]*r^4+inp[3]*r^2+inp[5])*r^3+inp[7]*r
+	##   \___________________/
+	##
+	## Note that we start with inp[2:3]*r^2. This is because it
+	## doesn't depend on reduction in previous iteration.
+	################################################################
+	## d4 = h4*r0 + h3*r1   + h2*r2   + h1*r3   + h0*r4
+	## d3 = h3*r0 + h2*r1   + h1*r2   + h0*r3   + h4*5*r4
+	## d2 = h2*r0 + h1*r1   + h0*r2   + h4*5*r3 + h3*5*r4
+	## d1 = h1*r0 + h0*r1   + h4*5*r2 + h3*5*r3 + h2*5*r4
+	## d0 = h0*r0 + h4*5*r1 + h3*5*r2 + h2*5*r3 + h1*5*r4
+
+	vmuleuw		$ACC0,$I0,$R0
+	vmuleuw		$ACC1,$I0,$R1
+	vmuleuw		$ACC2,$I0,$R2
+	vmuleuw		$ACC3,$I1,$R2
+
+	vmuleuw		$T0,$I1,$R0
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I1,$R1
+	vaddudm		$ACC2,$ACC2,$T0
+	 vmuleuw	$ACC4,$I2,$R2
+	vmuleuw		$T0,$I4,$S1
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I2,$R1
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx		$S3,$x50,$_ctx
+	vmuleuw		$T0,$I3,$R1
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx		$R3,$x40,$_ctx
+
+	 vaddudm	$H2,$H2,$I2
+	 vaddudm	$H0,$H0,$I0
+	 vaddudm	$H3,$H3,$I3
+	 vaddudm	$H1,$H1,$I1
+	 vaddudm	$H4,$H4,$I4
+
+	vmuleuw		$T0,$I3,$S2
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I4,$S2
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I2,$R0
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I3,$R0
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx		$S4,$x70,$_ctx
+	vmuleuw		$T0,$I4,$R0
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx		$R4,$x60,$_ctx
+
+	vmuleuw		$T0,$I2,$S3
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I3,$S3
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I4,$S3
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I0,$R3
+	vaddudm		$ACC3,$ACC3,$T0
+	vmuleuw		$T0,$I1,$R3
+	vaddudm		$ACC4,$ACC4,$T0
+
+	 be?lvx_u	$_4,$x00,$const		# byte swap mask
+	 lvx_u		$T1,$x00,$inp		# load next input block
+	 lvx_u		$T2,$x10,$inp
+	 lvx_u		$T3,$x20,$inp
+	 lvx_u		$T4,$x30,$inp
+	 be?vperm	$T1,$T1,$T1,$_4
+	 be?vperm	$T2,$T2,$T2,$_4
+	 be?vperm	$T3,$T3,$T3,$_4
+	 be?vperm	$T4,$T4,$T4,$_4
+
+	vmuleuw		$T0,$I1,$S4
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I2,$S4
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I3,$S4
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I4,$S4
+	vaddudm		$ACC3,$ACC3,$T0
+	vmuleuw		$T0,$I0,$R4
+	vaddudm		$ACC4,$ACC4,$T0
+
+	 vpermdi	$I0,$T1,$T2,0b00	# smash input to base 2^26
+	 vspltisb	$_4,4
+	 vperm		$I2,$T1,$T2,$I2perm	# 0x...0e0f0001...1e1f1011
+	 vpermdi	$I3,$T1,$T2,0b11
+
+	# (hash + inp[0:1]) * r^4
+	vmulouw		$T0,$H0,$R0
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H1,$R0
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H2,$R0
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H3,$R0
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H4,$R0
+	vaddudm		$ACC4,$ACC4,$T0
+
+	 vpermdi	$T1,$T3,$T4,0b00
+	 vperm		$T2,$T3,$T4,$I2perm	# 0x...0e0f0001...1e1f1011
+	 vpermdi	$T3,$T3,$T4,0b11
+
+	vmulouw		$T0,$H2,$S3
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H3,$S3
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H4,$S3
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H0,$R3
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx		$S1,$x10,$_ctx
+	vmulouw		$T0,$H1,$R3
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx		$R1,$x00,$_ctx
+
+	 vsrd		$I1,$I0,$_26
+	 vsrd		$I2,$I2,$_4
+	 vsrd		$I4,$I3,$_40
+	 vsrd		$I3,$I3,$_14
+
+	vmulouw		$T0,$H1,$S4
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H2,$S4
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H3,$S4
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H4,$S4
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx		$S2,$x30,$_ctx
+	vmulouw		$T0,$H0,$R4
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx		$R2,$x20,$_ctx
+
+	 vand		$I0,$I0,$mask26
+	 vand		$I1,$I1,$mask26
+	 vand		$I2,$I2,$mask26
+	 vand		$I3,$I3,$mask26
+
+	vmulouw		$T0,$H4,$S1
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H0,$R1
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H1,$R1
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H2,$R1
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H3,$R1
+	vaddudm		$ACC4,$ACC4,$T0
+
+	 vsrd		$T2,$T2,$_4
+	 vsrd		$_4,$T1,$_26
+	 vsrd		$T4,$T3,$_40
+	 vsrd		$T3,$T3,$_14
+
+	vmulouw		$T0,$H3,$S2
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H4,$S2
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H0,$R2
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H1,$R2
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H2,$R2
+	vaddudm		$ACC4,$ACC4,$T0
+
+	 vand		$T1,$T1,$mask26
+	 vand		$_4,$_4,$mask26
+	 vand		$T2,$T2,$mask26
+	 vand		$T3,$T3,$mask26
+
+	################################################################
+	# lazy reduction as discussed in "NEON crypto" by D.J. Bernstein
+	# and P. Schwabe
+
+	vspltisb	$T0,2
+	vsrd		$H4,$ACC3,$_26
+	vsrd		$H1,$ACC0,$_26
+	vand		$H3,$ACC3,$mask26
+	vand		$H0,$ACC0,$mask26
+	vaddudm		$H4,$H4,$ACC4		# h3 -> h4
+	vaddudm		$H1,$H1,$ACC1		# h0 -> h1
+
+	 vmrgow		$I4,$T4,$I4
+	 vmrgow		$I0,$T1,$I0
+	 vmrgow		$I1,$_4,$I1
+	 vmrgow		$I2,$T2,$I2
+	 vmrgow		$I3,$T3,$I3
+	 vor		$I4,$I4,$padbits
+
+	vsrd		$ACC4,$H4,$_26
+	vsrd		$ACC1,$H1,$_26
+	vand		$H4,$H4,$mask26
+	vand		$H1,$H1,$mask26
+	vaddudm		$H0,$H0,$ACC4
+	vaddudm		$H2,$ACC2,$ACC1		# h1 -> h2
+
+	vsld		$ACC4,$ACC4,$T0		# <<2
+	vsrd		$ACC2,$H2,$_26
+	vand		$H2,$H2,$mask26
+	vaddudm		$H0,$H0,$ACC4		# h4 -> h0
+	vaddudm		$H3,$H3,$ACC2		# h2 -> h3
+
+	vsrd		$ACC0,$H0,$_26
+	vsrd		$ACC3,$H3,$_26
+	vand		$H0,$H0,$mask26
+	vand		$H3,$H3,$mask26
+	vaddudm		$H1,$H1,$ACC0		# h0 -> h1
+	vaddudm		$H4,$H4,$ACC3		# h3 -> h4
+
+	addi		$inp,$inp,0x40
+	bdnz		Loop_vsx
+
+	neg		$len,$len
+	andi.		$len,$len,0x30
+	sub		$inp,$inp,$len
+
+	lvx_u		$R0,$x30,$ctx		# load all powers
+	lvx_u		$R1,$x00,$ctx_
+	lvx_u		$S1,$x10,$ctx_
+	lvx_u		$R2,$x20,$ctx_
+	lvx_u		$S2,$x30,$ctx_
+
+Last_vsx:
+	vmuleuw		$ACC0,$I0,$R0
+	vmuleuw		$ACC1,$I1,$R0
+	vmuleuw		$ACC2,$I2,$R0
+	vmuleuw		$ACC3,$I3,$R0
+	vmuleuw		$ACC4,$I4,$R0
+
+	vmuleuw		$T0,$I4,$S1
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I0,$R1
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I1,$R1
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I2,$R1
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx_u		$S3,$x50,$ctx_
+	vmuleuw		$T0,$I3,$R1
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx_u		$R3,$x40,$ctx_
+
+	 vaddudm	$H2,$H2,$I2
+	 vaddudm	$H0,$H0,$I0
+	 vaddudm	$H3,$H3,$I3
+	 vaddudm	$H1,$H1,$I1
+	 vaddudm	$H4,$H4,$I4
+
+	vmuleuw		$T0,$I3,$S2
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I4,$S2
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I0,$R2
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I1,$R2
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx_u		$S4,$x70,$ctx_
+	vmuleuw		$T0,$I2,$R2
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx_u		$R4,$x60,$ctx_
+
+	vmuleuw		$T0,$I2,$S3
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I3,$S3
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I4,$S3
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I0,$R3
+	vaddudm		$ACC3,$ACC3,$T0
+	vmuleuw		$T0,$I1,$R3
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmuleuw		$T0,$I1,$S4
+	vaddudm		$ACC0,$ACC0,$T0
+	vmuleuw		$T0,$I2,$S4
+	vaddudm		$ACC1,$ACC1,$T0
+	vmuleuw		$T0,$I3,$S4
+	vaddudm		$ACC2,$ACC2,$T0
+	vmuleuw		$T0,$I4,$S4
+	vaddudm		$ACC3,$ACC3,$T0
+	vmuleuw		$T0,$I0,$R4
+	vaddudm		$ACC4,$ACC4,$T0
+
+	# (hash + inp[0:1]) * r^4
+	vmulouw		$T0,$H0,$R0
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H1,$R0
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H2,$R0
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H3,$R0
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H4,$R0
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmulouw		$T0,$H2,$S3
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H3,$S3
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H4,$S3
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H0,$R3
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx_u		$S1,$x10,$ctx_
+	vmulouw		$T0,$H1,$R3
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx_u		$R1,$x00,$ctx_
+
+	vmulouw		$T0,$H1,$S4
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H2,$S4
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H3,$S4
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H4,$S4
+	vaddudm		$ACC3,$ACC3,$T0
+	lvx_u		$S2,$x30,$ctx_
+	vmulouw		$T0,$H0,$R4
+	vaddudm		$ACC4,$ACC4,$T0
+	lvx_u		$R2,$x20,$ctx_
+
+	vmulouw		$T0,$H4,$S1
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H0,$R1
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H1,$R1
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H2,$R1
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H3,$R1
+	vaddudm		$ACC4,$ACC4,$T0
+
+	vmulouw		$T0,$H3,$S2
+	vaddudm		$ACC0,$ACC0,$T0
+	vmulouw		$T0,$H4,$S2
+	vaddudm		$ACC1,$ACC1,$T0
+	vmulouw		$T0,$H0,$R2
+	vaddudm		$ACC2,$ACC2,$T0
+	vmulouw		$T0,$H1,$R2
+	vaddudm		$ACC3,$ACC3,$T0
+	vmulouw		$T0,$H2,$R2
+	vaddudm		$ACC4,$ACC4,$T0
+
+	################################################################
+	# horizontal addition
+
+	vpermdi		$H0,$ACC0,$ACC0,0b10
+	vpermdi		$H1,$ACC1,$ACC1,0b10
+	vpermdi		$H2,$ACC2,$ACC2,0b10
+	vpermdi		$H3,$ACC3,$ACC3,0b10
+	vpermdi		$H4,$ACC4,$ACC4,0b10
+	vaddudm		$ACC0,$ACC0,$H0
+	vaddudm		$ACC1,$ACC1,$H1
+	vaddudm		$ACC2,$ACC2,$H2
+	vaddudm		$ACC3,$ACC3,$H3
+	vaddudm		$ACC4,$ACC4,$H4
+
+	################################################################
+	# lazy reduction
+
+	vspltisb	$T0,2
+	vsrd		$H4,$ACC3,$_26
+	vsrd		$H1,$ACC0,$_26
+	vand		$H3,$ACC3,$mask26
+	vand		$H0,$ACC0,$mask26
+	vaddudm		$H4,$H4,$ACC4		# h3 -> h4
+	vaddudm		$H1,$H1,$ACC1		# h0 -> h1
+
+	vsrd		$ACC4,$H4,$_26
+	vsrd		$ACC1,$H1,$_26
+	vand		$H4,$H4,$mask26
+	vand		$H1,$H1,$mask26
+	vaddudm		$H0,$H0,$ACC4
+	vaddudm		$H2,$ACC2,$ACC1		# h1 -> h2
+
+	vsld		$ACC4,$ACC4,$T0		# <<2
+	vsrd		$ACC2,$H2,$_26
+	vand		$H2,$H2,$mask26
+	vaddudm		$H0,$H0,$ACC4		# h4 -> h0
+	vaddudm		$H3,$H3,$ACC2		# h2 -> h3
+
+	vsrd		$ACC0,$H0,$_26
+	vsrd		$ACC3,$H3,$_26
+	vand		$H0,$H0,$mask26
+	vand		$H3,$H3,$mask26
+	vaddudm		$H1,$H1,$ACC0		# h0 -> h1
+	vaddudm		$H4,$H4,$ACC3		# h3 -> h4
+
+	beq		Ldone_vsx
+
+	add		r6,$const,$len
+
+	be?lvx_u	$_4,$x00,$const		# byte swap mask
+	lvx_u		$T1,$x00,$inp		# load last partial input block
+	lvx_u		$T2,$x10,$inp
+	lvx_u		$T3,$x20,$inp
+	lvx_u		$T4,$x30,$inp
+	be?vperm	$T1,$T1,$T1,$_4
+	be?vperm	$T2,$T2,$T2,$_4
+	be?vperm	$T3,$T3,$T3,$_4
+	be?vperm	$T4,$T4,$T4,$_4
+
+	vpermdi		$I0,$T1,$T2,0b00	# smash input to base 2^26
+	vspltisb	$_4,4
+	vperm		$I2,$T1,$T2,$I2perm	# 0x...0e0f0001...1e1f1011
+	vpermdi		$I3,$T1,$T2,0b11
+
+	vsrd		$I1,$I0,$_26
+	vsrd		$I2,$I2,$_4
+	vsrd		$I4,$I3,$_40
+	vsrd		$I3,$I3,$_14
+	vand		$I0,$I0,$mask26
+	vand		$I1,$I1,$mask26
+	vand		$I2,$I2,$mask26
+	vand		$I3,$I3,$mask26
+
+	vpermdi		$T0,$T3,$T4,0b00
+	vperm		$T1,$T3,$T4,$I2perm	# 0x...0e0f0001...1e1f1011
+	vpermdi		$T2,$T3,$T4,0b11
+
+	lvx_u		$ACC0,$x00,r6
+	lvx_u		$ACC1,$x30,r6
+
+	vsrd		$T3,$T0,$_26
+	vsrd		$T1,$T1,$_4
+	vsrd		$T4,$T2,$_40
+	vsrd		$T2,$T2,$_14
+	vand		$T0,$T0,$mask26
+	vand		$T3,$T3,$mask26
+	vand		$T1,$T1,$mask26
+	vand		$T2,$T2,$mask26
+
+	# inp[2]:inp[0]:inp[3]:inp[1]
+	vmrgow		$I4,$T4,$I4
+	vmrgow		$I0,$T0,$I0
+	vmrgow		$I1,$T3,$I1
+	vmrgow		$I2,$T1,$I2
+	vmrgow		$I3,$T2,$I3
+	vor		$I4,$I4,$padbits
+
+	vperm		$H0,$H0,$H0,$ACC0	# move hash to right lane
+	vand		$I0,$I0,    $ACC1	# mask redundant input lane[s]
+	vperm		$H1,$H1,$H1,$ACC0
+	vand		$I1,$I1,    $ACC1
+	vperm		$H2,$H2,$H2,$ACC0
+	vand		$I2,$I2,    $ACC1
+	vperm		$H3,$H3,$H3,$ACC0
+	vand		$I3,$I3,    $ACC1
+	vperm		$H4,$H4,$H4,$ACC0
+	vand		$I4,$I4,    $ACC1
+
+	vaddudm		$I0,$I0,$H0		# accumulate hash
+	vxor		$H0,$H0,$H0		# wipe hash value
+	vaddudm		$I1,$I1,$H1
+	vxor		$H1,$H1,$H1
+	vaddudm		$I2,$I2,$H2
+	vxor		$H2,$H2,$H2
+	vaddudm		$I3,$I3,$H3
+	vxor		$H3,$H3,$H3
+	vaddudm		$I4,$I4,$H4
+	vxor		$H4,$H4,$H4
+
+	xor.		$len,$len,$len
+	b		Last_vsx
+
+.align	4
+Ldone_vsx:
+	$POP	r0,`$VSXFRAME+$LRSAVE`($sp)
+	li	$x10,4
+	li	$x20,8
+	li	$x30,12
+	li	$x40,16
+	stvwx_u	$H0,$x00,$ctx			# store hash
+	stvwx_u	$H1,$x10,$ctx
+	stvwx_u	$H2,$x20,$ctx
+	stvwx_u	$H3,$x30,$ctx
+	stvwx_u	$H4,$x40,$ctx
+
+	lwz	r12,`$VSXFRAME-$SIZE_T*5-4`($sp)# pull vrsave
+	mtlr	r0
+	li	r10,`15+$LOCALS+128`
+	li	r11,`31+$LOCALS+128`
+	mtspr	256,r12				# restore vrsave
+	lvx	v20,r10,$sp
+	addi	r10,r10,32
+	lvx	v21,r10,$sp
+	addi	r10,r10,32
+	lvx	v22,r11,$sp
+	addi	r11,r11,32
+	lvx	v23,r10,$sp
+	addi	r10,r10,32
+	lvx	v24,r11,$sp
+	addi	r11,r11,32
+	lvx	v25,r10,$sp
+	addi	r10,r10,32
+	lvx	v26,r11,$sp
+	addi	r11,r11,32
+	lvx	v27,r10,$sp
+	addi	r10,r10,32
+	lvx	v28,r11,$sp
+	addi	r11,r11,32
+	lvx	v29,r10,$sp
+	addi	r10,r10,32
+	lvx	v30,r11,$sp
+	lvx	v31,r10,$sp
+	$POP	r27,`$VSXFRAME-$SIZE_T*5`($sp)
+	$POP	r28,`$VSXFRAME-$SIZE_T*4`($sp)
+	$POP	r29,`$VSXFRAME-$SIZE_T*3`($sp)
+	$POP	r30,`$VSXFRAME-$SIZE_T*2`($sp)
+	$POP	r31,`$VSXFRAME-$SIZE_T*1`($sp)
+	addi	$sp,$sp,$VSXFRAME
+	blr
+	.long	0
+	.byte	0,12,0x04,1,0x80,5,4,0
+	.long	0
+.size	__poly1305_blocks_vsx,.-__poly1305_blocks_vsx
+
+.align	6
+LPICmeup:
+	mflr	r0
+	bcl	20,31,\$+4
+	mflr	$const      # vvvvvv "distance" between . and 1st data entry
+	addi	$const,$const,`64-8`
+	mtlr	r0
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,0,0
+	.space	`64-9*4`
+
+.quad	0x0000000003ffffff,0x0000000003ffffff	# mask26
+.quad	0x000000000000001a,0x000000000000001a	# _26
+.quad	0x0000000000000028,0x0000000000000028	# _40
+.quad	0x000000000e0f0001,0x000000001e1f1011	# I2perm
+.quad	0x0100000001000000,0x0100000001000000	# padbits
+.quad	0x0706050403020100,0x0f0e0d0c0b0a0908	# byte swap for big-endian
+
+.quad	0x0000000000000000,0x0000000004050607	# magic tail masks
+.quad	0x0405060700000000,0x0000000000000000
+.quad	0x0000000000000000,0x0405060700000000
+
+.quad	0xffffffff00000000,0xffffffffffffffff
+.quad	0xffffffff00000000,0xffffffff00000000
+.quad	0x0000000000000000,0xffffffff00000000
+___
+}}}
+$code.=<<___;
+.asciz	"Poly1305 for PPC, CRYPTOGAMS by \@dot-asm"
+___
+
+foreach (split("\n",$code)) {
+	s/\`([^\`]*)\`/eval($1)/ge;
+
+	# instructions prefixed with '?' are endian-specific and need
+	# to be adjusted accordingly...
+	if ($flavour !~ /le$/) {	# big-endian
+	    s/be\?//		or
+	    s/le\?/#le#/
+	} else {			# little-endian
+	    s/le\?//		or
+	    s/be\?/#be#/
+	}
+
+	print $_,"\n";
+}
+close STDOUT;
diff --git a/src/crypto/zinc/poly1305/poly1305-ppcfp.pl b/src/crypto/zinc/poly1305/poly1305-ppcfp.pl
new file mode 100755
index 0000000..3eb9b88
--- /dev/null
+++ b/src/crypto/zinc/poly1305/poly1305-ppcfp.pl
@@ -0,0 +1,749 @@
+#! /usr/bin/env perl
+# SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#
+# This code is taken from the OpenSSL project but the author, Andy Polyakov,
+# has relicensed it under the licenses specified in the SPDX header above.
+# The original headers, including the original license headers, are
+# included below for completeness.
+#
+# Changes: look in more places for ppc-xlate.pl
+#
+# Copyright 2016-2018 The OpenSSL Project Authors. All Rights Reserved.
+#
+# Licensed under the Apache License 2.0 (the "License").  You may not use
+# this file except in compliance with the License.  You can obtain a copy
+# in the file LICENSE in the source distribution or at
+# https://www.openssl.org/source/license.html
+
+#
+# ====================================================================
+# Written by Andy Polyakov <appro@openssl.org> for the OpenSSL
+# project. The module is, however, dual licensed under OpenSSL and
+# CRYPTOGAMS licenses depending on where you obtain it. For further
+# details see http://www.openssl.org/~appro/cryptogams/.
+# ====================================================================
+#
+# This module implements Poly1305 hash for PowerPC FPU.
+#
+# June 2015
+#
+# Numbers are cycles per processed byte with poly1305_blocks alone,
+# and improvement coefficients relative to gcc-generated code.
+#
+# Freescale e300	9.78/+30%
+# PPC74x0		6.92/+50%
+# PPC970		6.03/+80%
+# POWER7		3.50/+30%
+# POWER8		3.75/+10%
+
+$flavour = shift;
+
+if ($flavour =~ /64/) {
+	$SIZE_T	=8;
+	$LRSAVE	=2*$SIZE_T;
+	$UCMP	="cmpld";
+	$STU	="stdu";
+	$POP	="ld";
+	$PUSH	="std";
+} elsif ($flavour =~ /32/) {
+	$SIZE_T	=4;
+	$LRSAVE	=$SIZE_T;
+	$UCMP	="cmplw";
+	$STU	="stwu";
+	$POP	="lwz";
+	$PUSH	="stw";
+} else { die "nonsense $flavour"; }
+
+$LITTLE_ENDIAN = ($flavour=~/le$/) ? 4 : 0;
+
+$LWXLE = $LITTLE_ENDIAN ? "lwzx" : "lwbrx";
+
+$0 =~ m/(.*[\/\\])[^\/\\]+$/; $dir=$1;
+( $xlate="${dir}ppc-xlate.pl" and -f $xlate ) or
+( $xlate="${dir}../perlasm/ppc-xlate.pl" and -f $xlate) or
+( $xlate="${dir}../../perlasm/ppc-xlate.pl" and -f $xlate) or
+die "can't locate ppc-xlate.pl";
+
+open STDOUT,"| $^X $xlate $flavour ".shift || die "can't call $xlate: $!";
+
+$LOCALS=6*$SIZE_T;
+$FRAME=$LOCALS+6*8+18*8;
+
+my $sp="r1";
+
+my ($ctx,$inp,$len,$padbit) = map("r$_",(3..6));
+my ($in0,$in1,$in2,$in3,$i1,$i2,$i3) = map("r$_",(7..12,6));
+
+my ($h0lo,$h0hi,$h1lo,$h1hi,$h2lo,$h2hi,$h3lo,$h3hi,
+    $two0,$two32,$two64,$two96,$two130,$five_two130,
+    $r0lo,$r0hi,$r1lo,$r1hi,$r2lo,$r2hi,
+    $s2lo,$s2hi,$s3lo,$s3hi,
+    $c0lo,$c0hi,$c1lo,$c1hi,$c2lo,$c2hi,$c3lo,$c3hi) = map("f$_",(0..31));
+# borrowings
+my ($r3lo,$r3hi,$s1lo,$s1hi) = ($c0lo,$c0hi,$c1lo,$c1hi);
+my ($x0,$x1,$x2,$x3) = ($c2lo,$c2hi,$c3lo,$c3hi);
+my ($y0,$y1,$y2,$y3) = ($c3lo,$c3hi,$c1lo,$c1hi);
+
+$code.=<<___;
+.machine	"any"
+.text
+
+.globl	.poly1305_init_fpu
+.align	6
+.poly1305_init_fpu:
+	$STU	$sp,-$LOCALS($sp)		# minimal frame
+	mflr	$padbit
+	$PUSH	$padbit,`$LOCALS+$LRSAVE`($sp)
+
+	bl	LPICmeup
+
+	xor	r0,r0,r0
+	mtlr	$padbit				# restore lr
+
+	lfd	$two0,8*0($len)			# load constants
+	lfd	$two32,8*1($len)
+	lfd	$two64,8*2($len)
+	lfd	$two96,8*3($len)
+	lfd	$two130,8*4($len)
+	lfd	$five_two130,8*5($len)
+
+	stfd	$two0,8*0($ctx)			# initial hash value, biased 0
+	stfd	$two32,8*1($ctx)
+	stfd	$two64,8*2($ctx)
+	stfd	$two96,8*3($ctx)
+
+	$UCMP	$inp,r0
+	beq-	Lno_key
+
+	lfd	$h3lo,8*13($len)		# new fpscr
+	mffs	$h3hi				# old fpscr
+
+	stfd	$two0,8*4($ctx)			# key "template"
+	stfd	$two32,8*5($ctx)
+	stfd	$two64,8*6($ctx)
+	stfd	$two96,8*7($ctx)
+
+	li	$in1,4
+	li	$in2,8
+	li	$in3,12
+	$LWXLE	$in0,0,$inp			# load key
+	$LWXLE	$in1,$in1,$inp
+	$LWXLE	$in2,$in2,$inp
+	$LWXLE	$in3,$in3,$inp
+
+	lis	$i1,0xf000			#   0xf0000000
+	ori	$i2,$i1,3			#   0xf0000003
+	andc	$in0,$in0,$i1			# &=0x0fffffff
+	andc	$in1,$in1,$i2			# &=0x0ffffffc
+	andc	$in2,$in2,$i2
+	andc	$in3,$in3,$i2
+
+	stw	$in0,`8*4+(4^$LITTLE_ENDIAN)`($ctx)	# fill "template"
+	stw	$in1,`8*5+(4^$LITTLE_ENDIAN)`($ctx)
+	stw	$in2,`8*6+(4^$LITTLE_ENDIAN)`($ctx)
+	stw	$in3,`8*7+(4^$LITTLE_ENDIAN)`($ctx)
+
+	mtfsf	255,$h3lo			# fpscr
+	stfd	$two0,8*18($ctx)		# copy constants to context
+	stfd	$two32,8*19($ctx)
+	stfd	$two64,8*20($ctx)
+	stfd	$two96,8*21($ctx)
+	stfd	$two130,8*22($ctx)
+	stfd	$five_two130,8*23($ctx)
+
+	lfd	$h0lo,8*4($ctx)			# load [biased] key
+	lfd	$h1lo,8*5($ctx)
+	lfd	$h2lo,8*6($ctx)
+	lfd	$h3lo,8*7($ctx)
+
+	fsub	$h0lo,$h0lo,$two0		# r0
+	fsub	$h1lo,$h1lo,$two32		# r1
+	fsub	$h2lo,$h2lo,$two64		# r2
+	fsub	$h3lo,$h3lo,$two96		# r3
+
+	lfd	$two0,8*6($len)			# more constants
+	lfd	$two32,8*7($len)
+	lfd	$two64,8*8($len)
+	lfd	$two96,8*9($len)
+
+	fmul	$h1hi,$h1lo,$five_two130	# s1
+	fmul	$h2hi,$h2lo,$five_two130	# s2
+	 stfd	$h3hi,8*15($ctx)		# borrow slot for original fpscr
+	fmul	$h3hi,$h3lo,$five_two130	# s3
+
+	fadd	$h0hi,$h0lo,$two0
+	 stfd	$h1hi,8*12($ctx)		# put aside for now
+	fadd	$h1hi,$h1lo,$two32
+	 stfd	$h2hi,8*13($ctx)
+	fadd	$h2hi,$h2lo,$two64
+	 stfd	$h3hi,8*14($ctx)
+	fadd	$h3hi,$h3lo,$two96
+
+	fsub	$h0hi,$h0hi,$two0
+	fsub	$h1hi,$h1hi,$two32
+	fsub	$h2hi,$h2hi,$two64
+	fsub	$h3hi,$h3hi,$two96
+
+	lfd	$two0,8*10($len)		# more constants
+	lfd	$two32,8*11($len)
+	lfd	$two64,8*12($len)
+
+	fsub	$h0lo,$h0lo,$h0hi
+	fsub	$h1lo,$h1lo,$h1hi
+	fsub	$h2lo,$h2lo,$h2hi
+	fsub	$h3lo,$h3lo,$h3hi
+
+	stfd	$h0hi,8*5($ctx)			# r0hi
+	stfd	$h1hi,8*7($ctx)			# r1hi
+	stfd	$h2hi,8*9($ctx)			# r2hi
+	stfd	$h3hi,8*11($ctx)		# r3hi
+
+	stfd	$h0lo,8*4($ctx)			# r0lo
+	stfd	$h1lo,8*6($ctx)			# r1lo
+	stfd	$h2lo,8*8($ctx)			# r2lo
+	stfd	$h3lo,8*10($ctx)		# r3lo
+
+	lfd	$h1lo,8*12($ctx)		# s1
+	lfd	$h2lo,8*13($ctx)		# s2
+	lfd	$h3lo,8*14($ctx)		# s3
+	lfd	$h0lo,8*15($ctx)		# pull original fpscr
+
+	fadd	$h1hi,$h1lo,$two0
+	fadd	$h2hi,$h2lo,$two32
+	fadd	$h3hi,$h3lo,$two64
+
+	fsub	$h1hi,$h1hi,$two0
+	fsub	$h2hi,$h2hi,$two32
+	fsub	$h3hi,$h3hi,$two64
+
+	fsub	$h1lo,$h1lo,$h1hi
+	fsub	$h2lo,$h2lo,$h2hi
+	fsub	$h3lo,$h3lo,$h3hi
+
+	stfd	$h1hi,8*13($ctx)		# s1hi
+	stfd	$h2hi,8*15($ctx)		# s2hi
+	stfd	$h3hi,8*17($ctx)		# s3hi
+
+	stfd	$h1lo,8*12($ctx)		# s1lo
+	stfd	$h2lo,8*14($ctx)		# s2lo
+	stfd	$h3lo,8*16($ctx)		# s3lo
+
+	mtfsf	255,$h0lo			# restore fpscr
+Lno_key:
+	xor	r3,r3,r3
+	addi	$sp,$sp,$LOCALS
+	blr
+	.long	0
+	.byte	0,12,4,1,0x80,0,2,0
+.size	.poly1305_init_fpu,.-.poly1305_init_fpu
+
+.globl	.poly1305_blocks_fpu
+.align	4
+.poly1305_blocks_fpu:
+	srwi.	$len,$len,4
+	beq-	Labort
+
+	$STU	$sp,-$FRAME($sp)
+	mflr	r0
+	stfd	f14,`$FRAME-8*18`($sp)
+	stfd	f15,`$FRAME-8*17`($sp)
+	stfd	f16,`$FRAME-8*16`($sp)
+	stfd	f17,`$FRAME-8*15`($sp)
+	stfd	f18,`$FRAME-8*14`($sp)
+	stfd	f19,`$FRAME-8*13`($sp)
+	stfd	f20,`$FRAME-8*12`($sp)
+	stfd	f21,`$FRAME-8*11`($sp)
+	stfd	f22,`$FRAME-8*10`($sp)
+	stfd	f23,`$FRAME-8*9`($sp)
+	stfd	f24,`$FRAME-8*8`($sp)
+	stfd	f25,`$FRAME-8*7`($sp)
+	stfd	f26,`$FRAME-8*6`($sp)
+	stfd	f27,`$FRAME-8*5`($sp)
+	stfd	f28,`$FRAME-8*4`($sp)
+	stfd	f29,`$FRAME-8*3`($sp)
+	stfd	f30,`$FRAME-8*2`($sp)
+	stfd	f31,`$FRAME-8*1`($sp)
+	$PUSH	r0,`$FRAME+$LRSAVE`($sp)
+
+	xor	r0,r0,r0
+	li	$in3,1
+	mtctr	$len
+	neg	$len,$len
+	stw	r0,`$LOCALS+8*4+(0^$LITTLE_ENDIAN)`($sp)
+	stw	$in3,`$LOCALS+8*4+(4^$LITTLE_ENDIAN)`($sp)
+
+	lfd	$two0,8*18($ctx)		# load constants
+	lfd	$two32,8*19($ctx)
+	lfd	$two64,8*20($ctx)
+	lfd	$two96,8*21($ctx)
+	lfd	$two130,8*22($ctx)
+	lfd	$five_two130,8*23($ctx)
+
+	lfd	$h0lo,8*0($ctx)			# load [biased] hash value
+	lfd	$h1lo,8*1($ctx)
+	lfd	$h2lo,8*2($ctx)
+	lfd	$h3lo,8*3($ctx)
+
+	stfd	$two0,`$LOCALS+8*0`($sp)	# input "template"
+	oris	$in3,$padbit,`(1023+52+96)<<4`
+	stfd	$two32,`$LOCALS+8*1`($sp)
+	stfd	$two64,`$LOCALS+8*2`($sp)
+	stw	$in3,`$LOCALS+8*3+(0^$LITTLE_ENDIAN)`($sp)
+
+	li	$i1,4
+	li	$i2,8
+	li	$i3,12
+	$LWXLE	$in0,0,$inp			# load input
+	$LWXLE	$in1,$i1,$inp
+	$LWXLE	$in2,$i2,$inp
+	$LWXLE	$in3,$i3,$inp
+	addi	$inp,$inp,16
+
+	stw	$in0,`$LOCALS+8*0+(4^$LITTLE_ENDIAN)`($sp)	# fill "template"
+	stw	$in1,`$LOCALS+8*1+(4^$LITTLE_ENDIAN)`($sp)
+	stw	$in2,`$LOCALS+8*2+(4^$LITTLE_ENDIAN)`($sp)
+	stw	$in3,`$LOCALS+8*3+(4^$LITTLE_ENDIAN)`($sp)
+
+	mffs	$x0				# original fpscr
+	lfd	$x1,`$LOCALS+8*4`($sp)		# new fpscr
+	lfd	$r0lo,8*4($ctx)			# load key
+	lfd	$r0hi,8*5($ctx)
+	lfd	$r1lo,8*6($ctx)
+	lfd	$r1hi,8*7($ctx)
+	lfd	$r2lo,8*8($ctx)
+	lfd	$r2hi,8*9($ctx)
+	lfd	$r3lo,8*10($ctx)
+	lfd	$r3hi,8*11($ctx)
+	lfd	$s1lo,8*12($ctx)
+	lfd	$s1hi,8*13($ctx)
+	lfd	$s2lo,8*14($ctx)
+	lfd	$s2hi,8*15($ctx)
+	lfd	$s3lo,8*16($ctx)
+	lfd	$s3hi,8*17($ctx)
+
+	stfd	$x0,`$LOCALS+8*4`($sp)		# save original fpscr
+	mtfsf	255,$x1
+
+	addic	$len,$len,1
+	addze	r0,r0
+	slwi.	r0,r0,4
+	sub	$inp,$inp,r0			# conditional rewind
+
+	lfd	$x0,`$LOCALS+8*0`($sp)
+	lfd	$x1,`$LOCALS+8*1`($sp)
+	lfd	$x2,`$LOCALS+8*2`($sp)
+	lfd	$x3,`$LOCALS+8*3`($sp)
+
+	fsub	$h0lo,$h0lo,$two0		# de-bias hash value
+	 $LWXLE	$in0,0,$inp			# modulo-scheduled input load
+	fsub	$h1lo,$h1lo,$two32
+	 $LWXLE	$in1,$i1,$inp
+	fsub	$h2lo,$h2lo,$two64
+	 $LWXLE	$in2,$i2,$inp
+	fsub	$h3lo,$h3lo,$two96
+	 $LWXLE	$in3,$i3,$inp
+
+	fsub	$x0,$x0,$two0			# de-bias input
+	 addi	$inp,$inp,16
+	fsub	$x1,$x1,$two32
+	fsub	$x2,$x2,$two64
+	fsub	$x3,$x3,$two96
+
+	fadd	$x0,$x0,$h0lo			# accumulate input
+	 stw	$in0,`$LOCALS+8*0+(4^$LITTLE_ENDIAN)`($sp)
+	fadd	$x1,$x1,$h1lo
+	 stw	$in1,`$LOCALS+8*1+(4^$LITTLE_ENDIAN)`($sp)
+	fadd	$x2,$x2,$h2lo
+	 stw	$in2,`$LOCALS+8*2+(4^$LITTLE_ENDIAN)`($sp)
+	fadd	$x3,$x3,$h3lo
+	 stw	$in3,`$LOCALS+8*3+(4^$LITTLE_ENDIAN)`($sp)
+
+	b	Lentry
+
+.align	4
+Loop:
+	fsub	$y0,$y0,$two0			# de-bias input
+	 addic	$len,$len,1
+	fsub	$y1,$y1,$two32
+	 addze	r0,r0
+	fsub	$y2,$y2,$two64
+	 slwi.	r0,r0,4
+	fsub	$y3,$y3,$two96
+	 sub	$inp,$inp,r0			# conditional rewind
+
+	fadd	$h0lo,$h0lo,$y0			# accumulate input
+	fadd	$h0hi,$h0hi,$y1
+	fadd	$h2lo,$h2lo,$y2
+	fadd	$h2hi,$h2hi,$y3
+
+	######################################### base 2^48 -> base 2^32
+	fadd	$c1lo,$h1lo,$two64
+	 $LWXLE	$in0,0,$inp			# modulo-scheduled input load
+	fadd	$c1hi,$h1hi,$two64
+	 $LWXLE	$in1,$i1,$inp
+	fadd	$c3lo,$h3lo,$two130
+	 $LWXLE	$in2,$i2,$inp
+	fadd	$c3hi,$h3hi,$two130
+	 $LWXLE	$in3,$i3,$inp
+	fadd	$c0lo,$h0lo,$two32
+	 addi	$inp,$inp,16
+	fadd	$c0hi,$h0hi,$two32
+	fadd	$c2lo,$h2lo,$two96
+	fadd	$c2hi,$h2hi,$two96
+
+	fsub	$c1lo,$c1lo,$two64
+	 stw	$in0,`$LOCALS+8*0+(4^$LITTLE_ENDIAN)`($sp)	# fill "template"
+	fsub	$c1hi,$c1hi,$two64
+	 stw	$in1,`$LOCALS+8*1+(4^$LITTLE_ENDIAN)`($sp)
+	fsub	$c3lo,$c3lo,$two130
+	 stw	$in2,`$LOCALS+8*2+(4^$LITTLE_ENDIAN)`($sp)
+	fsub	$c3hi,$c3hi,$two130
+	 stw	$in3,`$LOCALS+8*3+(4^$LITTLE_ENDIAN)`($sp)
+	fsub	$c0lo,$c0lo,$two32
+	fsub	$c0hi,$c0hi,$two32
+	fsub	$c2lo,$c2lo,$two96
+	fsub	$c2hi,$c2hi,$two96
+
+	fsub	$h1lo,$h1lo,$c1lo
+	fsub	$h1hi,$h1hi,$c1hi
+	fsub	$h3lo,$h3lo,$c3lo
+	fsub	$h3hi,$h3hi,$c3hi
+	fsub	$h2lo,$h2lo,$c2lo
+	fsub	$h2hi,$h2hi,$c2hi
+	fsub	$h0lo,$h0lo,$c0lo
+	fsub	$h0hi,$h0hi,$c0hi
+
+	fadd	$h1lo,$h1lo,$c0lo
+	fadd	$h1hi,$h1hi,$c0hi
+	fadd	$h3lo,$h3lo,$c2lo
+	fadd	$h3hi,$h3hi,$c2hi
+	fadd	$h2lo,$h2lo,$c1lo
+	fadd	$h2hi,$h2hi,$c1hi
+	fmadd	$h0lo,$c3lo,$five_two130,$h0lo
+	fmadd	$h0hi,$c3hi,$five_two130,$h0hi
+
+	fadd	$x1,$h1lo,$h1hi
+	 lfd	$s1lo,8*12($ctx)		# reload constants
+	fadd	$x3,$h3lo,$h3hi
+	 lfd	$s1hi,8*13($ctx)
+	fadd	$x2,$h2lo,$h2hi
+	 lfd	$r3lo,8*10($ctx)
+	fadd	$x0,$h0lo,$h0hi
+	 lfd	$r3hi,8*11($ctx)
+Lentry:
+	fmul	$h0lo,$s3lo,$x1
+	fmul	$h0hi,$s3hi,$x1
+	fmul	$h2lo,$r1lo,$x1
+	fmul	$h2hi,$r1hi,$x1
+	fmul	$h1lo,$r0lo,$x1
+	fmul	$h1hi,$r0hi,$x1
+	fmul	$h3lo,$r2lo,$x1
+	fmul	$h3hi,$r2hi,$x1
+
+	fmadd	$h0lo,$s1lo,$x3,$h0lo
+	fmadd	$h0hi,$s1hi,$x3,$h0hi
+	fmadd	$h2lo,$s3lo,$x3,$h2lo
+	fmadd	$h2hi,$s3hi,$x3,$h2hi
+	fmadd	$h1lo,$s2lo,$x3,$h1lo
+	fmadd	$h1hi,$s2hi,$x3,$h1hi
+	fmadd	$h3lo,$r0lo,$x3,$h3lo
+	fmadd	$h3hi,$r0hi,$x3,$h3hi
+
+	fmadd	$h0lo,$s2lo,$x2,$h0lo
+	fmadd	$h0hi,$s2hi,$x2,$h0hi
+	fmadd	$h2lo,$r0lo,$x2,$h2lo
+	fmadd	$h2hi,$r0hi,$x2,$h2hi
+	fmadd	$h1lo,$s3lo,$x2,$h1lo
+	fmadd	$h1hi,$s3hi,$x2,$h1hi
+	fmadd	$h3lo,$r1lo,$x2,$h3lo
+	fmadd	$h3hi,$r1hi,$x2,$h3hi
+
+	fmadd	$h0lo,$r0lo,$x0,$h0lo
+	 lfd	$y0,`$LOCALS+8*0`($sp)		# load [biased] input
+	fmadd	$h0hi,$r0hi,$x0,$h0hi
+	 lfd	$y1,`$LOCALS+8*1`($sp)
+	fmadd	$h2lo,$r2lo,$x0,$h2lo
+	 lfd	$y2,`$LOCALS+8*2`($sp)
+	fmadd	$h2hi,$r2hi,$x0,$h2hi
+	 lfd	$y3,`$LOCALS+8*3`($sp)
+	fmadd	$h1lo,$r1lo,$x0,$h1lo
+	fmadd	$h1hi,$r1hi,$x0,$h1hi
+	fmadd	$h3lo,$r3lo,$x0,$h3lo
+	fmadd	$h3hi,$r3hi,$x0,$h3hi
+
+	bdnz	Loop
+
+	######################################### base 2^48 -> base 2^32
+	fadd	$c0lo,$h0lo,$two32
+	fadd	$c0hi,$h0hi,$two32
+	fadd	$c2lo,$h2lo,$two96
+	fadd	$c2hi,$h2hi,$two96
+	fadd	$c1lo,$h1lo,$two64
+	fadd	$c1hi,$h1hi,$two64
+	fadd	$c3lo,$h3lo,$two130
+	fadd	$c3hi,$h3hi,$two130
+
+	fsub	$c0lo,$c0lo,$two32
+	fsub	$c0hi,$c0hi,$two32
+	fsub	$c2lo,$c2lo,$two96
+	fsub	$c2hi,$c2hi,$two96
+	fsub	$c1lo,$c1lo,$two64
+	fsub	$c1hi,$c1hi,$two64
+	fsub	$c3lo,$c3lo,$two130
+	fsub	$c3hi,$c3hi,$two130
+
+	fsub	$h1lo,$h1lo,$c1lo
+	fsub	$h1hi,$h1hi,$c1hi
+	fsub	$h3lo,$h3lo,$c3lo
+	fsub	$h3hi,$h3hi,$c3hi
+	fsub	$h2lo,$h2lo,$c2lo
+	fsub	$h2hi,$h2hi,$c2hi
+	fsub	$h0lo,$h0lo,$c0lo
+	fsub	$h0hi,$h0hi,$c0hi
+
+	fadd	$h1lo,$h1lo,$c0lo
+	fadd	$h1hi,$h1hi,$c0hi
+	fadd	$h3lo,$h3lo,$c2lo
+	fadd	$h3hi,$h3hi,$c2hi
+	fadd	$h2lo,$h2lo,$c1lo
+	fadd	$h2hi,$h2hi,$c1hi
+	fmadd	$h0lo,$c3lo,$five_two130,$h0lo
+	fmadd	$h0hi,$c3hi,$five_two130,$h0hi
+
+	fadd	$x1,$h1lo,$h1hi
+	fadd	$x3,$h3lo,$h3hi
+	fadd	$x2,$h2lo,$h2hi
+	fadd	$x0,$h0lo,$h0hi
+
+	lfd	$h0lo,`$LOCALS+8*4`($sp)	# pull saved fpscr
+	fadd	$x1,$x1,$two32			# bias
+	fadd	$x3,$x3,$two96
+	fadd	$x2,$x2,$two64
+	fadd	$x0,$x0,$two0
+
+	stfd	$x1,8*1($ctx)			# store [biased] hash value
+	stfd	$x3,8*3($ctx)
+	stfd	$x2,8*2($ctx)
+	stfd	$x0,8*0($ctx)
+
+	mtfsf	255,$h0lo			# restore original fpscr
+	lfd	f14,`$FRAME-8*18`($sp)
+	lfd	f15,`$FRAME-8*17`($sp)
+	lfd	f16,`$FRAME-8*16`($sp)
+	lfd	f17,`$FRAME-8*15`($sp)
+	lfd	f18,`$FRAME-8*14`($sp)
+	lfd	f19,`$FRAME-8*13`($sp)
+	lfd	f20,`$FRAME-8*12`($sp)
+	lfd	f21,`$FRAME-8*11`($sp)
+	lfd	f22,`$FRAME-8*10`($sp)
+	lfd	f23,`$FRAME-8*9`($sp)
+	lfd	f24,`$FRAME-8*8`($sp)
+	lfd	f25,`$FRAME-8*7`($sp)
+	lfd	f26,`$FRAME-8*6`($sp)
+	lfd	f27,`$FRAME-8*5`($sp)
+	lfd	f28,`$FRAME-8*4`($sp)
+	lfd	f29,`$FRAME-8*3`($sp)
+	lfd	f30,`$FRAME-8*2`($sp)
+	lfd	f31,`$FRAME-8*1`($sp)
+	addi	$sp,$sp,$FRAME
+Labort:
+	blr
+	.long	0
+	.byte	0,12,4,1,0x80,0,4,0
+.size	.poly1305_blocks_fpu,.-.poly1305_blocks_fpu
+___
+{
+my ($mac,$nonce)=($inp,$len);
+
+my ($h0,$h1,$h2,$h3,$h4, $d0,$d1,$d2,$d3
+   ) = map("r$_",(7..11,28..31));
+my $mask = "r0";
+my $FRAME = (6+4)*$SIZE_T;
+
+$code.=<<___;
+.globl	.poly1305_emit_fpu
+.align	4
+.poly1305_emit_fpu:
+	$STU	$sp,-$FRAME($sp)
+	mflr	r0
+	$PUSH	r28,`$FRAME-$SIZE_T*4`($sp)
+	$PUSH	r29,`$FRAME-$SIZE_T*3`($sp)
+	$PUSH	r30,`$FRAME-$SIZE_T*2`($sp)
+	$PUSH	r31,`$FRAME-$SIZE_T*1`($sp)
+	$PUSH	r0,`$FRAME+$LRSAVE`($sp)
+
+	lwz	$d0,`8*0+(0^$LITTLE_ENDIAN)`($ctx)	# load hash
+	lwz	$h0,`8*0+(4^$LITTLE_ENDIAN)`($ctx)
+	lwz	$d1,`8*1+(0^$LITTLE_ENDIAN)`($ctx)
+	lwz	$h1,`8*1+(4^$LITTLE_ENDIAN)`($ctx)
+	lwz	$d2,`8*2+(0^$LITTLE_ENDIAN)`($ctx)
+	lwz	$h2,`8*2+(4^$LITTLE_ENDIAN)`($ctx)
+	lwz	$d3,`8*3+(0^$LITTLE_ENDIAN)`($ctx)
+	lwz	$h3,`8*3+(4^$LITTLE_ENDIAN)`($ctx)
+
+	lis	$mask,0xfff0
+	andc	$d0,$d0,$mask			# mask exponent
+	andc	$d1,$d1,$mask
+	andc	$d2,$d2,$mask
+	andc	$d3,$d3,$mask			# can be partially reduced...
+	li	$mask,3
+
+	srwi	$padbit,$d3,2			# ... so reduce
+	and	$h4,$d3,$mask
+	andc	$d3,$d3,$mask
+	add	$d3,$d3,$padbit
+___
+						if ($SIZE_T==4) {
+$code.=<<___;
+	addc	$h0,$h0,$d3
+	adde	$h1,$h1,$d0
+	adde	$h2,$h2,$d1
+	adde	$h3,$h3,$d2
+	addze	$h4,$h4
+
+	addic	$d0,$h0,5			# compare to modulus
+	addze	$d1,$h1
+	addze	$d2,$h2
+	addze	$d3,$h3
+	addze	$mask,$h4
+
+	srwi	$mask,$mask,2			# did it carry/borrow?
+	neg	$mask,$mask
+	srawi	$mask,$mask,31			# mask
+
+	andc	$h0,$h0,$mask
+	and	$d0,$d0,$mask
+	andc	$h1,$h1,$mask
+	and	$d1,$d1,$mask
+	or	$h0,$h0,$d0
+	lwz	$d0,0($nonce)			# load nonce
+	andc	$h2,$h2,$mask
+	and	$d2,$d2,$mask
+	or	$h1,$h1,$d1
+	lwz	$d1,4($nonce)
+	andc	$h3,$h3,$mask
+	and	$d3,$d3,$mask
+	or	$h2,$h2,$d2
+	lwz	$d2,8($nonce)
+	or	$h3,$h3,$d3
+	lwz	$d3,12($nonce)
+
+	addc	$h0,$h0,$d0			# accumulate nonce
+	adde	$h1,$h1,$d1
+	adde	$h2,$h2,$d2
+	adde	$h3,$h3,$d3
+___
+						} else {
+$code.=<<___;
+	add	$h0,$h0,$d3
+	add	$h1,$h1,$d0
+	add	$h2,$h2,$d1
+	add	$h3,$h3,$d2
+
+	srdi	$d0,$h0,32
+	add	$h1,$h1,$d0
+	srdi	$d1,$h1,32
+	add	$h2,$h2,$d1
+	srdi	$d2,$h2,32
+	add	$h3,$h3,$d2
+	srdi	$d3,$h3,32
+	add	$h4,$h4,$d3
+
+	insrdi	$h0,$h1,32,0
+	insrdi	$h2,$h3,32,0
+
+	addic	$d0,$h0,5			# compare to modulus
+	addze	$d1,$h2
+	addze	$d2,$h4
+
+	srdi	$mask,$d2,2			# did it carry/borrow?
+	neg	$mask,$mask
+	sradi	$mask,$mask,63			# mask
+	ld	$d2,0($nonce)			# load nonce
+	ld	$d3,8($nonce)
+
+	andc	$h0,$h0,$mask
+	and	$d0,$d0,$mask
+	andc	$h2,$h2,$mask
+	and	$d1,$d1,$mask
+	or	$h0,$h0,$d0
+	or	$h2,$h2,$d1
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	rotldi	$d2,$d2,32			# flip nonce words
+	rotldi	$d3,$d3,32
+___
+$code.=<<___;
+	addc	$h0,$h0,$d2			# accumulate nonce
+	adde	$h2,$h2,$d3
+
+	srdi	$h1,$h0,32
+	srdi	$h3,$h2,32
+___
+						}
+$code.=<<___	if ($LITTLE_ENDIAN);
+	stw	$h0,0($mac)			# write result
+	stw	$h1,4($mac)
+	stw	$h2,8($mac)
+	stw	$h3,12($mac)
+___
+$code.=<<___	if (!$LITTLE_ENDIAN);
+	li	$d1,4
+	stwbrx	$h0,0,$mac			# write result
+	li	$d2,8
+	stwbrx	$h1,$d1,$mac
+	li	$d3,12
+	stwbrx	$h2,$d2,$mac
+	stwbrx	$h3,$d3,$mac
+___
+$code.=<<___;
+	$POP	r28,`$FRAME-$SIZE_T*4`($sp)
+	$POP	r29,`$FRAME-$SIZE_T*3`($sp)
+	$POP	r30,`$FRAME-$SIZE_T*2`($sp)
+	$POP	r31,`$FRAME-$SIZE_T*1`($sp)
+	addi	$sp,$sp,$FRAME
+	blr
+	.long	0
+	.byte	0,12,4,1,0x80,4,3,0
+.size	.poly1305_emit_fpu,.-.poly1305_emit_fpu
+___
+}
+# Ugly hack here, because PPC assembler syntax seem to vary too
+# much from platforms to platform...
+$code.=<<___;
+.align	6
+LPICmeup:
+	mflr	r0
+	bcl	20,31,\$+4
+	mflr	$len	# vvvvvv "distance" between . and 1st data entry
+	addi	$len,$len,`64-8`	# borrow $len
+	mtlr	r0
+	blr
+	.long	0
+	.byte	0,12,0x14,0,0,0,0,0
+	.space	`64-9*4`
+
+.quad	0x4330000000000000		# 2^(52+0)
+.quad	0x4530000000000000		# 2^(52+32)
+.quad	0x4730000000000000		# 2^(52+64)
+.quad	0x4930000000000000		# 2^(52+96)
+.quad	0x4b50000000000000		# 2^(52+130)
+
+.quad	0x37f4000000000000		# 5/2^130
+
+.quad	0x4430000000000000		# 2^(52+16+0)
+.quad	0x4630000000000000		# 2^(52+16+32)
+.quad	0x4830000000000000		# 2^(52+16+64)
+.quad	0x4a30000000000000		# 2^(52+16+96)
+.quad	0x3e30000000000000		# 2^(52+16+0-96)
+.quad	0x4030000000000000		# 2^(52+16+32-96)
+.quad	0x4230000000000000		# 2^(52+16+64-96)
+
+.quad	0x0000000000000001		# fpscr: truncate, no exceptions
+.asciz	"Poly1305 for PPC FPU, CRYPTOGAMS by <appro\@openssl.org>"
+.align	4
+___
+
+$code =~ s/\`([^\`]*)\`/eval $1/gem;
+print $code;
+close STDOUT;
diff --git a/src/crypto/zinc/poly1305/poly1305.c b/src/crypto/zinc/poly1305/poly1305.c
index 7d373b9..dd2e1a3 100644
--- a/src/crypto/zinc/poly1305/poly1305.c
+++ b/src/crypto/zinc/poly1305/poly1305.c
@@ -14,16 +14,85 @@
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/init.h>
 
+#if defined(CONFIG_ZINC_ARCH_ARM) || defined(CONFIG_ZINC_ARCH_ARM64) || defined(CONFIG_ZINC_ARCH_PPC32) || defined(CONFIG_ZINC_ARCH_PPC64)
+#if defined(CONFIG_ZINC_ARCH_ARM64) || defined(CONFIG_ZINC_ARCH_PPC64)
+struct poly1305_arch_internal {
+	union {
+		u32 h[5];
+		struct {
+			u64 h0, h1, h2;
+		};
+	};
+	u64 is_base2_26;
+	u64 r[2];
+};
+#elif defined(CONFIG_ZINC_ARCH_ARM) || defined(CONFIG_ZINC_ARCH_PPC32)
+struct poly1305_arch_internal {
+	union {
+		u32 h[5];
+		struct {
+			u64 h0, h1;
+			u32 h2;
+		} __packed;
+	};
+	u32 r[4];
+	u32 is_base2_26;
+};
+#endif
+/* The NEON and AVX code uses base 2^26, while the scalar code uses base 2^64 on 64-bit
+ * and base 2^32 on 32-bit. If we hit the unfortunate situation of using NEON or AVX
+ * and then having to go back to scalar -- because the user is silly and has
+ * called the update function from two separate contexts -- then we need to
+ * convert back to the original base before proceeding. The below function is
+ * written for 64-bit integers, and so we have to swap words at the end on
+ * big-endian 32-bit. It is possible to reason that the initial reduction below
+ * is sufficient given the implementation invariants. However, for an avoidance
+ * of doubt and because this is not performance critical, we do the full
+ * reduction anyway.
+ */
+static void convert_to_base2_64(void *ctx)
+{
+	struct poly1305_arch_internal *state = ctx;
+	u32 cy;
+
+	if (!(IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || IS_ENABLED(CONFIG_AVX)) || !state->is_base2_26)
+		return;
+
+	cy = state->h[0] >> 26; state->h[0] &= 0x3ffffff; state->h[1] += cy;
+	cy = state->h[1] >> 26; state->h[1] &= 0x3ffffff; state->h[2] += cy;
+	cy = state->h[2] >> 26; state->h[2] &= 0x3ffffff; state->h[3] += cy;
+	cy = state->h[3] >> 26; state->h[3] &= 0x3ffffff; state->h[4] += cy;
+	state->h0 = ((u64)state->h[2] << 52) | ((u64)state->h[1] << 26) | state->h[0];
+	state->h1 = ((u64)state->h[4] << 40) | ((u64)state->h[3] << 14) | (state->h[2] >> 12);
+	state->h2 = state->h[4] >> 24;
+	if ((IS_ENABLED(CONFIG_ZINC_ARCH_ARM) || IS_ENABLED(CONFIG_ZINC_ARCH_PPC32)) &&
+	    IS_ENABLED(CONFIG_CPU_BIG_ENDIAN)) {
+		state->h0 = rol64(state->h0, 32);
+		state->h1 = rol64(state->h1, 32);
+	}
+#define ULT(a, b) ((a ^ ((a ^ b) | ((a - b) ^ b))) >> (sizeof(a) * 8 - 1))
+	cy = (state->h2 >> 2) + (state->h2 & ~3ULL);
+	state->h2 &= 3;
+	state->h0 += cy;
+	state->h1 += (cy = ULT(state->h0, cy));
+	state->h2 += ULT(state->h1, cy);
+#undef ULT
+	state->is_base2_26 = 0;
+}
+#endif
+
 #if defined(CONFIG_ZINC_ARCH_X86_64)
 #include "poly1305-x86_64-glue.c"
 #elif defined(CONFIG_ZINC_ARCH_ARM) || defined(CONFIG_ZINC_ARCH_ARM64)
 #include "poly1305-arm-glue.c"
 #elif defined(CONFIG_ZINC_ARCH_MIPS) || defined(CONFIG_ZINC_ARCH_MIPS64)
 #include "poly1305-mips-glue.c"
+#elif defined(CONFIG_ZINC_ARCH_PPC32) || defined(CONFIG_ZINC_ARCH_PPC64)
+#include "poly1305-ppc-glue.c"
 #else
 static inline bool poly1305_init_arch(void *ctx,
 				      const u8 key[POLY1305_KEY_SIZE])
 {
 	return false;
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
