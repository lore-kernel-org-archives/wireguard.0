Return-Path: <SRS0=tvh/=OG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B55F4C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Sep 2021 09:32:53 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45EB60F23
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Sep 2021 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B45EB60F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64044c44;
	Thu, 16 Sep 2021 09:32:50 +0000 (UTC)
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [2607:f8b0:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 302bc44b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Sep 2021 09:32:47 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 17so5593393pgp.4
 for <wireguard@lists.zx2c4.com>; Thu, 16 Sep 2021 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=8C9EXKgkCcNkAS3O2JuCfp+L/R4hOYNvblul5t4E9aM=;
 b=gAsOWNz7KHf/RDlj/vl96TYxiCrMBaLBZTjjSGnthE8haLlce6bdirXbkr10Qo0Ebi
 g+WTBtHTui4pKOuycoh/IJqEpwi5hzFlpbI7jShb2HNwxeeGQ4nIFIbXukOyUtQkarhf
 pO9Ciy5rvRGec/6StRLJ45OfE2D3JhCJT+JlM/BZUeoH+95Mx/1+LgxWULJhbu16nyg4
 bRZSXJpc59n9KakUir35V86Pi9vOmmnHzaTJ/di6lPKut1g0kRGtFFP1d8HZbkULCcHW
 1TyrezJt2TrSQjEBaUStYpl86fVOuYXgHfaDG7Lnyq3Ds34sej0vRlbckT5Jwg/SQoZE
 VEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=8C9EXKgkCcNkAS3O2JuCfp+L/R4hOYNvblul5t4E9aM=;
 b=JVHZdPDnfLmrtHcwch9Kr3k+9M+fQ6u2B5fXaRtmSE/X3NAsw2mf1zdMR/ZxSd/3hg
 lIRi1mqZ/barrkwzDOxxQp2Emqq1MLMpX/I193I4yLSrLHm+l3DAmwkaXnLiF3mWGEak
 H+uQ/mPzDMtWkGM2G+0MFt0kCVrdUIiBvQdhE+zHiKB+N+KV8rQh+2q660YnWI8IeaKB
 d39KjlvKZpPxd/fGZ5K5PsgiIClUZUmweXznwM/HOZZvqvt/i+cFvcbuwNgNkWTT4bVS
 MBFihICS/XQgrnagfzsa6fkJM/+CU3ADwdV/45f1Zgxpm52z3cwcT1o1FiYkeph8Xd67
 wVlQ==
X-Gm-Message-State: AOAM533IrDC1mCydMtn97lHdUapjmLQzBz4Rx2DsyR5Leu5NWFO4UJH5
 qkRZ2c0Ne1N9xyqgZ4QIVHl9OKiDCRCbXuwgcAmFpCgAx7c=
X-Google-Smtp-Source: ABdhPJwthy7TdsJhjDC4XYGep+hy1c2YN72Pe2Sr3L57oL17b9dHOVKOkrwksjhgO/oXnP8L/jldi6fX2OdtpjumV2w=
X-Received: by 2002:aa7:84d6:0:b0:43d:fe64:e8c0 with SMTP id
 x22-20020aa784d6000000b0043dfe64e8c0mr4369949pfn.48.1631784764848; Thu, 16
 Sep 2021 02:32:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFiEPQu-w-ZX-TMiriGpK2h4_WSGs+5mzq_5PbhbjK1yyncCbA@mail.gmail.com>
In-Reply-To: <CAFiEPQu-w-ZX-TMiriGpK2h4_WSGs+5mzq_5PbhbjK1yyncCbA@mail.gmail.com>
From: =?UTF-8?Q?David_L=C3=B6nnhager?= <dv.lnh.d@gmail.com>
Date: Thu, 16 Sep 2021 11:32:34 +0200
Message-ID: <CAFiEPQuqzyfQgViE5X4NfimPrcXA6Pk-rm7g8jTrM0e8dqVDfA@mail.gmail.com>
Subject: Re: WireGuardNT: Tunnels cannot be "nested"
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
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

The patch below does what I want, though I suspect it has problems. Effectively,
it aims to bind the endpoint socket implicitly instead of performing a
route lookup
manually. I expected that not setting IP_PKTINFO after some route change could
cause it to not rebind the socket correctly, but it doesn't seem to
have that problem.
Feedback would be appreciated.

Expanding on my older comment slightly, what we want is for an
endpoint to connect
inside the tunnel *if no other route can be used*. With wireguard-go and other
implementations, we are able to do this by dropping traffic going
outside the tunnel
using WFP (or nftables), and adding a route for the tunnel interface
to that endpoint.
This way we can create "multihop" tunnels. wireguard-nt simply ignores
this route.

Code for reproducing the issue can be provided if it would be helpful.

David

---
driver/peer.h | 1 -
driver/socket.c | 172 ++++++++++++------------------------------------
2 files changed, 41 insertions(+), 132 deletions(-)

diff --git a/driver/peer.h b/driver/peer.h
index d5d14d7..27a81e9 100644
--- a/driver/peer.h
+++ b/driver/peer.h
@@ -33,7 +33,6 @@ typedef struct _ENDPOINT
};
};
UINT32 RoutingGeneration;
- UINT32 UpdateGeneration;
} ENDPOINT;
typedef enum _HANDSHAKE_TX_ACTION
diff --git a/driver/socket.c b/driver/socket.c
index 11e402b..854ec65 100644
--- a/driver/socket.c
+++ b/driver/socket.c
@@ -173,114 +173,6 @@ CidrMaskMatchV6(_In_ CONST IN6_ADDR *Addr, _In_
CONST IP_ADDRESS_PREFIX *Prefix)
((UINT32 *)&Prefix->Prefix.Ipv6.sin6_addr)[WholeParts];
}
-_IRQL_requires_max_(PASSIVE_LEVEL)
-_IRQL_raises_(DISPATCH_LEVEL)
-_Acquires_shared_lock_(Peer->EndpointLock)
-_Requires_lock_not_held_(Peer->EndpointLock)
-static NTSTATUS
-SocketResolvePeerEndpoint(_Inout_ WG_PEER *Peer, _Out_ _At_(*Irql,
_IRQL_saves_) KIRQL *Irql)
-{
- *Irql = ExAcquireSpinLockShared(&Peer->EndpointLock);
-retryWhileHoldingSharedLock:
- if ((Peer->Endpoint.Addr.si_family == AF_INET &&
- Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV4) &&
- Peer->Endpoint.Src4.ipi_ifindex && Peer->Endpoint.Src4.ipi_ifindex
!= Peer->Device->InterfaceIndex) ||
- (Peer->Endpoint.Addr.si_family == AF_INET6 &&
- Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV6) &&
- Peer->Endpoint.Src6.ipi6_ifindex && Peer->Endpoint.Src6.ipi6_ifindex
!= Peer->Device->InterfaceIndex))
- return STATUS_SUCCESS;
-
- SOCKADDR_INET Addr;
- UINT32 UpdateGeneration = Peer->Endpoint.UpdateGeneration;
- RtlCopyMemory(&Addr, &Peer->Endpoint.Addr, sizeof(Addr));
- ExReleaseSpinLockShared(&Peer->EndpointLock, *Irql);
- SOCKADDR_INET SrcAddr = { 0 };
- ULONG BestIndex = 0, BestCidr = 0, BestMetric = ~0UL;
- NET_LUID BestLuid = { 0 };
- MIB_IPFORWARD_TABLE2 *Table;
- NTSTATUS Status = GetIpForwardTable2(Addr.si_family, &Table);
- if (!NT_SUCCESS(Status))
- return Status;
- union
- {
- MIB_IF_ROW2 Interface;
- MIB_IPINTERFACE_ROW IpInterface;
- } *If = MemAllocate(sizeof(*If));
- if (!If)
- return STATUS_INSUFFICIENT_RESOURCES;
- for (ULONG i = 0; i < Table->NumEntries; ++i)
- {
- if (Table->Table[i].InterfaceLuid.Value == Peer->Device->InterfaceLuid.Value)
- continue;
- if (Table->Table[i].DestinationPrefix.PrefixLength < BestCidr)
- continue;
- if (Addr.si_family == AF_INET &&
!CidrMaskMatchV4(&Addr.Ipv4.sin_addr,
&Table->Table[i].DestinationPrefix))
- continue;
- if (Addr.si_family == AF_INET6 &&
!CidrMaskMatchV6(&Addr.Ipv6.sin6_addr,
&Table->Table[i].DestinationPrefix))
- continue;
- If->Interface = (MIB_IF_ROW2){ .InterfaceLuid =
Table->Table[i].InterfaceLuid };
- if (!NT_SUCCESS(GetIfEntry2(&If->Interface)) ||
If->Interface.OperStatus != IfOperStatusUp)
- continue;
- If->IpInterface =
- (MIB_IPINTERFACE_ROW){ .Family = Addr.si_family, .InterfaceLuid =
Table->Table[i].InterfaceLuid };
- if (!NT_SUCCESS(GetIpInterfaceEntry(&If->IpInterface)))
- continue;
- ULONG Metric = Table->Table[i].Metric + If->IpInterface.Metric;
- if (Table->Table[i].DestinationPrefix.PrefixLength == BestCidr &&
Metric > BestMetric)
- continue;
- BestCidr = Table->Table[i].DestinationPrefix.PrefixLength;
- BestMetric = Metric;
- BestIndex = Table->Table[i].InterfaceIndex;
- BestLuid = Table->Table[i].InterfaceLuid;
- }
- MemFree(If);
- if (Table->NumEntries && BestIndex)
- Status = GetBestRoute2(&BestLuid, 0, NULL, &Addr, 0,
&Table->Table[0], &SrcAddr);
- FreeMibTable(Table);
- if (!BestIndex)
- return STATUS_BAD_NETWORK_PATH;
- if (!NT_SUCCESS(Status))
- return Status;
-
- *Irql = ExAcquireSpinLockExclusive(&Peer->EndpointLock);
- if (UpdateGeneration != Peer->Endpoint.UpdateGeneration)
- {
- ExReleaseSpinLockExclusiveFromDpcLevel(&Peer->EndpointLock);
- ExAcquireSpinLockSharedAtDpcLevel(&Peer->EndpointLock);
- goto retryWhileHoldingSharedLock;
- }
- if (Peer->Endpoint.Addr.si_family == AF_INET)
- {
- Peer->Endpoint.Cmsg.cmsg_len = WSA_CMSG_LEN(sizeof(Peer->Endpoint.Src4));
- Peer->Endpoint.Cmsg.cmsg_level = IPPROTO_IP;
- Peer->Endpoint.Cmsg.cmsg_type = IP_PKTINFO;
- Peer->Endpoint.Src4.ipi_addr = SrcAddr.Ipv4.sin_addr;
- Peer->Endpoint.Src4.ipi_ifindex = BestIndex;
- Peer->Endpoint.CmsgHack4.cmsg_len = WSA_CMSG_LEN(0);
- Peer->Endpoint.CmsgHack4.cmsg_level = IPPROTO_IP;
- Peer->Endpoint.CmsgHack4.cmsg_type = IP_OPTIONS;
- Peer->Endpoint.RoutingGeneration = ReadNoFence(&RoutingGenerationV4);
- }
- else if (Peer->Endpoint.Addr.si_family == AF_INET6)
- {
- Peer->Endpoint.Cmsg.cmsg_len = WSA_CMSG_LEN(sizeof(Peer->Endpoint.Src6));
- Peer->Endpoint.Cmsg.cmsg_level = IPPROTO_IPV6;
- Peer->Endpoint.Cmsg.cmsg_type = IPV6_PKTINFO;
- Peer->Endpoint.Src6.ipi6_addr = SrcAddr.Ipv6.sin6_addr;
- Peer->Endpoint.Src6.ipi6_ifindex = BestIndex;
- Peer->Endpoint.CmsgHack6.cmsg_len = WSA_CMSG_LEN(0);
- Peer->Endpoint.CmsgHack6.cmsg_level = IPPROTO_IPV6;
- Peer->Endpoint.CmsgHack6.cmsg_type = IPV6_RTHDR;
- Peer->Endpoint.RoutingGeneration = ReadNoFence(&RoutingGenerationV6);
- }
- ++Peer->Endpoint.UpdateGeneration, ++UpdateGeneration;
- ExReleaseSpinLockExclusiveFromDpcLevel(&Peer->EndpointLock);
- ExAcquireSpinLockSharedAtDpcLevel(&Peer->EndpointLock);
- if (Peer->Endpoint.UpdateGeneration != UpdateGeneration)
- goto retryWhileHoldingSharedLock;
- return STATUS_SUCCESS;
-}
-
#pragma warning(suppress : 28194) /* `Nbl` is aliased in Ctx->Nbl or
freed on failure. */
#pragma warning(suppress : 28167) /* IRQL is either not raised on
SocketResolvePeerEndpoint failure, or \
restored by ExReleaseSpinLockShared */
@@ -320,10 +212,7 @@ SocketSendNblsToPeer(WG_PEER *Peer,
NET_BUFFER_LIST *First, BOOLEAN *AllKeepaliv
Ctx->Wg = Peer->Device;
IoInitializeIrp(&Ctx->Irp, sizeof(Ctx->IrpBuffer), 1);
IoSetCompletionRoutine(&Ctx->Irp, NblSendComplete, Ctx, TRUE, TRUE, TRUE);
- KIRQL Irql;
- Status = SocketResolvePeerEndpoint(Peer, &Irql);
- if (!NT_SUCCESS(Status))
- goto cleanupCtx;
+ KIRQL Irql = ExAcquireSpinLockShared(&Peer->EndpointLock);
SOCKET *Socket = NULL;
RcuReadLockAtDpcLevel();
if (Peer->Endpoint.Addr.si_family == AF_INET)
@@ -340,13 +229,24 @@ SocketSendNblsToPeer(WG_PEER *Peer,
NET_BUFFER_LIST *First, BOOLEAN *AllKeepaliv
if (NoWskSendMessages)
WskSendMessages = PolyfilledWskSendMessages;
#endif
+ ULONG CmsgLen = 0;
+ WSACMSGHDR *Cmsg = NULL;
+ if ((Peer->Endpoint.Addr.si_family == AF_INET &&
+ Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV4) &&
+ Peer->Endpoint.Src4.ipi_ifindex) ||
+ (Peer->Endpoint.Addr.si_family == AF_INET6 &&
+ Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV6) &&
+ Peer->Endpoint.Src6.ipi6_ifindex)) {
+ CmsgLen = (ULONG)WSA_CMSGDATA_ALIGN(Peer->Endpoint.Cmsg.cmsg_len) +
WSA_CMSG_SPACE(0);
+ Cmsg = &Peer->Endpoint.Cmsg;
+ }
Status = WskSendMessages(
Socket->Sock,
FirstWskBuf,
0,
(PSOCKADDR)&Peer->Endpoint.Addr,
- (ULONG)WSA_CMSGDATA_ALIGN(Peer->Endpoint.Cmsg.cmsg_len) + WSA_CMSG_SPACE(0),
- &Peer->Endpoint.Cmsg,
+ CmsgLen,
+ Cmsg,
&Ctx->Irp);
RcuReadUnlockFromDpcLevel();
ExReleaseSpinLockShared(&Peer->EndpointLock, Irql);
@@ -364,7 +264,6 @@ SocketSendNblsToPeer(WG_PEER *Peer,
NET_BUFFER_LIST *First, BOOLEAN *AllKeepaliv
cleanupRcuLock:
RcuReadUnlockFromDpcLevel();
ExReleaseSpinLockShared(&Peer->EndpointLock, Irql);
-cleanupCtx:
ExFreeToLookasideListEx(&SocketSendCtxCache, Ctx);
cleanupNbls:
FreeSendNetBufferList(Peer->Device, First, 0);
@@ -390,10 +289,7 @@ SocketSendBufferToPeer(WG_PEER *Peer, CONST VOID
*Buffer, ULONG Len)
Ctx->Wg = Peer->Device;
IoInitializeIrp(&Ctx->Irp, sizeof(Ctx->IrpBuffer), 1);
IoSetCompletionRoutine(&Ctx->Irp, BufferSendComplete, Ctx, TRUE, TRUE, TRUE);
- KIRQL Irql;
- Status = SocketResolvePeerEndpoint(Peer, &Irql);
- if (!NT_SUCCESS(Status))
- goto cleanupMdl;
+ KIRQL Irql = ExAcquireSpinLockShared(&Peer->EndpointLock);
SOCKET *Socket = NULL;
RcuReadLockAtDpcLevel();
if (Peer->Endpoint.Addr.si_family == AF_INET)
@@ -405,14 +301,25 @@ SocketSendBufferToPeer(WG_PEER *Peer, CONST VOID
*Buffer, ULONG Len)
Status = STATUS_NETWORK_UNREACHABLE;
goto cleanupRcuLock;
}
+ ULONG CmsgLen = 0;
+ WSACMSGHDR *Cmsg = NULL;
+ if ((Peer->Endpoint.Addr.si_family == AF_INET &&
+ Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV4) &&
+ Peer->Endpoint.Src4.ipi_ifindex) ||
+ (Peer->Endpoint.Addr.si_family == AF_INET6 &&
+ Peer->Endpoint.RoutingGeneration ==
(UINT32)ReadNoFence(&RoutingGenerationV6) &&
+ Peer->Endpoint.Src6.ipi6_ifindex)) {
+ CmsgLen = (ULONG)WSA_CMSGDATA_ALIGN(Peer->Endpoint.Cmsg.cmsg_len) +
WSA_CMSG_SPACE(0);
+ Cmsg = &Peer->Endpoint.Cmsg;
+ }
Status = ((WSK_PROVIDER_DATAGRAM_DISPATCH *)Socket->Sock->Dispatch)
->WskSendTo(
Socket->Sock,
&Ctx->Buffer,
0,
(PSOCKADDR)&Peer->Endpoint.Addr,
- (ULONG)WSA_CMSGDATA_ALIGN(Peer->Endpoint.Cmsg.cmsg_len) + WSA_CMSG_SPACE(0),
- &Peer->Endpoint.Cmsg,
+ CmsgLen,
+ Cmsg,
&Ctx->Irp);
RcuReadUnlockFromDpcLevel();
ExReleaseSpinLockShared(&Peer->EndpointLock, Irql);
@@ -423,7 +330,6 @@ SocketSendBufferToPeer(WG_PEER *Peer, CONST VOID
*Buffer, ULONG Len)
cleanupRcuLock:
RcuReadUnlockFromDpcLevel();
ExReleaseSpinLockShared(&Peer->EndpointLock, Irql);
-cleanupMdl:
MemFreeDataAndMdlChain(Ctx->Buffer.Mdl);
cleanupCtx:
ExFreeToLookasideListEx(&SocketSendCtxCache, Ctx);
@@ -452,9 +358,6 @@ SocketSendBufferAsReplyToNbl(WG_DEVICE *Wg, CONST
NET_BUFFER_LIST *InNbl, CONST
if (!NT_SUCCESS(Status))
goto cleanupMdl;
Status = STATUS_BAD_NETWORK_PATH;
- if ((Endpoint.Addr.si_family == AF_INET && Endpoint.Src4.ipi_ifindex
== Wg->InterfaceIndex) ||
- (Endpoint.Addr.si_family == AF_INET6 && Endpoint.Src6.ipi6_ifindex
== Wg->InterfaceIndex))
- goto cleanupMdl;
KIRQL Irql = RcuReadLock();
SOCKET *Socket = NULL;
if (Endpoint.Addr.si_family == AF_INET)
@@ -466,14 +369,25 @@ SocketSendBufferAsReplyToNbl(WG_DEVICE *Wg,
CONST NET_BUFFER_LIST *InNbl, CONST
Status = STATUS_NETWORK_UNREACHABLE;
goto cleanupRcuLock;
}
+ ULONG CmsgLen = 0;
+ WSACMSGHDR *Cmsg = NULL;
+ if ((Endpoint.Addr.si_family == AF_INET &&
+ Endpoint.RoutingGeneration == (UINT32)ReadNoFence(&RoutingGenerationV4) &&
+ Endpoint.Src4.ipi_ifindex) ||
+ (Endpoint.Addr.si_family == AF_INET6 &&
+ Endpoint.RoutingGeneration == (UINT32)ReadNoFence(&RoutingGenerationV6) &&
+ Endpoint.Src6.ipi6_ifindex)) {
+ CmsgLen = (ULONG)WSA_CMSGDATA_ALIGN(Endpoint.Cmsg.cmsg_len) +
WSA_CMSG_SPACE(0);
+ Cmsg = &Endpoint.Cmsg;
+ }
Status = ((WSK_PROVIDER_DATAGRAM_DISPATCH *)Socket->Sock->Dispatch)
->WskSendTo(
Socket->Sock,
&Ctx->Buffer,
0,
(PSOCKADDR)&Endpoint.Addr,
- (ULONG)WSA_CMSGDATA_ALIGN(Endpoint.Cmsg.cmsg_len) + WSA_CMSG_SPACE(0),
- &Endpoint.Cmsg,
+ CmsgLen,
+ Cmsg,
&Ctx->Irp);
RcuReadUnlock(Irql);
return Status;
@@ -600,7 +514,6 @@ SocketSetPeerEndpoint(WG_PEER *Peer, CONST
ENDPOINT *Endpoint)
if (Endpoint->Addr.si_family == AF_INET)
{
Peer->Endpoint.Addr.Ipv4 = Endpoint->Addr.Ipv4;
- if (Endpoint->Src4.ipi_ifindex != Peer->Device->InterfaceIndex)
{
Peer->Endpoint.Cmsg = Endpoint->Cmsg;
Peer->Endpoint.Src4 = Endpoint->Src4;
@@ -610,7 +523,6 @@ SocketSetPeerEndpoint(WG_PEER *Peer, CONST
ENDPOINT *Endpoint)
else if (Endpoint->Addr.si_family == AF_INET6)
{
Peer->Endpoint.Addr.Ipv6 = Endpoint->Addr.Ipv6;
- if (Endpoint->Src6.ipi6_ifindex != Peer->Device->InterfaceIndex)
{
Peer->Endpoint.Cmsg = Endpoint->Cmsg;
Peer->Endpoint.Src6 = Endpoint->Src6;
@@ -620,7 +532,6 @@ SocketSetPeerEndpoint(WG_PEER *Peer, CONST
ENDPOINT *Endpoint)
else
goto out;
Peer->Endpoint.RoutingGeneration = Endpoint->RoutingGeneration;
- ++Peer->Endpoint.UpdateGeneration;
out:
ExReleaseSpinLockExclusive(&Peer->EndpointLock, Irql);
}
@@ -643,7 +554,6 @@ SocketClearPeerEndpointSrc(WG_PEER *Peer)
Irql = ExAcquireSpinLockExclusive(&Peer->EndpointLock);
Peer->Endpoint.RoutingGeneration = 0;
- ++Peer->Endpoint.UpdateGeneration;
RtlZeroMemory(&Peer->Endpoint.Src6, sizeof(Peer->Endpoint.Src6));
ExReleaseSpinLockExclusive(&Peer->EndpointLock, Irql);
}
-- 
2.31.1
