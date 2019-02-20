Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E76C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 652B420675
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 07:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=connectedcars.dk header.i=@connectedcars.dk header.b="hgQQDR4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 652B420675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=connectedcars.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3bd33ba6;
	Thu, 21 Feb 2019 07:04:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b0b1d6ec
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 08:23:53 +0000 (UTC)
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 832fd1f3
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 08:23:52 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j19so19244718ljg.5
 for <wireguard@lists.zx2c4.com>; Wed, 20 Feb 2019 00:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=connectedcars.dk; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWC/PO/ClrxxgJvsm41Dl60k6ahjCCKfIbRP3/x6Ni8=;
 b=hgQQDR4uC4f5L476KCgqy23WvsnorO4JBefTYClkJ7GCl1+JsjFPSVhEBMHcsd3h9B
 yyOcycjeyIsdb6jP1efWR+g4iapmnnPuUu5ZltRFa9wU8YVojqWNg7p/DO3ClhoytbZd
 L2eNmufkTNCXYgYbx0ucqZYPbnudP7zHjgM2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vWC/PO/ClrxxgJvsm41Dl60k6ahjCCKfIbRP3/x6Ni8=;
 b=b84u9ojz8Li6JKXVo4hZzXia/uU5Qhw7ZhfBZyDxcdo51capt+AfhZuQ1n7gY5e2Tg
 iTPU7AwweMqG2PxSfHvwTHJ4ZMGqVkeOYNiw1tZgymkjE4jRzZfHGRCnLc1mNkKf10GU
 YaCGcolA5U4s3XkmkFFltByhiA6ZkDWOgHLJeDrZk/vt/vHAznebDrBLNt45zAOLr2Pi
 h1ljqUeJ1ElHaOmilJjPP8F8ewkbDIiaxXveTIPNpJPDrUIz/X+C3RLJ8AOwbjIMSLZa
 9HDKkaXT7ApDIX2pKWzT2UbNg/qIxYk8t2GJvVLh0t67DIztljUdEngc62yHFMrUeyNf
 RrGA==
X-Gm-Message-State: AHQUAubyynsnpRqoDPD//qu0aK5NH3Bp8Ul8RodfYhX/uzoNzbdoCrwb
 PbWEzig30lyRaoH2bbU6j15wR8PSOyE=
X-Google-Smtp-Source: AHgI3IaNgWf+I26fT6YNSyXrhnFpHgqvxVA3ivPS9saurb3M0ZkpkZ+sL30BWkDF5rc3mOi8p2okVA==
X-Received: by 2002:a2e:9595:: with SMTP id
 w21-v6mr19525278ljh.194.1550651549231; 
 Wed, 20 Feb 2019 00:32:29 -0800 (PST)
Received: from localhost.localdomain ([193.89.188.34])
 by smtp.gmail.com with ESMTPSA id k23sm437044ljk.69.2019.02.20.00.32.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Feb 2019 00:32:28 -0800 (PST)
From: Viktor Kim Christiansen <vkc@connectedcars.dk>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] wg-quick@.service: change execstart & execstop to use
 unescaped instance name
Date: Wed, 20 Feb 2019 09:33:58 +0100
Message-Id: <20190220083358.30941-1-vkc@connectedcars.dk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Feb 2019 08:03:58 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Signed-off-by: Viktor Kim Christiansen <vkc@connectedcars.dk>
---
 src/tools/systemd/wg-quick@.service | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tools/systemd/wg-quick@.service b/src/tools/systemd/wg-quick@.service
index 9c67af9..bddb19d 100644
--- a/src/tools/systemd/wg-quick@.service
+++ b/src/tools/systemd/wg-quick@.service
@@ -12,8 +12,8 @@ Documentation=https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8
 [Service]
 Type=oneshot
 RemainAfterExit=yes
-ExecStart=/usr/bin/wg-quick up %i
-ExecStop=/usr/bin/wg-quick down %i
+ExecStart=/usr/bin/wg-quick up %I
+ExecStop=/usr/bin/wg-quick down %I
 
 [Install]
 WantedBy=multi-user.target
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
