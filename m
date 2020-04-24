Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16D0C2BA1A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50F3520728
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta4TEbUz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50F3520728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2032735;
	Fri, 24 Apr 2020 23:33:07 +0000 (UTC)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [2607:f8b0:4864:20::541])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd82c795
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 23:33:06 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t11so5398917pgg.2
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 16:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQEkVXtfNM6n1StjbHRiHUcAJLur7gwq1XYwaSW2eoc=;
 b=Ta4TEbUzkxZMXn3TnvYG7aLmxBvPbeGPXmjfrxq4vOwaktX06iXTMjmYypg/jjVncr
 Nl0SmcJ+LsnwdKTnhxgLe4oSoqRAtsrFsz7ol8r1RNlPvm3CSYqA3+IQDhyiSfsvn6To
 1uaE+UKqMDbAuPWa+JtJwCNahwC42rKELcUG7nWjJrSkwYV3cZ3/M5MgSRO7vq+Iwp00
 S3NoUvLem58JI3aNmsh7hQetJx7rZaD8sxW8kef3//Wsdsr2toH+4ZOCngWdPRXy9cCu
 8peKx4PZsZG1p+1S1BaT6huaEhuXwp85mxwju+nOT80/MiZAwbwm/UA58FxVC73aH3VQ
 t7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YQEkVXtfNM6n1StjbHRiHUcAJLur7gwq1XYwaSW2eoc=;
 b=i9IGhk2qN2tSis7KNipl3KsmjlAlUmCipINOhZGQOyUW5T/vGO4P3zHblKcmEoY8rk
 VD6WgLH+xtEbIj4+p8vxDnsPcYcXrHi/XnTm+WTcBfvDAZS4lwy0tjcYRpknDgiPK1O2
 uUx55kbGbEyKo1r099iHpW+a16Upr5YtWUKMehoNjTC61JCkQRRlBmqn0tIlpvdIUun9
 TKSoGW0vc1QF21sMQeZI4xP5nK47MeAa+s9L53btaFKfobJT1BSYITUZtb3qSaRFabOx
 qC/YtZflAJjv6e3md8joRwRCfFIHxzvkW0aB+tWaR7H5fDd2qDB8DlP5YsvnZzeC5ELu
 K0Cw==
X-Gm-Message-State: AGi0PubyysGUGCxvpKJWrZn7Oym0C1EtyHmTnoB/7i8OjZMeUQD9jsUt
 ZwbQ3KURZCyhi1LeK/c+AycaZsa0
X-Google-Smtp-Source: APiQypKorIRKUXzDkRdC/i5UcbhjjknECEpAcDagU/iZgvVj5nDOVIPA7c2gVOhmFHhNzGwg5SCmqw==
X-Received: by 2002:a62:6585:: with SMTP id
 z127mr12475756pfb.217.1587771854858; 
 Fri, 24 Apr 2020 16:44:14 -0700 (PDT)
Received: from localhost.localdomain ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id u13sm5583535pjb.45.2020.04.24.16.44.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 16:44:14 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 1/3] fix possible TunDispatchSecurityDescriptor leak.
Date: Fri, 24 Apr 2020 16:43:25 -0700
Message-Id: <20200424234327.1814-1-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.26.2.windows.1
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

TunDispatchSecurityDescriptor will leak if second
RtlAbsoluteToSelfRelativeSD fails. Practically this can't happen, but
from wintun code it's unclear.

Signed-off-by: Shawn Hoffman <godisgovernment@gmail.com>
---
 wintun.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/wintun.c b/wintun.c
index 624de2f..90e7930 100644
--- a/wintun.c
+++ b/wintun.c
@@ -820,6 +820,14 @@ static NTSTATUS TunInitializeDispatchSecurityDescriptor(VOID)
     return STATUS_SUCCESS;
 }
 
+static VOID TunFreeDispatchSecurityDescriptor(VOID)
+{
+    if (!TunDispatchSecurityDescriptor)
+        return;
+    ExFreePoolWithTag(TunDispatchSecurityDescriptor, TUN_MEMORY_TAG);
+    TunDispatchSecurityDescriptor = NULL;
+}
+
 _IRQL_requires_max_(PASSIVE_LEVEL)
 static VOID
 TunProcessNotification(HANDLE ParentId, HANDLE ProcessId, BOOLEAN Create)
@@ -1387,7 +1395,7 @@ TunUnload(PDRIVER_OBJECT DriverObject)
     NdisMDeregisterMiniportDriver(NdisMiniportDriverHandle);
     ExDeleteResourceLite(&TunDispatchCtxGuard);
     ExDeleteResourceLite(&TunDispatchDeviceListLock);
-    ExFreePoolWithTag(TunDispatchSecurityDescriptor, TUN_MEMORY_TAG);
+    TunFreeDispatchSecurityDescriptor();
 }
 
 DRIVER_INITIALIZE DriverEntry;
@@ -1398,7 +1406,7 @@ DriverEntry(DRIVER_OBJECT *DriverObject, UNICODE_STRING *RegistryPath)
     NTSTATUS Status;
 
     if (!NT_SUCCESS(Status = TunInitializeDispatchSecurityDescriptor()))
-        return Status;
+        goto cleanupSD;
 
     NdisVersion = NdisGetVersion();
     if (NdisVersion < NDIS_MINIPORT_VERSION_MIN)
@@ -1461,6 +1469,7 @@ cleanupNotifier:
 cleanupResources:
     ExDeleteResourceLite(&TunDispatchCtxGuard);
     ExDeleteResourceLite(&TunDispatchDeviceListLock);
-    ExFreePoolWithTag(TunDispatchSecurityDescriptor, TUN_MEMORY_TAG);
+cleanupSD:
+    TunFreeDispatchSecurityDescriptor();
     return Status;
 }
-- 
2.26.2.windows.1

