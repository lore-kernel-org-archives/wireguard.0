Return-Path: <SRS0=jbYm=7F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148E1C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 07:44:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A26892071C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 07:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkE/gWU9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A26892071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d9a4b4f;
	Sat, 23 May 2020 07:28:58 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [2607:f8b0:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id efbd5ce6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 07:28:55 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id z64so1740594pfb.1
 for <wireguard@lists.zx2c4.com>; Sat, 23 May 2020 00:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8rkiaSwCHXH/6mH65IDImw+ZvzwSmy9F90BR3jB+KY=;
 b=dkE/gWU9uBbLwAlSM0vQ5P4OK0sH+S18m9ANp6oCF4OI0xzeiHMIPonDUjXXgv1AAx
 65d7ZmnXeiCeDubp/vYkATAWVhRHlbfNRBFcyvia4LsDi27/cntot2RG8y0gHG9xdiFc
 8/68jl3RdlDsuSBWyUg90QOcIb7nKzTjr0twi4E47gEtsGfSPK/zI9c0L3lsmhqVHkmJ
 qP6GbktrDhl3zCcNfAuYRhPpCtNAXqBsTMLLOlD+CFMdsQ/y0rnmZ89MoJInQMKQZ3D8
 XSrPDN5hoJGNw3snl5h/JdsI/uQzetlmFdJ/5BkJfmH1DM0yozyTr2z4N9m5pGulE78V
 0Lyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8rkiaSwCHXH/6mH65IDImw+ZvzwSmy9F90BR3jB+KY=;
 b=SfJsCt5h0WeY3DeleZNXQVvWytZxOAsN5QqzjYflxBensc2i+wIjtqAeDzqXd6lIbx
 +xYdz7HJuGGhi1YrLm9DM0CEwmRI2BV9NMLliKujkxXRAEozU/HAz/OcLG4lM5CELcjn
 s58d/AA5OSKRyDnc05zojzvgvSyl/l3PqnG2RuKuXawtV4aoNb49mVyMxSzQr1TRcLHX
 BD8Z6xa9GjhkjYPDWqi4zkUGwZ/AULDBG6mtWqz/AeYGJMV+morGeOs5NZHQk9UbbTOS
 PYp/AYCDkW80We+A63wZE1iIrvu2hKhfAYAcxFwlp+zQXlaWnGSso97yObMVYTC/9WJV
 M5Rw==
X-Gm-Message-State: AOAM533lmIQf4ki013Y/iTOxLzbRxWc4iThyYlf6GeuJsd1oJnkmLaxq
 BmoRQDNDlokuMvGE07CmGwqURWaOo2ydmg==
X-Google-Smtp-Source: ABdhPJxgqgKJtYLeGg7XTjcOvyjSicJMLB4/GJkQ3Tybs9aivOjiiyMTz9TerWOIn+BwAVr2pogalw==
X-Received: by 2002:a63:3609:: with SMTP id d9mr17044775pga.354.1590219353375; 
 Sat, 23 May 2020 00:35:53 -0700 (PDT)
Received: from localhost.localdomain (li1179-65.members.linode.com.
 [45.79.80.65])
 by smtp.googlemail.com with ESMTPSA id m14sm7361634pgk.56.2020.05.23.00.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 May 2020 00:35:52 -0700 (PDT)
From: Kai Haberzettl <khaberz@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Kai Haberzettl <khaberz@gmail.com>
Subject: [PATCH] Update Copyright notice for dmesg to 2020
Date: Sat, 23 May 2020 09:34:54 +0200
Message-Id: <20200523073454.29440-1-khaberz@gmail.com>
X-Mailer: git-send-email 2.20.1
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

Signed-off-by: Kai Haberzettl <khaberz@gmail.com>
---
 drivers/net/wireguard/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireguard/main.c b/drivers/net/wireguard/main.c
index 7a7d5f1a80fc..d189699b63d4 100644
--- a/drivers/net/wireguard/main.c
+++ b/drivers/net/wireguard/main.c
@@ -37,7 +37,7 @@ static int __init mod_init(void)
 		goto err_netlink;
 
 	pr_info("WireGuard " WIREGUARD_VERSION " loaded. See www.wireguard.com for information.\n");
-	pr_info("Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.\n");
+	pr_info("Copyright (C) 2015-2020 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.\n");
 
 	return 0;
 
-- 
2.20.1

