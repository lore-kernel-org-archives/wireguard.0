Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1FCC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCBA160E97
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 13:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCBA160E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=grsecurity.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f60650f;
	Mon, 2 Aug 2021 13:14:17 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3a62fc14
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 6 Jul 2021 13:35:35 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j16-20020a05600c1c10b0290204b096b0caso2283797wms.1
 for <wireguard@lists.zx2c4.com>; Tue, 06 Jul 2021 06:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grsecurity.net; s=grsec;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77jFAi9uoJVAXtr4MNedcW+ZDrnJD4Mo5ETNFDRdXn8=;
 b=AH25Q2hksOgzawyCGRofV+x5URJQyzTxgl3JHxv4lOr07Y1HFcreDn4C5EjpZXUTdF
 ztV553NZiE8e1E3JvYxOtQRlSXgZhGvma0E0d9NkwRaYUPq34vpTSFSJLA4nTaQnI/xV
 G+Pf07nBKLPuJE0n0qm9G6CSspZVq0qZTP0Ts1mCrCW3IMIONtQNtO8UhLVLK7BTLGoM
 vB0mIp4Pr9gas0j2Qv+/xCX9rEk1viGGguO2DjZvbc9uBW/57Lo4v+GxHjrUn/cElkR7
 yIRA6ar+v4I8MmypheYIqFYvbIxNwAKYSUYcTCNo82tKvEwaReNoBgnoRtPM1DTWiC04
 iSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77jFAi9uoJVAXtr4MNedcW+ZDrnJD4Mo5ETNFDRdXn8=;
 b=Ll/SwqrlbKcWN9IU7LJz0I/jpXr4AJvDPMb9HNqyKGFDl3M3FuBoilcrCQTO5pcKOW
 O2fd7O8//3NTmw3HZhAlyQnUDd8VDBP7NX51tFw/M16K5+iMxPJ1O7PR/axuUUFEnsWm
 SD8gs9LRJfg2IXuLvkghhYerneggHSowf0YKH3sB0Lm5nRd6SBosrQKzadEOpUfYVLEA
 5OPo1CuV/Xd/TmHZD6MW+ukOMreL7Kh1qsaxuBqHFpJrwD9XOp+8gorYL+4m97CtAdCI
 +xAe7d/a9i2r4HnUwyMgWrlzv0JoajUj9DrUuqtUyKlLMIiqGjryWl1vB/8/sPO3+Mj/
 cPrg==
X-Gm-Message-State: AOAM531mMQRC25KeEJGZXvUengl1ehlUtvnHO1bP7ZoT2SQLsk2JAb2t
 6QtUTcn49EjZMPi/8k6dqfYG4fRtbNMA+V+Nl34=
X-Google-Smtp-Source: ABdhPJwz+SMk2Lgfo4h/JtNo+w/nEE6spKTYejZaWCCS8pbtMCM3dVsqQtI76JOfOXfENvAw1aR0dw==
X-Received: by 2002:a1c:9a97:: with SMTP id c145mr778110wme.42.1625578039601; 
 Tue, 06 Jul 2021 06:27:19 -0700 (PDT)
Received: from bell.fritz.box
 (p200300f6af0ea300f5eebaf01242eb9f.dip0.t-ipconnect.de.
 [2003:f6:af0e:a300:f5ee:baf0:1242:eb9f])
 by smtp.gmail.com with ESMTPSA id c7sm16927769wrs.23.2021.07.06.06.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 06:27:19 -0700 (PDT)
From: Mathias Krause <minipli@grsecurity.net>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	Mathias Krause <minipli@grsecurity.net>
Subject: [PATCH 1/2] compat: better grsecurity compatibility
Date: Tue,  6 Jul 2021 15:27:13 +0200
Message-Id: <20210706132714.8220-2-minipli@grsecurity.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706132714.8220-1-minipli@grsecurity.net>
References: <20210706132714.8220-1-minipli@grsecurity.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 02 Aug 2021 13:14:07 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

grsecurity kernels tend to carry additional backports and changes, like
commit b60b87fc2996 ("netlink: add ethernet address policy types") or
the SYM_FUNC_* changes. RAP nowadays hooks the latter, therefore no
diversion to RAP_ENTRY is needed any more.

Instead of relying on the kernel version test, also test for the macros
we're about to define to not already be defined to account for these
additional changes in the grsecurity patch without breaking
compatibility to the older public ones.

Also test for CONFIG_PAX instead of RAP_PLUGIN for the timer API related
changes as these don't depend on the RAP plugin to be enabled but just a
PaX/grsecurity patch to be applied. While there is no preprocessor knob
for the latter, use CONFIG_PAX as this will likely be enabled in every
kernel that uses the patch.

Signed-off-by: Mathias Krause <minipli@grsecurity.net>
---
 src/compat/compat-asm.h | 4 ++--
 src/compat/compat.h     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/compat/compat-asm.h b/src/compat/compat-asm.h
index fde21dabba4f..5bfdb9410933 100644
--- a/src/compat/compat-asm.h
+++ b/src/compat/compat-asm.h
@@ -22,7 +22,7 @@
 #endif
 
 /* PaX compatibility */
-#if defined(RAP_PLUGIN)
+#if defined(RAP_PLUGIN) && defined(RAP_ENTRY)
 #undef ENTRY
 #define ENTRY RAP_ENTRY
 #endif
@@ -51,7 +51,7 @@
 #undef pull
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76) && !defined(ISCENTOS8S)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 4, 76) && !defined(ISCENTOS8S) && !defined(SYM_FUNC_START)
 #define SYM_FUNC_START ENTRY
 #define SYM_FUNC_END ENDPROC
 #endif
diff --git a/src/compat/compat.h b/src/compat/compat.h
index b2041327d85c..da6912d871fa 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -830,7 +830,7 @@ static inline void skb_mark_not_on_list(struct sk_buff *skb)
 }
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && !defined(ISRHEL8)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && !defined(ISRHEL8) && !defined(NLA_POLICY_EXACT_LEN)
 #define NLA_POLICY_EXACT_LEN(_len) { .type = NLA_UNSPEC, .len = _len }
 #endif
 #if LINUX_VERSION_CODE < KERNEL_VERSION(5, 2, 0) && !defined(ISRHEL8)
@@ -1127,7 +1127,7 @@ static const struct header_ops ip_tunnel_header_ops = { .parse_protocol = ip_tun
 #undef __read_mostly
 #define __read_mostly
 #endif
-#if (defined(RAP_PLUGIN) || defined(CONFIG_CFI_CLANG)) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 0)
+#if (defined(CONFIG_PAX) || defined(CONFIG_CFI_CLANG)) && LINUX_VERSION_CODE < KERNEL_VERSION(4, 15, 0)
 #include <linux/timer.h>
 #define wg_expired_retransmit_handshake(a) wg_expired_retransmit_handshake(unsigned long timer)
 #define wg_expired_send_keepalive(a) wg_expired_send_keepalive(unsigned long timer)
-- 
2.20.1

