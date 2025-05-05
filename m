Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41EEC54E92
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 22:04:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bb01e8d;
	Tue, 20 May 2025 19:55:31 +0000 (UTC)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b67d0b5b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 May 2025 07:13:14 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2254e0b4b79so59422315ad.2
 for <wireguard@lists.zx2c4.com>; Mon, 05 May 2025 00:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746429192; x=1747033992; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=osfZqjJg/3Wwpn8i69rm46kY9ryd7rgrJ6Y9tTr2JqE=;
 b=CWprwRIBwBeie5+MqJHINy4mO7bND/BplyuO+XsC8+A9BEAfiIld6S8xpUzIqXidK0
 D6caqTjUBD30vUlBJvpB4rf5PKc+ICwfXQUFzs5ymVRoN5iTX3YFajktRxa13zkmGp6W
 Vp0tg6PvW/sdDgcT+XWvKdNQNp2N6F9HNDFydHGd4w7o9AVC40yFdHt3SCvmgw1qf/ew
 c3vzDIIptJix9Dba+ruTUqmXEcGuxc3+aX5JnhXMuBUF0NZQsug5MmPoSYmvZrj1Uvsl
 VxNsRe0f/jGRQmRdQLlG1e7Wej/V2tAoKT0db3lXNUsPrZ5YdftJyPruTHceFfgFO+8r
 uQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746429192; x=1747033992;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=osfZqjJg/3Wwpn8i69rm46kY9ryd7rgrJ6Y9tTr2JqE=;
 b=ivqYH2DFC6bPq0zQM1Ww+7LV6YYnIMneZslJSJzV55/DGMXq/WppwQOPAsd+DI0xD5
 Rz34S4mTlDZN9SIvWXX1LYc2vD99OZy4NGVgTuZmaKvD4ULRBwR3C3+aaXTvL7Yyx/Rf
 bDnUq4nj3nq/Va+gI+TPy+Bc2MBhcpLn/6hjTMCpCuUxIW7q1kZZm44PDVhTuBpiLeTv
 mVrip1GgKl4Rofjw5o+QWzQrhRm5OAYHxqvX7L3Gzi8nA8CWWvAfSz8CzfSxnKU8TH/A
 GJmurgrEiM3LyGe98ibGIVi5TLrMvQU1GDux/agU2VUiKp7XyohafA3txYHFTC+Tlzuv
 jD5A==
X-Gm-Message-State: AOJu0YyUOoZOHQL4JggxqjzAUVwYr2PuUEhbcTksy2PrpYbWlPGY50nl
 gxvobvytrsEolnE86S5eFbJI6B3zmYWXpJUFsMXeto1Zh3XwrSHFH2AZIOgr
X-Gm-Gg: ASbGncudZdj0nM0Pe1aKb7f6RZkfCZK58xbMU9pRy2xGKxjOc/mwV/KAQphtYnzEPeM
 4qmtmBCmBuzBuxVq14F9f/0GQVr51tDWTNSOurYiC5CopFsNS3rmsPewRhRcLQJ/+SV+MrQnw6x
 Sf8uMrv6k1u67x1gAEgKyfGVszIIumVgggdbvbG8ytOtkbqaLFblE/IkoE3WMKCIzAhQT1FGPZz
 Del9d7xPfSNGdTZPBW5NDncGKtZ7B5qQOEXQYAvw9jKcaCobdnXjfnNGDMVxIJ/M3bg7bpg0mGY
 J7yXlB+6RY0JXi0N8wB68WPwbXkx8S7VjfQdXaa1tnsqKv15+LWXf42Nu/vciDKM20/AaJaSU9V
 ATCV2RCwdyw==
X-Google-Smtp-Source: AGHT+IF5MVdTDpSrmdyaVsb+6NMm4xCYrhg29+8GhO9VM1z4j0nsrHs/iKhk+wQ8qdlpnJBeB2B5/Q==
X-Received: by 2002:a17:903:1b2f:b0:223:f408:c3f7 with SMTP id
 d9443c01a7336-22e1ea47acbmr95344945ad.16.1746429192326; 
 Mon, 05 May 2025 00:13:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:a16:bb3c:f0c2:89e6:285e:5472])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e1521fb33sm47788935ad.131.2025.05.05.00.13.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 05 May 2025 00:13:11 -0700 (PDT)
From: TriangleSnake <trianglesnake2002@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: trianglesnake2002@gmail.com
Subject: [PATCH] wg-quick: add 'dev' to 'ip link add' to avoid keyword
 conflicts
Date: Mon,  5 May 2025 15:13:06 +0800
Message-Id: <20250505071306.80342-1-trianglesnake2002@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 May 2025 19:52:08 +0000
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

Signed-off-by: TriangleSnake <trianglesnake2002@gmail.com>
---
 src/wg-quick/linux.bash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/wg-quick/linux.bash b/src/wg-quick/linux.bash
index 4193ce5..93df80d 100755
--- a/src/wg-quick/linux.bash
+++ b/src/wg-quick/linux.bash
@@ -87,7 +87,7 @@ auto_su() {
 
 add_if() {
 	local ret
-	if ! cmd ip link add "$INTERFACE" type wireguard; then
+	if ! cmd ip link add dev "$INTERFACE" type wireguard; then
 		ret=$?
 		[[ -e /sys/module/wireguard ]] || ! command -v "${WG_QUICK_USERSPACE_IMPLEMENTATION:-wireguard-go}" >/dev/null && exit $ret
 		echo "[!] Missing WireGuard kernel module. Falling back to slow userspace implementation." >&2
-- 
2.39.5 (Apple Git-154)

