Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8E4C54F5F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Feb 2026 07:28:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3e5c7cf;
	Fri, 20 Feb 2026 07:28:24 +0000 (UTC)
Received: from ojstrica.amebis.si (ojstrica.amebis.si [93.103.235.91])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 19c26af3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Feb 2026 07:28:23 +0000 (UTC)
Received: from ojstrica.amebis.doma (localhost [IPv6:::1])
 by ojstrica.amebis.si (Postfix) with ESMTP id 45C7F30E9957;
 Fri, 20 Feb 2026 08:28:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amebis.si; s=mail;
 t=1771572502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3ep67H+w26KUBseVukCBampb7DDZVJEliGYFlZKGmE=;
 b=YUJyCza0f/jy0RwaqHNtVpoQXzimb3WR7II4eSjBib9GIXYqedp8cHCxAOVHQAadv2gNtl
 6kqo4XgTLi14BE0nyFeha1V9RCER5lhLL3udvrA7O0PXLuVKYR6zQ7hV4ez5xJzs+01UzE
 yLFo5VTuM9r6SdLPtCGX1rdEVImYKBg=
Received: from [IPV6:2a01:260:4101:1464:7d19:4e6b:3fba:c880]
 ([2a01:260:4101:1464:7d19:4e6b:3fba:c880])
 by ojstrica.amebis.doma with ESMTPSA id bwt4DhYNmGkQ0BoAkOztjA
 (envelope-from <simon.rozman@amebis.si>); Fri, 20 Feb 2026 08:28:22 +0100
Message-ID: <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
Date: Fri, 20 Feb 2026 08:28:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] in order to prevent buffer overrun (which was
 observed while sending multiple high throughput UDP streams from different
 threads) I move the driver spinlock to protect Ring buffer Head.
Content-Language: en-US, sl
To: odedkatz <katz.oded@gmail.com>, wireguard@lists.zx2c4.com
Cc: odedk@twingate.com
References: <20260219193255.14334-1-katz.oded@gmail.com>
 <20260219193255.14334-2-katz.oded@gmail.com>
From: Simon Rozman <simon.rozman@amebis.si>
Organization: Amebis
In-Reply-To: <20260219193255.14334-2-katz.oded@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi, Oded!

First and foremost, thank you very much for taking time to look into 
this and troubleshoot it.

It was believed, that ReadULongAcquire() and WriteULongRelease() alone 
provide atomic manipulation with Ring->Head on all modern platforms. 
Hence, these calls were made outside the spinlock, to squeeze an extra 
micrometer of performance.

I could not directly apply your patch to the wintun repo, since it does 
not follow our code style, commit message conventions and is not 
Signed-off-by you.

However, it would have been a terrible waste of your research if your 
contribution wouldn't get into wintun, so I reworked your PR and applied 
it here: 
https://git.zx2c4.com/wintun/commit/?id=607c181ea9fa0036d23598038e6019ad54db5ce4

Please, stay tuned for an official WHQL-signed release.

Lep pozdrav | Best regards,
Simon Rozman
Amebis, d. o. o., Kamnik

On 19. 2. 2026 20.32, odedkatz wrote:
>      I observed that the Ring->Head was taken and manipulated later on with just a `ReadULongAcquire` which isn't OK when 2 are trying to manipulate it later on based on the same received value.
> ---
>   driver/wintun.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/driver/wintun.c b/driver/wintun.c
> index d1f3b9f..65cd97e 100644
> --- a/driver/wintun.c
> +++ b/driver/wintun.c
> @@ -284,13 +284,14 @@ TunSendNetBufferLists(
>       TUN_RING *Ring = Ctx->Device.Send.Ring;
>       ULONG RingCapacity = Ctx->Device.Send.Capacity;
>   
> +    KLOCK_QUEUE_HANDLE LockHandle;
> +    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle);
>       /* Allocate space for packets in the ring. */
>       ULONG RingHead = ReadULongAcquire(&Ring->Head);
> -    if (Status = NDIS_STATUS_ADAPTER_NOT_READY, RingHead >= RingCapacity)
> +    if (Status = NDIS_STATUS_ADAPTER_NOT_READY, RingHead >= RingCapacity) {
> +        KeReleaseInStackQueuedSpinLock(&LockHandle);
>           goto skipNbl;
> -
> -    KLOCK_QUEUE_HANDLE LockHandle;
> -    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle);
> +    }
>   
>       ULONG RingTail = Ctx->Device.Send.RingTail;
>       ASSERT(RingTail < RingCapacity);
> @@ -419,8 +420,8 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdapterContext, PNET_BUFFER_LIST Net
>               Ctx->Device.Receive.ActiveNbls.Head = NET_BUFFER_LIST_NEXT_NBL_EX(CompletedNbl);
>               if (!Ctx->Device.Receive.ActiveNbls.Head)
>                   KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty, IO_NO_INCREMENT, FALSE);
> -            KeReleaseInStackQueuedSpinLock(&LockHandle);
>               WriteULongRelease(&Ring->Head, TunNblGetOffset(CompletedNbl));
> +            KeReleaseInStackQueuedSpinLock(&LockHandle);
>               const MDL *TargetMdl = Ctx->Device.Receive.Mdl;
>               for (MDL *Mdl = NET_BUFFER_FIRST_MDL(NET_BUFFER_LIST_FIRST_NB(CompletedNbl)); Mdl; Mdl = Mdl->Next)
>               {

