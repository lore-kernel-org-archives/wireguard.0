Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A799DC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:45:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff2e9f3b;
	Mon, 6 Mar 2023 23:07:05 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31c64ec7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 20:47:58 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so14407696pjb.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 12:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678135676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MGmtZmnDs5ASNE58FlHEoRflz4j5hRXcFcWdJp13C10=;
 b=qYRs34Gk9hUvTs5ooXKPKoymdDDp1qyJBx1E+sIY2JvW1s22DJk2X7y1vFmfMeNrya
 jjiZs95ll3Deo94LJL0MIxxSzm3AWRXtvMwqww3eAIRMZv1we4kFFe5CoNGogyjud4lu
 pXxem8c/aN7PvEOkXxjWSMGHwMbKX563gMIWEEC8S196B2+ltQLn/Qz0WDJ+GiwYyu4/
 v7TN1sQjBcS/3bHO/fl8LNr5VGX4MBH5kONmDgLJUmrWf5YzB0akr/Oq91jAVYUCyxPi
 Lo/fnlVTqlRZPMUY2RyW7pa2rGqTEbKBIuL4RiQYRZ9a6C+RYptbZSpYXQaxMI9QmYTH
 ru9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678135676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGmtZmnDs5ASNE58FlHEoRflz4j5hRXcFcWdJp13C10=;
 b=qGypaW8EowrKea+y2dOuSA53NWMiMuq8BQvYhgncMRyIOzqc0srcGeT1fDp3kX7dU5
 JP34hC2iatStxCsice5fjMwnhPMJwvzpz8mX6VUuYoEghPOZT6H0wlPq7iDQ6NOL716e
 wc5hX9NsW6xacZJBwErK6zU1zxskfZYeeFXxo6jvEHfS4YuYAngmKKpWMpkgbyzVazqy
 z+l2GdfZEpby2OhcCYmOEjq0Vt25j81xpvfBIADjmVcaA2/mjKaRgVkuRQUXNLz4OdEQ
 SoRajOPvgWAPOFTZrulxatV2l6CY0NwXUkh0NHetQGIMOZ7gDPdI1I/oOMbaSHao8ta1
 SJvQ==
X-Gm-Message-State: AO0yUKVdXhCeVmXvVMyQhmhVmvcb6ggVIschFgNAAp/6gi1nf/Ngc8Ck
 wccR92wV5cFfEhfxFfLzvdk=
X-Google-Smtp-Source: AK7set/FIMLWtnvm1jz8Ak/Nanv3uUTjVLkFSHhdcorkKHDqQ6eoh1Z+NIyFSpqTUVyNVTkxCTNMkA==
X-Received: by 2002:a05:6a20:1e61:b0:cb:a0e3:4598 with SMTP id
 cy33-20020a056a201e6100b000cba0e34598mr11460370pzb.43.1678135676488; 
 Mon, 06 Mar 2023 12:47:56 -0800 (PST)
Received: from vernon-pc.. ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 e23-20020aa78c57000000b005a75d85c0c7sm6699772pfd.51.2023.03.06.12.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:47:56 -0800 (PST)
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
Date: Tue,  7 Mar 2023 04:47:21 +0800
Message-Id: <20230306204723.2584724-3-vernon2gm@gmail.com>
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

