Return-Path: <SRS0=/FJx=XG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7E6BC5ACAE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D032206CD
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Sep 2019 16:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uTiRjvuQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D032206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbbd41c2;
	Wed, 11 Sep 2019 16:40:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b5059cc
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 20:42:43 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f796ffb
 for <wireguard@lists.zx2c4.com>;
 Tue, 10 Sep 2019 20:42:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id o184so1016616wme.3
 for <wireguard@lists.zx2c4.com>; Tue, 10 Sep 2019 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uD8Q/fhw7z1+bqMyZmf33lCfwYPHDf1BAzPu6Jkowbk=;
 b=uTiRjvuQTe4pWtwQnryBAXJORD7WJo6zZAa669biNe2qbmI7gA9Ics0bc9Gfu+/C0q
 W5ub2L1sQJZ8jy/JDJoEEdZmVc8CMyiuleb+Jma7gL0tou6koscwrPTk7GDQAG+JtEfO
 A0l9Liu1VPknH9KkIox+T3WpkZOS9xzwpiPWomKRxOTTnFEW8090EGhmjfCY5wuPp/kl
 8XjZ5dVME4lO6VbjbEHa/95VgZYE/vmwM8RWTwWbFYFh07ZBr6pV4andWh9XleRhG96r
 erS5jPk6uZZrnhvb3LI0rpT0l0WbHysxNVEQyJP3tSPyVUThr2Yw7cEFpDm4JLY7f+O+
 yrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uD8Q/fhw7z1+bqMyZmf33lCfwYPHDf1BAzPu6Jkowbk=;
 b=UXJ/WfsBXQZXIjl/oDHJm+e2neCe9KRh7tHnzJ3S42wY6blKxzVR71TyWMO2fGdOcX
 WRuRTPIvUNolwD9F6720YS6CgMRpKEG8Ie0WjL7S7FT3OIrxJMmdCtYKpo5VhjWafgJZ
 iEw5KGOAHiO4k7X8uxL0WvwLybA2GT7DhhmRi8gf+Pfs3/MvfYsoqwN3L/+zieSTJw6k
 gLgKUodjCDtdxRN3M9zYuzztdl6WwvgsvHTQYY9NkIWZN0Sn+yHPfl6WUte5ZSqIR+7a
 jiWIFbdI25nnpidyXLMWjuH1Dx+MRVFU4L51n2C29P9vqKkI6dgUYLbUzhk6hQ6r6k/7
 JJSQ==
X-Gm-Message-State: APjAAAWRnFnJL3FPvD1bpvUDmHCILGk37UjXewzFZLIDpSZPfgUQilvo
 E8htHpDBFsAqkoU0Jt3wq5VPxNZQ
X-Google-Smtp-Source: APXvYqyHrmQrkWoCFYHyLJwnh0onHVQynsdDSDnoUhAO3wTNiRXvId+xlK8YCmHxfQyH3rmnj28Cow==
X-Received: by 2002:a1c:3bd6:: with SMTP id i205mr1014292wma.135.1568148161897; 
 Tue, 10 Sep 2019 13:42:41 -0700 (PDT)
Received: from themisto.localnet (89.74.204.77.rev.sfr.net. [77.204.74.89])
 by smtp.gmail.com with ESMTPSA id d28sm21734921wrb.95.2019.09.10.13.42.40
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 13:42:41 -0700 (PDT)
From: =?ISO-8859-1?Q?Robert=2DAndr=E9?= Mauchin <zebob.m@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: RHEL8 compatibility
Date: Tue, 10 Sep 2019 22:42:40 +0200
Message-ID: <3256534.Vi1k177MCT@themisto>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Sep 2019 18:40:39 +0200
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

Hello,

The RHEL8 kernel (4.18) contains backported changes that make it act more like
a > 4.7 kernel. As such src/compat/compat.h need to be patched to handle
RHEL8 special case.

We are currently using this patch in RPMFusion EPEL8 branch:

--- a/WireGuard-0.0.20190702/src/compat/compat.h
+++ b/WireGuard-0.0.20190702/src/compat/compat.h
@@ -79,18 +79,6 @@
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 0) && !defined(ISRHEL7)
 #define ipv6_dst_lookup(a, b, c, d) ipv6_dst_lookup(b, c, d)
-#endif
-
-#if (LINUX_VERSION_CODE == KERNEL_VERSION(4, 4, 0) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(4, 3, 5) && LINUX_VERSION_CODE >= KERNEL_VERSION(4, 2, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(4, 1, 17) && LINUX_VERSION_CODE > KERNEL_VERSION(3, 19, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 18, 27) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 17, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 16, 8) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 15, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 14, 40) && LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)) || \
-    (LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 54))) && !defined(ISUBUNTU1404)
-#include <linux/if.h>
-#include <net/ip_tunnels.h>
-#define IP6_ECN_set_ce(a, b) IP6_ECN_set_ce(b)
 #endif
 
 #if LINUX_VERSION_CODE < KERNEL_VERSION(3, 12, 0) && IS_ENABLED(CONFIG_IPV6) && !defined(ISRHEL7)


Could you please define a ISRHEL8 to handle this?


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
