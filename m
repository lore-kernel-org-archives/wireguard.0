Return-Path: <SRS0=1xjk=6I=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4C0C54FCB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1995D21556
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Apr 2020 20:56:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNhNxKxA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1995D21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf9ac934;
	Fri, 24 Apr 2020 20:36:38 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [2607:f8b0:4864:20::641])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 440a13ef
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Apr 2020 19:29:09 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id v2so4099698plp.9
 for <wireguard@lists.zx2c4.com>; Fri, 24 Apr 2020 12:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nRz1dR8CqEtpEJC7/DG61qZFABnBtBu9otIGYQtWkHw=;
 b=cNhNxKxAcUlwPbLGvDymNzVQ0AKWL942kW0Oe6MFSRobuJi7jIYvt0cBH75C3ve3p1
 EEuhSX4JtAsaZo6hAncHKS2s7sFdFPJm++L6amNIH915VQjokqcY+24d1DqLtBfp1L2M
 7R/cG8KfoPdf/g7GSDx8PNaox5YD0iZG0w/ee2Vr5A7pzQcJdFonKnebboRtAGytriZQ
 9aoAjpLv0eeACT0G88GjQr0yf6FpyjiDiVxjOZsWn89LCt+p0P6/13g30e41DB7R4bD/
 6Xl+9u4VCoFEifgojkPfTjzVpq9ttYh1DLjuo3VC5/6MdHgi+8jB9FQ8CXDxWfoePQa9
 Py4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nRz1dR8CqEtpEJC7/DG61qZFABnBtBu9otIGYQtWkHw=;
 b=t+gg0P4bf5j3pCmUO7ACHd5JfGs09KHTKMGlu222L0GABypR3mYSLIoyvJRdAzS4na
 aECL2rllGcRzkhrUqakanPKv3Bm8FjgE3wauqB+v07SYDhuQYl/n2wa+rBQGenNrQ0dJ
 92J4r7HDE0c4/A8zJGSkzMhMIuoIb0xAHRlBrlvYXhBF4TXR/gnc+R/wlwP6LDnUXkff
 AVWs0CGfmJjAr1yI227CkiffeCdy+3fbl0u+jnMUQdzyk1gWzKqNLtoYN3ff/o/YMjFm
 0aIcYsH64aYJFBOcAiVfj1sATu/+t67rkIuPDgVu1J4TEyAK0f9Yy2ZIMzzrO9+6ycex
 jB3w==
X-Gm-Message-State: AGi0PuZd7jrqW0Jp1fg5Pb9x33jvhk+8mcVrqtgFk+S5DRl3V1fNNVRQ
 Z26OhnsFSJ3r7V4ZXtonDWEDfHk8
X-Google-Smtp-Source: APiQypKuvuGdGtiKbppQGE3un8QHQVRXEKziZ6wts7ten91x1aGldt5GOE4VSCGEU1pUD7MS2YzsSA==
X-Received: by 2002:a17:902:8213:: with SMTP id
 x19mr10938144pln.86.1587757217573; 
 Fri, 24 Apr 2020 12:40:17 -0700 (PDT)
Received: from goliath.corp.microsoft.com ([98.203.142.101])
 by smtp.gmail.com with ESMTPSA id m24sm5446847pgn.91.2020.04.24.12.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 12:40:16 -0700 (PDT)
From: Shawn Hoffman <godisgovernment@gmail.com>
To: wireguard@lists.zx2c4.com
Cc: Shawn Hoffman <godisgovernment@gmail.com>
Subject: [PATCH 1/1] replace atomic.h with provided APIs switch to
 /volatile:iso
Date: Fri, 24 Apr 2020 12:40:10 -0700
Message-Id: <20200424194010.32225-2-godisgovernment@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424194010.32225-1-godisgovernment@gmail.com>
References: <20200424194010.32225-1-godisgovernment@gmail.com>
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
 wintun.c               | 76 +++++++++++++++++++++---------------------
 wintun.vcxproj         |  5 ++-
 wintun.vcxproj.filters |  3 --
 3 files changed, 40 insertions(+), 44 deletions(-)

diff --git a/wintun.c b/wintun.c
index a6a0e16..b042d35 100644
--- a/wintun.c
+++ b/wintun.c
@@ -9,7 +9,6 @@
 #include <ndis.h>
 #include <ntstrsafe.h>
 #include "undocumented.h"
-#include "atomic.h"
 
 #pragma warning(disable : 4100) /* unreferenced formal parameter */
 #pragma warning(disable : 4200) /* nonstandard: zero-sized array in struct/union */
@@ -250,7 +249,7 @@ TunSendNetBufferLists(
 
     KIRQL Irql = ExAcquireSpinLockShared(&Ctx->TransitionLock);
     NDIS_STATUS Status;
-    if ((Status = NDIS_STATUS_PAUSED, !InterlockedGet(&Ctx->Running)) ||
+    if ((Status = NDIS_STATUS_PAUSED, !ReadAcquire(&Ctx->Running)) ||
         (Status = NDIS_STATUS_MEDIA_DISCONNECTED, KeReadStateEvent(&Ctx->Device.Disconnected)))
         goto skipNbl;
 
@@ -258,7 +257,7 @@ TunSendNetBufferLists(
     ULONG RingCapacity = Ctx->Device.Send.Capacity;
 
     /* Allocate space for packets in the ring. */
-    ULONG RingHead = InterlockedGetU(&Ring->Head);
+    ULONG RingHead = ReadULongAcquire(&Ring->Head);
     if (Status = NDIS_STATUS_ADAPTER_NOT_READY, RingHead >= RingCapacity)
         goto skipNbl;
 
@@ -325,7 +324,7 @@ TunSendNetBufferLists(
     {
         NET_BUFFER_LIST *CompletedNbl = Ctx->Device.Send.ActiveNbls.Head;
         Ctx->Device.Send.ActiveNbls.Head = NET_BUFFER_LIST_NEXT_NBL_EX(CompletedNbl);
-        InterlockedSetU(&Ring->Tail, TunNblGetOffset(CompletedNbl));
+        WriteULongRelease(&Ring->Tail, TunNblGetOffset(CompletedNbl));
         KeSetEvent(Ctx->Device.Send.TailMoved, IO_NETWORK_INCREMENT, FALSE);
         NdisMSendNetBufferListsComplete(
             Ctx->MiniportAdapterHandle, CompletedNbl, NDIS_SEND_COMPLETE_FLAGS_DISPATCH_LEVEL);
@@ -343,11 +342,11 @@ skipNbl:
     ExReleaseSpinLockShared(&Ctx->TransitionLock, Irql);
     NdisMSendNetBufferListsComplete(Ctx->MiniportAdapterHandle, NetBufferLists, 0);
 updateStatistics:
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCOutOctets, SentPacketsSize);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCOutUcastOctets, SentPacketsSize);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCOutUcastPkts, SentPacketsCount);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifOutErrors, ErrorPacketsCount);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifOutDiscards, DiscardedPacketsCount);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutOctets, SentPacketsSize);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutUcastOctets, SentPacketsSize);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutUcastPkts, SentPacketsCount);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifOutErrors, ErrorPacketsCount);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifOutDiscards, DiscardedPacketsCount);
 }
 
 static MINIPORT_CANCEL_SEND TunCancelSend;
@@ -393,15 +392,15 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdapterContext, PNET_BUFFER_LIST Net
             if (!Ctx->Device.Receive.ActiveNbls.Head)
                 KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty, IO_NO_INCREMENT, FALSE);
             KeReleaseInStackQueuedSpinLock(&LockHandle);
-            InterlockedSetU(&Ring->Head, TunNblGetOffset(CompletedNbl));
+            WriteULongRelease(&Ring->Head, TunNblGetOffset(CompletedNbl));
             NdisFreeNetBufferList(CompletedNbl);
         }
     }
 
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCInOctets, ReceivedPacketsSize);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCInUcastOctets, ReceivedPacketsSize);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifHCInUcastPkts, ReceivedPacketsCount);
-    InterlockedAdd64((LONG64 *)&Ctx->Statistics.ifInErrors, ErrorPacketsCount);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCInOctets, ReceivedPacketsSize);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCInUcastOctets, ReceivedPacketsSize);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifHCInUcastPkts, ReceivedPacketsCount);
+    InterlockedAddNoFence64((LONG64 *)&Ctx->Statistics.ifInErrors, ErrorPacketsCount);
 }
 
 _IRQL_requires_max_(PASSIVE_LEVEL)
@@ -419,20 +418,20 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
     VOID *Events[] = { &Ctx->Device.Disconnected, Ctx->Device.Receive.TailMoved };
     ASSERT(RTL_NUMBER_OF(Events) <= THREAD_WAIT_OBJECTS);
 
-    ULONG RingHead = InterlockedGetU(&Ring->Head);
+    ULONG RingHead = ReadULongAcquire(&Ring->Head);
     if (RingHead >= RingCapacity)
         goto cleanup;
 
     while (!KeReadStateEvent(&Ctx->Device.Disconnected))
     {
         /* Get next packet from the ring. */
-        ULONG RingTail = InterlockedGetU(&Ring->Tail);
+        ULONG RingTail = ReadULongAcquire(&Ring->Tail);
         if (RingHead == RingTail)
         {
             LARGE_INTEGER SpinStart = KeQueryPerformanceCounter(NULL);
             for (;;)
             {
-                RingTail = InterlockedGetU(&Ring->Tail);
+                RingTail = ReadULongAcquire(&Ring->Tail);
                 if (RingTail != RingHead)
                     break;
                 if (KeReadStateEvent(&Ctx->Device.Disconnected))
@@ -444,16 +443,16 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
             }
             if (RingHead == RingTail)
             {
-                InterlockedSet(&Ring->Alertable, TRUE);
-                RingTail = InterlockedGetU(&Ring->Tail);
+                WriteRelease(&Ring->Alertable, TRUE);
+                RingTail = ReadULongAcquire(&Ring->Tail);
                 if (RingHead == RingTail)
                 {
                     KeWaitForMultipleObjects(
                         RTL_NUMBER_OF(Events), Events, WaitAny, Executive, KernelMode, FALSE, NULL, NULL);
-                    InterlockedSet(&Ring->Alertable, FALSE);
+                    WriteRelease(&Ring->Alertable, FALSE);
                     continue;
                 }
-                InterlockedSet(&Ring->Alertable, FALSE);
+                WriteRelease(&Ring->Alertable, FALSE);
                 KeClearEvent(Ctx->Device.Receive.TailMoved);
             }
         }
@@ -501,7 +500,7 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
         TunNblSetOffsetAndMarkActive(Nbl, RingHead);
 
         KIRQL Irql = ExAcquireSpinLockShared(&Ctx->TransitionLock);
-        if (!InterlockedGet(&Ctx->Running))
+        if (!ReadAcquire(&Ctx->Running))
             goto cleanupNbl;
 
         KLOCK_QUEUE_HANDLE LockHandle;
@@ -530,16 +529,16 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
         ExReleaseSpinLockShared(&Ctx->TransitionLock, Irql);
         NdisFreeNetBufferList(Nbl);
     skipNbl:
-        InterlockedIncrement64((LONG64 *)&Ctx->Statistics.ifInDiscards);
+        InterlockedIncrementNoFence64((LONG64 *)&Ctx->Statistics.ifInDiscards);
         KeWaitForSingleObject(&Ctx->Device.Receive.ActiveNbls.Empty, Executive, KernelMode, FALSE, NULL);
-        InterlockedSetU(&Ring->Head, RingHead);
+        WriteULongRelease(&Ring->Head, RingHead);
     }
 
     /* Wait for all NBLs to return: 1. To prevent race between proceeding and invalidating ring head. 2. To have
      * TunDispatchUnregisterBuffers() implicitly wait before releasing ring MDL used by NBL(s). */
     KeWaitForSingleObject(&Ctx->Device.Receive.ActiveNbls.Empty, Executive, KernelMode, FALSE, NULL);
 cleanup:
-    InterlockedSetU(&Ring->Head, MAXULONG);
+    WriteULongRelease(&Ring->Head, MAXULONG);
 }
 
 #define IS_POW2(x) ((x) && !((x) & ((x)-1)))
@@ -595,7 +594,7 @@ TunRegisterBuffers(_Inout_ TUN_CTX *Ctx, _Inout_ IRP *Irp)
     if (Status = STATUS_INSUFFICIENT_RESOURCES, !Ctx->Device.Send.Ring)
         goto cleanupSendUnlockPages;
 
-    Ctx->Device.Send.RingTail = InterlockedGetU(&Ctx->Device.Send.Ring->Tail);
+    Ctx->Device.Send.RingTail = ReadULongAcquire(&Ctx->Device.Send.Ring->Tail);
     if (Status = STATUS_INVALID_PARAMETER, Ctx->Device.Send.RingTail >= Ctx->Device.Send.Capacity)
         goto cleanupSendUnlockPages;
 
@@ -709,7 +708,7 @@ TunUnregisterBuffers(_Inout_ TUN_CTX *Ctx, _In_ FILE_OBJECT *Owner)
     }
     ZwClose(Ctx->Device.Receive.Thread);
 
-    InterlockedSetU(&Ctx->Device.Send.Ring->Tail, MAXULONG);
+    WriteULongRelease(&Ctx->Device.Send.Ring->Tail, MAXULONG);
     KeSetEvent(Ctx->Device.Send.TailMoved, IO_NO_INCREMENT, FALSE);
 
     MmUnlockPages(Ctx->Device.Receive.Mdl);
@@ -926,7 +925,7 @@ static NDIS_STATUS
 TunRestart(NDIS_HANDLE MiniportAdapterContext, PNDIS_MINIPORT_RESTART_PARAMETERS MiniportRestartParameters)
 {
     TUN_CTX *Ctx = (TUN_CTX *)MiniportAdapterContext;
-    InterlockedSet(&Ctx->Running, TRUE);
+    WriteRelease(&Ctx->Running, TRUE);
     return NDIS_STATUS_SUCCESS;
 }
 
@@ -937,7 +936,7 @@ TunPause(NDIS_HANDLE MiniportAdapterContext, PNDIS_MINIPORT_PAUSE_PARAMETERS Min
 {
     TUN_CTX *Ctx = (TUN_CTX *)MiniportAdapterContext;
 
-    InterlockedSet(&Ctx->Running, FALSE);
+    WriteRelease(&Ctx->Running, FALSE);
     ExReleaseSpinLockExclusive(
         &Ctx->TransitionLock,
         ExAcquireSpinLockExclusive(&Ctx->TransitionLock)); /* Ensure above change is visible to all readers. */
@@ -1131,9 +1130,10 @@ TunHaltEx(NDIS_HANDLE MiniportAdapterContext, NDIS_HALT_ACTION HaltAction)
         ExAcquireSpinLockExclusive(&Ctx->TransitionLock)); /* Ensure above change is visible to all readers. */
     NdisFreeNetBufferListPool(Ctx->NblPool);
 
-    InterlockedSetPointer(&Ctx->MiniportAdapterHandle, NULL);
-#pragma warning(suppress : 28175)
-    InterlockedSetPointer(&Ctx->FunctionalDeviceObject->Reserved, NULL);
+#pragma warning(suppress : 6387)
+    WritePointerNoFence(&Ctx->MiniportAdapterHandle, NULL);
+#pragma warning(suppress : 6387 28175)
+    WritePointerNoFence(&Ctx->FunctionalDeviceObject->Reserved, NULL);
     KeEnterCriticalRegion();
     ExAcquireResourceExclusiveLite(&TunDispatchCtxGuard, TRUE); /* Ensure above change is visible to all readers. */
     ExReleaseResourceLite(&TunDispatchCtxGuard);
@@ -1242,16 +1242,16 @@ TunOidQuery(_Inout_ TUN_CTX *Ctx, _Inout_ NDIS_OID_REQUEST *OidRequest)
     case OID_GEN_XMIT_OK:
         return TunOidQueryWrite32or64(
             OidRequest,
-            InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCOutUcastPkts) +
-                InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCOutMulticastPkts) +
-                InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCOutBroadcastPkts));
+            ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutUcastPkts) +
+                ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutMulticastPkts) +
+                ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCOutBroadcastPkts));
 
     case OID_GEN_RCV_OK:
         return TunOidQueryWrite32or64(
             OidRequest,
-            InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCInUcastPkts) +
-                InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCInMulticastPkts) +
-                InterlockedGet64((LONG64 *)&Ctx->Statistics.ifHCInBroadcastPkts));
+            ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCInUcastPkts) +
+                ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCInMulticastPkts) +
+                ReadNoFence64((LONG64 *)&Ctx->Statistics.ifHCInBroadcastPkts));
 
     case OID_GEN_STATISTICS:
         return TunOidQueryWriteBuf(OidRequest, &Ctx->Statistics, (ULONG)sizeof(Ctx->Statistics));
diff --git a/wintun.vcxproj b/wintun.vcxproj
index 3bb61d1..abe4a17 100644
--- a/wintun.vcxproj
+++ b/wintun.vcxproj
@@ -125,7 +125,7 @@
   <ItemDefinitionGroup>
     <ClCompile>
       <PreprocessorDefinitions>NDIS_MINIPORT_DRIVER=1;NDIS620_MINIPORT=1;NDIS683_MINIPORT=1;NDIS_WDM=1;%(PreprocessorDefinitions)</PreprocessorDefinitions>
-      <AdditionalOptions>/volatile:ms %(AdditionalOptions)</AdditionalOptions>
+      <AdditionalOptions>/volatile:iso %(AdditionalOptions)</AdditionalOptions>
       <EnablePREfast>true</EnablePREfast>
     </ClCompile>
     <ResourceCompile>
@@ -171,9 +171,8 @@
     <FilesToPackage Include="$(TargetPath)" Condition="'$(ConfigurationType)'=='Driver' or '$(ConfigurationType)'=='DynamicLibrary'" />
   </ItemGroup>
   <ItemGroup>
-    <ClInclude Include="atomic.h" />
     <ClInclude Include="undocumented.h" />
   </ItemGroup>
   <Import Project="$(VCTargetsPath)\Microsoft.Cpp.targets" />
   <ImportGroup Label="ExtensionTargets" />
-</Project>
+</Project>
\ No newline at end of file
diff --git a/wintun.vcxproj.filters b/wintun.vcxproj.filters
index 467cc48..3e19120 100644
--- a/wintun.vcxproj.filters
+++ b/wintun.vcxproj.filters
@@ -33,8 +33,5 @@
     <ClInclude Include="undocumented.h">
       <Filter>Header Files</Filter>
     </ClInclude>
-    <ClInclude Include="atomic.h">
-      <Filter>Header Files</Filter>
-    </ClInclude>
   </ItemGroup>
 </Project>
\ No newline at end of file
-- 
2.20.1

