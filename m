Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F07C6FD1B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:10:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0321c996;
	Mon, 6 Mar 2023 23:06:48 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 542d7e54
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:07:14 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id z11so6135493pfh.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678118832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eWkkRYesFCW1vKhYnmJIj+4iqGRi3O7KEL7awX6yNM8=;
 b=XNmq2vb+s4SPKfaOPFyH3zvSWiAUbROWktuZtoU0JF3A/gglCpc7UXrWSG+QHoNpbn
 YJ+BQnVJFkJ/YGvCqa9kUlXgP2DWxU1va6Jywh2WhlpDhx8ruLRavj8XiKaI1SqI0Z0U
 N5Lgcf3fhBJ8Ork9Uxu84A5j20i2diwSljtefxgf289szP4db5lCtOu6uipJBLfpLz+V
 1yh00sWscLWELgqZAfoIJFsrv+oB+0rFmv5tKP+PBZJl2Lk1Fen/cfQ9W9l942v+BHQf
 Y5JlQWXvpJtfbHhfmL7UEmlpK8wlXNgNztZzoJuhrT2zAvI+Dyt9LV2nTvHMSeYZzdtT
 RNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678118832;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eWkkRYesFCW1vKhYnmJIj+4iqGRi3O7KEL7awX6yNM8=;
 b=CjVSBVrBywX3vUGNUq6A3btVJDnosJYd51m3xCet67J0rfmPCOVVzIdTSUahrnC+GJ
 5SMkxDbTJ2OFE6tnX+cXioIgQbJbiTxLHYAe7bgs2+b4rPDv3l2bgHfvabShcsNNoY3r
 2CkfPudLCOyfHack3/lztICB7Y5pC9qleuXkHHAaotclnOLAZ4kZ9ecn9piDUwn0oobk
 UwABti3Zf/LUjwk+k8DAjgPf8v4qUhNaUmKw/yzZfREIJNah/IjcLqTCwtj73oprNI87
 mijXpHvcNjRunZD6PC3CUs7QcayVURRUkBGF1HmmT83+Eb0hWyk7srcOvarczn2CwqBT
 GXeQ==
X-Gm-Message-State: AO0yUKUpj1+5zMjYq51sOVV9LU2ma4obvIsrvmVmxdeQ/JUiui/TN33d
 PiPYPpQc9dIIEa7uml3179k=
X-Google-Smtp-Source: AK7set/jXyku28q+ivaz+ryE2alL97ENe0rhsGlfLmALivyk2C0qphcGmohIX43LtAVrDFFmgh+SZA==
X-Received: by 2002:a62:1dd0:0:b0:590:7616:41eb with SMTP id
 d199-20020a621dd0000000b00590761641ebmr10105161pfd.30.1678118832374; 
 Mon, 06 Mar 2023 08:07:12 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 u6-20020aa78386000000b005d35695a66csm6465318pfm.137.2023.03.06.08.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:07:12 -0800 (PST)
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
Subject: [PATCH 2/5] wireguard: fix wg_cpumask_choose_online() if no further
 cpus set
Date: Tue,  7 Mar 2023 00:06:48 +0800
Message-Id: <20230306160651.2016767-3-vernon2gm@gmail.com>
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
 drivers/net/wireguard/queueing.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 583adb37ee1e..41adeac3ee0b 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -106,7 +106,7 @@ static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
 {
 	unsigned int cpu = *stored_cpu, cpu_index, i;
 
-	if (unlikely(cpu == nr_cpumask_bits ||
+	if (unlikely(cpu >= nr_cpumask_bits ||
 		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
 		cpu_index = id % cpumask_weight(cpu_online_mask);
 		cpu = cpumask_first(cpu_online_mask);
-- 
2.34.1

