Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD44DF55431
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Feb 2026 23:50:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 0acc289b;
	Tue, 24 Feb 2026 23:47:25 +0000 (UTC)
Received: from mail-dy1-x1331.google.com (mail-dy1-x1331.google.com
 [2607:f8b0:4864:20::1331])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 217db692
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Feb 2026 23:47:23 +0000 (UTC)
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-2bdb17511aaso1127816eec.0
 for <wireguard@lists.zx2c4.com>; Tue, 24 Feb 2026 15:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771976841; x=1772581641; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5Q9jC8hQHZLYqfskpFddPX8DxFBU62Nx+t39vy6gr/c=;
 b=QDdYawn91ER6FXtpi7Bwy/TbJWr4GjYDXdLGczykaXCgAS4mzMcy8sUVaORIUuYxVi
 UFYi9hM8inwbgF7qEM/5IOEAj5WBs8EgRrnENEmSC8j7jKIJezGTAWHjuDkjhzkyADMD
 Y4G5IS/s+D3OZ/ot6DnSIGab+N9ss16auZliOWyQnwXk235C2qms10061y1QUwxgPJSN
 +5m/NkY/8F6Ne+aGVT/FA2RdxX/1t/EuIPWQkSrrC9VqOUlah3FmQV+qhKvoYImIlaAJ
 V7uG1tBH92F1sQAbwBB0b3QnWqtzPi6I4eihLW+LnCjFDIopGm4+A2aKgKg4bEH2SSor
 2Oww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771976841; x=1772581641;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Q9jC8hQHZLYqfskpFddPX8DxFBU62Nx+t39vy6gr/c=;
 b=E6LNw6ypVmSBIfClg4ruOeteH/ZTdh9t8qHUMkf0V+2YnDrTwoiFnZRkLmq6E0YL99
 iqLRQmUiYchFbq02g4hdKxnc4/FiapTErn1aDAjFCoXsQVuHOj1ijsWp8oJn/WRtCGDq
 m7h5g9RqgUrFRUHbffoTNqkJfwoVeGm+mfWrQobm81Ck4mzTQTGAptJAxRz6X2r1VJhu
 2DpANfYEXnxJeXuY2i1519qiG9Ny18DProW1BCnRt/R/tiq6bl15rnIbBJJUFnleNG7q
 MgEqq5PgH7wMSKaEYIY3oO02YhDRLOsIq71My6bdMjfxHVNfLvURPJtdyRcmaEy5V6ZS
 vg6Q==
X-Gm-Message-State: AOJu0YyB1JjYK6g/1NtmnDyASua2fWGdC/kboSuuoV+fF2g6ClEWlR0e
 5eXa7s1OcgDswbk91o6D/7pYBKXOg2ZuCRcF4xRgN6aLDNNxZpoH/5FeV26/m6y8
X-Gm-Gg: ATEYQzyBwTFXnUZc5+Ea9kBVwbZxM1h+mN6gtM/tAznQP9o4BHG08DJe3hxWv/6EoWs
 OVbVZNOdbFI4Y8ycWEFjy58d3yt/7otW/R4gzVLMzOEl6LtDR04h6xw3WoCtDYqFN1MI5eiJ0M2
 J7xBQlsBGewTMyMITCldp5JIWhQpBKlwuEvqcJNYGHU5/hr3yt41O8GzoyLX62Q4G1Vl/N75NT5
 SSQHv7ElVGJZR8CIDnZNt4pBtLsn3v31jqIOIYZhfJzSoMp6wDzKkr+QFdupGV2m0BRR6OP5Hrf
 toijADhABeABCFCruG3AZyuUD3mh8IJJTgDC3QvO8bWHAEGyNgPhqVFXq8jHfedB3oBQxxE1b7W
 VdoNHBbrkio5/hbFIkLSDrr9xKaGjVY3aOJlSYLGVOqbAxpf4h5Sn8sZvhKAKtKwEDbD3R4ErrV
 hNl8Lre4H3xdOnv/wM+Wstt65sMGTibuiT5GydXqQyZQAItip6vhxQIsaez422bQ==
X-Received: by 2002:a05:693c:25c7:b0:2ba:a1a5:b5b1 with SMTP id
 5a478bee46e88-2bd7b9efc61mr5486060eec.7.1771976840504; 
 Tue, 24 Feb 2026 15:47:20 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:3db4:7690:94b4:8ccb])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bd7dc167b2sm7607985eec.28.2026.02.24.15.47.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Feb 2026 15:47:20 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	alexey@twingate.com,
	odedkatz <katz.oded@gmail.com>
Subject: [PATCH 0/1] wintun driver get stalled for few sec until another
 packet is being sent -- approach 2
Date: Tue, 24 Feb 2026 15:47:16 -0800
Message-ID: <20260224234717.16883-1-katz.oded@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

## Problem
High-speed TCP uploads stall for 4-5 seconds when the sender and receiver are close (~1ms RTT). The root cause is a missed-wakeup race in the Receive ring's Alertable/Tail signaling protocol between the userspace API (WintunSendPacket) and the kernel0 consumer thread (TunProcessReceiveData).

On x86-64, WriteRelease/ReadAcquire provide acquire-release semantics but do not emit MFENCE — the only instruction that prevents store-load reordering (the one reordering x86 permits). Both cores can simultaneously observe stale values of the other's store, causing the userspace to skip SetEvent while the driver enters KeWaitForMultipleObjects indefinitely.

The driver sleeps until a TCP retransmission (RTO ~1s + exponential backoff) coincidentally wins the race, producing the observed 4-5 second stalls.

## Fix
Insert MemoryBarrier() between each store-load pair on both sides. This guarantees that at least one side always sees the other's store, eliminating the missed wakeup. The Alertable optimization (avoiding SetEvent syscalls when the driver is actively spinning) is fully preserved.
Alexey Lapuka (1):
  Fix missed-wakeup race in ring buffer Alertable signaling

 api/session.c   | 1 +
 driver/wintun.c | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0

