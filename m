Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 105B21048924
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 28 Feb 2026 01:12:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 104fef5d;
	Sat, 28 Feb 2026 01:12:47 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 412b1a5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 28 Feb 2026 01:12:44 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-387090ae5b1so35606451fa.0
 for <wireguard@lists.zx2c4.com>; Fri, 27 Feb 2026 17:12:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772241163; cv=none;
 d=google.com; s=arc-20240605;
 b=WQFphZls9ZnFkGv8Evl4ACD2089T3KohvD+dmbK3hwy3Ry+1mkRgnlY3t2PUCVSui8
 x6eN5BxL+b07PY4mUyk9iZgzEA6UiEbiiE+hDKfPLP3dLKlvMeXI+RVbb6xaCqHCazKH
 ud4lFJWuWaJJEjAbTr+jb68vrV/0cVHV/nnOEgIcRPBC+sU9R+sbW3KKEISl+6gQfbtX
 Z1Z5fKRY8YoM2USsFN/V+8+QRucYKYTte9Dq7AI/VGwu1Ufnrnx6Vcp2sjvY8iB8aZ9a
 nVvu3ItBtm40MzmAlhiSkdIRR6iq9jpFIW61zVW4za16CBbva+U+ct4+yVmXWne8Q29C
 3J3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=T5yAIJM9eDSuiJ4nJGwFgUPVG+Ae9mYCx1ZlamC+fdE=;
 fh=/BFo+RY7kXm53mlPOtKGD29D83ltQRSdceyOY5kAX6I=;
 b=f+ahJ69435lCyOjnkik2EUAIvgEwoo78VFdGcNOfSzJDC5IzmybZEHGrcBfM/8oNQc
 8BNqUmhxvc7IBkV2IE4/g3g+Z9ZKq0ZaNvgMlE9nK1Pcanxmv77qWsugltu4UE8ypp1o
 xSyLyTPRxVZ2hz9gbvawMO59atNxsykqPrxptW4bM+DnSdZKvm1OX6JNXhf2qLQ3wDgG
 X7RmWh8UMkcDEtQFyGjnsd5NoJvqbr9ajm+n/Ym8HKdoiNmQJ6k8rRCXvyk4ztLo5SKf
 Sn7hYFOxmn9H8RHHTxh+2338VY/oMZpUM5pi38zCX0XEsRTBDECQUxoXjoMwQ+HK3lNL
 8r8g==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772241163; x=1772845963; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5yAIJM9eDSuiJ4nJGwFgUPVG+Ae9mYCx1ZlamC+fdE=;
 b=jDbPioU5z1m124XmFOHr8YSzwP9CeobMTFix02heYPLxjO9uMdkuNG5MCO+PkgiZhV
 TUVZp0AVEzbMWWgdoQp+sVjX78mqsRjgsKtN3vLUjM+iD7eCzzxW8yTGYWtYQgD33ei9
 tI0WiE4kNw81tgnxjkULJIpKURyFM5ng7RJaCwhEzDrE97hv0rxAMXk2yeMPlqI1pk+6
 KNhNMXYQLHvtPioITicwjp3B91rT/8Ef3J9JJe71bXj3CBVTrxDfgprBB7/O5rg7fzq4
 JP23cjLwELyUX2Aq2W90WCdf0ZgESMCWtKrIab4laz/dBoQ+ittpitNwOnPRcGE3sbtR
 QC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772241163; x=1772845963;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=T5yAIJM9eDSuiJ4nJGwFgUPVG+Ae9mYCx1ZlamC+fdE=;
 b=DKVZBea/6mGQtA2vQQ3Cg0aS6yhtOIKeWU4fdvgxBHt7CQ1FNRzFOBK3SunOZh8e/d
 EDhyEK6MW/vVVZ3Gc5/QUgHYVNV03mVnuC/ip6GuB3yUlwzeTlvonaDs6HYEGXvF/FBL
 OM8pZRr45gJnhQGv6as3mK/0ivtlSGorpawWPepbp1oPso8Ytayv7c3sk39wias3nq1V
 +vJWs7cJ4quJnSkHw4XxZDWEIYpsv5rE+RK4LlPfZcIWKC9Tmz7lvIIl0FrMNcriAutd
 GSz7mQPy4k+yw1yMqLQrMsDF/KdwUFZQT74db7R6EcAtseJVSKDFCXk86PXpWz2xZZAZ
 OW7Q==
X-Gm-Message-State: AOJu0Yx9DlsgWdbEtApa46pqaTpuhq60CGDojQTuQV0Jb9W51jrHoVMa
 T+yIdyM3aTjxA52jcrixqN6fKMCNdbK3dkPknlDFvwnITgoyidGyCeBB/Igx0WdyniCTD6/E/aZ
 x1RDynRDg6gtSjW5A6Kah8wfuhpJOKN4=
X-Gm-Gg: ATEYQzxnIAMHyfRjyzURna4zwPtYc8RQy1rrKFeNDUBgKdQnb+VDNGcigpYuuT8t5Kf
 fwZZit13GRbUdis68MKcf64niJ9mu010ywouP766+0ylH7OQEdY1j1+DTS+cyb02lvFDc7em97A
 uiRyDJnbbD6oM1LAsR3BhwDT/bY4CYpwYNOcG9HsXyUxtoEotVoRW7s0pSSOaZiyu/EUKt89wlE
 +GcHG/ifKwlwwJtHmD1vMs4bzbdvG+5Hmh5a5DKja6nKYBNX3hDnHjiYj9IWZSCDCEA+NHGNl6a
 5QExhUDkRLTV4kICaQUlvqPdUKrFh1Vh
X-Received: by 2002:a05:651c:441a:10b0:386:1ce2:1192 with SMTP id
 38308e7fff4ca-389ff15e19emr24026571fa.20.1772241163100; Fri, 27 Feb 2026
 17:12:43 -0800 (PST)
MIME-Version: 1.0
References: <20260219193255.14334-1-katz.oded@gmail.com>
 <20260219193255.14334-2-katz.oded@gmail.com>
 <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
 <CAApnxP1TETDP1yQ-SgdhJ1RsyQ8HNRy9Vuk6jFqdyHx8okaUaA@mail.gmail.com>
 <CAApnxP3H7LjxDBfFoPMsjZ=fb1mosOaemLW-c5xgdhuzWQvzfA@mail.gmail.com>
 <cf366216-883b-4d42-99e1-f59cb12a6b34@amebis.si>
In-Reply-To: <cf366216-883b-4d42-99e1-f59cb12a6b34@amebis.si>
From: Oded Katz <katz.oded@gmail.com>
Date: Fri, 27 Feb 2026 17:12:32 -0800
X-Gm-Features: AaiRm521iyPwrIV2znD99iixAQa3jNIPEekOgpKaiGFnzg6OO7tMWit9GX7_104
Message-ID: <CAApnxP3P2evKEjAa-JxCpCLGzCV9M1RaYGce1+WGbCwGC=OyRg@mail.gmail.com>
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

Thanks for the update.
Have a wonderful weekend
Oded

On Fri, Feb 27, 2026 at 2:03=E2=80=AFPM Simon Rozman <simon.rozman@amebis.s=
i> wrote:
>
> Yes, Oded. Your research is much appreciated. I have stare-reviewed it
> immediately, and it makes sense: by slightly extending the critical
> section a race condition should be fixed. Unfortunately, haven't had
> time to apply it to the master branch yet. Hopefully next week.
> Definitely before a release.
>
> Lep pozdrav | Best regards,
> Simon Rozman
> Amebis, d. o. o., Kamnik
>
> On 27.2.2026 22:28, Oded Katz wrote:
> > Hi Simon,
> >
> > We have found another issue with the driver code.
> > some race condition between "alertable" flag between driver and
> > user-side. causing driver to stall until new packet wakes it up.
> > We have seen some cases where it can be for periods of 5 sec.
> >
> > we already made the fix, and I sent 2 approaches for that fix.
> > please let us know if you are planning to solve it in your repo?
> >
> > regards and thanks,
> > Oded
> >
> > On Fri, Feb 20, 2026 at 8:55=E2=80=AFAM Oded Katz <katz.oded@gmail.com>=
 wrote:
> >>
> >> Hi Simon,
> >>
> >> Thanks for the update.
> >> FYI: the ReadULongAcquire() and WriteULongRelease() themself are good
> >> enough for getting and updating an atomic operation.
> >> however, after on thread updates the head, the second thread can't
> >> stay with the same atomic read value of the Head.
> >> - so assuming 2 thread read the Head on the same time so the 2 threads
> >> has same head.
> >> - now 1st thread takes the spin lock and updates the head
> >> - 2nd thread is pending the job until the spinlock is released and
> >> then it doing the job, but with the non-updated Head value
> >>       - so it will overrun the previous thread data and mess the ringb=
uffer
> >>
> >>
> >> again thanks for providing the next release
> >> Regards,
> >> Oded
> >>
> >> On Thu, Feb 19, 2026 at 11:28=E2=80=AFPM Simon Rozman <simon.rozman@am=
ebis.si> wrote:
> >>>
> >>> Hi, Oded!
> >>>
> >>> First and foremost, thank you very much for taking time to look into
> >>> this and troubleshoot it.
> >>>
> >>> It was believed, that ReadULongAcquire() and WriteULongRelease() alon=
e
> >>> provide atomic manipulation with Ring->Head on all modern platforms.
> >>> Hence, these calls were made outside the spinlock, to squeeze an extr=
a
> >>> micrometer of performance.
> >>>
> >>> I could not directly apply your patch to the wintun repo, since it do=
es
> >>> not follow our code style, commit message conventions and is not
> >>> Signed-off-by you.
> >>>
> >>> However, it would have been a terrible waste of your research if your
> >>> contribution wouldn't get into wintun, so I reworked your PR and appl=
ied
> >>> it here:
> >>> https://git.zx2c4.com/wintun/commit/?id=3D607c181ea9fa0036d23598038e6=
019ad54db5ce4
> >>>
> >>> Please, stay tuned for an official WHQL-signed release.
> >>>
> >>> Lep pozdrav | Best regards,
> >>> Simon Rozman
> >>> Amebis, d. o. o., Kamnik
> >>>
> >>> On 19. 2. 2026 20.32, odedkatz wrote:
> >>>>       I observed that the Ring->Head was taken and manipulated later=
 on with just a `ReadULongAcquire` which isn't OK when 2 are trying to mani=
pulate it later on based on the same received value.
> >>>> ---
> >>>>    driver/wintun.c | 11 ++++++-----
> >>>>    1 file changed, 6 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/driver/wintun.c b/driver/wintun.c
> >>>> index d1f3b9f..65cd97e 100644
> >>>> --- a/driver/wintun.c
> >>>> +++ b/driver/wintun.c
> >>>> @@ -284,13 +284,14 @@ TunSendNetBufferLists(
> >>>>        TUN_RING *Ring =3D Ctx->Device.Send.Ring;
> >>>>        ULONG RingCapacity =3D Ctx->Device.Send.Capacity;
> >>>>
> >>>> +    KLOCK_QUEUE_HANDLE LockHandle;
> >>>> +    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHan=
dle);
> >>>>        /* Allocate space for packets in the ring. */
> >>>>        ULONG RingHead =3D ReadULongAcquire(&Ring->Head);
> >>>> -    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D Rin=
gCapacity)
> >>>> +    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D Rin=
gCapacity) {
> >>>> +        KeReleaseInStackQueuedSpinLock(&LockHandle);
> >>>>            goto skipNbl;
> >>>> -
> >>>> -    KLOCK_QUEUE_HANDLE LockHandle;
> >>>> -    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHan=
dle);
> >>>> +    }
> >>>>
> >>>>        ULONG RingTail =3D Ctx->Device.Send.RingTail;
> >>>>        ASSERT(RingTail < RingCapacity);
> >>>> @@ -419,8 +420,8 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdap=
terContext, PNET_BUFFER_LIST Net
> >>>>                Ctx->Device.Receive.ActiveNbls.Head =3D NET_BUFFER_LI=
ST_NEXT_NBL_EX(CompletedNbl);
> >>>>                if (!Ctx->Device.Receive.ActiveNbls.Head)
> >>>>                    KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty,=
 IO_NO_INCREMENT, FALSE);
> >>>> -            KeReleaseInStackQueuedSpinLock(&LockHandle);
> >>>>                WriteULongRelease(&Ring->Head, TunNblGetOffset(Comple=
tedNbl));
> >>>> +            KeReleaseInStackQueuedSpinLock(&LockHandle);
> >>>>                const MDL *TargetMdl =3D Ctx->Device.Receive.Mdl;
> >>>>                for (MDL *Mdl =3D NET_BUFFER_FIRST_MDL(NET_BUFFER_LIS=
T_FIRST_NB(CompletedNbl)); Mdl; Mdl =3D Mdl->Next)
> >>>>                {
> >>>
>
