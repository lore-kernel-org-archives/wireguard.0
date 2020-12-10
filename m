Return-Path: <SRS0=050+=FR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE263C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 23:12:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B9D222DFA
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 13 Dec 2020 23:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B9D222DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9529567f;
	Sun, 13 Dec 2020 23:04:16 +0000 (UTC)
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 259bafef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Dec 2020 23:52:46 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id l14so3403671qvh.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 Dec 2020 16:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SdYtKtK7zUrXPWMga8yFd/i5OgS9usyRJh0ZQzJgdJw=;
 b=MG8qB8YhefM+dC01ebFgvlT5qEFJIt5nJwN2ZkdOkVsIBgJlZCePYa+OK87/5g2Yom
 GfQOJzSzQfMg3heLbL22CQQHSbm5fAMsA0qPYc5bYVt9GnjMGbhvY/TYOsuHxyt3Y5M6
 RH0jqqzhE/ctOHoEOZw32fhANIvReqPPE8vRkpH3nBTIhbIaYFkApaV6eM3Wirlshuc1
 JC7KEL5cNVkzjK82rkR8anWE/7ea9uDMNXTELXeeKnSZ02VeDLcbLySeF6Ek/aYYeeeo
 bThTS+/+J36QdwkwU5Bn4e0eeP+jxT+WJjPI6Gnj8zF1GvYmg/8I6M4m9boRrX3fgZrR
 caOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SdYtKtK7zUrXPWMga8yFd/i5OgS9usyRJh0ZQzJgdJw=;
 b=jIwYwTs0Xq19zDpQJWSkZuB3LXVUIUeOvCEDcK1DFZab9VoI0xt7AwMPtxk5BiF2TW
 Qc9qlsOuDKG+JiBHkTPzp0BZcUV+pyD1of+moj/nMyY4otVTQdomq4OIWXvrPkZPkoeT
 vXiYzfZ7ZGNk9uGq2+e6wTc8aQXPrYvdbePT99/ESRo9rKzeWV/n+gVvn1h7a/SDzVfS
 MiucQWSxgppzpQhJFfxZ1CJ7lSGdDMEG9wH+QCqHNmVZQVGz6+RdAkPNhcwB/I32Oxdf
 05W9IwNCRbI3wlPPxoqUfsA1VmxiuFVAtPP4nXrrqL5EXOXafBUCa3014XlEy+Ud6F7Z
 94ow==
X-Gm-Message-State: AOAM533HaHQstg1iSiuc0YbRzkaGZm9iNApGCfrPqR1JYJeR8UnDxRYb
 L7VpsqN0ZM2FeSessIE6W8VNRBl/k4gMSg==
X-Google-Smtp-Source: ABdhPJyzt9xfQxj7mgWCyAsiEtkUX/MnUT5nbiVihL1kYU4rK+ZqWaMMq/qKC9lUp2MPKSf6TBpdZw==
X-Received: by 2002:a05:6a00:13a3:b029:18b:d5d2:196 with SMTP id
 t35-20020a056a0013a3b029018bd5d20196mr9051879pfg.62.1607644464159; 
 Thu, 10 Dec 2020 15:54:24 -0800 (PST)
Received: from localhost.localdomain
 (23-114-247-29.lightspeed.irvnca.sbcglobal.net. [23.114.247.29])
 by smtp.gmail.com with ESMTPSA id s21sm7735559pgk.52.2020.12.10.15.54.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Dec 2020 15:54:23 -0800 (PST)
From: Adam Stiles <ajstiles@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Adam Stiles <ajstiles@gmail.com>
Subject: [PATCH wireguard-apple] Update SPDX-License-Identifier tags from
 GPL-2.0 to MIT
Date: Thu, 10 Dec 2020 15:54:12 -0800
Message-Id: <20201210235412.85721-1-ajstiles@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 14 Dec 2020 00:04:15 +0100
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

Signed-off-by: Adam Stiles <ajstiles@gmail.com>
---
 Sources/WireGuardApp/UI/macOS/View/highlighter.c | 2 +-
 Sources/WireGuardApp/UI/macOS/View/highlighter.h | 2 +-
 Sources/WireGuardKitC/key.c                      | 2 +-
 Sources/WireGuardKitC/key.h                      | 2 +-
 Sources/WireGuardKitC/x25519.c                   | 2 +-
 Sources/WireGuardKitGo/Makefile                  | 2 +-
 Sources/WireGuardKitGo/wireguard.h               | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.c b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
index e0d4e04..55fabfd 100644
--- a/Sources/WireGuardApp/UI/macOS/View/highlighter.c
+++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: MIT
 /*
  * Copyright (C) 2015-2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
diff --git a/Sources/WireGuardApp/UI/macOS/View/highlighter.h b/Sources/WireGuardApp/UI/macOS/View/highlighter.h
index 885db2d..8b86acb 100644
--- a/Sources/WireGuardApp/UI/macOS/View/highlighter.h
+++ b/Sources/WireGuardApp/UI/macOS/View/highlighter.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
diff --git a/Sources/WireGuardKitC/key.c b/Sources/WireGuardKitC/key.c
index 140f278..84e7f16 100644
--- a/Sources/WireGuardKitC/key.c
+++ b/Sources/WireGuardKitC/key.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: MIT
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
diff --git a/Sources/WireGuardKitC/key.h b/Sources/WireGuardKitC/key.h
index 149e4ed..5353ade 100644
--- a/Sources/WireGuardKitC/key.h
+++ b/Sources/WireGuardKitC/key.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
diff --git a/Sources/WireGuardKitC/x25519.c b/Sources/WireGuardKitC/x25519.c
index b77da0b..9ceed9f 100644
--- a/Sources/WireGuardKitC/x25519.c
+++ b/Sources/WireGuardKitC/x25519.c
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0+
+/* SPDX-License-Identifier: MIT+
  *
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  *
diff --git a/Sources/WireGuardKitGo/Makefile b/Sources/WireGuardKitGo/Makefile
index 767edbd..d59c61d 100644
--- a/Sources/WireGuardKitGo/Makefile
+++ b/Sources/WireGuardKitGo/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: MIT
 #
 # Copyright (C) 2018-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.

diff --git a/Sources/WireGuardKitGo/wireguard.h b/Sources/WireGuardKitGo/wireguard.h
index 9da8cef..8cefa49 100644
--- a/Sources/WireGuardKitGo/wireguard.h
+++ b/Sources/WireGuardKitGo/wireguard.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: MIT
  *
  * Copyright (C) 2018-2020 WireGuard LLC. All Rights Reserved.
  */
--
2.21.0

