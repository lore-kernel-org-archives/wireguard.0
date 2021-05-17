Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922F4C43617
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:22:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D7D611B0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D7D611B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9e34dae;
	Mon, 17 May 2021 15:22:00 +0000 (UTC)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [2607:f8b0:4864:20::102e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40303aa2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 08:17:46 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 cu11-20020a17090afa8bb029015d5d5d2175so2420195pjb.3
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPVXV5rkpmusT9GGUEjwOzn8WfiRWJBQO/NMGCKWpME=;
 b=ZbtQQlWamd/enBPVov07CvXW5PeiPEPayslWgV9jkDLuIeqcs5YcY6KFGu6iqPOkpA
 6yg5ehHAHdQkBfMIxlHFaqVgibeJd5QftfpsXroo9+zyfj8w9J6kGNWWne/9BR/y+5Lj
 F52phjjxck93bZa4NeVFZRCX2wnGud6c/Gu5s9InFSH6uMa7Kvi06OX9nM3FdPjgMaB4
 6eJNZUY0HMvqRUVr1+aRT/MlRnxryto4qKYVBQ7azh1JWxhzGirOBxx41VDDwUkaZLg2
 FIpqY3job/gPtH4R4u3kR4uQme8a2R1DHCujxc70VOTt/hseqpjYxvvCW91yrGLqj/jo
 K9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JPVXV5rkpmusT9GGUEjwOzn8WfiRWJBQO/NMGCKWpME=;
 b=DoecYk26uqr0grELep+VgtKAMK4ic/U3Far1FksM7O95SVmh4bNhdfUdw4Y2pR1V5/
 xdghHfq4fPZWpSoN6s7V/93NAMDBZ369m4guwDDZbAv6OXaph9oYkjXMl3JqK4SDCJP2
 FnS5GCddIfAPgAqLK7L+3w+ZdYUkg7AKMbQ7Ne1oYWEffyt4CpJGy2SAC86DitDRpPUC
 7DL8jIrHsCETsl4FYDWQHqEJ2eGOWQdBOmuVnA1gCZWK0GJ3BEEo+21/4hGZxNrGy5Wb
 fZiPrfOQhmeh0R+sCDOpmPI147+2p9DOo2uN2xZwABTI5bFIK1+dD7mX5HeBMCIj37g8
 QVpA==
X-Gm-Message-State: AOAM5327ZsUVCGb2cQ7kI6j8XmgozkQRJtKOxBAyti0/n0N43SJJiokL
 ATsRhCKGLo19ZhAVLhyf1JDlZl+qCBLrQg==
X-Google-Smtp-Source: ABdhPJzgRAz1UzmbdiZBiTdgpxUGaz9I3Ps2f44u6xhrcsUDmb101KvjLD1R5F+AMSVW8b5xQuuyCQ==
X-Received: by 2002:a17:903:1ca:b029:ee:5aa3:c077 with SMTP id
 e10-20020a17090301cab02900ee5aa3c077mr59301877plh.51.1621239464183; 
 Mon, 17 May 2021 01:17:44 -0700 (PDT)
Received: from Leo-laptop-t470s.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id n27sm9543246pfv.142.2021.05.17.01.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 01:17:43 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCH RESEND wireguard-tools] contrib/launchd: fix xml syntax error
Date: Mon, 17 May 2021 16:17:30 +0800
Message-Id: <20210517081730.868755-1-liuhangbin@gmail.com>
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

The current plist xml gets error "DOCTYPE improperly terminated" with xml
syntax checker[1]. The example in apple doc[2] also doesn't have semicolon
at the end of DOCTYPE line.

[1] https://www.w3schools.com/xml/xml_validator.asp
[2] https://opensource.apple.com/source/launchd/launchd-257/launchd/doc/HOWTO.html

Fixes: b30e74b5956a ("wg-quick: darwin: support being called from launchd")
Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
---
 contrib/launchd/com.wireguard.wg0.plist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/launchd/com.wireguard.wg0.plist b/contrib/launchd/com.wireguard.wg0.plist
index 9fc0141..ea1eab6 100644
--- a/contrib/launchd/com.wireguard.wg0.plist
+++ b/contrib/launchd/com.wireguard.wg0.plist
@@ -1,5 +1,5 @@
 <?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd";>
+<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
 <plist version="1.0">
 <dict>
   <key>Label</key>
-- 
2.26.3

