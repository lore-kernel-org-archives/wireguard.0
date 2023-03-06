Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D2EC64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:37:14 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 885982ed;
	Mon, 6 Mar 2023 23:07:03 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 67649b47
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 20:47:53 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id ay18so6732294pfb.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 12:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678135672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohhBlm5/EvdaRANIY+/17hlHt7n4eAlMQRKCzUzJefs=;
 b=P9VGVXIw6J51iOQeGUMdlchyu9nMT+CJXhCGQt5j0A3EMcsN9uwA+ikRPkdjw/loKH
 32Mgu+nPV0wqlP8lBPfETTy9cIvJXNdzA/PRaRLJ9cOuURQpNM3tnNfbMRnh0CQpnzwX
 Twu30sMOpTzjtgBep+klHkWeG1VgaBxPxapwBJt57r/FE9G1mjZbX2cMfgoD+LCn8PGz
 DsUVAC9dZggw9ZhlOygRzfLR1C0/dxVRb+NyH9gzP9jg5+Bt2z/SdLk7bnVvXWOWfjow
 vDs6MxWlMkw3lCOqt4AJKJsHwlfHCoBydyRPwn9tzGk7j5tVgjG8Jkec0aarUwYqhMMv
 XITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678135672;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohhBlm5/EvdaRANIY+/17hlHt7n4eAlMQRKCzUzJefs=;
 b=yS/D/k+sumQCXUQmYIQN26Wj2/Y+6Z77QwEKhPo7DPraj36Ic/lVFUOqtbeEdZeuQh
 RPqoy5N3cqCm+3r0PXZZyXh2Mw17PFKh9qvQskyuxHY+p80CKO9UYpsWxhhYuOZneJ2I
 X7Ko8WFkHAty2ydvYcvN9I97OsyEZVm3315/3ukNJ9oQ5qN2bNK26SiRQtqb4HzFA8pn
 KOpBCZJFGdPlSqE8ULd1ZmmChVstg2lL9DurU1hRfcdH+FV7pb4nNBo4cIA/Msv/i2sw
 bcTDjH4xmiHqGp3WpeptCABv2ItT4DEwg5uocLTmTvZc0wp1btptWEMDHAqGKor7dqbB
 wBtA==
X-Gm-Message-State: AO0yUKXvU+YZRSlV4IbpjZFEmLn/N+DfYBqs3T86tbkcj0IBC9gA2j+m
 wE8yBedoBLVMnyafc+zeM0E=
X-Google-Smtp-Source: AK7set9iSDUiwRSSU+iAktisKbnMBWUM4GX842oxXYu7f5iOPfLRWS9DR+Fg3gD6eN2AelR9p6vmtA==
X-Received: by 2002:a62:3814:0:b0:5a9:c533:3c06 with SMTP id
 f20-20020a623814000000b005a9c5333c06mr9912111pfa.14.1678135672104; 
 Mon, 06 Mar 2023 12:47:52 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 e23-20020aa78c57000000b005a75d85c0c7sm6699772pfd.51.2023.03.06.12.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:47:51 -0800 (PST)
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
Date: Tue,  7 Mar 2023 04:47:20 +0800
Message-Id: <20230306204723.2584724-2-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306204723.2584724-1-vernon2gm@gmail.com>
References: <20230306204723.2584724-1-vernon2gm@gmail.com>
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

