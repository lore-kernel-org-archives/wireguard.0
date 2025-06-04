Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EF8C5B549
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Jun 2025 23:37:04 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4f503a0;
	Wed, 4 Jun 2025 23:37:02 +0000 (UTC)
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cf19096b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jun 2025 23:36:59 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-70e102eada9so4729927b3.2
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jun 2025 16:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749080218; x=1749685018; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gBRqa9U/2heZAUJZPXCb7LrXPxk4R2Wa7FOgeDBgosM=;
 b=CyfbnnJkVCVZW4D98MvmGDDu5Ta8tbczXJ5QJqrugi3LCxhjgxs9A+auB55bHDlSAd
 NwRfgC2vPM0pUlx3MEUIzHnhmAH5/2MrVTtr3Uc5K0l8CUWMXtSKty3VHRCnI7bfQZ50
 mpJq03OlC/6wAbIaIssI/J/PACE25LNGwzkIQyy6XGgHCFHcw1jHjR6GEVX9FKyIFp47
 KDrPtR/wL3SLYP6YLn7K39k/lYvgWQJxsbXH6rZOBWFyjjvdpNJcIdPIf0uGkFRQPogZ
 bNP7NvqGe1o0lq6s9ntAJdmhlHRm+BVt3It/7mXmrEHJsxvHutOXITBDMNeo90kVYFDx
 0m9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749080218; x=1749685018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gBRqa9U/2heZAUJZPXCb7LrXPxk4R2Wa7FOgeDBgosM=;
 b=T7Zfcn2SDhOpLYKSYT+hqN5c8BbnOy2ndu95S2EqjqEs7O7WD21n5NjgidftMb6jPP
 0r1nWdIRbJfZrkjwdUrGCzMD5GfUltM8WV5RT/CQF7LRQqExTHEtqazXiwRiMIuYS/6J
 8RF83HJdIQRbX0GmcjLfdVDP5nMi4nshoaOVx0nK7xiQJ6vJZ61ecoAcJWh5mBANpWyc
 QgOjdhNtG4wDmmbtCgYmz0PE3Ljuv3Edr15euJx4CxxPD9P4yNF9K5T4EBSW96fIvUYD
 EJE9zxJU0c7U7GpeDaLr0DmCqAWtDPFelDgsle8IxJs1emnnZUzf/ENdkz6LxV58/h8u
 BtOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2omI0hveCWkrR4FbzSvWEefOJBLCUyXI5vOZ7OUB2VhggC93eZVDNJ42ic4wlXsuBdWpsD1RJr5E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YymN6bWl19KNiPv3cheCrUUKcHxo66B3g3HGahEJc5RJB2O0r68
 E3874S3fyWdFqa7qU7b1l/e3X0DSZ3kGjXr2+jlGm0T58oGJZ749gh9K
X-Gm-Gg: ASbGnctkwSlfxV56e5AW6syhOL7RLyzeGEMDrN9OQ9p5ZflnnBz6vsOBclFkHbLiW9U
 q4LKoyuCHXw2YRiel56RRMtlci/UThR/k+dwJKtV22/ju/0TCth8ONQV1D0CHuiVjJP0PtRLqVy
 fNYWPtBixTv4jyFmPlUqz0p4yhzEv5jW5XZyhk+3Xwatv4aCTI+BbropXHXy0M+Ph+XobpGA+sp
 L1/bFgqDIxVRAFisAX21lZqtUsTJolY3N5auyFlLM42G+MxoePNukA4JDjB38a+ZvTBRCy9VKVT
 /+/8g1UILKO3IpH1qYtTF4duluZaEgwUd5zM6oyWM3fYqFvHQpvd1kPc56wh0IZccOJ2fOxDDWJ
 JCENN8osHrDA=
X-Google-Smtp-Source: AGHT+IG84WFtztMkrKBWhzmHd8MsAsgBDrOouQY73izuVIVBEUYmm2gffzeGDeXrH0VDTDPQsmMGvg==
X-Received: by 2002:a05:690c:7092:b0:6fb:b37f:2072 with SMTP id
 00721157ae682-710d9f3120cmr68548817b3.22.1749080218488; 
 Wed, 04 Jun 2025 16:36:58 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-70f8abed2basm32224477b3.36.2025.06.04.16.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 16:36:57 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
Date: Wed,  4 Jun 2025 19:36:55 -0400
Message-ID: <20250604233656.41896-1-yury.norov@gmail.com>
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

wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
function significantly simpler. While there, fix opencoded cpu_online()
too. 

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 drivers/net/wireguard/queueing.h | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
index 7eb76724b3ed..3bfe16f71af0 100644
--- a/drivers/net/wireguard/queueing.h
+++ b/drivers/net/wireguard/queueing.h
@@ -104,17 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
 
 static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
 {
-	unsigned int cpu = *stored_cpu, cpu_index, i;
+	if (likely(*stored_cpu < nr_cpu_ids && cpu_online(*stored_cpu)))
+		return cpu;
 
-	if (unlikely(cpu >= nr_cpu_ids ||
-		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
-		cpu_index = id % cpumask_weight(cpu_online_mask);
-		cpu = cpumask_first(cpu_online_mask);
-		for (i = 0; i < cpu_index; ++i)
-			cpu = cpumask_next(cpu, cpu_online_mask);
-		*stored_cpu = cpu;
-	}
-	return cpu;
+	*stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
+	return *stored_cpu;
 }
 
 /* This function is racy, in the sense that it's called while last_cpu is
-- 
2.43.0

