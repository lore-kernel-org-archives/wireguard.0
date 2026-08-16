Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2236CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6de8431a;
	Mon, 5 Oct 2026 06:56:34 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 91af906c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Aug 2026 18:25:17 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-38e3efab7e0so1741789a91.0
 for <wireguard@lists.zx2c4.com>; Sun, 16 Aug 2026 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kurochan.org; s=gmail1; t=1786904715; x=1787509515; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XTPU1VqAVtuBCyeVkcpv4g82zHQQIQ3cB22P17vpz/w=;
 b=ft8EryJhouX0sJwcL6XvGVwRSrHuamwoybI7ZlmU+9DBTrePvJ5ZlPORIu3OCw3JJ0
 9Z1/+M6JNQnpUqgOHTXgGzFxTNSWPtecMmGGC2Mepb4i0JALXUvUyKFqXHmSJHzmBqog
 oeUOz5ndqpv6g9HmGk9kpIjuDHWAVUTCKmtDHH0wOfK9lhSU6CXc+jU69x8ZEOm9Z72/
 xY6eTvMMPi6+HiZx6dJHPlX12nnp0HbbMdfQrrJHiZVVHk0yhhwoCWU5AKMfvZALwSAb
 6k6cfPrQ3XmuxaTDSfqNFhYKI/Dv7WfkgfZq20XIrt0mBdWq8MwsN0RMmSS4dmmg5RBS
 MjBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786904715; x=1787509515;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XTPU1VqAVtuBCyeVkcpv4g82zHQQIQ3cB22P17vpz/w=;
 b=NAN2fy8zH64dXskXglGg/OFHl+BzlHazX/VetkrQzV1cPpiRupOdpewEJI+ARz4Hsd
 K46QNZv/SjmEbqo+5w4J616W5UEtV6zPSO7c/iwBeddoYWuCVhOO1jWh89qFWWnDNmIJ
 6op6wki1+4w4DS29WUMnNFvGqHL1P+85m34BwzIXmWi4iiGUZLqK0RamRBZpxaLbHzac
 ubxEOgCZOg5O3m1NCUzoNwVczxWWzKmfZvZy4BrSxUmz8KpTMNUT0eQ8RXusM5FKoaNG
 dJwWX94ljx2VdoynzMbNXBhpvoaXDwdI9AdvMKq/WVf8UrLKAd0cJmHPb7GQ8vVXF9Xp
 W6NA==
X-Gm-Message-State: AOJu0Yxv4ONAkSih5J+o3wCXCAFnBi0VLPeX3sA6oo17gP60xSz1nH6/
 80RYAl1Od7L66xHFt5RG9HV4q6o56CcrYneiHx63LLOMQpreQwdskh+IbEc1Sm+PmOCHu8dL1+M
 s2t8=
X-Gm-Gg: AR+sD13gr58hrjWRf2Hx298evB1VTByei0+bHW0hk9VOkQeWQH/2a+XKbgWnctRzP1o
 2hXqbDi5+dJEY3mVOBtdQl6Hm0OCkjB80LofJ2pkinhztAJSTQV6odllvCUacVYrRhqvPcT1zx9
 iJfGSyoHKHQ1kgvku0zAR+17jbagqBtuIcskkZqVEkaQzMAFCHi5eqQHQwr3GuWGXEqHfh1B8nl
 Zi/MtoLa9pI2GbLjOnMOqAEO/mwwZw8laNlOnUjZSvpP9pJWD/3w+J5/KzDeAy6WtwGSG/MIU1w
 x5wL4eiJLzYUmsuT386D6cjrxcxGfWGGBx2ffwJV5RZWfd42WWZqVmjjdftdDL41/Ggj7eXflnU
 EnwlZM/4CK7sXi/AkXSY+Obomqw0+h0+ndyInkzFEV+zIKjfmx05AkdKEetAik06v6IKbTIgunn
 J7i7F5TXocW/y92yXzXLhEtSmnuHWGrCjSLjiL7YBR8QZnD4ibua67OB4+OkdNKoTCfwTKWskGU
 Qm9dRPiEG5TAKdgAOnDDMjJoMTw3YvCr+5yx5+KXiBkAQ==
X-Received: by 2002:a17:90b:2e87:b0:38e:6d55:b1a6 with SMTP id
 98e67ed59e1d1-3933af038ccmr16162183a91.3.1786904715236; 
 Sun, 16 Aug 2026 11:25:15 -0700 (PDT)
Received: from CA-20036284 (124-144-108-156.rev.home.ne.jp. [124.144.108.156])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-39531ee7d46sm2112357a91.16.2026.08.16.11.25.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 16 Aug 2026 11:25:14 -0700 (PDT)
From: kuro@kurochan.org
To: wireguard@lists.zx2c4.com
Cc: kurochan <kuro@kurochan.org>
Subject: [PATCH] device: use GOMAXPROCS for worker count
Date: Mon, 17 Aug 2026 03:25:00 +0900
Message-ID: <20260816182500.23926-1-kuro@kurochan.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

From: kurochan <kuro@kurochan.org>

Use runtime.GOMAXPROCS(0) instead of runtime.NumCPU() when starting
encryption, decryption, and handshake workers. This makes the worker
pools follow the runtime's effective parallelism.

Go 1.25 introduced automatic GOMAXPROCS adjustment based on cgroup CPU
limits and other runtime constraints. However, this module declares
go 1.23.1, so the compatibility defaults are:

    containermaxprocs=0
    updatemaxprocs=0

As a result, cgroup-based adjustment is not enabled by default for
this module when built with a newer Go toolchain. Using GOMAXPROCS
still allows the configured parallelism to be reflected in the worker
count, and keeps the worker lifecycle ready for future cgroup-aware
runtime defaults.

Signed-off-by: kurochan <kuro@kurochan.org>
---
 device/device.go | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/device/device.go b/device/device.go
index 6854ed8..7d9d910 100644
--- a/device/device.go
+++ b/device/device.go
@@ -308,10 +308,13 @@ func NewDevice(tunDevice tun.Device, bind conn.Bind, logger *Logger) *Device {
 
 	// start workers
 
-	cpus := runtime.NumCPU()
+	workers := runtime.GOMAXPROCS(0)
+	if workers < 2 {
+		workers = 2
+	}
 	device.state.stopping.Wait()
-	device.queue.encryption.wg.Add(cpus) // One for each RoutineHandshake
-	for i := 0; i < cpus; i++ {
+	device.queue.encryption.wg.Add(workers) // One for each RoutineHandshake
+	for i := 0; i < workers; i++ {
 		go device.RoutineEncryption(i + 1)
 		go device.RoutineDecryption(i + 1)
 		go device.RoutineHandshake(i + 1)

base-commit: 8eb8581c3460a654ad0926891e7e5f4df75f01a2
-- 
2.55.0

