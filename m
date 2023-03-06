Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7DCC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:10:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 823237ea;
	Mon, 6 Mar 2023 23:06:46 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5bb8eaff
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:07:08 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id ce7so6112969pfb.9
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678118827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IYGyvuAOKnVSJLZ+PGJAH4uPpRYGFdgKO1BedlDVykI=;
 b=Zj7QTr3bPQFGJWPCt6BL1facdE1H4EI1QpEm1JofidOKeFz4ftD78cpf9hnHm9rLKl
 60HkEtWjDPOTOPYqofUBcAh6SH3j6FgqnLg2nxUMJDt2J7rGc1km7N/0FC/42jzXDjnT
 IDW6yemF2a+OjQaOq9RsPNAQDLbAIyvxTSwwbAnnkSvcTaBmxCXXtVWVZ394+5XwzZtv
 LPfcUL4mOlfV8NjZgAvj8Xp6nbj1jj0PbhrszYycZcT4yQHQJ7Ct3ul0GpNzS+xqNWL1
 eHzBTJKltGbP6Yr8tV9Qk1jlymoXGchg3T8rpKwxr6qyO5wcQVgIeOyX5bfWBxNp0Hnp
 Il7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118827;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IYGyvuAOKnVSJLZ+PGJAH4uPpRYGFdgKO1BedlDVykI=;
 b=Lk6JUNgCaRtZkF+hyG5ehhoPJE2rWGWmz2KMbhdUrK5ywU0E/13kQm9fD0WrusJVxv
 F8WORAQjALl4YElXDD2I04oXduNg+lxUWLXScupgLGk4pBdPBwQuutwMezXvXoT9UDCT
 Msj21OJRvVxVkG+a5I2HeKPRw2McKK9KiEtVHVtbLXpPsnoIlPFN1s8j9uKfXSTNNw37
 zabI2728bvgnzK1ht/Y9UDMIUCR61b3+Wo3yrY/93wGjxbSqg9wnwLN0222h+un86lDC
 S4R8z2oMRSO6/PrY42kFT++B9K6rB9PXI8NIWlDLYWksuhNi3wyQzzoRIfw0uzHLwxv3
 57lQ==
X-Gm-Message-State: AO0yUKXAEOn85bMNHb8KrAftqtqS/87pazVQhgG0dNrTO0FlPchPkq2U
 p3xDjAIadijdPgC13GfT/g8=
X-Google-Smtp-Source: AK7set9FRJJ4bXIzCpqYTe8FRO5hxEPWPyG4KeJpbdnQ94eOSJ9cEuAei2kEStRQ6ROkgIXiyTXqbg==
X-Received: by 2002:a62:7b45:0:b0:5a9:b4eb:d262 with SMTP id
 w66-20020a627b45000000b005a9b4ebd262mr10996934pfc.1.1678118827070; 
 Mon, 06 Mar 2023 08:07:07 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa78386000000b005d35695a66csm6465318pfm.137.2023.03.06.08.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:07:06 -0800 (PST)
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
Subject: [PATCH 1/5] random: fix try_to_generate_entropy() if no further cpus
 set
Date: Tue,  7 Mar 2023 00:06:47 +0800
Message-Id: <20230306160651.2016767-2-vernon2gm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306160651.2016767-1-vernon2gm@gmail.com>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
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

After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
optimizations"), when NR_CPUS <= BITS_PER_LONG, small_cpumask_bits used
a macro instead of variable-sized for efficient.

If no further cpus set, the cpumask_next() returns small_cpumask_bits,
it must greater than or equal to nr_cpumask_bits, so fix it to correctly.

Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
---
 drivers/char/random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index ce3ccd172cc8..d76f12a5f74f 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -1311,7 +1311,7 @@ static void __cold try_to_generate_entropy(void)
 			/* Basic CPU round-robin, which avoids the current CPU. */
 			do {
 				cpu = cpumask_next(cpu, &timer_cpus);
-				if (cpu == nr_cpumask_bits)
+				if (cpu >= nr_cpumask_bits)
 					cpu = cpumask_first(&timer_cpus);
 			} while (cpu == smp_processor_id() && num_cpus > 1);
 
-- 
2.34.1

