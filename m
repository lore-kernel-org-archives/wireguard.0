Return-Path: <SRS0=FIfu=5K=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E66CC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 12:26:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F4320772
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 25 Mar 2020 12:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2QtFZQS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F4320772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13845624;
	Wed, 25 Mar 2020 12:18:44 +0000 (UTC)
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [2607:f8b0:4864:20::1044])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 89124fa6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Mar 2020 12:18:42 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id kx8so942899pjb.5
 for <wireguard@lists.zx2c4.com>; Wed, 25 Mar 2020 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f8ios5lT6ZLTyaNIlyk/4/VdZ5TgnLp0nUSd/Nt2JHA=;
 b=q2QtFZQSpWVQNeJZyRqd7X0/rBg+u4SMDG+AGqFUJmQe4ZXKtRXqulcc7N+PXywWMN
 wudY4NIRDEfFo52l/FNbl71Vyf2Lgsed+wONbdwW88l5ZbImp76PkEdc/rLelsDb4Xtk
 pZX0iwYynZLSwC91NJFV+k4oczXDGnw53LyFWPLXjXtcCC/DDx8eR8tlTloPn35sqZGa
 GoLrDzDR+jxiazXEo5vUCnPamX9OKWJSy2Idp/9Yb9LXMV5Hh9n6wD5rKchqYZt8ybf+
 BCp5caXsGLY8xG3nKiHs5HCojQK4JBD0nL32ZqaAPAL0SqinmXA5PscQ05hMzlWz+MgB
 Mw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f8ios5lT6ZLTyaNIlyk/4/VdZ5TgnLp0nUSd/Nt2JHA=;
 b=tIVWEGK0t7b3PiYiSXMYs6GAuEz5+OhQ5VGdeofBwZK3iglFlfntdj22RiYr3MbaPy
 rF6kCz1a8wcdMPAZEyIWq61XDXCu4MQm/0RWkZ4n1xxHODIOCq6IO7hUIfsTdDkiyf0K
 1XI72MxyWzf2MxITHFo5SZ5NKO288fVACS6nnDXzSI3gVh9k3JkPRgDjTh/iqkeeLylM
 vNZvYsqLL7nmz6YB3yCtPyYp0RIJBoynGrCpaQ5EM/qr9fDXKDWMispLzKWKYWhmLqqb
 lFmALDLwJ8yCVQ/JjGHkOYsmhgK/wWC5mJTCjWzyyBM1/e7XknK4W8YBHKitKf8ZRrOx
 npng==
X-Gm-Message-State: ANhLgQ1bK0VdY+2HfeG3qDYldwaGad6y0/pcQ9E+zItYvQU1l9Q3nsLm
 OF6/NMo4BSU+jsMg3G3Hu5ZJCetL
X-Google-Smtp-Source: ADFU+vskILq+/75EG2B8h2DUxjhVsFjHsgqbHwLxxUCefXpqoQKTYneSWdwp+uGJuNliFIwy0ADvCQ==
X-Received: by 2002:a62:8684:: with SMTP id x126mr3176654pfd.160.1585138782804; 
 Wed, 25 Mar 2020 05:19:42 -0700 (PDT)
Received: from My-MacBookAir.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id a15sm18334013pfg.77.2020.03.25.05.19.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 05:19:42 -0700 (PDT)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Eiji Tanioka <tanioka404@gmail.com>
Subject: [PATCH wireguard-android] Explicit indexing for
 'import_partial_success'
Date: Wed, 25 Mar 2020 21:16:35 +0900
Message-Id: <20200325121633.2991-1-tanioka404@gmail.com>
X-Mailer: git-send-email 2.25.2
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

When translate it to Japanese, values are exchanged.
For example, '1 of 10' is '10 個中の 1'.

So this string should be explicit indexed.

Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
---
 ui/src/main/res/values/strings.xml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/src/main/res/values/strings.xml b/ui/src/main/res/values/strings.xml
index 70d92c3..74c5be6 100644
--- a/ui/src/main/res/values/strings.xml
+++ b/ui/src/main/res/values/strings.xml
@@ -13,8 +13,8 @@
         <item quantity="other">%d tunnels selected</item>
     </plurals>
     <plurals name="import_partial_success">
-        <item quantity="one">Imported %d of %d tunnels</item>
-        <item quantity="other">Imported %d of %d tunnels</item>
+        <item quantity="one">Imported %1$d of %2$d tunnels</item>
+        <item quantity="other">Imported %1$d of %2$d tunnels</item>
     </plurals>
     <plurals name="import_total_success">
         <item quantity="one">Imported %d tunnel</item>
-- 
2.25.2

