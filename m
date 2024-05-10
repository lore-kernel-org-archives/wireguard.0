Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1717EC10F1A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 May 2024 00:12:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57368cea;
	Fri, 10 May 2024 00:12:13 +0000 (UTC)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f1686c3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 May 2024 00:12:10 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-6f452eb2108so1205140b3a.0
 for <wireguard@lists.zx2c4.com>; Thu, 09 May 2024 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715299928; x=1715904728; darn=lists.zx2c4.com;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uRjTqL5jZBxzwk8RtqE4pMuTf8/KsRch8ACUgOLR1L4=;
 b=hZw1XrG3U7A1GvaYUPfcwEugAVewvhbygHeItx87IRAKtOfjW29T+PANMkhuQ27bIJ
 Dln0mmFevWQ1N7ktElXwZi5QWkqecVoeXiCtfk8ZvSSVfdjsnkJnBOXwuBfZ3SnyHFID
 Q2h3xBU4C/KRwxwWCMbt36keSz+HfPbUPZdCcOUu/OFEpdP6yfi/QV3P3qxX4kcaR9cD
 gk7H+oBtoPnJ9VEfKPK/vXXlKq7VsOKgGsol7ESJiY2nmLuxzK1D4S8tikp/C4rvZ6Xt
 +uFsKMtYPELtXSldll5BcgZpeTmHxlJ4hFT0UpS09pt1x6R2u+MsA0XvCuu3nrMKW1ux
 wVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715299928; x=1715904728;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uRjTqL5jZBxzwk8RtqE4pMuTf8/KsRch8ACUgOLR1L4=;
 b=bABQpWaQzXLQzs5a7khC7FdBlmN/jD+tuq9zdpXMejU5chxjxWA8IkftNiuOyO824T
 Ek4lA1Eo2DxapmruP6R0+N5w0zgc4Boh3XgDUaxNn0sxz4KvGltbgwXMCAwdKpn1KEOh
 /CdSYSYTwLgJA8L7d+kCe3dDpmfvhE3TH0Ss9WvcgYB97zboR2WBZUgaA3fEcmKVB8FG
 pUHHcu1JoBvAzHS+P6Ier1YCsE2vDdQ6TvcZHtXUQMfMxJi69nVwysGb4S4w+lxVNgdd
 I/4344v6+RzIe276Ge3ieJ335n82sXcnKNsbvcM1xLrPpphhKVHDj/+WRLT34OijHLJL
 SfEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv8ywT8DDo7qCzS541oATzOlZxs6b1vtPg+dpOJ6B8r0IbSwpAXOPdOCw2W2BTocKepAEHuYZcHgL5d6C6uVbX1OjzKIzk3atv
X-Gm-Message-State: AOJu0YxEqTXnQHRbwfkKs1RRgTZWuSxtZCRZlaX6wqkmTwyoGD95+EFz
 1fywjOPCKhtAgSVDk5Y3okDUJrOHTaE2djpOk7BVpRNd66O6LWtv6laiZzmoi2XvLtHrscO+7eO
 EpA==
X-Google-Smtp-Source: AGHT+IGSF9WzQWuvr2wMEGyozUQO7K9UVp16MtXq9kPeGzg8zdiMSf7txQHGnyzqkIc1hkialPRFYFdBrZE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:8c82:b0:6ea:df4b:86d0 with SMTP id
 d2e1a72fcca58-6f4c91f346dmr13199b3a.2.1715299928188; Thu, 09 May 2024
 17:12:08 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:22 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-66-edliaw@google.com>
Subject: [PATCH v4 65/66] selftests/wireguard: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org,
 "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
 "=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
 wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/wireguard/qemu/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e..08113f3c6189 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
-
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog

