Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E2C83F34
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Jul 2025 22:44:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1999d4d;
	Sat, 19 Jul 2025 22:44:57 +0000 (UTC)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5011ca25
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Jul 2025 22:44:55 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-747fba9f962so3006713b3a.0
 for <wireguard@lists.zx2c4.com>; Sat, 19 Jul 2025 15:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752965094; x=1753569894; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+iJGo+evc2L+FHv0RiQZvlWwxutqT5SwKMfAl/86uLw=;
 b=M2xlxnx66pb3NZGvWtQuFV71JfNvb1AfzOdIVNsbrBd+MrBuAbPxtn8c9Tvn5xQfGV
 x5bSAJpr5YvkP6cuDKQlmoiUIBJ4RjGsc8g7iq+cRz6RjhNa5vIslicFidRf5GQzVhon
 mIFOK439gMlVyXuyjtUKI78UtwbLBgga4x1nIO5H0zRIzqpY9ic0kqiAn9b6/aEA2OB8
 yaJnuPLPJep0D3J5g+EDz6dcSuwajv5sa3qIThdEiWoPNJbzBhtm4c56PyMb/VyB+dIR
 GK26dhIW4Nigyq6+p5QlFc8rpAe7j/BOb0X/vQ3HjzBDk8RW1HM40mElTffgG1eSTS/3
 12iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752965094; x=1753569894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+iJGo+evc2L+FHv0RiQZvlWwxutqT5SwKMfAl/86uLw=;
 b=plQQ4sO6V8a6Td6ZWWK6RwmqHwtxlSAex0qffKP1gC+r1ltfzeHJtXr8YWox9dBYN7
 V7+yGKNgnPY7DVuwL0ZMkdPGTmdVsk7e5u2VOTwa5HxydUqecflz4LtSTpA8RnSMnKhO
 yK2sCoBzy5qL797rD3x4YQfKecBuz22u8W/QobjM1i8/Ex3WsHb9owosAy3+GKGHujq4
 ud/hJ1cGYzX+wvUtBOsYl5CgqIHi8qmkfPBLcLIJG9N73p5IYsL+a8fQrgW/kooB36Gt
 NyVwen+ckRsa8+9ebPti/17az9gM9yWmBeA4MahgNPgKFAli/EOYz5e4bjET9fyKmRd9
 Vv0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVkx3VCYTodOBbLjCSc3Lr5RKgj6mSdkUtlarAzvaayitrR5krt6wSGdTSDPuvCqFyA6nNRbW43mw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyGemF81h+GHKXaDKD/iav7OKbq/kBbn8smxmmtesYPlhVQYypz
 2Z1FhSCtxOt0jRFTyd5WqO+a1Kwxva1dmGLpTGZOhOaKrLERJVU+hsbE
X-Gm-Gg: ASbGncuQQJRYhIg8ZbZA9IAHW/7VjkOQ/Lo52KuVWWP3aL14UfGNrLKY4cWOM7qt+E4
 qlXfMVPZbkBF8xFG+QtiRq0vtxlGiqk9oz5jX6MDj1s8upRfEk+sDPe+bFSiIpKkV3Rfut1XbvY
 pwTmvG3of5VhvaqpMzwoqRTjENaz3OA+g/33ylRumfUArm7L7MF3zs64n605uyrBSNq/vaP5eiM
 G2iyvOd4kmJQQYnviDg/1FuCeLOOva+E7FfQ8QspszUEY1RKHgzWEo+CXOFFqOGErc/xDHCeszu
 qXmsuWSFAuuKg7Ye1ApwwqJzfqkgZkyYkWbrDwYsBhPN67gxtUCiqKDSmpe7808fiGRQJ76HsjH
 EO+RVqPl3FpXIL0AfOqM1sQ==
X-Google-Smtp-Source: AGHT+IHdQ4UpnsC/CBi3lvY5pcItF/kF9ghnPx0kUzR8vZ67JjhtSuWwPaLJenOiLXPhJpa6QYE/7g==
X-Received: by 2002:a05:6a21:32a1:b0:234:97af:40b9 with SMTP id
 adf61e73a8af0-2391a2d7d31mr14272124637.2.1752965094115; 
 Sat, 19 Jul 2025 15:44:54 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f2ffa6351sm3057193a12.60.2025.07.19.15.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jul 2025 15:44:53 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH 2/2] wireguard: queueing: always return valid online CPU in
 wg_cpumask_choose_online()
Date: Sat, 19 Jul 2025 18:44:43 -0400
Message-ID: <20250719224444.411074-3-yury.norov@gmail.com>
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

From: Yury Norov (NVIDIA) <yury.norov@gmail.com>

The function gets number of online CPUS, and uses it to search for
Nth cpu in cpu_online_mask.

If id == num_online_cpus() - 1, and one CPU gets offlined between
calling num_online_cpus() -> cpumask_nth(), there's a chance for
cpumask_nth() to find nothing and return >= nr_cpu_ids.

The caller code in __queue_work() tries to avoid that by checking the
returned CPU against WORK_CPU_UNBOUND, which is NR_CPUS. It's not the
same as '>= nr_cpu_ids'. On a typical Ubuntu desktop, NR_CPUS is 8192,
while nr_cpu_ids is the actual number of possible CPUs, say 8.

The non-existing cpu may later be passed to rcu_dereference() and
corrupt the logic. Fix it by switching from 'if' to 'while'.

Suggested-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/net/wireguard/queueing.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 56314f98b6ba..79b6d70de236 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -106,7 +106,7 @@ static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
 {
 	unsigned int cpu = *stored_cpu;
 
-	if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
+	while (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
 		cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
 
 	return cpu;
-- 
2.43.0

