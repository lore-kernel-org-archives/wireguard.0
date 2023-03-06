Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AB3C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:10:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75b164b2;
	Mon, 6 Mar 2023 23:06:49 +0000 (UTC)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ea12c0f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:07:19 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id d10so5840734pgt.12
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678118837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0XbTdGx8oMSPf4HhkoZWFz5gkpw9U1/T7K2pkx4Uby0=;
 b=HCcypDFK1luKyH1bpbMwsp4hGVlhmqhx0nRiDUE3c9URKzHNGcGgNyJ1GaULDEvMYk
 POWZs5eOaE9H+aslwyE1lAPZoeZZU5/L6T7PF+PlUep88mKPPTEebkxhFBpLnJZG++3R
 Pis2YFyewXeweKeyZXanrk0LCriI8qCTykUNVkeDSLNzEJrdAC1Q+LT2zK0vDRY+PAGV
 clL3lEUfg4J4I6rjjZ722a/NCh28ofIydxk8yylaVZeec1hS090k3GL4cDnVZ+r3m4mQ
 aGR6FbB3eTxg26bwspyksc+PkJCm1W0yNiw331P3BnJENH+UG04LwDZSUSOR36ZytOR1
 HJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0XbTdGx8oMSPf4HhkoZWFz5gkpw9U1/T7K2pkx4Uby0=;
 b=LU+/sqLgZsGl+yGJmxUX3pZpGItiFpBh3J8i3pd0MzXDZjQ1DAQj4YnxIsrMalKiUG
 R8qLj51Zh04HGAreCW19owH8Tmn7FhTIA6mDnJfb5W80IxyXUys3iHetlR1liZDBA4qY
 MRTap91B80C4IFiOnbuG7kVj4AiQy2X21kDE4NDhjcn1NZoo6jwEBboH0w4FWkrdbV13
 XBvBl3i4OEfA8LY0+e/pl3MQuO4PwOi6TflNpD35bQ95CWFyVq30rN+x2egJ9LfrN7be
 cdlXB7x4NJaDBPn+k9mvYgb68BHphKGp5bm6ta44qd2mLUeRhE9XAV6U9FtSGzBwYNE+
 pigQ==
X-Gm-Message-State: AO0yUKU2OOme8Jog/ay65QaE8Nkw4/lxz/uOdzzyGrONeE0tmEA/f7I6
 8RZVIptO/qGd6g4JMOOC/cvToWfaHsgBuw==
X-Google-Smtp-Source: AK7set+tQVdHJh4e+PqliYudDb3ddl76u0In93Ak366TBVp36ZG0/TpUrXOnnQYXS7peWeuLObbsvQ==
X-Received: by 2002:a05:6a00:2d28:b0:5a8:4ae7:25d5 with SMTP id
 fa40-20020a056a002d2800b005a84ae725d5mr17256165pfb.8.1678118837403; 
 Mon, 06 Mar 2023 08:07:17 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa78386000000b005d35695a66csm6465318pfm.137.2023.03.06.08.07.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:07:17 -0800 (PST)
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
Subject: [PATCH 3/5] scsi: lpfc: fix lpfc_cpu_affinity_check() if no further
 cpus set
Date: Tue,  7 Mar 2023 00:06:49 +0800
Message-Id: <20230306160651.2016767-4-vernon2gm@gmail.com>
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
 drivers/scsi/lpfc/lpfc_init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 61958a24a43d..01c0e2f47cf7 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -12563,7 +12563,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 					goto found_same;
 				new_cpu = cpumask_next(
 					new_cpu, cpu_present_mask);
-				if (new_cpu == nr_cpumask_bits)
+				if (new_cpu >= nr_cpumask_bits)
 					new_cpu = first_cpu;
 			}
 			/* At this point, we leave the CPU as unassigned */
@@ -12577,7 +12577,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 			 * selecting the same IRQ.
 			 */
 			start_cpu = cpumask_next(new_cpu, cpu_present_mask);
-			if (start_cpu == nr_cpumask_bits)
+			if (start_cpu >= nr_cpumask_bits)
 				start_cpu = first_cpu;
 
 			lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
@@ -12613,7 +12613,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 					goto found_any;
 				new_cpu = cpumask_next(
 					new_cpu, cpu_present_mask);
-				if (new_cpu == nr_cpumask_bits)
+				if (new_cpu >= nr_cpumask_bits)
 					new_cpu = first_cpu;
 			}
 			/* We should never leave an entry unassigned */
@@ -12631,7 +12631,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 			 * selecting the same IRQ.
 			 */
 			start_cpu = cpumask_next(new_cpu, cpu_present_mask);
-			if (start_cpu == nr_cpumask_bits)
+			if (start_cpu >= nr_cpumask_bits)
 				start_cpu = first_cpu;
 
 			lpfc_printf_log(phba, KERN_INFO, LOG_INIT,
@@ -12704,7 +12704,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 				goto found_hdwq;
 			}
 			new_cpu = cpumask_next(new_cpu, cpu_present_mask);
-			if (new_cpu == nr_cpumask_bits)
+			if (new_cpu >= nr_cpumask_bits)
 				new_cpu = first_cpu;
 		}
 
@@ -12719,7 +12719,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
 				goto found_hdwq;
 
 			new_cpu = cpumask_next(new_cpu, cpu_present_mask);
-			if (new_cpu == nr_cpumask_bits)
+			if (new_cpu >= nr_cpumask_bits)
 				new_cpu = first_cpu;
 		}
 
@@ -12730,7 +12730,7 @@ lpfc_cpu_affinity_check(struct lpfc_hba *phba, int vectors)
  found_hdwq:
 		/* We found an available entry, copy the IRQ info */
 		start_cpu = cpumask_next(new_cpu, cpu_present_mask);
-		if (start_cpu == nr_cpumask_bits)
+		if (start_cpu >= nr_cpumask_bits)
 			start_cpu = first_cpu;
 		cpup->hdwq = new_cpup->hdwq;
  logit:
-- 
2.34.1

