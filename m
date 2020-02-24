Return-Path: <SRS0=8BwB=4N=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74486C35DEE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:48:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1624F21D7E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 25 Feb 2020 00:48:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p7tU6CjE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1624F21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2213b8dd;
	Tue, 25 Feb 2020 00:43:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ece5a7e
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:31:41 +0000 (UTC)
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3adee35
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Feb 2020 13:31:41 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z15so2075870wrl.1
 for <wireguard@lists.zx2c4.com>; Mon, 24 Feb 2020 05:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgkWDk5QfcspmkZaIZr50vVKbt4Kr6qoHxpxOJCDhdc=;
 b=p7tU6CjEX9K9FWgwCbF7V5BRRWt99YgpeaMeLBf96vsptl+LBfKZyl+00WQ7g8e7vc
 cBlg3mnMmOtG+RF4LIwJ8pjf/zAcuAm7ON3y+vDbzVSN+d0KHA9OzoUHG3UEMPC4hih2
 fLUtVM6FezVkcITSk15VMAt64A/648CBNeEy41OFk5ZEukax2wcTQhrifdlA0uAY27D7
 UnrgL2hDsFv3wDsKMPk8zxycjgy06kK84Ao7wHTTPwcyiIk5K+wTj3x4zzjzg6bysolc
 zYJFmEWehe22r+83NtARAM/DU7WOwoy+C3qItQ9SXhfkJ9x7ECuHrWulFWrAdWo9tRdD
 py5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgkWDk5QfcspmkZaIZr50vVKbt4Kr6qoHxpxOJCDhdc=;
 b=tDWrnNUV6ef2OwOYc89VVL9svybl3W38AlHbjHENmWYMh2uUyAyh7WM6J8fqIbCXSn
 BCe9Nv6gMMzo/8NnQsvfqD0xa+v0BJ09gPbItFGBpTKHwfXNsigr7ttnE2IM9jnblTox
 UuhPbfxIy8vRUN2BWk4UjQmTXWZB7neWwBwLjVM7aq+AEJq1n4rnRt3C2ug6n2T+NG7A
 lPueCwnRGPWgob3Ah4uwDbluJcE3NoR7nV4W6bw4dJS3YL1n4IBCYW8inq5no1SFKwq4
 /KymJmqy5/4gmN1ehf9/H8l396TFSHeqIS5zB/NKWGLJF98U/p3BKJ3Fizq20Dy2KAR6
 NGgA==
X-Gm-Message-State: APjAAAXiG9c3SpFxrleIQ4AHjZhhPkaytHzKswrjlXEdURL6EqLE1r6X
 iSZvW1L+H2pigxg8IuDQcZ1TKvmUFfo=
X-Google-Smtp-Source: APXvYqymhHs61GHgxEfgQ5xZ1kwAt5DxiZ7rTYaBrQxTBOjAUPQULs0HIzUL19juAOsfcN0IMJ1Ogg==
X-Received: by 2002:adf:f084:: with SMTP id n4mr66515274wro.200.1582551303418; 
 Mon, 24 Feb 2020 05:35:03 -0800 (PST)
Received: from localhost.localdomain ([185.217.171.65])
 by smtp.gmail.com with ESMTPSA id u8sm18596013wmm.15.2020.02.24.05.35.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Feb 2020 05:35:02 -0800 (PST)
From: Arjen Brouwer <arjenjb@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: [PATCH] DO_NOT_LAUNCH parameter was ignored by MSI, should work now
Date: Mon, 24 Feb 2020 14:32:39 +0100
Message-Id: <20200224133237.953-1-arjenjb@gmail.com>
X-Mailer: git-send-email 2.24.1.windows.2
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Feb 2020 01:43:43 +0100
Cc: Arjen Brouwer <arjen@ag5.nl>
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

From: Arjen Brouwer <arjen@ag5.nl>


The `DO_NO_LAUNCH` parameter did not actually work. After running the installer with the DO_NO_LAUNCH parameter, the UI still showed up afterwards and the MSI log had the following entry:

```
MSI (c) (28:08) [14:43:17:966]: Ignoring disallowed property DO_NOT_LAUNCH
```

By explicitly defining the DO_NOT_LAUNCH property and making it secure, solved the problem.

---
 installer/wireguard.wxs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/installer/wireguard.wxs b/installer/wireguard.wxs
index 5bbb1eb..781d20c 100644
--- a/installer/wireguard.wxs
+++ b/installer/wireguard.wxs
@@ -45,7 +45,8 @@
 		<Property Id="DISABLEROLLBACK" Value="yes" />
 		<Property Id="MSIDISABLERMRESTART" Value="1" />
 		<Property Id="MSIRMSHUTDOWN" Value="1" />
-
+		<Property Id="DO_NOT_LAUNCH" Value="0" Secure="yes" />
+		
 		<!--
 			Upgrading
 		-->
@@ -135,7 +136,7 @@
 		-->
 		<CustomAction Id="LaunchApplication" HideTarget="yes" Impersonate="no" Execute="deferred" FileKey="wireguard.exe" ExeCommand="" Return="asyncNoWait" />
 		<InstallExecuteSequence>
-			<Custom Action="LaunchApplication" Before="InstallFinalize">(&amp;WireGuardFeature = 3) AND NOT DO_NOT_LAUNCH</Custom>
+			<Custom Action="LaunchApplication" Before="InstallFinalize"><![CDATA[(&WireGuardFeature = 3) AND (DO_NOT_LAUNCH = "0")]]></Custom>
 		</InstallExecuteSequence>
 
 		<!--
@@ -143,7 +144,7 @@
 		-->
 		<CustomAction Id="LaunchApplicationAsOrdinaryUser" HideTarget="yes" FileKey="wireguard.exe" ExeCommand="" Return="asyncNoWait" />
 		<InstallExecuteSequence>
-			<Custom Action="LaunchApplicationAsOrdinaryUser" After="InstallFinalize">(&amp;WireGuardFeature = -1) AND (!WireGuardFeature = 3) AND NOT DO_NOT_LAUNCH</Custom>
+			<Custom Action="LaunchApplicationAsOrdinaryUser" After="InstallFinalize"><![CDATA[(&WireGuardFeature = -1) AND (!WireGuardFeature = 3) AND (DO_NOT_LAUNCH = "0")]]></Custom>
 		</InstallExecuteSequence>
 	</Product>
 </Wix>
-- 
2.24.1.windows.2

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
