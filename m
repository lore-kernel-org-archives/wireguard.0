Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DBBCA5FFF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id acb99866;
	Mon, 5 Oct 2026 06:56:33 +0000 (UTC)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 30bee325
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 16 Aug 2026 16:01:04 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2caed617615so34185695ad.3
 for <wireguard@lists.zx2c4.com>; Sun, 16 Aug 2026 09:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kurochan.org; s=gmail1; t=1786896063; x=1787500863; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lSFfB4MlNN+G0O4z1oLahsX99bmD2onn6kRcuOgqxL8=;
 b=UOGqNWDgX9k+xnUJeJNATq21SXGlm/7sp4L/rMXXVErzHtAAklwmocZoC7UaO5/HPt
 1YhAqv0kHiM4t/wHPgc+nxsBVQnONvLFfzjSoHW34tHHG5teZL8TOGRnVFYhHk6hRNwY
 Ga9JpCLn/fN4EOelxGloyyzhGGkucK9/7ovvIcNlDEr04X/N09IYYzsSyYHKB35Cbifh
 fL9WWcdbB+7TmF4CQxc8IMKSiTJWgVB0s0/8/9xjMo9unYR2YV5nU+sBtpMDDdNYeYKa
 IIcQvzWnuWhxGVMg2vkOxS1pZxhhoQnxORt5F6GztDWVUUO6wyxzL8/ND77WsLWfYXUP
 MpZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786896063; x=1787500863;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lSFfB4MlNN+G0O4z1oLahsX99bmD2onn6kRcuOgqxL8=;
 b=Vr3Co4/hDeAV4SO01hSwAAfrE4GYubSTknxEtXaJlUzaAnumzcE04d+Dl1VlHredLi
 4XTaLdE+R7BndzuNTUz5d/DyhnPSfN0zWhuEl6EPUUd4I26/fkJfr8pwvRgomvtfaS/U
 xVxKFQ1pphBOnWVTo3ul/yYr2c2NqnGNt3+IOGGsd8OdRRiRPicTXnAL28TpRv60LXbo
 xEYfZsi07y7HqS8jNsUOi61EAg3bxV6LusHADjXp4JtmXs1h2cFZy9bETcbNl752VoR6
 F0FsbQk8XXPC3rFE6tiCsauDkuTOdOwimYKPxAvJ6ry0HanAazKoEo1c0+aPxtsg0MeD
 zRnQ==
X-Gm-Message-State: AOJu0YzWPmEmqJa49kJi+OHT1yBG4Z+6EVYtMloUkKIcprXqkCcEiJ8/
 N0I7o1Gj9yKyOXmhW62xV4U/Es+q09VilmBArm3Z53DgEl63lrVrSr5VebPASOKx4lMIx2HJjvp
 Dgns=
X-Gm-Gg: AR+sD11YGyudTtPOgtTutEJmbtf/ttFk3RKwZH8lV1HZGzOD6gBdIRrxfGEv8PmPdok
 h9wk1MbkUl9b4wrLKBTJg/07QnacbIOM6YRYjRnur8pKQ88/bVCrmuoKHaQBvCpqdxzc197x4vz
 exI86w+fv6lZdPjCxOgr9pOEvY0zvKPKB1xvOSZUaBGRB9smQ0EdmRl4i6LRbWqBz+vKY5Juw1m
 oo3J6FsSjuvHnVAwPeQn2VEusH+qvu89CctQvVvD8eu7aTs7SFGFwCK/XCzZKbUms9BEaihy6Hi
 qZOHtBv54E48T5i0bJd0dy2WBBdwhVPGBr1tsLUBucwDmFf/LIkRHiVennl3HWZQetxjLkw5oLD
 vo2xlOo8KYGF+wQThNfwepT4PhpPESD6R6p13aov2PudF5yglQlslMyHBmnvbsZ7YqncH38RHBm
 O7XxadmtAnoyxxpFa4ovG+3lEPkhkUcYXxCTqqepzErv+UUcoMoBCLQRCet3xC8oKeHo2Z1zHeO
 hF5ExGgRcK94LxnmslxrNxOtQ9W3WIgKvc=
X-Received: by 2002:a17:902:f60f:b0:2d3:6fac:d67c with SMTP id
 d9443c01a7336-2d3b0deafc2mr232173975ad.10.1786896062809; 
 Sun, 16 Aug 2026 09:01:02 -0700 (PDT)
Received: from CA-20036284 (124-144-108-156.rev.home.ne.jp. [124.144.108.156])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d3ae7aae0bsm26634455ad.23.2026.08.16.09.01.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 16 Aug 2026 09:01:02 -0700 (PDT)
From: kuro@kurochan.org
To: wireguard@lists.zx2c4.com
Cc: kurochan <kuro@kurochan.org>
Subject: [PATCH] device: avoid per-packet timestamp lookup in receive path
Date: Mon, 17 Aug 2026 01:00:44 +0900
Message-ID: <20260816160044.4098-1-kuro@kurochan.org>
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

RoutineReceiveIncoming checks keypair expiry for every datagram in a
receive batch. Capture the current time once after receiving the batch
and reuse it for all expiry checks.

This removes one time.Now call per datagram while preserving the
receive-path processing order. The expiry decision differs from the
previous behavior by at most the time required to process the batch.

Benchmark: Linux arm64 Lima VM, Ubuntu 26.04, 4 vCPUs, TCP iperf3,
5-second runs over two userspace WireGuard interfaces.

With normal MSS, median throughput changed from 5.969 to 5.998 Gbps
for one flow (+0.5%), and from 6.785 to 6.793 Gbps for four flows
(+0.1%). In an alternating MSS 256 run, median throughput changed from
1.253 to 1.283 Gbps (+2.4%).

These are preliminary same-host VM results. They show no regression
under normal MSS and a small improvement under higher packet-rate load.

Signed-off-by: kurochan <kuro@kurochan.org>
---
 device/receive.go | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/device/receive.go b/device/receive.go
index 1392957..1bb52ef 100644
--- a/device/receive.go
+++ b/device/receive.go
@@ -124,6 +124,7 @@ func (device *Device) RoutineReceiveIncoming(maxBatchSize int, recv conn.Receive
 			return
 		}
 		deathSpiral = 0
+		receivedAt := time.Now()
 
 		// handle each packet in the batch
 		for i, size := range sizes[:count] {
@@ -161,7 +162,7 @@ func (device *Device) RoutineReceiveIncoming(maxBatchSize int, recv conn.Receive
 
 				// check keypair expiry
 
-				if keypair.created.Add(RejectAfterTime).Before(time.Now()) {
+				if keypair.created.Add(RejectAfterTime).Before(receivedAt) {
 					continue
 				}
 

base-commit: ecfc5a8d54462e18e13c72173e2623d16d8e25a0
-- 
2.55.0

