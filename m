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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534B2C54FD0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0177720728
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 23:44:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+1Ody9J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0177720728
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ebfee97;
	Fri, 24 Apr 2020 23:33:09 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [2607:f8b0:4864:20::441])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 51004c93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 23:33:06 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 18so5571033pfx.6
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 16:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=El0vbCxOnVeBlCpnp3YWM+/HWVaz9OUJG8Z+OWhuhsw=;
 b=O+1Ody9JK+ZZPGjJYnz1FGBJjlqrTf7A8EhyAZspADMw4N4z4Tm9iG/8su3bm5Ruj3
 xsGaFmDP+QNqazGWtqmPFvdlZT/kOFnd4Yy05ie4DjAHwNGoLDBW1oWuFIcYup1q80jy
 MIZqiiaLOh5Dqe1pH9mmtmLAtheN6MAiPiePJZrbii4G3S1oOALiVkqhbtLbF7Pad3Cp
 ZNaue5ZYXaOb98iAwFfJ3FPvjb0JuAybGKRiduFybRKzxDKHbwDu6WAzRP2C88zw9Cn3
 u290RAdYpLoEFGqeO8v5rZQPMWbGoCd4QPE91xev7nnJnCCaQnhZC4GZK04+mD5UaSs1
 /XQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=El0vbCxOnVeBlCpnp3YWM+/HWVaz9OUJG8Z+OWhuhsw=;
 b=aZSH0MdLSTYG7MhMBnDhKsGI1aA5mweVnt717Bg/Obs7413RZGet+2ujjdClIC8xbs
 88c2tc3qpusRUkJWLFUwOwfs5MYLQEBwB9S7ErknAEwfcsiU2ZtpnVgcSt1lMT35Ahui
 0WGnR0LwKw401nLRgqrqKgOkGWuQkbMsR3YNmFSGfG/JhpsC71XRRd8yZl2M0TLgTA2Q
 npq1zodQS8ykHoMnT8Z2p4RmDxp60g09eWB1GGauBa0bC3Q0ZIGeGtqDmj/Z33ZNYhFa
 l4ROBNDbFWfkQAI4bK5laGbwtdP0d12m+3vICn8eoHxawUYhZwRCSbsrjMB/XLhGHP+/
 XhCw==
X-Gm-Message-State: AGi0PuZbbN+1e21OhITJqQlD8XqHZiU3CsQfT9G0Sd5ZR9dNEdDaWZO5
 2lMjMmiv2WpKYIt1/wpwXhUFX6vV
X-Google-Smtp-Source: APiQypKSICS5zcO4bbcNDILGXa/qz2+e83XHpA7W9M11i0rpuSQ0zaWQB4Xk89QrMIrTxJPQ9gmglw==
X-Received: by 2002:a63:e74f:: with SMTP id j15mr11596801pgk.153.1587771855835; 
 Fri, 24 Apr 2020 16:44:15 -0700 (PDT)
Received: from localhost.localdomain ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id u13sm5583535pjb.45.2020.04.24.16.44.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 16:44:15 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 2/3] use ExEnterCriticalRegionAndAcquireResourceExclusive and
 ExReleaseResourceAndLeaveCriticalRegion
Date: Fri, 24 Apr 2020 16:43:26 -0700
Message-Id: <20200424234327.1814-2-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.26.2.windows.1
In-Reply-To: <20200424234327.1814-1-godisgovernment@gmail.com>
References: <20200424234327.1814-1-godisgovernment@gmail.com>
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

Signed-off-by: Shawn Hoffman <godisgovernment@gmail.com>
---
 wintun.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/wintun.c b/wintun.c
index 90e7930..00ac378 100644
--- a/wintun.c
+++ b/wintun.c
@@ -884,15 +884,13 @@ TunDispatchDeviceControl(DEVICE_OBJECT *DeviceObject, IRP *Irp)
     switch (Stack->Parameters.DeviceIoControl.IoControlCode)
     {
     case TUN_IOCTL_REGISTER_RINGS: {
-        KeEnterCriticalRegion();
-        ExAcquireResourceSharedLite(&TunDispatchCtxGuard, TRUE);
+        ExEnterCriticalRegionAndAcquireResourceExclusive(&TunDispatchCtxGuard);
 #pragma warning(suppress : 28175)
         TUN_CTX *Ctx = DeviceObject->Reserved;
         Status = NDIS_STATUS_ADAPTER_NOT_READY;
         if (Ctx)
             Status = TunRegisterBuffers(Ctx, Irp);
-        ExReleaseResourceLite(&TunDispatchCtxGuard);
-        KeLeaveCriticalRegion();
+        ExReleaseResourceAndLeaveCriticalRegion(&TunDispatchCtxGuard);
         break;
     }
     case TUN_IOCTL_FORCE_CLOSE_HANDLES:
@@ -913,14 +911,12 @@ _Use_decl_annotations_
 static NTSTATUS
 TunDispatchClose(DEVICE_OBJECT *DeviceObject, IRP *Irp)
 {
-    KeEnterCriticalRegion();
-    ExAcquireResourceSharedLite(&TunDispatchCtxGuard, TRUE);
+    ExEnterCriticalRegionAndAcquireResourceExclusive(&TunDispatchCtxGuard);
 #pragma warning(suppress : 28175)
     TUN_CTX *Ctx = DeviceObject->Reserved;
     if (Ctx)
         TunUnregisterBuffers(Ctx, IoGetCurrentIrpStackLocation(Irp)->FileObject);
-    ExReleaseResourceLite(&TunDispatchCtxGuard);
-    KeLeaveCriticalRegion();
+    ExReleaseResourceAndLeaveCriticalRegion(&TunDispatchCtxGuard);
     return NdisDispatchClose(DeviceObject, Irp);
 }
 
-- 
2.26.2.windows.1

