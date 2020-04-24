Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5180DC54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA3C20857
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEN4zK5D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA3C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 567fcb7e;
	Fri, 24 Apr 2020 20:36:35 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fc7e0a4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 18:56:49 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id o10so5050824pgb.6
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SlCmztABG0Urj5Fp7336hQQwVWCd/2KrYEZhocyXtb8=;
 b=KEN4zK5Dy7vnNgECp8xeflH3UzYhKPA3205Xy3LW7Sp/8lLToWAHis83pB/jTFv11X
 TQKqXOaY4N5f96/U2ZVAacqeh1eX+qTTwZ1kpjSAljW0k9KJmRV+KDBsuAbZ0mbH8Ujl
 uwhHrN8ckDQaoDo7fZmHSpchXK/dF+VfwKrag70HpgLtPFdca0Q0lGFrm5F6WBo+NgIe
 56TaewXPvJmRm8bM7cAOTDqRH9Zb7OE1PLYZVPREl6j0faLCWU6hkEk5kJDB7IOZ017U
 POLsqQXjNNVk1cpEv6syJCfQNOUS7kEElcGRZ12TXqwyrmFCQSmX4g0zNjd9OHN0+lEB
 CSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SlCmztABG0Urj5Fp7336hQQwVWCd/2KrYEZhocyXtb8=;
 b=D2yB+VNSEUNQ5wdecuBo8Alrk1zB7D25rSI6t27hC2JRJwZrNRCzoziwIh7CzwXXP5
 kucyJMN2d8dFB4A5vbk43jVPAFdKdwczOv0hi//UHMYIa3cgmEiFbMO8gyyLm0Hfn3z8
 0IxE2IEWBk8cXHpeMgbFajE0q6uWo0LQkrgMFGjUUzYKCxOaSRguNFwPO7WdD2ACheZx
 qGXf77fWiaLhOtrdo8Tcc1YlAWkwFHQymydGCJlQg+T+pT8UjC4ydHYSNOayE4pEVgu7
 CDjPHl81E7OUGsurIDfH/yShp7rL9Ec276X0tSJtwoAjZTkUZAuHCGvFKPlchcVyaqp3
 8x4Q==
X-Gm-Message-State: AGi0PuZBPrEQTmc9yZ92bJReKqamleK3u95dTF1cP9yPuJdD54opSZf/
 KBcwiiUBCZuCWD3yUuwOhY1RQiom
X-Google-Smtp-Source: APiQypJ+TT/7/lK9Ozj3DDv6qF7ZTvlQDW5LdW+RbSAVEsf2h0qNEhNcfbxxrNTwxGoqHCYDdhD/qw==
X-Received: by 2002:a63:1c1:: with SMTP id 184mr11060138pgb.203.1587754815264; 
 Fri, 24 Apr 2020 12:00:15 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id i11sm5003187pgi.1.2020.04.24.12.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:00:14 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 1/3] don't leak TunDispatchSecurityDescriptor if second
 RtlAbsoluteToSelfRelativeSD fails. practically this can't happen,
 but from wintun code it's unclear.
Date: Fri, 24 Apr 2020 11:59:23 -0700
Message-Id: <20200424185925.31971-2-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424185925.31971-1-godisgovernment@gmail.com>
References: <20200424185925.31971-1-godisgovernment@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 24 Apr 2020 22:36:30 +0200
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
2.25.0.windows.1

