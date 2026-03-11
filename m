Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE392103E2F4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 11 Mar 2026 23:35:43 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 620cdb6d;
	Wed, 11 Mar 2026 23:35:41 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8169a995
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 11 Mar 2026 23:35:37 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5a13a06fc85so570621e87.1
 for <wireguard@lists.zx2c4.com>; Wed, 11 Mar 2026 16:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773272137; cv=none;
 d=google.com; s=arc-20240605;
 b=h7jCiq25uceiODnUB8/LGMJv3uaWbJL5hOtBpthFQgBbsNml/2x6IWqWaDgDSi68Bz
 /h+rFQOA2ZeCQV7PbC3Apu2iDTdNkn7rSb2iijAkvZeHj6n19uqM9oGvnn9F3d0YKUvF
 0uV6mXM5aqnwxhcujvLbuWByXYCCSEAisI2vsOjOkWazab/RDcASbetIpJxPMk2E4Wjz
 VrudAnt2RhRsX76kRowSumCuFWQjDMzWpn7/tEBSi4FFM95srCfNw8Q5yi4MFBDXtySb
 8rnpSmSvb1drFmp+fG0GeeF4pfvSM++kJGnka+eBZfyVS+4Nyxeer7XP9VvKQmSuKxyw
 Nsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=U+sC9nDWlhkRgqb/KiFa5gzgoyLukuOau3FTQFYmVDA=;
 fh=/BFo+RY7kXm53mlPOtKGD29D83ltQRSdceyOY5kAX6I=;
 b=PeciJ2CHOCH7Bzp1UuDGkLtunR63lMS1PCo9w1uoUPNfjLo/iZ6y+nJKsnKkqGs/Iv
 ebVEZMOUGnDfpvcQXzGTLkGTPE+P1/Sm43icALch2aTCvU4CfvsARlbOROefC7qDLX9C
 KFWQ5Pt1tvIM5bm4hwdK9TDHneATsO3TQQKWKnFrxW5v4qbv6fCrvQPh7+1tY8OBgeoc
 NnnwykspwgtI9gAOeSGDsr4mATr2V5y4Y2kDiN0BuH1jtrKMQhMpOAcPfpqcJdGwTi5j
 sy+gsxY67ozjSt5HMab1w9HMlWmluIz6ZABIom5BG23bDCf0gsngOf125nmPGDkzMA7b
 VPMA==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773272137; x=1773876937; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+sC9nDWlhkRgqb/KiFa5gzgoyLukuOau3FTQFYmVDA=;
 b=YW3RINGWIA/xpsX0LxFBEsKAMWGouu1gPU5fQllEqg92d77v5/3EBiYS+rmGnabU/a
 KGZEwVt+5m4z7kF8iwIi1fnZm2FonwmtmtyqgKFOzYyfMwFY+ySjUA17DhgC5TzU/NN8
 DhylWsVG/H7+OfzEOtBBf/5l+nXIppYtLgpwX4Vp+8n053p1D5Sv+nepVqnd49jYLy2S
 aWvN1Q3qjqbBct5W/CYuDzep60DVYSspfUUMHr/Ia1UhJrSF/xXmhf6JjtIiJ1rppVTk
 yMv4DE50UNzVWVmbPg+BS8WMEDwGqPLE1wgFX8wSmLZjNki2sYqVNDRbE43WzkjMxMMJ
 d9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773272137; x=1773876937;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U+sC9nDWlhkRgqb/KiFa5gzgoyLukuOau3FTQFYmVDA=;
 b=L6T2TQXc0dcLTHS12QWsanUptZgSsUELqw33mZh0ux7BwAVWG94sIoEk+5dK2gsjdw
 YzrSNicg8HL+frY/QzoTcxtD61mvv731dtf8BEIYaV0vxtEyKJQ8B40Ew5fmN7a4JAem
 ezCaoKiLF7mmdNTdYMVqmd8LnEzYNdNnkYWTHZI7S6IhUBiAm77CtcLWW/Lo55a8CcjM
 /IgFbFufevJsHGnv3JCA8GR5St6hyaoH3a0BiZzymG5NtCPCMsss/8HhczQQtdwvkALf
 Km5GZPq6Q9bdsQa9ccQZy9qV0QAHJze3XWmgO//RckG7FAl9Ztn89DrAF9MpZwLOWUqi
 2YbA==
X-Gm-Message-State: AOJu0YwHTq13G5WMhBm3tSpkZZ5lt+vb3SeIwoTiMsNCh9lHOOz9bGVg
 b8xWaTpk0b15jR5S+jZ5/o8VBPPsjkPQzJnM9TCWKSrpOI1bWGLOJPm4eZ0Yn0TAjcrRpKyi10h
 FOmotsaKivbx/+TAoSqbxoY1oJO2HXUn8dA==
X-Gm-Gg: ATEYQzzsjETzKtCv2AgWfj05+n9V3RLtA4tXPwzNivI0vrsVxOUsWr3f+HUYYeJ0NCR
 eSXtZ5ISX8b+ZTv7MHcmjUtbuGFJmy4DXd4a2JU05n0VOicGDEQwxj9Tdi0VYSsc+XADPGVS1Oi
 3CqZON52KLlZHBhUSZiV7AryZv/pGp8vRARlFqxD1LVHE/8wKhuYbxKjmMmp+aCyCz45F2JVuJF
 MRAr4ZJZ6GIteTQ0AE/bGZB+Bj01vC1I28qQDpna9+j5kr5b1c6AvitKw/6XwP0P0y0Q5gTGFYa
 STK3keIL0AtlipVDRDTaupkIOW76WWFZaA4/
X-Received: by 2002:a05:6512:3e12:b0:5a1:d06:573 with SMTP id
 2adb3069b0e04-5a156dcf451mr1439232e87.43.1773272136333; Wed, 11 Mar 2026
 16:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260219193255.14334-1-katz.oded@gmail.com>
 <20260219193255.14334-2-katz.oded@gmail.com>
 <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
In-Reply-To: <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
From: Oded Katz <katz.oded@gmail.com>
Date: Wed, 11 Mar 2026 16:35:25 -0700
X-Gm-Features: AaiRm50C1BpsnzBYRJQvL2FBD618YPT1Qv9yBMlJxkPZ1O-XKX1qC0gZxpxFRZk
Message-ID: <CAApnxP3-0gSkh7W0Y8OCHVQ05phWfG9hY6jTnjR0EoUVuxgvPw@mail.gmail.com>
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

I still haven't heard from you guys, neither saw a ticket in the mailing li=
st.
is there any update ?

regards,
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
