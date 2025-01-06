Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22107C54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c897a373;
	Tue, 20 May 2025 19:37:52 +0000 (UTC)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1e3b8c0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Jan 2025 08:10:59 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2163b0c09afso198352975ad.0
 for <wireguard@lists.zx2c4.com>; Mon, 06 Jan 2025 00:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736151058; x=1736755858; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UNj5EB3CBzzHNe2564u4Vg3r3GIGTo09F7r1zlnGu1M=;
 b=VAgD4Hk08lvcF9S+UW/3yBPZMlEK7D1yBFyw7VczeMsVlPyGy/+d/D0B67tfAOXOjh
 UZSGMKaWUH5DOSXBqDyJpZhHQa7EuXtS+Yc8jBQHeumxaxfObbC5vVVF5YKgy+mL9Z7G
 ruioX7kWfA/BtvbwvVUNhoVrz1uLTxWVbtN1qpM2LH59O9YR5GwvkfPIs5nJvzXWuzr+
 /m/EcGPObnl7YSxrAnDMUQOAUDY1+Hm+olZE3FgdGxCvrhsGlOclBO1QEoB73yElVNFp
 IxOiCiwXtas7d7YzTG8K+FghFv7sInEexjU09etxf24cDCRorLjv7hJKwMsK9lRePU/6
 7sbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736151058; x=1736755858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UNj5EB3CBzzHNe2564u4Vg3r3GIGTo09F7r1zlnGu1M=;
 b=kuQ//7EWAYheUC42jtWTeJ32hc7L8e7Db3d3nEShN5rsVOiuy3OCpSQnBVGwQDpEpw
 SeHppPWGAee0diO/elEIYKl7hGhtXR5QSAr2zzLS3Z14HRagmZHESlfWSpIl+3/4YZON
 4bnMGcB4K+FfqZAKGoJ+fH6mreYlx6D/aIBsCaru8VwHcDxuOwRnYSla4RgcUJCkgmRH
 LMvU/lc5/lJqx+vewKPvjqcvXbuKXk84vNUrWps5+gOYP0GHRs4m13FzEgApdR2P/q4e
 9uQrwdgEEhcG4LMyr+E1wfpyUtmoutzLTi8OHNJS87u6Tbgq/xbfOWqMIByZVS01HkbO
 bKdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3nQwHjeAuWvhexrZtGBUO2elwbGeMpYpOrH32ZkUpNT5xzKFY1AGiIhUyRTzmrsQynQpRBZ0EJfg=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzTYS0DaBJsAlmBzoOaJFnenj1nL931iw+oW16m04BH05V2dsKs
 gmHGUzEiIs4CKQ4LVOIj09SO1qcxw+6AdkbfFMBHwP4H473YHhcl
X-Gm-Gg: ASbGncsKmJWrR8vyAhWonnaNS2tYCpxdlOMH6abj7uE/BGEjvh58K5SNc5424dtSGpQ
 QXsZjlBA/ZcKHiVPC2n+QaiPfTmM63TgX1X4DTtW1FrtmuKR51GZuR7YlhrMwhTUnC4gkUMRB2l
 nsqq+sLCOuD2j7yNuU7J0jV72NLWx1egx/6WHb4xqILu1rYELNnBt6es190nfjeHA8rVH2pJn0R
 zF57ij+hJI7rlimta0CNyFpJEza5vC/hpo5h9dR+kQN/q3E8EeUuDCb7Zd4OyTJiPADpM3H/Cos
X-Google-Smtp-Source: AGHT+IHjMYJ+kYgL9lIpddes5A+CsRLnuYBEZZhoqovTAHBKAqmupPfBM7y9cycXTJ4TnPKyShex5Q==
X-Received: by 2002:a05:6a21:3189:b0:1e1:ab8b:dda1 with SMTP id
 adf61e73a8af0-1e5e080c4a3mr6061674637.35.1736151057881; 
 Mon, 06 Jan 2025 00:10:57 -0800 (PST)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad835469sm31910429b3a.60.2025.01.06.00.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:10:57 -0800 (PST)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv4 RESEND net-next 0/2] selftests: wireguards: use nftables for
 testing
Date: Mon,  6 Jan 2025 08:10:41 +0000
Message-ID: <20250106081043.2073169-1-liuhangbin@gmail.com>
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

v3: drop iptables directly (Jason A. Donenfeld)
    Also convert to using nft for qemu testing (Jason A. Donenfeld)
v2: use one nft table for testing (Phil Sutter)

Hangbin Liu (2):
  selftests: wireguards: convert iptables to nft
  selftests: wireguard: update to using nft for qemu test

 tools/testing/selftests/wireguard/netns.sh    | 29 +++++++++-----
 .../testing/selftests/wireguard/qemu/Makefile | 40 ++++++++++++++-----
 .../selftests/wireguard/qemu/kernel.config    |  7 ++--
 3 files changed, 53 insertions(+), 23 deletions(-)

-- 
2.46.0

