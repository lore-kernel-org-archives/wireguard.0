Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4777AC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:54:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4db7d0a;
	Mon, 6 Mar 2023 23:07:07 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d32d259b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 21:03:44 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 132so6380055pgh.13
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678136622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohhBlm5/EvdaRANIY+/17hlHt7n4eAlMQRKCzUzJefs=;
 b=jddwh84zwUpSQuatvj4c7Dpgl/B68lIc/yasenGO6pdLPdPi5mYHxG8eXh62Yz++wr
 64vwB8kutOmKeAyu9i2kM3ICs828b7TCLH1GK0jUbMwkeQbvl0Ii8ptdMYZhXHMuzIPL
 V+3uMHRGAOPTgIkB94ykDqXF8VeLLXqH/ZMXQi8Ve4saIO0PImMGq3bxlmzsZFS15pQG
 NoIWQlxj3IqaCV7yHbxIrQ0fa/vPWBV4XKjFE5PjiYzL8MaaZyakd/MKhl/WaZ1C7mch
 4IobHwykjv/5tIFUOenW8tcEBFDD+ZAL/zwr9gNMnLbPmDRDzCnw+cfg89CxNO266///
 ye2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678136622;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohhBlm5/EvdaRANIY+/17hlHt7n4eAlMQRKCzUzJefs=;
 b=Wr86lJ7aJh9kqEAKLTzZdnQ/HiAqWKna+roO9ET/SQlQDbBiRBAQk7jARfEki7J6cC
 Q4ml9tOp4BCU6Lh31T21ZvBvks3Zl8HAj0GfVa/cFlPLR7obKIbDv4+kDHjRYKhh4/23
 izoh9EcOaOalKR8HSdplZngCIe6EmFqea7xMfdNK3v5L3OsUajAC/bgU1ppMu18k0VXu
 5JjlOBlpuvWizVskMeTSWNolHriBN2wHGCcbat8BfSHDOVyqb888kW0UDFrihLMbUOPk
 V+2SFdNl1c/LpZjJcEkGL4zrxntTbCbfxMmd272Sw13UHaiRjBUbpIHJdneihwNLmwqS
 qMlw==
X-Gm-Message-State: AO0yUKUHTogExKhlTeQfIWafILjS2mxg2mYu66Nhr7u+EkmgvgAtUrhP
 KXZ0x88CGGn3+o6zTUDw6Mg=
X-Google-Smtp-Source: AK7set9C+GX1uA5tZkGP2zTQMIs94EYIBwyVaiOu7iZSR8QoXhcin7YC0GzM7XQYnpJ1bW1BZLgToQ==
X-Received: by 2002:a62:5105:0:b0:593:ed9c:9f07 with SMTP id
 f5-20020a625105000000b00593ed9c9f07mr11960629pfb.27.1678136622631; 
 Mon, 06 Mar 2023 13:03:42 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 3-20020aa79143000000b005810c4286d6sm6706760pfi.0.2023.03.06.13.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:03:42 -0800 (PST)
From: Vernon Yang <vernon2gm@gmail.com>
To: torvalds@linux-foundation.org, tytso@mit.edu, Jason@zx2c4.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, james.smart@broadcom.com,
 dick.kennedy@broadcom.com
Cc: linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org,
 Vernon Yang <vernon2gm@gmail.com>
Subject: [PATCH v2 1/4] random: fix try_to_generate_entropy() if no further
 cpus set
Date: Tue,  7 Mar 2023 05:03:09 +0800
Message-Id: <20230306210312.2614988-2-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306210312.2614988-1-vernon2gm@gmail.com>
References: <20230306210312.2614988-1-vernon2gm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 23:06:36 +0000
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

When cpumask_next() the return value is greater than or equal to
nr_cpu_ids, it indicates invalid.

Before commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations"), when cpumask_next() returned an invalid cpu, the driver
used the judgment equal to nr_cpu_ids to indicate the invalid cpu, so it
happened to work normally, but this is the wrong approach.

After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations"), these incorrect practices actively buggy, so fix it to
correctly.

Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
---
 drivers/char/random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index ce3ccd172cc8..253f2ddb8913 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1311,7 +1311,7 @@ static void __cold try_to_generate_entropy(void)
 			/* Basic CPU round-robin, which avoids the current CPU. */
 			do {
 				cpu = cpumask_next(cpu, &timer_cpus);
-				if (cpu == nr_cpumask_bits)
+				if (cpu >= nr_cpu_ids)
 					cpu = cpumask_first(&timer_cpus);
 			} while (cpu == smp_processor_id() && num_cpus > 1);
 
-- 
2.34.1

