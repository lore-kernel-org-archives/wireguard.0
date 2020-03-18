Return-Path: <SRS0=qVad=5D=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8905AC4332B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 23:43:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E572120768
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Mar 2020 23:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POwf+1Ax"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E572120768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c954346a;
	Wed, 18 Mar 2020 23:36:44 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a8a8907a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Mar 2020 23:36:41 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id g18so216605plq.0
 for <wireguard@lists.zx2c4.com>; Wed, 18 Mar 2020 16:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeOKntOVq2hz29DNBDrZbM/pLdlu5Jm+mD8N3i5XPE0=;
 b=POwf+1Ax8oYvd/VJzMVpBCuZHn2NrS8G0bybwGkefUpAomQNwg1+NNlQWrQKHcQRbK
 t9YR9/GYmcRM5MJK5QftdE/+TP4LTQKosB2f3//HJzwAhmRY4SHuPlfovFPsW92kveIE
 gdORrbIHrC5Mn8pC4SiBCnyf8GJ1uws1Bp/QSp/T9GeeZEvWKVCm8/WMTCPVM+j5DfUU
 Mj5THA0i60qlfpYwB9W1tZVvfpz7iO2650Lb4kX5rmE6yPxqUUClRGJt7Obic4WYAFae
 3FJn69ftg6TA9os4OrdJ643lIKPLea/t4Vzd3Zq9OjX7W30SVksbEcBqyrIPaS5I8ivO
 ieIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GeOKntOVq2hz29DNBDrZbM/pLdlu5Jm+mD8N3i5XPE0=;
 b=KvJBm1PvshCncX5mO/fdLYvqdOK29pVtKK77wL/4+/06AxG4yeru8Gd9Lw9xgX5/8T
 w9hhnAcYRdMu3UrM0txNNrJBM8n4Fr4rt9ZSWdnR4OCwCJoSVr5FcSCeLsYOfuUaZihf
 8Lf18imRPA1W6NDDzvdKpLXFx/qK8kGufy8hyzTZJSNm6AxdiSuFnDbPMcHeMlwjUQYU
 eifWF4CYWRKX6iT8y123h7CQjb0Vz0xs7K/BWTvwGPdt2awRt41yUz9ZLXNKKVcW5xOg
 2lg1MWbIck92qCfXrS+aZJlwb2gSMDxGpvL+ccsKT0juNLv6N10c8iNUeSPjy6Mx9kPp
 NJ6Q==
X-Gm-Message-State: ANhLgQ3hZloMvLgVX43cWdLVBYPrhHaP8miTGQugqme2hZaDa2IRnYHL
 uXSG+WOX5k0JOCZY+D/2k+Wa8QeE
X-Google-Smtp-Source: ADFU+vvzFeuBVUtXR7EclWPnfL8getzibhPesf6MQ7Qa6jRksVDrYANgN3S2JIrEQ//REhtubJnijQ==
X-Received: by 2002:a17:902:9f95:: with SMTP id
 g21mr700543plq.66.1584574984574; 
 Wed, 18 Mar 2020 16:43:04 -0700 (PDT)
Received: from My-MacBookAir.catsrv1.hicat.ne.jp (ca163152.hicat.ne.jp.
 [202.95.163.152])
 by smtp.gmail.com with ESMTPSA id y22sm134289pfr.68.2020.03.18.16.43.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Mar 2020 16:43:03 -0700 (PDT)
From: Eiji Tanioka <tanioka404@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Eiji Tanioka <tanioka404@gmail.com>
Subject: [PATCH wireguard-android] strings: Update Japanese Translation,
 corresponds to commit 724884e.
Date: Thu, 19 Mar 2020 08:42:15 +0900
Message-Id: <20200318234214.5048-1-tanioka404@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Signed-off-by: Eiji Tanioka <tanioka404@gmail.com>
---
 ui/src/main/res/values-ja/strings.xml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/src/main/res/values-ja/strings.xml b/ui/src/main/res/values-ja/strings.xml
index 2f85bc8..49a4ee0 100644
--- a/ui/src/main/res/values-ja/strings.xml
+++ b/ui/src/main/res/values-ja/strings.xml
@@ -99,6 +99,7 @@
     <string name="module_disabler_disabled_summary">カーネルモジュールは実験的ですがパフォーマンスが向上する可能性があります。</string>
     <string name="module_disabler_enabled_title">カーネルモジュールバックエンドの無効化</string>
     <string name="module_disabler_enabled_summary">ユーザースペースバックエンドは低速ですが安定しています。</string>
+    <string name="success_application_will_restart">成功。アプリケーションは再起動します…</string>
     <string name="mtu">MTU</string>
     <string name="multiple_tunnels_title">複数トンネルの同時有効化</string>
     <string name="multiple_tunnels_summary_on">同時に複数のトンネルを有効化できます</string>
-- 
2.25.1

