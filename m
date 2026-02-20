Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9EAC5AD05
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 20 Feb 2026 16:55:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 24b6d58e;
	Fri, 20 Feb 2026 16:55:30 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b403cb39
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Feb 2026 16:55:28 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3870d178a9aso19233011fa.0
 for <wireguard@lists.zx2c4.com>; Fri, 20 Feb 2026 08:55:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771606527; cv=none;
 d=google.com; s=arc-20240605;
 b=SvagQBHdgIGLHXuwYO3eEv+wjczECPwoWxcDArpF6d5e2mYe7/qtFZiyZ9b4bCXkMY
 g3rZVLCshVDumJCrATivibn++dC0wk0ES8sRQ0r5DewvGNz7f9ogOaPgeTrW/nJJY8EZ
 e6qYpUqJa6LxzS/SX4p/mcVJu30bufb2jxYe7yjBwwhG1sa+n3lTXD9z5o1sY7cxzyyn
 b7x8RabzbyrP5O1YSuRBdixPrqDBKxYkEde0gkD/CRWIVR3I5JheLyuwe7AT+REznUr/
 MLgbhtoEW6WhGQuzAatIJxHFtDxFtMxhI/6KbDmSyQG8DsEV8piED+ECRjdbMzawVkRb
 welg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kxExR6pcQQzNpbdezNdB2m4xQUUj/NYtP0oFwvO7aoc=;
 fh=/BFo+RY7kXm53mlPOtKGD29D83ltQRSdceyOY5kAX6I=;
 b=kydU1iCMvEqfTl/xd3U6zm+DyM7RSLJ5bp5NKtz2vy7HBfe4z+bTo6qkkGIaRF59JU
 0SiS2HZRaMPb+m/sPLuTfSHqoYBUME5v9S8dmoMJjGL2AK9QFX0s/92WfYB7tIxV68oD
 yM4LeAVgV4c3gGP0ILKwLXgnHd875iCKQDQNysaS+hhfqENlz3bnM4rVGkOs4TFpkSlL
 ZQTuXjbKlvxENN8KK/tnKptccmi6S7KKCyJZO8UinCTmzAhemu/5pxKaRcpbe3qMv0wb
 b9GIpFARhmYPj1ivpS5rA3LkDMwcOYkm+SuEuPZ32nLki4FaEbcUvzCZK9p+JwERpgJK
 AxCw==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771606527; x=1772211327; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kxExR6pcQQzNpbdezNdB2m4xQUUj/NYtP0oFwvO7aoc=;
 b=nphIDP2Nt8bFvW3nDhZlPTXqL1kihttGItXcRXoj4jmruanOPfawOQ6BDLMsLysxRu
 7eDQqgyi0nl+f18Nf2jCjv9qYGRfNJW0nrWb5R/+YP1EpAA3RwfjQaSYFR1dHedEI5zF
 ee3lQiINmORSRQ8uaVGskJofMZAH3TdM5BXh4p3hwOd5oTNX6d0QunjxdEMJztsScY3Q
 gJXZOEOQo+SFkomZ77scVVpgUUeoMwAssLCeds7NVzuY/anYddorBNkVsK+lnk7MOfFq
 Ah10vab/YjskUFDtpLlJ47gUsUyHihxQDPgVSZ6gApFNwKpCeH+rf1T0Ibw1zJcHJZAi
 g2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771606527; x=1772211327;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kxExR6pcQQzNpbdezNdB2m4xQUUj/NYtP0oFwvO7aoc=;
 b=t6eII5D9+2+cTZpw0XkDi3x2jcl6UppCLsLP4gK6k8SXnDIHQlqlItmGc6OCkbiUtQ
 I5pl9rdjfoCMb5MR1mo6KuXg9MeZtrTxizCwFjOqOoNlEVJonPRSIFQw5k5DJCKHDv0h
 /0uPmH4c7uVs55R6FnBc7o4RcXPH139kAOYxMamWRBeOePfxIVSGmjFozgUT3ZdRF+pT
 IrHAYw7G7aue8+FgxJ7uy44EoPxhSQtKNHGirBeoTMGpSSsT2PAGAjMqeoj/2lxBPmlT
 F5+qmWtqpvEK1EMAFnuE1rzkfzoMCZpYdongqdT2hfwoMCLDTmQHNzVrjfJxIdgzJIPQ
 HcRQ==
X-Gm-Message-State: AOJu0YwacqZCZ3bC3KQbcDyY+mzNXVl63GG6c5i139dBv77N7NE9VHOC
 S7xJJ3BlI48Txq+TU2tJ4gEmMA30EC4eG/JGiC1MuKnIP4kRE9gj8lwYoBUWK9tRNpCJW8CT1vE
 ZS+xZ1UnGd88oQcyNg0FFbctpxyktCd0=
X-Gm-Gg: AZuq6aKYNFE8hoCeEuTt+4K62RVogkPCKfHF0StNE7FxVQweF5Lu6gi1Pdbz1re2jXI
 /ZKVbvXRb5TzZ26RzNcYFl9XQ7riLSWGEFej0TRIGrjhEuxPOW6rkKwG1I3DBI7W+gumPSZ986k
 5jAyVDxbhd8wssfB88Tj8IIBzrG+1n08cXvbp6sxLYaVE/YIPzCM2cwx5x7ywwfApNFH1K+PnvZ
 qdPsit4h2n6KmEytvMOgJtM0NJ6d1SJcxuvdjkt+VXqCi+lIFN7z7dj9AcuztLOYGis+vGHH04q
 BXul+UGYeqTPqL/7EUG530u98gW+RjQsGZY3
X-Received: by 2002:a05:651c:e17:b0:387:2fb:7c1 with SMTP id
 38308e7fff4ca-389a5e06416mr1056091fa.37.1771606527017; Fri, 20 Feb 2026
 08:55:27 -0800 (PST)
MIME-Version: 1.0
References: <20260219193255.14334-1-katz.oded@gmail.com>
 <20260219193255.14334-2-katz.oded@gmail.com>
 <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
In-Reply-To: <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
From: Oded Katz <katz.oded@gmail.com>
Date: Fri, 20 Feb 2026 08:55:15 -0800
X-Gm-Features: AaiRm53gG_mnDNrqBSeFqWhbWdLjyAISJbOB6HxetAfa6oQGcU99et6HZ5-6-X8
Message-ID: <CAApnxP1TETDP1yQ-SgdhJ1RsyQ8HNRy9Vuk6jFqdyHx8okaUaA@mail.gmail.com>
Subject: Re: [PATCH 1/1] in order to prevent buffer overrun (which was
 observed while sending multiple high throughput UDP streams from different
 threads) I move the driver spinlock to protect Ring buffer Head.
To: Simon Rozman <simon.rozman@amebis.si>
Cc: wireguard@lists.zx2c4.com, odedk@twingate.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Simon,

Thanks for the update.
FYI: the ReadULongAcquire() and WriteULongRelease() themself are good
enough for getting and updating an atomic operation.
however, after on thread updates the head, the second thread can't
stay with the same atomic read value of the Head.
- so assuming 2 thread read the Head on the same time so the 2 threads
has same head.
- now 1st thread takes the spin lock and updates the head
- 2nd thread is pending the job until the spinlock is released and
then it doing the job, but with the non-updated Head value
     - so it will overrun the previous thread data and mess the ringbuffer


again thanks for providing the next release
Regards,
Oded

On Thu, Feb 19, 2026 at 11:28=E2=80=AFPM Simon Rozman <simon.rozman@amebis.=
si> wrote:
>
> Hi, Oded!
>
> First and foremost, thank you very much for taking time to look into
> this and troubleshoot it.
>
> It was believed, that ReadULongAcquire() and WriteULongRelease() alone
> provide atomic manipulation with Ring->Head on all modern platforms.
> Hence, these calls were made outside the spinlock, to squeeze an extra
> micrometer of performance.
>
> I could not directly apply your patch to the wintun repo, since it does
> not follow our code style, commit message conventions and is not
> Signed-off-by you.
>
> However, it would have been a terrible waste of your research if your
> contribution wouldn't get into wintun, so I reworked your PR and applied
> it here:
> https://git.zx2c4.com/wintun/commit/?id=3D607c181ea9fa0036d23598038e6019a=
d54db5ce4
>
> Please, stay tuned for an official WHQL-signed release.
>
> Lep pozdrav | Best regards,
> Simon Rozman
> Amebis, d. o. o., Kamnik
>
> On 19. 2. 2026 20.32, odedkatz wrote:
> >      I observed that the Ring->Head was taken and manipulated later on =
with just a `ReadULongAcquire` which isn't OK when 2 are trying to manipula=
te it later on based on the same received value.
> > ---
> >   driver/wintun.c | 11 ++++++-----
> >   1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/driver/wintun.c b/driver/wintun.c
> > index d1f3b9f..65cd97e 100644
> > --- a/driver/wintun.c
> > +++ b/driver/wintun.c
> > @@ -284,13 +284,14 @@ TunSendNetBufferLists(
> >       TUN_RING *Ring =3D Ctx->Device.Send.Ring;
> >       ULONG RingCapacity =3D Ctx->Device.Send.Capacity;
> >
> > +    KLOCK_QUEUE_HANDLE LockHandle;
> > +    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle=
);
> >       /* Allocate space for packets in the ring. */
> >       ULONG RingHead =3D ReadULongAcquire(&Ring->Head);
> > -    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D RingCa=
pacity)
> > +    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D RingCa=
pacity) {
> > +        KeReleaseInStackQueuedSpinLock(&LockHandle);
> >           goto skipNbl;
> > -
> > -    KLOCK_QUEUE_HANDLE LockHandle;
> > -    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHandle=
);
> > +    }
> >
> >       ULONG RingTail =3D Ctx->Device.Send.RingTail;
> >       ASSERT(RingTail < RingCapacity);
> > @@ -419,8 +420,8 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdapter=
Context, PNET_BUFFER_LIST Net
> >               Ctx->Device.Receive.ActiveNbls.Head =3D NET_BUFFER_LIST_N=
EXT_NBL_EX(CompletedNbl);
> >               if (!Ctx->Device.Receive.ActiveNbls.Head)
> >                   KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty, IO_=
NO_INCREMENT, FALSE);
> > -            KeReleaseInStackQueuedSpinLock(&LockHandle);
> >               WriteULongRelease(&Ring->Head, TunNblGetOffset(CompletedN=
bl));
> > +            KeReleaseInStackQueuedSpinLock(&LockHandle);
> >               const MDL *TargetMdl =3D Ctx->Device.Receive.Mdl;
> >               for (MDL *Mdl =3D NET_BUFFER_FIRST_MDL(NET_BUFFER_LIST_FI=
RST_NB(CompletedNbl)); Mdl; Mdl =3D Mdl->Next)
> >               {
>
