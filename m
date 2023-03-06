Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FE9C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:58:07 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4321c57f;
	Mon, 6 Mar 2023 23:07:09 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5ecf1e27
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 21:03:49 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id ay18so6761509pfb.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 13:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678136628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGmtZmnDs5ASNE58FlHEoRflz4j5hRXcFcWdJp13C10=;
 b=EzJCZDBXCZQBtCcs+i2Sd8VIIl3ZxMoIHVX47PVzHkX/80N6AnpWho3ip+JfnBNkcU
 DRhP9WEmyqgTb7amsutb8jjVfZKWRhNRIMWGGgmyyhv9j8c2hrsORGdruJ0fVdMJWBgb
 54pxkz2GPiUV5Nqz4U8SiiVXj4uu2mBEyUAnWR30Zr73qhKA+PGvs3PHaehLzCVwJojn
 K7uwJxuujTPDCN0YMmOI2hZ+jbdZibY7uHOme+hcHCxERz8ZbNdHj1XJisFrX+r9OfRl
 rC3DrdZJO9MyRn7lS6cz6LFV2u5iTdJLlqy2n3bEQThJca7tcLrCPHdznlHVWZJn1WsI
 9e6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678136628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGmtZmnDs5ASNE58FlHEoRflz4j5hRXcFcWdJp13C10=;
 b=HYFBB0vq1jt/zkjEGvLUA1U5BwoEqL+7WjtaFYe/ZukHjqVm98IlsyeFGpx5/t1OUz
 xi2vGozeFa+cJbKrAsk2iqoEbY6qEaEI52izXWjSCiIkFUUB9MDawHM6JBgsZzsZkZDA
 VfuFRMLCXPH7YixoeItdz1chEKY7Bafb158ifJmt5bsY7M1kYfrYZyoyB0DhM9nOHme8
 gEI3wxa3Hqdgz/l3jZoClqsu9OBR1x8PUeXtT56+DGr3fvVjCHQtUwODCbtpY0FNWx8R
 dkvJZEzzw501eBVMkzQuSAiik+0aaCJ8wEH1FPobp8b3PD3bbkzWaD3XUyg2EOZPhFyO
 jOqg==
X-Gm-Message-State: AO0yUKXjdcth95NH6IRmtHKtL3iSKh4D9vq4qyGJttaY66CWWUo0fAnq
 mjEiQHvPvnc653OZUWn7XfE=
X-Google-Smtp-Source: AK7set9SgjU99y7UTZCA7R51uGEBr/FGuhsJ2xk/AqVt+5KthhS3T7GPuQ5t/T6C74NazCaB8bgX8g==
X-Received: by 2002:a62:844c:0:b0:5db:db1c:37f9 with SMTP id
 k73-20020a62844c000000b005dbdb1c37f9mr13680453pfd.10.1678136627797; 
 Mon, 06 Mar 2023 13:03:47 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 3-20020aa79143000000b005810c4286d6sm6706760pfi.0.2023.03.06.13.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:03:47 -0800 (PST)
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
Subject: [PATCH v2 2/4] wireguard: fix wg_cpumask_choose_online() if no
 further cpus set
Date: Tue,  7 Mar 2023 05:03:10 +0800
Message-Id: <20230306210312.2614988-3-vernon2gm@gmail.com>
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
 drivers/net/wireguard/queueing.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 583adb37ee1e..125284b346a7 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -106,7 +106,7 @@ static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
 {
 	unsigned int cpu = *stored_cpu, cpu_index, i;
 
-	if (unlikely(cpu == nr_cpumask_bits ||
+	if (unlikely(cpu >= nr_cpu_ids ||
 		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
 		cpu_index = id % cpumask_weight(cpu_online_mask);
 		cpu = cpumask_first(cpu_online_mask);
-- 
2.34.1

