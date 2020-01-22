Return-Path: <SRS0=23NU=3L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6384AC2D0DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:56:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0274921835
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Jan 2020 19:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=revathskumar-com.20150623.gappssmtp.com header.i=@revathskumar-com.20150623.gappssmtp.com header.b="mC+FwY6U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0274921835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=revathskumar.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdced805;
	Wed, 22 Jan 2020 19:48:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 676982d9
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:42:31 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 449cd433
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 19:42:31 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j26so325954ljc.12
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jan 2020 11:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=revathskumar-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Zo8EQs/7VHKiceX4P1IdnsmbF5tEH27RZ4FZ6LMOmQ=;
 b=mC+FwY6UMp5tcDmIa3DgDfpU0H9Hr/DmcN0YC21+v3Sw/FlKX4bga42z1YD8QirNxr
 8Y9i69wbv2Y4rI+lQ0f4dFVvZiolJl5CcnDte1/8DB9I1VXcmFsImoVRROwL1aAJfuSQ
 s8ZjOwzDR2X5YL4pMAkiGo6sfuvxKHEle1pe98+TGzZBEKK14cN9Zs3Qr4DT0lvtlZYf
 yHSEs8n9BCXZqeOGMWpqPoSDa0N+m1ZqkkHAallsRgZtFRGUhIXx7Zl7n2xWDtLrsIV+
 XTBZ3rxXFGeu0sCLOfJ4Aj5dPYmfuzbJ8X2YHG44uSZAIMsKVo7fSe+p+ybzbNr0nkDO
 wRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Zo8EQs/7VHKiceX4P1IdnsmbF5tEH27RZ4FZ6LMOmQ=;
 b=ThHpaBNSGQdYp+m0Ze1JUvlzvH6TSQdHTDlFMQ6MH8pQ2VyCxAYJWwDUcxPWakTTUE
 Q2svlQ8KN8dvo5wYmSOK/ioeE1wpw8kYvshvQHdp404+nLj+IZKtMesjY2YcL27DuIIM
 J/91lbDNU9+uax7kPvGw1TJ1F7tD8gsSSwqteb2F+7yKCqtrDB/fpuwk6i78Uf7lWHlB
 9QcR4+Tt4/wahO0HsmKwbf4gjBcpjwf9V7/Bw961osWgWPFmJdfXV/LNK7AevWiX96rL
 lCImhzS7NqDsODTlB0kxUrPEQN+S/xCM86gNq3Ha+4VMykecZjEISW3IpRxw9Zm2zsU5
 qJKw==
X-Gm-Message-State: APjAAAVQBjTYgD9A4eUwVNvQY00i+t1lBC4ZkTsN1r9IyAw0m6wmX4+m
 tdEf/gyAsFx1oOcg9lgW1lA16Q==
X-Google-Smtp-Source: APXvYqzfoOQSg0LaxIJcAen/5kVYnhLAw2o18fgDYZ1JMcsq//r/N1zcqMYZvJRiSjtZAnEKPNlaAA==
X-Received: by 2002:a2e:571d:: with SMTP id l29mr20645096ljb.193.1579722149736; 
 Wed, 22 Jan 2020 11:42:29 -0800 (PST)
Received: from workstation.local
 (ec2-13-53-113-88.eu-north-1.compute.amazonaws.com. [13.53.113.88])
 by smtp.googlemail.com with ESMTPSA id w1sm21088008lfe.96.2020.01.22.11.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 11:42:29 -0800 (PST)
From: Revath S Kumar <rsk@revathskumar.com>
To: Jason@zx2c4.com,
	wireguard@lists.zx2c4.com
Subject: [PATCH] fix: make wireguard compatible with android TV
Date: Thu, 23 Jan 2020 01:11:56 +0530
Message-Id: <20200122194156.14049-1-rsk@revathskumar.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 20:48:08 +0100
Cc: Revath S Kumar <rsk@revathskumar.com>
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

As of now wireguard is not listed in Android TV play store
due to the lack of CATEGORY_LEANBACK_LAUNCHER [1].
Even the app is not listed when we sideload into TV device[2].

[1]: https://developer.android.com/reference/android/content/Intent.html#CATEGORY_LEANBACK_LAUNCHER
[2]: https://developer.android.com/training/tv/start/start.html#tv-activity
---
 app/src/main/AndroidManifest.xml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/app/src/main/AndroidManifest.xml b/app/src/main/AndroidManifest.xml
index 21fc6eb..9bd2940 100644
--- a/app/src/main/AndroidManifest.xml
+++ b/app/src/main/AndroidManifest.xml
@@ -16,6 +16,8 @@
         android:label="@string/permission_label"
         android:protectionLevel="dangerous" />
 
+    <uses-feature android:name="android.hardware.touchscreen" android:required="false"/>
+
     <application
         android:name=".Application"
         android:allowBackup="false"
@@ -31,6 +33,7 @@
             <intent-filter>
                 <action android:name="android.intent.action.MAIN" />
                 <category android:name="android.intent.category.LAUNCHER" />
+                <category android:name="android.intent.category.LEANBACK_LAUNCHER" />
             </intent-filter>
 
             <intent-filter>
-- 
2.25.0

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
