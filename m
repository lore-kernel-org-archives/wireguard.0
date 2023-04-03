Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE96C46CD2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 05:55:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dfbdec88;
	Wed, 20 Dec 2023 05:00:22 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6beb5c2e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Apr 2023 15:23:42 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id x3so118748053edb.10
 for <wireguard@lists.zx2c4.com>; Mon, 03 Apr 2023 08:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pango.co; s=google; t=1680535422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WManZygapMS58KkQSiI8nwAJtVpuZkWyzDi8AzM2uxU=;
 b=PvCIDn/Wpxd1HxQv3DmpaPNT8Y7E96IkrKxYnllAjw61BPoQkxPKIRASTz1iAYPtRb
 RzlY7cDsg4FtDlUgegUPrucLJv9O6EqDgb5/rEQLbXRAFFz93s1wZNHSEUkv8xoETpmg
 E3rmOpUaVVuFmIovuVOXiSBFHi1n1DANAvt54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680535422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WManZygapMS58KkQSiI8nwAJtVpuZkWyzDi8AzM2uxU=;
 b=dKCFi1wkSJ1/qzCNNYtyFtzTdqRqmyISzSyztLiVJxktyAZ1NwjOSqp7+4euEGNFTL
 v+JC6hiO7NiiHsO1cZgePMf6s7cSIdosfbalUjXAj/31det3ALYUtSllokRY9kQu1vkD
 jY3l4udVtu+qix5nTuIa75k6nO+gPq0SmtKIUhe4lx06td79sBIGKoMB98zozKsgBoIK
 ReiekiHfkFP7TsctG9mqoXdA9kl/QN+NIW0+VoLXbPv8jQPRQkZvXcxMj2F4Iopm0kEm
 6vilyr7/n0LH13p1kieLNcV7NKqSyLeUx7ndoGISxkyaWE8vZgrvvIhL6nK5rel4Nb/B
 EMvQ==
X-Gm-Message-State: AAQBX9ciVnOdBUcND9azE0dAGuA8AE3IFADD8Tqy51YT7Q+7LQ456pHD
 jmZfRxMpetiGA7gO5wLI+34n0WijFQgMxsUfiUDeItis/zwqfeVEnloEjDpk7H7byQjomppKt24
 Okpt46Jpj41FOp0V5AwTCfgpmWuIcF3BRNnjrDrqEIaec+giGmA4w/613dGYO461DbATFivzht0
 tdrRQruepuLoS3OReGNg==
X-Google-Smtp-Source: AKy350bdPb1VgP7e+gUh3B290fFZfNFswG9BLG2o1r0TjnDw2nif2q1YOkSj1pdgYC/jjX1bV5/y3g==
X-Received: by 2002:a17:907:248c:b0:931:bbcf:eb6b with SMTP id
 zg12-20020a170907248c00b00931bbcfeb6bmr37137074ejb.63.1680535422154; 
 Mon, 03 Apr 2023 08:23:42 -0700 (PDT)
Received: from localhost.localdomain ([188.24.42.1])
 by smtp.gmail.com with ESMTPSA id
 jo25-20020a170906f6d900b0093408d33875sm4679413ejb.49.2023.04.03.08.23.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 08:23:41 -0700 (PDT)
From: Alexandru Brinduse <alexandru.brinduse@pango.co>
To: wireguard@lists.zx2c4.com
Cc: Jason@zx2c4.com,
	Alexandru Brinduse <alexandru.brinduse@pango.co>
Subject: [PATCH] driver: indicate all available packets in the ring-buffer to
 NDIS in two NBL chains, one chain for IPv4 and one for IPv6.
Date: Mon,  3 Apr 2023 18:23:07 +0300
Message-Id: <20230403152307.171-1-alexandru.brinduse@pango.co>
X-Mailer: git-send-email 2.36.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Dec 2023 05:00:21 +0000
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

NdisMIndicateReceiveNetBufferLists() allows batch processing of chained NBLs.
From network performance measurements it can be seen that it brings a dramatic increase in download speed.
No chain size limit was imposed due to the fact that the ring-buffer already has a limit. In worst case, not sure how it can be attained in real life, the NBL chain will have the same size as the ringbuffer.
---
 driver/wintun.c | 210 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 147 insertions(+), 63 deletions(-)

diff --git a/driver/wintun.c b/driver/wintun.c
index ad4b16b..64f8e1b 100644
--- a/driver/wintun.c
+++ b/driver/wintun.c
@@ -246,6 +246,35 @@ TunNblIsCompleted(_In_ NET_BUFFER_LIST *Nbl)
     return (ULONG_PTR)(NET_BUFFER_LIST_MINIPORT_RESERVED(Nbl)[0]) & 1;
 }
 
+static VOID
+TunFreeNblChain(_In_ NET_BUFFER_LIST* Nbl)
+{
+    while (Nbl)
+    {
+        NET_BUFFER_LIST* nextNbl = NET_BUFFER_LIST_NEXT_NBL(Nbl);
+        IoFreeMdl(NET_BUFFER_LIST_FIRST_NB(Nbl)->MdlChain);
+        NdisFreeNetBufferList(Nbl);
+        Nbl = nextNbl;
+    }
+}
+
+static VOID
+TunAddNewNblsToReceiveActiveNblsUnsafe(
+    _Inout_ TUN_CTX *Ctx,
+    _In_ NET_BUFFER_LIST* Head, 
+    _In_ NET_BUFFER_LIST* Tail
+)
+{
+    if (Ctx->Device.Receive.ActiveNbls.Head)
+        NET_BUFFER_LIST_NEXT_NBL_EX(Ctx->Device.Receive.ActiveNbls.Tail) = Head;
+    else
+    {
+        KeClearEvent(&Ctx->Device.Receive.ActiveNbls.Empty);
+        Ctx->Device.Receive.ActiveNbls.Head = Head;
+    }
+    Ctx->Device.Receive.ActiveNbls.Tail = Tail;
+}
+
 static MINIPORT_SEND_NET_BUFFER_LISTS TunSendNetBufferLists;
 _Use_decl_annotations_
 static VOID
@@ -491,89 +520,144 @@ TunProcessReceiveData(_Inout_ TUN_CTX *Ctx)
                 KeClearEvent(Ctx->Device.Receive.TailMoved);
             }
         }
+
         if (RingTail >= RingCapacity)
             break;
 
-        ULONG RingContent = TUN_RING_WRAP(RingTail - RingHead, RingCapacity);
-        if (RingContent < sizeof(TUN_PACKET))
+        ULONG RingContentToConsume = TUN_RING_WRAP(RingTail - RingHead, RingCapacity);
+        if (RingContentToConsume < sizeof(TUN_PACKET))
             break;
+        ULONG ConsumedRingContent = 0;
 
-        TUN_PACKET *Packet = (TUN_PACKET *)(Ring->Data + RingHead);
-        ULONG PacketSize = *(volatile ULONG *)&Packet->Size;
-        if (PacketSize > TUN_MAX_IP_PACKET_SIZE)
-            break;
+        NET_BUFFER_LIST* NblChainV4 = NULL, *NblChainV6 = NULL;
+        ULONG NumberOfNblsV4 = 0, NumberOfNblsV6 = 0;
 
-        ULONG AlignedPacketSize = TUN_ALIGN(sizeof(TUN_PACKET) + PacketSize);
-        if (AlignedPacketSize > RingContent)
-            break;
+        /* We'll build two NBL chains for IPv4 and IPv6 with all available packets 
+            (they are sepparted so we can use NDIS_RECEIVE_FLAGS_SINGLE_ETHER_TYPE)
+        Network performance measurements indicate that the download speed is drastically increased 
+        if multiple NBLs are indicated to NDIS in a single call */
+        while (ConsumedRingContent < RingContentToConsume)
+        {
+            TUN_PACKET* Packet = (TUN_PACKET*)(Ring->Data + RingHead);
+            ULONG PacketSize = *(volatile ULONG*)&Packet->Size;
+            if (PacketSize > TUN_MAX_IP_PACKET_SIZE)
+                goto fatalError;
 
-        RingHead = TUN_RING_WRAP(RingHead + AlignedPacketSize, RingCapacity);
+            ULONG AlignedPacketSize = TUN_ALIGN(sizeof(TUN_PACKET) + PacketSize);
+            if (AlignedPacketSize > RingContentToConsume)
+                goto fatalError;
 
-        ULONG NblFlags;
-        USHORT NblProto;
-        if (PacketSize >= 20 && Packet->Data[0] >> 4 == 4)
-        {
-            NblFlags = NDIS_NBL_FLAGS_IS_IPV4;
-            NblProto = HTONS(NDIS_ETH_TYPE_IPV4);
-        }
-        else if (PacketSize >= 40 && Packet->Data[0] >> 4 == 6)
-        {
-            NblFlags = NDIS_NBL_FLAGS_IS_IPV6;
-            NblProto = HTONS(NDIS_ETH_TYPE_IPV6);
-        }
-        else
-            goto skipNbl;
-
-        VOID *PacketAddr =
-            (UCHAR *)MmGetMdlVirtualAddress(Ctx->Device.Receive.Mdl) + (ULONG)(Packet->Data - (UCHAR *)Ring);
-        MDL *Mdl = IoAllocateMdl(PacketAddr, PacketSize, FALSE, FALSE, NULL);
-        if (!Mdl)
-            goto skipNbl;
-        IoBuildPartialMdl(Ctx->Device.Receive.Mdl, Mdl, PacketAddr, PacketSize);
-        NET_BUFFER_LIST *Nbl = NdisAllocateNetBufferAndNetBufferList(Ctx->NblPool, 0, 0, Mdl, 0, PacketSize);
-        if (!Nbl)
-            goto cleanupMdl;
-        Nbl->SourceHandle = Ctx->MiniportAdapterHandle;
-        NdisSetNblFlag(Nbl, NblFlags);
-        NET_BUFFER_LIST_INFO(Nbl, NetBufferListFrameType) = (PVOID)NblProto;
-        NET_BUFFER_LIST_STATUS(Nbl) = NDIS_STATUS_SUCCESS;
-        TunNblSetOffsetAndMarkActive(Nbl, RingHead);
+            RingHead = TUN_RING_WRAP(RingHead + AlignedPacketSize, RingCapacity);
+
+            NET_BUFFER_LIST** TargetChain;
+            ULONG* NumberOfNblsInTargetChain;
+            ULONG NblFlags;
+            USHORT NblProto;
+            if (PacketSize >= 20 && Packet->Data[0] >> 4 == 4)
+            {
+                NblFlags = NDIS_NBL_FLAGS_IS_IPV4;
+                NblProto = HTONS(NDIS_ETH_TYPE_IPV4);
+                TargetChain = &NblChainV4;
+                NumberOfNblsInTargetChain = &NumberOfNblsV4;
+            }
+            else if (PacketSize >= 40 && Packet->Data[0] >> 4 == 6)
+            {
+                NblFlags = NDIS_NBL_FLAGS_IS_IPV6;
+                NblProto = HTONS(NDIS_ETH_TYPE_IPV6);
+                TargetChain = &NblChainV6;
+                NumberOfNblsInTargetChain = &NumberOfNblsV6;
+            }
+            else
+                break;
+
+            VOID* PacketAddr =
+                (UCHAR*)MmGetMdlVirtualAddress(Ctx->Device.Receive.Mdl) + (ULONG)(Packet->Data - (UCHAR*)Ring);
+            MDL* Mdl = IoAllocateMdl(PacketAddr, PacketSize, FALSE, FALSE, NULL);
+            if (!Mdl)
+                break;
+            IoBuildPartialMdl(Ctx->Device.Receive.Mdl, Mdl, PacketAddr, PacketSize);
+            NET_BUFFER_LIST* Nbl = NdisAllocateNetBufferAndNetBufferList(Ctx->NblPool, 0, 0, Mdl, 0, PacketSize);
+            if (!Nbl)
+                goto skipPacket;
+            Nbl->SourceHandle = Ctx->MiniportAdapterHandle;
+            NdisSetNblFlag(Nbl, NblFlags);
+            NET_BUFFER_LIST_INFO(Nbl, NetBufferListFrameType) = (PVOID)NblProto;
+            NET_BUFFER_LIST_STATUS(Nbl) = NDIS_STATUS_SUCCESS;
+            TunNblSetOffsetAndMarkActive(Nbl, RingHead);
 
+            if (*TargetChain)
+            {
+                NET_BUFFER_LIST_NEXT_NBL((NET_BUFFER_LIST*)(*TargetChain)->Scratch) = Nbl;
+                NET_BUFFER_LIST_NEXT_NBL_EX((NET_BUFFER_LIST*)(*TargetChain)->Scratch) = Nbl;
+            }
+            else
+            {
+                *TargetChain = Nbl;
+            }
+
+            (*TargetChain)->Scratch = Nbl; // Set LAST_NBL
+            ++(*NumberOfNblsInTargetChain);
+            ConsumedRingContent += AlignedPacketSize;
+            continue;
+
+        skipPacket:
+            IoFreeMdl(Mdl);
+            break;
+        }
+       
         KIRQL Irql = ExAcquireSpinLockShared(&Ctx->TransitionLock);
         if (!ReadAcquire(&Ctx->Running))
-            goto cleanupNbl;
+        {
+            ExReleaseSpinLockShared(&Ctx->TransitionLock, Irql);
+            goto notRunning;
+        }
 
         KLOCK_QUEUE_HANDLE LockHandle;
         KeAcquireInStackQueuedSpinLock(&Ctx->Device.Receive.Lock, &LockHandle);
-        if (Ctx->Device.Receive.ActiveNbls.Head)
-            NET_BUFFER_LIST_NEXT_NBL_EX(Ctx->Device.Receive.ActiveNbls.Tail) = Nbl;
-        else
-        {
-            KeClearEvent(&Ctx->Device.Receive.ActiveNbls.Empty);
-            Ctx->Device.Receive.ActiveNbls.Head = Nbl;
-        }
-        Ctx->Device.Receive.ActiveNbls.Tail = Nbl;
+        if(NblChainV4)
+            TunAddNewNblsToReceiveActiveNblsUnsafe(Ctx, NblChainV4, NblChainV4->Scratch);
+        if(NblChainV6)
+            TunAddNewNblsToReceiveActiveNblsUnsafe(Ctx, NblChainV6, NblChainV6->Scratch);
         KeReleaseInStackQueuedSpinLock(&LockHandle);
 
-        NdisMIndicateReceiveNetBufferLists(
-            Ctx->MiniportAdapterHandle,
-            Nbl,
-            NDIS_DEFAULT_PORT_NUMBER,
-            1,
-            NDIS_RECEIVE_FLAGS_DISPATCH_LEVEL | NDIS_RECEIVE_FLAGS_SINGLE_ETHER_TYPE);
+        if (NblChainV4)
+        {
+            NdisMIndicateReceiveNetBufferLists(
+                Ctx->MiniportAdapterHandle,
+                NblChainV4,
+                NDIS_DEFAULT_PORT_NUMBER,
+                NumberOfNblsV4,
+                NDIS_RECEIVE_FLAGS_DISPATCH_LEVEL | NDIS_RECEIVE_FLAGS_SINGLE_ETHER_TYPE);
+        }
 
+        if (NblChainV6)
+        {
+            NdisMIndicateReceiveNetBufferLists(
+                Ctx->MiniportAdapterHandle,
+                NblChainV6,
+                NDIS_DEFAULT_PORT_NUMBER,
+                NumberOfNblsV6,
+                NDIS_RECEIVE_FLAGS_DISPATCH_LEVEL | NDIS_RECEIVE_FLAGS_SINGLE_ETHER_TYPE);
+        }
+        
         ExReleaseSpinLockShared(&Ctx->TransitionLock, Irql);
+
+        if (ConsumedRingContent < RingContentToConsume)
+        {
+            InterlockedIncrementNoFence64((LONG64*)&Ctx->Statistics.ifInDiscards);
+            KeWaitForSingleObject(&Ctx->Device.Receive.ActiveNbls.Empty, Executive, KernelMode, FALSE, NULL);
+            WriteULongRelease(&Ring->Head, RingHead);
+        }
         continue;
 
-    cleanupNbl:
-        ExReleaseSpinLockShared(&Ctx->TransitionLock, Irql);
-        NdisFreeNetBufferList(Nbl);
-    cleanupMdl:
-        IoFreeMdl(Mdl);
-    skipNbl:
-        InterlockedIncrementNoFence64((LONG64 *)&Ctx->Statistics.ifInDiscards);
-        KeWaitForSingleObject(&Ctx->Device.Receive.ActiveNbls.Empty, Executive, KernelMode, FALSE, NULL);
-        WriteULongRelease(&Ring->Head, RingHead);
+    fatalError:
+        InterlockedIncrementNoFence64((LONG64*)&Ctx->Statistics.ifInDiscards);
+    notRunning:
+        TunFreeNblChain(NblChainV4);
+        InterlockedAddNoFence64((LONG64*)&Ctx->Statistics.ifInDiscards, NumberOfNblsV4);
+        TunFreeNblChain(NblChainV6);
+        InterlockedAddNoFence64((LONG64*)&Ctx->Statistics.ifInDiscards, NumberOfNblsV6);
+        break;
     }
 
     /* Wait for all NBLs to return: 1. To prevent race between proceeding and invalidating ring head. 2. To have
-- 
2.36.0.windows.1

