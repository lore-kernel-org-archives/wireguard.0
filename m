Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96169C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:41:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36E392467E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t0HULRGa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36E392467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b95da828;
	Tue, 28 Jan 2020 10:40:58 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63c9a76e
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 11:18:50 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2d8f1148
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Jan 2020 11:18:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c14so2616943wrn.7
 for <wireguard@lists.zx2c4.com>; Thu, 23 Jan 2020 03:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8upL1PnQRBBf5oQgT0iN3c/JKBf1FJTnmdvDat+FZDc=;
 b=t0HULRGafzJoa7T4u1vS4iaGXYVUhACF8MCnwApT3abfLYHL3laQ8HpioLelGJM23U
 mc3dQ/I+9tjCdHmM3M7AWCMc7rolIjX2iKAbTQjGZv/tPsngDZ6t/zR+QCv4p1lXO1g8
 FTR8rCduZ3waHxs+WSw+ookdgTN4sb/ApsxBFF7DL8Ih+IwRTAbe/cEhJ1bTW/zxOoou
 /XF+z+hOPfuUifiqiPY+ExMpaPi07teoKL0ZAyjnIu2OkkjYHCtGfQXIzZduZoxe0vKO
 OO137EvsNGCe2J5J30+5wMAw6qk9vINprd71Y8jBLw9BgEW0myno5q2nEfIu4/ipEeFh
 DcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8upL1PnQRBBf5oQgT0iN3c/JKBf1FJTnmdvDat+FZDc=;
 b=gBS1jTzW/+WV93LVCSEHd9SuWQVvUI6MnO3RfgJw0WKw1qi9Kuzg4MjtUVpFtRU95T
 6P1zU2RHmSfVI4pmrbUwFtiF8XVFdZMu/4cu29M/6NyUofNhwvrBS/RZ5frUBwxuv5RW
 25BmI8KLKLGACQaI5zQtml6Y97Mzz+N7SXKpQVNDqPuaZf8rdmnT9Yt6NgfVTuB80x+j
 0qRK4acYr+Qkkh/euGuJeBq02oEA8o+apEeSNMkq8aQJarYHu02xZ3pSYIuyHMbhR3Di
 ltn4IBuQR6wmwXUG9XwfphajkyZv19TP7/dzPBek8I+WrUKUQOQLuhkjwyUQsy02Mes4
 6g3g==
X-Gm-Message-State: APjAAAX1IzsEXwx1yzgFu2AckZ62B6C/z52lIvep20cmYlXkJQHpiGGS
 +xXPDqOGoyY9Yhi1xxmyjoRoyXP4naM=
X-Google-Smtp-Source: APXvYqzcQthaqJpWS3F98nxRqhYHHIdWChQ9J8cx38haSGMSKpMGY6qDO86U8u2RPkF+3+cyGVawbw==
X-Received: by 2002:adf:fe4d:: with SMTP id m13mr17868362wrs.179.1579778328283; 
 Thu, 23 Jan 2020 03:18:48 -0800 (PST)
Received: from localhost.localdomain ([2a02:a58:8166:7500:78c6:2197:80c4:a298])
 by smtp.gmail.com with ESMTPSA id w8sm8860816wmd.2.2020.01.23.03.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 03:18:46 -0800 (PST)
From: Ilie Halip <ilie.halip@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] compat: support building for RHEL-8.2
Date: Thu, 23 Jan 2020 13:18:25 +0200
Message-Id: <20200123111825.17435-1-ilie.halip@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:40:57 +0100
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

RedHat backported some more changes, now released as kernel 4.18.0-168.el8.
To maintain compatibility with kernel -147, a new macro is introduced: ISRHEL82.

Compile-tested with the -168 and -147 kernels.

Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
---
 src/compat/compat.h | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/src/compat/compat.h b/src/compat/compat.h
index 96f3556..a77f973 100644
--- a/src/compat/compat.h
+++ b/src/compat/compat.h
@@ -16,6 +16,11 @@
 #define ISRHEL7
 #elif RHEL_MAJOR == 8
 #define ISRHEL8
+#ifdef RHEL_MINOR
+#if RHEL_MINOR == 2
+#define ISRHEL82
+#endif
+#endif
 #endif
 #endif
 #ifdef UTS_UBUNTU_RELEASE_ABI
@@ -783,7 +788,7 @@ struct __kernel_timespec {
 #endif
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0) && !defined(ISRHEL82)
 #include <linux/skbuff.h>
 #define skb_probe_transport_header(a) skb_probe_transport_header(a, 0)
 #endif
@@ -792,7 +797,7 @@ struct __kernel_timespec {
 #define ignore_df local_df
 #endif
 
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 1, 0) && !defined(ISRHEL82)
 /* Note that all intentional uses of the non-_bh variety need to explicitly
  * undef these, conditionalized on COMPAT_CANNOT_DEPRECIATE_BH_RCU.
  */
@@ -834,7 +839,7 @@ static inline void skb_mark_not_on_list(struct sk_buff *skb)
 #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 20, 0) && !defined(ISRHEL8)
 #define NLA_EXACT_LEN NLA_UNSPEC
 #endif
-#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 2, 0)
+#if LINUX_VERSION_CODE < KERNEL_VERSION(5, 2, 0) && !defined(ISRHEL82)
 #define NLA_MIN_LEN NLA_UNSPEC
 #define COMPAT_CANNOT_INDIVIDUAL_NETLINK_OPS_POLICY
 #endif
-- 
2.17.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
