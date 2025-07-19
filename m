Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47867C83F34
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Jul 2025 22:44:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aa87fe41;
	Sat, 19 Jul 2025 22:44:54 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d147798c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Jul 2025 22:44:53 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-75b5be236deso413274b3a.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Jul 2025 15:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752965091; x=1753569891; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MpAsf0u7qEqgOoCFSjCz2GmzUWqUwe0Q+8oQjkkFLnI=;
 b=caY1tMoHnkPpiL26A60Jdh0ElM7553BLN1haXFipNkUwhHMrdV6pCM0GDmJWhkKgQo
 xRikD9D3AfASLKjeg3Z5QhPZ0UGpJKjyTJsy3VmGKxSCgA8gXCSMfu02PXDzDu7Awwjf
 knioWTe4D8rGCcQvmymdHRMCOePqdNuabvnxF9Fl6nXMrUBet/99dnZFH2cDrbOfKXAR
 gpjU1b9TVyB92p2fJiH1aFbYtYEyc49DWA7SGc4E4H/Mtm075u1RA2HwPKFiSJcdBQJI
 HZEF+JhDTtE6seO68tf6PYCpM/TRiUni0Vaa9lHI/6p8MbmJds4ptubNOmvyHBaohj+K
 AUqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752965091; x=1753569891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MpAsf0u7qEqgOoCFSjCz2GmzUWqUwe0Q+8oQjkkFLnI=;
 b=YMoXOl7ZTczKND/LYeBotA8dPTNKP/v0liX+JxZ8nKGVanFY8T/Jxup0a9exwMFoOo
 pNiU++t2425jIYGWRtTsd92jhXWT61V6OVGNQzQM9oH6ue7IP3YU2yxVckLa1IwaBwTt
 x0O3iaaMhx6UMjOU2xqvofpeo8gHenxNgBLV8k6saYIr86o8sJjGtjHWMiA/yCtR7U7C
 tOBCiHSEyGKGbEmQSkNJxKl6BRhOCO8apFS183nWsZZRmGojLQF1iinI6nwQSqhRPmCU
 7JxQwTPyYEjeruEOF+AdFiU7IRFhZt9M0F3AtGYcU/UKmTZyBo3F/f+JYuxL3euT04dA
 CNpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpI7j73cq+mUOtSV4J4q/QFXcr70GSaNUw+2ldkHXR0jlUIfMGejmquFpjFn+4KQ8H0loPB9bN/Sk=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yw3MBtZpGFamUq37xqRhTznqTSzvqhX6ty5w8W17aLMuKRgngsU
 0pJWDogORapHq7gp9hIE2r2gzzDfkfy1biEYoFqOa9cI2lahNTKAXdg3
X-Gm-Gg: ASbGncv61JjtafDwr706mkJ0H4KQC+oanocZFiWZ6Wzn6Kh2YF/uHn6OKx8kILcg+LU
 wI4MCduDRqNuP4oG0njllI+4+VqarvteU7gi/eqx7IO0yIVQsAAEhtrlFIR/H7/TEn/j1NhHrhw
 HFCNCiiI56++ncA4TNkDy2y7JjFA7kmjS7TGxYrI1XHwEH3/KIJqpaBZB+dgedQjONz8ZwXT4g4
 sC0G7zqy38gmlk5BHBsoJKlLCBnvlvz2AUDIb7lVozKRjKL2Gm15aCfdbGkPpBJGxHRcITUZzL8
 hSj331e+63stOhZai4yI/sVrLnXMszjeFQND+O0OFPwYH1oMipw0Xqv80aeqiuk02EHll5+RXFr
 i+uZeIinEiccvFdDN2xqx4w==
X-Google-Smtp-Source: AGHT+IHcT8dNDaVuaPX3yRVrcUXr8thrmjlKHBv0UlcunqoXVQP9zrK9wnw3YGPrQjKRM87ibUguKg==
X-Received: by 2002:a05:6a00:460e:b0:748:de24:1ade with SMTP id
 d2e1a72fcca58-75722d62d06mr21940983b3a.7.1752965091327; 
 Sat, 19 Jul 2025 15:44:51 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb67900fsm3327079b3a.101.2025.07.19.15.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:44:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH v2 1/2] wireguard: queueing: simplify wg_cpumask_next_online()
Date: Sat, 19 Jul 2025 18:44:42 -0400
Message-ID: <20250719224444.411074-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250719224444.411074-1-yury.norov@gmail.com>
References: <20250719224444.411074-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>

wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
function significantly simpler. While there, fix opencoded cpu_online()
too.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/net/wireguard/queueing.h | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 7eb76724b3ed..56314f98b6ba 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 
 static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
 {
-	unsigned int cpu = *stored_cpu, cpu_index, i;
+	unsigned int cpu = *stored_cpu;
+
+	if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
+		cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
 
-	if (unlikely(cpu >= nr_cpu_ids ||
-		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
-		cpu_index = id % cpumask_weight(cpu_online_mask);
-		cpu = cpumask_first(cpu_online_mask);
-		for (i = 0; i < cpu_index; ++i)
-			cpu = cpumask_next(cpu, cpu_online_mask);
-		*stored_cpu = cpu;
-	}
 	return cpu;
 }
 
-- 
2.43.0

