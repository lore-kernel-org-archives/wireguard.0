Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4D5C55196
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4D320857
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGg635Qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4D320857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3d08748;
	Fri, 24 Apr 2020 20:36:34 +0000 (UTC)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 39791e0d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 18:56:40 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id f7so5225736pfa.9
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUMo0tJbFu13LD5uQK20qFKqpc3QhWARiTpkhibV/cM=;
 b=UGg635Qma2ynhMJhxtkyEWUhkNwpKEbysCx1PpxNtg4Tjqt/8ibFoKyiMeZ0hcRbBL
 e5dzLHbCerdTey7sc2bkz/RmVnMGXs31etw98fb70VPhxzi2dU3S48bq+T1xHZNFZaEF
 3IfMCJwEvRYghkepjJxzHwfSor5MeVr3lg8wwJ24xaaLJCM8EeZ1L/qEv8AhPuOWCLdL
 SrsDJkyGqV/CEsCNphYDWtOJWZ5qJ9uoW4AUuowjw+M9z50o7lusu2qNWvnwx7V/brX9
 529pMPFWjrOpWnHOHjqS6RRQUeF4RcQUI7WoZLo9UT/erlT7GU5011k2ACpR+dlKAy66
 4EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KUMo0tJbFu13LD5uQK20qFKqpc3QhWARiTpkhibV/cM=;
 b=dal3D3z9jDRW315s3GujLharYODxe+gUBDaZAJTMaxU+RyLfnKcGt3HyasOAPKdpCN
 aH8nFjwhTp0eRm3ThR9LxvXXe6hhsWyej43CZ6s2iL4wAj3FLr6ifROnb8uvGR0tSxfr
 pFzCEtxp1GDKQZoOx8MXy14gmJTaYiFFLtuH4wcTcxlvFMj9BCFLqze59MaSugWPij5q
 rxXEeHVxO/JZam/uHfTjc5373mUiRKhvBWb5ROd2GwQTZjbpUgZy8wQDvj/7kK/959Uf
 gmTNHWk2XRzZjXJPCd1hivr16LYNrUBh9jaB0/X6aoZ8eQISOkogtYcOLxdd+OBnl1Rs
 ERSQ==
X-Gm-Message-State: AGi0PuZdP8UaVzdqiDOqDbD/Bik8BAB4fv71AB5rG698moS7mUrKEOau
 cjeC8Z1rZaInAE+YN5pMVXSnBA/0
X-Google-Smtp-Source: APiQypJ/YHa6TgNTFbzFh8M+SCOO2NuGVUUeJc/Jb7u1ghVUf6Em06fbNEf+VeN8tzIgmHtcCueDEw==
X-Received: by 2002:a63:d850:: with SMTP id k16mr10896956pgj.190.1587754816229; 
 Fri, 24 Apr 2020 12:00:16 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id i11sm5003187pgi.1.2020.04.24.12.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:00:15 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 2/3] use ExEnterCriticalRegionAndAcquireResourceExclusive and
 ExReleaseResourceAndLeaveCriticalRegion
Date: Fri, 24 Apr 2020 11:59:24 -0700
Message-Id: <20200424185925.31971-3-godisgovernment@gmail.com>
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
2.25.0.windows.1

