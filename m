Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC16C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d2978d6;
	Tue, 20 May 2025 19:43:25 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c8a58336
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Mar 2025 09:30:30 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3012a0c8496so3613232a91.2
 for <wireguard@lists.zx2c4.com>; Sat, 22 Mar 2025 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742635829; x=1743240629; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Irp+upazmFs5DB76PQDgJBxKxxQDsLsag1Qj5zhxeRM=;
 b=krzWS/HpF4jIIXjBSa8wk5ZzGBeoFzUBhllfqPUAo7b1UuWqrMC5QY3RZ3z+4NpL+R
 V/FAfUoADeA7LRkx3YKP12AT3LZctOebj0XY8Nv0mish31HEUol0UuplzPIqsfJUYGk4
 YIt0lyBUGSOH/xcx2iQLqICREKiZ9gRmYueXKWXmoa30mDwAN8Kw4DqWzbA+zTg9t3LA
 D1oVhVxI09+rgTcHgEOJPxfEeCJguXckxg7ICwQ4jMaACigQ8+OygFay3xTDhAAG8a6+
 bC8VjXXTyUrmg/MiG9oDn3bOZQIqIOqTU4PM0TXKjsCKVFhfZG4rBQnJYhVPLZSR6/0B
 IIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742635829; x=1743240629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Irp+upazmFs5DB76PQDgJBxKxxQDsLsag1Qj5zhxeRM=;
 b=hGq8aL8xm4qqNFDLww6usCs6k4elF1844SBDLd9g4ZaijXlYOChxrMq4m4EfR4ccJ4
 ZCgBxFyzJCDk0LeDlD/zDHsYfHl5HeelhuH7GClxX0BDUkN+i5zA0KHp5W7aHcyHvrXZ
 HpmHZejXuEQ/kas3gUK1qHbEHsRj2ybPv+qCXUX3syLWFjwCF3w0xmrLHugBXkP79L99
 zcULmiHl5HtHqWMbpjtT+vHXQDssc2X5liowpaYOt+u2Wxsi+XuQ1Cm/HrywXlkmc16F
 2usO5wCBY2+rSMK8aYSTcPn+e1iTc+wgzWuzRLlssO9CQT2EGe6uuFTtdzl0Gvp9QqwW
 Ri8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNLy15QqTdz4QjCqy1duBYGQIR+9aOYAOr4Z1prKS+S3/i0RITFfRo7hDji9EIrB1C6esx/6UXsYw=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yxgyq174UlvQ9EydcHgquhJJfmWjQYIqwlYYZ0qgzuPTA3Jnzq1
 iewQgfgdzbFQj7DeYJDypkAKGO1AneNZFCq7hzCFAh9g5H6/XYnI
X-Gm-Gg: ASbGncuW3PHjdvCpGm8xDquSY76IJZUmoRF7mbpCFTWpieKF/T8CBIs4rBLVS5sHeLX
 1zZlYk+AStFBNJGsqhyfkxidz2i+70BB0wPAEi9MRjAuZJmLE+9vATl2kYj6ZKFcArDHKIPTtZ0
 Up2FIXxRUtOOM2dcatug2IE2agKmgVQbzS7ww8pxjuQ5K6MSY5/I2mO0uqMB3L2nDZnypgdaA1w
 RlOyHBBmeVC3BzTFGlp3fM3JOuWHcCst3Ev/yXdr+MgIkZh81j7sWlImEtN+F0SpBLmuPJUE8+5
 QBR223IfM8X47M9yTsiu0Opq1JCYQFJN6KeO9PyiA/yhrydzQKuU81hYbf1P5ael
X-Google-Smtp-Source: AGHT+IGuQCRnSupF0XghzaFP+eOBI/S/qSer6RZlfeXZQYP1LbR6lU52d4TKY7O00O//CA1zLcCnKw==
X-Received: by 2002:a17:90b:17d2:b0:2ee:af31:a7bd with SMTP id
 98e67ed59e1d1-3030fe569d3mr8666490a91.5.1742635828887; 
 Sat, 22 Mar 2025 02:30:28 -0700 (PDT)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-301bf58c24esm8452440a91.20.2025.03.22.02.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Mar 2025 02:30:28 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv5 net-next 0/2] wireguard: selftests: use nftables for testing
Date: Sat, 22 Mar 2025 09:30:14 +0000
Message-ID: <20250322093016.16631-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
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

This patch set convert iptables to nftables for wireguard testing, as
iptables is deparated and nftables is the default framework of most releases.

v5: remove the counter in nft rules and link nft statically (Jason A. Donenfeld)
v4: no update, just re-send
v3: drop iptables directly (Jason A. Donenfeld)
    Also convert to using nft for qemu testing (Jason A. Donenfeld)
v2: use one nft table for testing (Phil Sutter)

Hangbin Liu (2):
  wireguard: selftests: convert iptables to nft
  wireguard: selftests: update to using nft for qemu test

 tools/testing/selftests/wireguard/netns.sh    | 29 +++++++++------
 .../testing/selftests/wireguard/qemu/Makefile | 36 ++++++++++++++-----
 .../selftests/wireguard/qemu/kernel.config    |  7 ++--
 3 files changed, 49 insertions(+), 23 deletions(-)

-- 
2.46.0

