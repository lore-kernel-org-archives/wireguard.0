Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60D9E9A05F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Feb 2026 19:33:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b6c5b5b;
	Thu, 19 Feb 2026 19:33:09 +0000 (UTC)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com
 [2607:f8b0:4864:20::122c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 71050984
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Feb 2026 19:33:06 +0000 (UTC)
Received: by mail-dl1-x122c.google.com with SMTP id
 a92af1059eb24-12721cd256bso1438917c88.1
 for <wireguard@lists.zx2c4.com>; Thu, 19 Feb 2026 11:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771529584; x=1772134384; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fT2OJIeXnwXuGXBIo/Ie5aW16K2jaCbcdksAD5JWxhI=;
 b=OVCAQ32OLsq8JXEbEghOvlOnsItFVqNjW8S1GOYKNWjCoI2tMxUtBg76zT8lmCAV2p
 oHPtaU3eb5rOtnO/xTeI8KS1vUwKhqJnbsHBo6NPQOMr6gxKnp4/TUZrzEvLCEmCQuVp
 xmDyYQAn5XJdQDl9s6Ur+8sjAYEemE2XwgyGXL5VSQ5xWoIDEtUEf2mea1mcbPHIfz6u
 zkSj1EkSI0C8fBypgyyIY8nQpZRsG6zeVflGSuuYjFfcLmE0AV09iedQAv+ugz7iVoYC
 m3X/Ne5fXRSIJ195SqK7p0/CSDO28z0S4eMtwARfT2xmBnghxRWSJ8lE95R7cdOV1b3q
 16hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771529584; x=1772134384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fT2OJIeXnwXuGXBIo/Ie5aW16K2jaCbcdksAD5JWxhI=;
 b=bDNdcPnfCtZE2wVGGc1IUyUT7jCM1g4xKshd+dDVjT7UE4w9tozccTdF9FEVoo5Gtd
 wCo2B9W05Gh7L5fr4nGQ14caMg9tWUKld6KHYtO4ltDEYsalZ09TKIi/bJp5+92x8U+l
 QIStUa3mTSTY4nPtPX71Yydx+2NNAgqjclMFr0JdSJ8OWbFAFR6TLjWp3LBls1KDrSPF
 R7QWBZK7SLhAbcvJgUrnYFdxH0TajYBANGpdY48Fp6Mytmerqg0lV+nXRtzbaA0IFkET
 E+laaI+kTEM9Auhb+LJi00XjnXDQ6ZiPGsOI7zc8vnEqtthgdUrnUPNNZwVvsYXSa5Pc
 Gw3A==
X-Gm-Message-State: AOJu0YxycPBjTKzzefKuEq+4cDl2V0CpXt1+aMMrhE0KgsvHYuydB5eE
 7ibdrsfu5aahBiinGCKebYc53OwprQIVY3qT4lapnFnv8Hzx8IyQe6QQoWtglw==
X-Gm-Gg: AZuq6aLLOcMx6LAAyOniDKp1Ev0eSWy5QEfr7arEf4Vgach5KVJBMM74z7b3OVcUG33
 8xSJVqaNleWNEvjXjnYY4RUxK9/hWSfCu7munUvlmaKy/f9pCd3oz+6wz7a6KVSBk2ISkaGqADN
 ANVRFMP89eNTQrNDFUpB2L39lFf0EO4BW4OZWYKahoPKuDl8ybi3YbvV1lf+58G+Fpg5QF4uPnr
 PmCjBo0Kdn8VZH4cmUD5/B40lrq+lo6NLe9+GF+zqd4zNurFLBvRSGoRyj/vMSvCDN4/jhdNZUQ
 BSygNLpxOr3VuvtkFPzMkWhkCPbaDxyJgRxogAbObcfCWvsKOfQiikY1ezgxxYZLJa5I+UO5rnn
 7b9h2jW7jWaoxt5Dg8dcJfJXWLFYCmW/PLoMocqQi9VS2OlM47Ae8sM4UiXF3SdIrGki6jPfszl
 G/frPXO9ywnIe1Xaz4DMzo9WsoeTAQipX0hVbRWEfXSAVaxUNYsyU=
X-Received: by 2002:a05:7022:fa2:b0:11a:4016:4491 with SMTP id
 a92af1059eb24-12741bc8651mr9702228c88.24.1771529583448; 
 Thu, 19 Feb 2026 11:33:03 -0800 (PST)
Received: from localhost.localdomain ([2601:645:0:cdeb:78c6:1ab4:b276:9a4a])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bacb415dddsm25046851eec.0.2026.02.19.11.33.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Feb 2026 11:33:03 -0800 (PST)
From: odedkatz <katz.oded@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: odedk@twingate.com,
	odedkatz <katz.oded@gmail.com>
Subject: [PATCH 1/1] in order to prevent buffer overrun (which was observed
 while sending multiple high throughput UDP streams from different threads) I
 move the driver spinlock to protect Ring buffer Head.
Date: Thu, 19 Feb 2026 11:32:55 -0800
Message-ID: <20260219193255.14334-2-katz.oded@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219193255.14334-1-katz.oded@gmail.com>
References: <20260219193255.14334-1-katz.oded@gmail.com>
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

    I observed that the Ring->Head was taken and manipulated later on with just a `ReadULongAcquire` which isn't OK when 2 are trying to manipulate it later on based on the same received value.
---
 driver/wintun.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/driver/wintun.c b/driver/wintun.c
index d1f3b9f..65cd97e 100644
--- a/driver/wintun.c
+++ b/driver/wintun.c
@@ -284,13 +284,14 @@ TunSendNetBufferLists(
     TUN_RING *Ring = Ctx->Device.Send.Ring;
     ULONG RingCapacity = Ctx->Device.Send.Capacity;
 
+    KLOCK_QUEUE_HANDLE LockHandle;
+    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle);
     /* Allocate space for packets in the ring. */
     ULONG RingHead = ReadULongAcquire(&Ring->Head);
-    if (Status = NDIS_STATUS_ADAPTER_NOT_READY, RingHead >= RingCapacity)
+    if (Status = NDIS_STATUS_ADAPTER_NOT_READY, RingHead >= RingCapacity) {
+        KeReleaseInStackQueuedSpinLock(&LockHandle);
         goto skipNbl;
-
-    KLOCK_QUEUE_HANDLE LockHandle;
-    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle);
+    }
 
     ULONG RingTail = Ctx->Device.Send.RingTail;
     ASSERT(RingTail < RingCapacity);
@@ -419,8 +420,8 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdapterContext, PNET_BUFFER_LIST Net
             Ctx->Device.Receive.ActiveNbls.Head = NET_BUFFER_LIST_NEXT_NBL_EX(CompletedNbl);
             if (!Ctx->Device.Receive.ActiveNbls.Head)
                 KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty, IO_NO_INCREMENT, FALSE);
-            KeReleaseInStackQueuedSpinLock(&LockHandle);
             WriteULongRelease(&Ring->Head, TunNblGetOffset(CompletedNbl));
+            KeReleaseInStackQueuedSpinLock(&LockHandle);
             const MDL *TargetMdl = Ctx->Device.Receive.Mdl;
             for (MDL *Mdl = NET_BUFFER_FIRST_MDL(NET_BUFFER_LIST_FIRST_NB(CompletedNbl)); Mdl; Mdl = Mdl->Next)
             {
-- 
2.43.0

