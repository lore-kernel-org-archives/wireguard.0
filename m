Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E832C7115B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Jun 2025 14:55:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7aae205;
	Thu, 19 Jun 2025 14:55:08 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad84ff78
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Jun 2025 14:55:07 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-3141b84bf65so776631a91.1
 for <wireguard@lists.zx2c4.com>; Thu, 19 Jun 2025 07:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750344905; x=1750949705; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fCc8wvcGt1Bzj1+8h/7it2Sg3YOCUwTqtEA7c0OIsck=;
 b=ZBgUkZq0PokfDE/JhgeH8Wftu3rKilQtiM+rOh+6xOP8AsONc8PVi2A5JyiBNuSoRb
 yMAY9df+ZuCLKof1wYiIt+XzE+1vPZkwTMR9ozxeJg8X+6VVaFGdN5bhLvmOIq6p0mJX
 kbaakCO4U+lhedudhyN6S2S40ZpYk4VsoDc9RpuALRYxlajbFfnMsDLxd1o3qLCd8dDa
 PIR+MucmBiosGLiwM0/qiTvcGqJcx73Wp1o1YPS17MPuuDyLKccsZNC1buni5ZnZwixQ
 YNAbPiLGgjfTOnOOwfI9HHJwc2rdxyk8iCx5CViRt7B+f4WxloUJZG6V11e/D6Zp+4xM
 SWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750344905; x=1750949705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fCc8wvcGt1Bzj1+8h/7it2Sg3YOCUwTqtEA7c0OIsck=;
 b=rjZdUnwoDKDxuifDAVQcxpGPitgTgtig6Z8ft/PiXGuL1zelRWfxwgPgXUmyLXrlAg
 0EL+LFKtOJCKz31Rwz2VtfQ5+j6cgf3T1Y3KpuXBGotTrARYW9qYuxOKVqZkvmu3XyZI
 IJV4RuYe1GXR/Fda7LfFcdBtJSup1PTw0YSKkUo8bZWT/VRXRWI87lafl0oRszVKngHP
 yWtEFKUqyjeKLdujj8eAz4+y2Chy7OJ2mu5VRjRKApfp6OvOlPkmjFNneu0ugWPy7jiI
 XJJTtJ8Gi5Ng81G6YM3u8ZCYS054uXuOReeElWHXyOpRyHvIHh8NJ+ibSsKcVzukyBd7
 /igQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjHAnVWUiN0giZC4/8NHzY4OnlukGtc/hXBNulBCLgIs4bLdR4R3tf7mGIfXWVzpW8QJfcsR3SjgM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyvTLTaIKOOaxzPIYtxMgIkwI+PLyI5XAqfEdelLI277j2kJggT
 vWgQD+jht4+fW1xcIPp3STxW0LGzFDJ6aEA3vsoDIYzXRT7867RSSwM9
X-Gm-Gg: ASbGncv9NyPsuNZY3R6HGomcZ/1k2dsFbR3NiK7yfr/NucxlRpQ2V9GUUk+GLsjCzwo
 FcLJri9hM31Pw5oB2QNWcsqPPotOSN5BIAYDOGGqIvWT8X2u+cyra46c94LILQl7xGVPuTGVb9g
 FA54b3gXBh+q+0FCtshL0W4BPwHSmcutXrVqlNjCx3GdJxSxj4jfGZ6R340iAy2PqGRCMpbhN8m
 pmKnBHQe7jodiDiRrz9tBUn7dbX6dzl+t5GPwJiBGJ7+F398fgQuZDH6cDJBQ0ACto/i34+ehPO
 Iasf5UJHV8pbEQzwl7oNrk64yAxhPJ2oLxT6mpYOEF8oXBSL2y/WBGff8aOGrJICPVdytNpe
X-Google-Smtp-Source: AGHT+IHFRai+eXLqEsx2ey+Wqt2gXo8kOT6meJ0aM2dbnVCHxPE9uC9Md/iQOR7yx7gT07xj188dPw==
X-Received: by 2002:a17:90b:2dcc:b0:311:9c1f:8516 with SMTP id
 98e67ed59e1d1-313f1c3fb20mr36050743a91.15.1750344905433; 
 Thu, 19 Jun 2025 07:55:05 -0700 (PDT)
Received: from localhost ([216.228.127.128]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a24cac2sm2506610a91.27.2025.06.19.07.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 07:55:04 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>
Subject: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Date: Thu, 19 Jun 2025 10:54:59 -0400
Message-ID: <20250619145501.351951-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Yury Norov [NVIDIA] <yury.norov@gmail.com>

wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
function significantly simpler. While there, fix opencoded cpu_online()
too.

Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
---
v1: https://lore.kernel.org/all/20250604233656.41896-1-yury.norov@gmail.com/
v2:
 - fix 'cpu' undeclared;
 - change subject (Jason);
 - keep the original function structure (Jason);

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

