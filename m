Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B7DC35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 18:22:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D9BA21775
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 18:22:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkLYU8RZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D9BA21775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 652fd0ed;
	Sat, 8 Feb 2020 18:20:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e3806ac
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 18:20:52 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40e1e8e0
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 18:20:52 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c9so2652399wrw.8
 for <wireguard@lists.zx2c4.com>; Sat, 08 Feb 2020 10:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+RaiUybFvun8ZHDON9qpImZFm+qiveWK5vvPFr6I7CY=;
 b=QkLYU8RZySxiN2g3vnzJFh/mxR1zTdltPQmqhOh1u47uBidcKAl4rZ814eyaIdWM2b
 0NYAVeV0dWbEJSXo+DRwzAjduKfsvgPke78/Q8MluWK3kpCZVoFUe2xOY/BAwy4M7YL9
 yVTjyjArshIf1K+QagKKxxL7NT3QcqSKNXbrbUxPtc+04+4zyqsYuAgGBFkEub9UAu+5
 dK0ncsfdJHwjb+MvkLU0EzGQlv1xzPH+qh3EHzDYf7pYmb42c5xJ8ewZOia53TEWEC0i
 pFsI/kKF0XyRqSLlR4NCfVIFI+LFtxuem6COFN8eAQp6gR8rTOZyP9K6N3EgB5ibliW9
 rldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+RaiUybFvun8ZHDON9qpImZFm+qiveWK5vvPFr6I7CY=;
 b=U7BLWM24VYeUxKzKyz9zC/kMTTCJmH8MqDShHOZj1lZu8tqf8QEqTBclWXtjzei2tt
 eJh8TC9dnRQA/zaKUc6n9nusjf5tlDH8Nt7Gj6Pw/8Nq2wrpueT9YT4B8DHW9uCy21IS
 ExjeQ929yT6j17anVs8jirjSIA5Wz+8ZlDTaPbWxeQjUrNMZk2D0GcGJFjx+5Lz/aJBq
 oYwCihb4cftcreAU0M6Xl7zGe2hYNv18KENKc+yHkwx9Xb0QrU1G37kZ8CLKVB8Q5G++
 /IoedZfTblD3tcDOqPl+SvOk0VSkOkDPi/+6D5AcsjTFZQnod73O0UzO97ktCRIpxeFm
 56kA==
X-Gm-Message-State: APjAAAXdwIrD90WMwFRJsIN0bjIsHaIE38FUdy9oQoyuE9qnEa0lApIU
 8tr1S+FoMo9A74XBmApU6wE=
X-Google-Smtp-Source: APXvYqwjNS/keQzTJ+OvHLtgR0/WFHgPEbA8wH0Nj3zUUBRJWrYHKVcV4Vhx0vS8I7YxQIjGha9m3w==
X-Received: by 2002:adf:b352:: with SMTP id k18mr6242182wrd.242.1581186131683; 
 Sat, 08 Feb 2020 10:22:11 -0800 (PST)
Received: from localhost.localdomain
 (p2003000601FCB63093D51F0CE694D5FA.dip0.t-ipconnect.de.
 [2003:6:1fc:b630:93d5:1f0c:e694:d5fa])
 by smtp.googlemail.com with ESMTPSA id 133sm8726438wmd.5.2020.02.08.10.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 10:22:11 -0800 (PST)
From: Kai Haberzettl <khaberz@gmail.com>
To: Jason@zx2c4.com,
	wireguard@lists.zx2c4.com
Subject: [PATCH] Fix typo in man wg-quick(8)
Date: Sat,  8 Feb 2020 19:21:42 +0100
Message-Id: <20200208182142.6479-1-khaberz@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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

Signed-off-by: Kai Haberzettl <khaberz@gmail.com>
---
 src/man/wg-quick.8 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/man/wg-quick.8 b/src/man/wg-quick.8
index 6250adc..c38c7d9 100644
--- a/src/man/wg-quick.8
+++ b/src/man/wg-quick.8
@@ -56,7 +56,7 @@ as usual.
 
 The configuration file adds a few extra configuration values to the format understood by
 .BR wg (8)
-in order to configure additional attribute of an interface. It handles the
+in order to configure additional attributes of an interface. It handles the
 values that it understands, and then it passes the remaining ones directly to
 .BR wg (8)
 for further processing.
-- 
2.20.1

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
