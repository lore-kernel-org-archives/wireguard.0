Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05525C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:27:28 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DA061004
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:27:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DA061004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25a56eab;
	Mon, 17 May 2021 15:22:01 +0000 (UTC)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [2607:f8b0:4864:20::42d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f127192f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 09:11:06 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id s19so2251016pfe.8
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 02:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjjjE71AfPUwf/ZypjvqVcfufjxakCDFUlRWj2bBDD0=;
 b=nhwidPbc2DLWgOgt6WMG/Een70fyRiTQX0RSfSq+m5vKanWgXRPaEr857tp8VH54EZ
 tBiOhfCWG3d7BzwyHeEeq3LGqnVDl9arI3Ac9iO3N6zt2OFaopsbeZhCXDC1bGkGrXqN
 uRYN28C5qbqGgzS0rX6ZHEqj9veiwoSSkILGMZlHT4kcT76gCmRuf4JBgGhCFA0CNPW3
 ec2zh5I6rQrlM6NPYBWbI3SK4qFSV0lcl3/clMzqvTJGtfPUh0PZwMRwPdY9RayLqwsD
 uOFlTegqoyLZLM+gkQHPutshlWd/UAe6/ftIs5Zv0WcC+plLjyzgCeBQctl+THLscgIt
 fylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjjjE71AfPUwf/ZypjvqVcfufjxakCDFUlRWj2bBDD0=;
 b=fm8aiaAuoQqaol0qbBMRp31Yk4B99Kh9bvOa1lO+xNAyPS0baxcDQP+djWNgpiAHGf
 l6zvg1mNqd0jjEoSKF+jQ5l4v8BJr7XHvGQVjb0sg4djPee8nq5E+3u5W1MRS1n3yH6s
 A4SoIIawflH+2rFjYlKkgOXlUW7GdLh/gOJRQRr45pqNfueJPNHeUVtSc3lmfjC/nCHQ
 ofq4ASMconOHx+kPrsW3dPdmt90j6KXToO4dhT6ArlOI1ciuWv0iJtdER11iluyG7bVe
 2lP2Izcglyybc+Aoe9TcmA+YzBDF72Q7mI6NJhCKUfZ1cp8LCAPPKoW3qwyo5e+oA3AJ
 spDQ==
X-Gm-Message-State: AOAM531zs1kVzUzVGGnGS5JM3ASGVo3FsWkZ2CdENBOn13pnPU2Ty2RF
 rRuA/lFXiCHoq7MkC4zDOWrHSUOePyc4uw==
X-Google-Smtp-Source: ABdhPJwFKpZO38Yio2IK3eMQ0mTxvQL/CVSOpoUPi36/ucSwGtuNIqrgJCJiWv2nYzMxoli0Vg1j9A==
X-Received: by 2002:a63:e105:: with SMTP id z5mr40752343pgh.321.1621242664446; 
 Mon, 17 May 2021 02:11:04 -0700 (PDT)
Received: from Leo-laptop-t470s.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t14sm9142310pfg.168.2021.05.17.02.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 02:11:04 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH wireguard-tools] src/show: remove dead offset check code
Date: Mon, 17 May 2021 17:10:53 +0800
Message-Id: <20210517091053.886157-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 May 2021 15:21:51 +0000
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

At first the offset will always be 0. So the check of offset ? ", " : ""
is useless.

Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 src/show.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/show.c b/src/show.c
index 761858b..83d4d6b 100644
--- a/src/show.c
+++ b/src/show.c
@@ -141,7 +141,7 @@ static size_t pretty_time(char *buf, const size_t len, unsigned long long left)
 	seconds = left % 60;
 
 	if (years)
-		offset += snprintf(buf + offset, len - offset, "%s%llu " TERMINAL_FG_CYAN "year%s" TERMINAL_RESET, offset ? ", " : "", years, years == 1 ? "" : "s");
+		offset = snprintf(buf, len, "%llu " TERMINAL_FG_CYAN "year%s" TERMINAL_RESET, years, years == 1 ? "" : "s");
 	if (days)
 		offset += snprintf(buf + offset, len - offset, "%s%llu " TERMINAL_FG_CYAN  "day%s" TERMINAL_RESET, offset ? ", " : "", days, days == 1 ? "" : "s");
 	if (hours)
-- 
2.26.3

