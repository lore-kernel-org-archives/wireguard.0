Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAF4C6FD1E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:10:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa6eefba;
	Mon, 6 Mar 2023 23:06:50 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a059ddc3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:07:24 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 me6-20020a17090b17c600b0023816b0c7ceso13644451pjb.2
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678118843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DGQdrsotz8W8EizOYEyX2DBff0cLsAl7IvbnLHf+bg=;
 b=nXoibcR7ByMCQICFh5RhNYtLXdctMhTA+mzKcFRnYoLe927/eL+h0tzDLTd0dnKoT0
 Z3z05jUPKUt4emgJ2q/iGj/eZsyitdS6TXa8ihVDkWpV5/onJknq0FNf2pphCFSu+Hui
 bfptA7x0gTIXK959Q7/8biA0Vay9WSDh5KGaN/pBGNJ4AwT+lqKhbtwJOumDaShaudGH
 eK3XnWbpdhfZ94ConuZv+3ifSNIUkwJtJW+K4hV2030YfNY2qXypG3VI4bApQIEQmMeI
 +blufCszN17pGg/ZQbNZPcgOJn42gOhr8krF48cXhsPkmWGitk3GARXgsrXa8ghyVQzo
 cI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118843;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DGQdrsotz8W8EizOYEyX2DBff0cLsAl7IvbnLHf+bg=;
 b=CStFk+So63cJx+L0+5z4wKmpOBd+IFAsTiDiJ5YHrFrA3OBNEyYs2VoLCJ6L5AGPRI
 NZpsF250o8WvyryKX+N9/Sxh+cfSYKNoRWJkn1f565fJTXr4mR6TdyZEjo4Cy32mu2Ov
 rzvkBztuisuTz9KEOBtTOE+f9ha3MsIkcXItQhyZpYtZ4nNUIIz0bXaPQgOmbKe4d95+
 h/Z0u5Te5hqYxB5lC5yuT12o8vbL66JXxF3zvUohDahxX16oKC85zS72hqhJgj2/OAmI
 SFo2Soj+LqNMl5zYKkT+oU6uSdgvAlWfKP2VuI89sRnAPT8vU95uH7ZysUZhqG6YR2XY
 Gj1g==
X-Gm-Message-State: AO0yUKU3WeTRL02+RttW3l8c0VJw5zIF5ox4y7bNceQVyxOvOSP5ot3p
 0ZWrd4ZvOSSxyF8PI3xYbBg=
X-Google-Smtp-Source: AK7set/tMWsOQQEdPjLWbhhz2SNcZHDm9AMA47AGQ9t0MP6KYTtdnCDlPd0/4DIKsgVEc6b4smPKLA==
X-Received: by 2002:a05:6a20:a10b:b0:c7:1da3:e3a with SMTP id
 q11-20020a056a20a10b00b000c71da30e3amr13357543pzk.16.1678118842755; 
 Mon, 06 Mar 2023 08:07:22 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa78386000000b005d35695a66csm6465318pfm.137.2023.03.06.08.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:07:22 -0800 (PST)
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
Subject: [PATCH 4/5] scsi: lpfc: fix lpfc_nvmet_setup_io_context() if no
 further cpus set
Date: Tue,  7 Mar 2023 00:06:50 +0800
Message-Id: <20230306160651.2016767-5-vernon2gm@gmail.com>
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
 drivers/scsi/lpfc/lpfc_nvmet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvmet.c b/drivers/scsi/lpfc/lpfc_nvmet.c
index 7517dd55fe91..3ae7f330f827 100644
--- a/drivers/scsi/lpfc/lpfc_nvmet.c
+++ b/drivers/scsi/lpfc/lpfc_nvmet.c
@@ -1621,7 +1621,7 @@ lpfc_nvmet_setup_io_context(struct lpfc_hba *phba)
 			continue;
 		}
 		cpu = cpumask_next(cpu, cpu_present_mask);
-		if (cpu == nr_cpu_ids)
+		if (cpu >= nr_cpu_ids)
 			cpu = cpumask_first(cpu_present_mask);
 
 	}
-- 
2.34.1

