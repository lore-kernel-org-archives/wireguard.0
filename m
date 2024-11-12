Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F34D10F57
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:58:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acc071a3;
	Mon, 18 Nov 2024 01:39:22 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6f5c1062
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 12 Nov 2024 09:48:36 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-720cb6ac25aso4959539b3a.3
 for <wireguard@lists.zx2c4.com>; Tue, 12 Nov 2024 01:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731404914; x=1732009714; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EnhCA+KfybkzGlQJdiXLfcOgUmb8rP+rbO7sRqwJqe8=;
 b=QITsjkVLPasWLx/8u7zr+sr2lUVK+m7ZsHYi2Diop3DKtIBQrgoigodLaleXuTjNK6
 MH+w/l9FSk869SKH/K5fZd7BgKVJ61RtHYp8X0QxmzPUhS428CAG3qm1ofZEOdldj+Vg
 j40pD3dIHLWgOw9hKFZ0ozIVEzYTDKzvGUvf7D8Y5GjIc0/gqxkvBB/6nQ8JIZKGc97z
 glINi8pt4zWe2NMXdFM42zbD9tGSbIia5rnfUiTmIu7fRqhsYNHxqUs306QAhlkhSY+r
 1PD5pnZA+1LiDZ4t47TmqR0KMGCVWsY6jsT8/YpSTJCGsNvEWDDctvGz5pKLwkI8rmGU
 +4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731404914; x=1732009714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EnhCA+KfybkzGlQJdiXLfcOgUmb8rP+rbO7sRqwJqe8=;
 b=Wh7j1KszIdzRwsn0r8gso/yR99m4LKhIYfXLfY/ekx8kQbLbhv+Xtb6WRCUcCy5Nwq
 76rvX0JM45ZP3eC0p5QZhqJzFAPu2Ovwg3nX2nqmAHpV7fLGheCrixgY1HWMwenc8KKS
 OmrRTHeTIuzy6iMZ1ZZ5TmNpMgeyxkEaQF+aYnMf9hKECcHnD8OplRWZKL0XXVKrmVUA
 VtH5iclQyWh/QWT/7VHTw72cAe+wi2ihO2k+sWWFdhbALL6B2JhcmrcSIXHMsD/BsvVQ
 cyM/7XQ5Xhtve3R9QzDeJ0r6W7/JPB2eehBxt/W4HUyYi2Qb6D+wNgYL3k0LZZr4tZIN
 kRcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXxJBtUhZYps50ttJXDsuYUsZL7lKHIpFxz5Pql9htDftPggiofInH1Fv7V+jn1YMWps8XIJ/yrOA=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxwzoRRVBeeFUljbCI7/PL2Vjna3X/1qf9+XU5a0Jb8N0K2xddj
 tJz3ZYYrsqs0Pc9Dbel9+v/UFwIBhEU38pi2fvbVbJhkD8X1oMU4
X-Google-Smtp-Source: AGHT+IHloP3SwFnWfmVSzGduUyRMZMHGhisk1H1OAr/Wbq1gp2qDOnB3PDtglid5zBEShhGqBNypUg==
X-Received: by 2002:a05:6a00:2e0d:b0:717:86e9:cc34 with SMTP id
 d2e1a72fcca58-7241328e927mr20123951b3a.8.1731404914213; 
 Tue, 12 Nov 2024 01:48:34 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-724079aa8e2sm10712102b3a.92.2024.11.12.01.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 01:48:33 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>,
 wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv2 net] selftests: wireguard: load nf_conntrack if it's not
 present
Date: Tue, 12 Nov 2024 09:48:27 +0000
Message-ID: <20241112094828.391002-1-liuhangbin@gmail.com>
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

Some distros may not load nf_conntrack by default, which will cause
subsequent nf_conntrack settings to fail. Let's load this module if it's
not loaded by default.

Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
v2: load the mode directly in case nf_conntrack is build in (Simon Horman)
---
 tools/testing/selftests/wireguard/netns.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index 405ff262ca93..fa4dd7eb5918 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -66,6 +66,7 @@ cleanup() {
 orig_message_cost="$(< /proc/sys/net/core/message_cost)"
 trap cleanup EXIT
 printf 0 > /proc/sys/net/core/message_cost
+modprobe nf_conntrack
 
 ip netns del $netns0 2>/dev/null || true
 ip netns del $netns1 2>/dev/null || true
-- 
2.39.5 (Apple Git-154)

