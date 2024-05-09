Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4BEC25B77
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 May 2024 20:04:06 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80ac5931;
	Thu, 9 May 2024 20:04:04 +0000 (UTC)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [2607:f8b0:4864:20::449])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0389807c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 9 May 2024 20:04:01 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-6f49fc7b5e6so1347887b3a.3
 for <wireguard@lists.zx2c4.com>; Thu, 09 May 2024 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715285040; x=1715889840; darn=lists.zx2c4.com;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=QQBoWhnW3eSJL5OjfxzO0lzEIXAyAkfzlFMU1Ex8yOg=;
 b=4IPb2plYvtRq2CoX5madgYu0NaqO6MxAXCVydOgwINpg+TzZdClDL0vLMkOvNdNwHz
 xz8ojSxWTz3LgqVroikq0r/1GIbGw5cb2L4n35wYLV9Tu1Yf9xPMZutYziFjuMf8RkEW
 EPO5fQec+rtlEThzhAjOx3TMKCELxM8Qn6yjoXfA4w5NWtwzzTiiCVnBoMs2k7hF6rz/
 FLhhuvFKbK5lsfkL8tyet7ZfyRENeCcMNmLX9AzgLD85m/w+Epzs37IsBu6FPLZm+fo6
 46BOMJdXCVow8VqQIzx4VpUVDGbggsVLF++dpqQ9k1utiF+3QBxttSxiq+e9dou3aZNM
 MfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715285040; x=1715889840;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QQBoWhnW3eSJL5OjfxzO0lzEIXAyAkfzlFMU1Ex8yOg=;
 b=JoUfXEV2knKBufrsTsZcHHb/Tdul5lrPV+QS+gxhZongyUwNRkFlPoEfmILqZE1Ncx
 5J2MnsmViGaSbhVq4IhFkRXuC7h8A/H3vqPpZbQIESRnyrmouaiIrO7qaNf8aMOl29pF
 cKYKhLe3Xv8hOQ61wdjiP2JdEzcbOf6D9AfjW/nfWyEb7XYqPmfmLt36sCc7bulJ/+DS
 cv8p3nAERd8f1SKXGqckftK9XpBWiR0Wcy2kVRxtjF55X50FmUf1XGtBiyE3GxOFAvZw
 CWwh8Mq8vvNLrJHO6lj9COOySG1NYkOkPBHSUdYcDoRVl5j3bpBbLtF9RkPUCacmnbFY
 ZOcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlZzD415v6exWEtCRiBiiRbvxTzE3WtGY7J8/pK4P01K8rXkfNaaEYSonJj6QSE1ipE7nnO6UBysgKhCV9gqulaH3taiJGhLpx
X-Gm-Message-State: AOJu0Yx06jXZw1TiTwz2QWpuGutmeVGl2SbjoJZxo8Wyy0hZcUPjMHzl
 kyCOa4u0W0/Msp8pY6pmin8/xQPTv85+v1sUlPBxnYMHOcVzk3341WP790V3A3QXnm7LiWjmGeo
 Ulw==
X-Google-Smtp-Source: AGHT+IHMhChQUGH3o/y/Xjd523PA1kFSsocfDFneSTYQRZIsze/kEjlVNH96NGo8Y5vnkXmCBqnyZyOLRsw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a91:b0:6f4:d079:bb24 with SMTP id
 d2e1a72fcca58-6f4e0296acamr10866b3a.1.1715285039543; Thu, 09 May 2024
 13:03:59 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:59 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-68-edliaw@google.com>
Subject: [PATCH v3 67/68] selftests/wireguard: Drop define _GNU_SOURCE
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
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 kernel-team@android.com, linux-security-module@vger.kernel.org, 
 netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
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

