Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D962C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Mar 2023 00:06:00 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e9d75b0;
	Mon, 6 Mar 2023 23:07:13 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6d0217de
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 21:03:59 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so14447809pjb.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 13:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678136637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z+JZSTuFczC5mo7PEY3yBvoy/91ay9ZlZhiG7/0/jdU=;
 b=J0G/0FbeicKyFQgCtYlOOk4T3oRqyNdGAmPLsHhC+AQzhfqNm09l3mAHs8IQpeDEK5
 tXW5R82OI7u7bhUdeK8PTTb/Xa9tmNRW7An5ryNY/VlLVIorS/f6VDFNRkHmqPkgNexd
 2V3nsdCrTizVcd32Nzq54QHft2pumYH/7g99jp8KyqObk62dxUAhMUOvzYwk4eHeaqYi
 mFS8sQLnUlwEgOfm+7KQW3KulkPpElt6qFYGnOKeiXEHNGxbOKze1nQsgpi92CJ1qwSo
 3KKUgdfecQl+4WpkS+onsXDqnrl4hRx53yIXhebFwMkVPogmwvrypbhF/nK3UGyGfLIU
 dnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678136637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+JZSTuFczC5mo7PEY3yBvoy/91ay9ZlZhiG7/0/jdU=;
 b=4mkyUwwnFQLomhvbNuw0sZy1ppxRGLzsLlDKnscXpjw6YTo3yMzjSys5DAnCW2IS1+
 okwEuATi1l/KYzTjq1ZDQgRC2bw25qdBk2ViSWrDGntps3xSaPPi8uhUoF0d2egncyry
 JqSq/OwbCzgUZQnbiMHbaSW/tvAQDt/gWjXMgvJ7WGunKbfwaVtrIgBdwAP+bptl7r3Q
 h9aR+XF/ZK9DxIC9W38etXVT7TrAPS7bek5LHL9JMgZfWgFgJHRPapm2ASyHSucRzwDw
 G92ziOVT3tiowedzLQmHWYOXFOoRWstFU0cTO9pmsMmTgfN0HV4F3yJMo0GyC4oxPjd7
 JM1w==
X-Gm-Message-State: AO0yUKUV8uxZB3f1ry3MMKKrxFSz2nRUtULSMrr7I8gJ+ceMXHCEz8+K
 8Pqlfukna+t9BL6GF/yV58o=
X-Google-Smtp-Source: AK7set9bJ+RZpctLL9LNRn8+W3MRhstsXchoF/02mRPZgh29TAeFmlavfd29dFchZTN62FY8teR5EQ==
X-Received: by 2002:a05:6a20:394f:b0:bc:8254:ddff with SMTP id
 r15-20020a056a20394f00b000bc8254ddffmr15220080pzg.1.1678136637715; 
 Mon, 06 Mar 2023 13:03:57 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 3-20020aa79143000000b005810c4286d6sm6706760pfi.0.2023.03.06.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 13:03:57 -0800 (PST)
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
Subject: [PATCH v2 4/4] scsi: lpfc: fix lpfc_nvmet_setup_io_context() if no
 further cpus set
Date: Tue,  7 Mar 2023 05:03:12 +0800
Message-Id: <20230306210312.2614988-5-vernon2gm@gmail.com>
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

