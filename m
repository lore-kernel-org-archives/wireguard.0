Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F510398B2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Feb 2026 21:28:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4c930c42;
	Fri, 27 Feb 2026 21:28:25 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 22c81279
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Feb 2026 21:28:19 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-389ff6e5885so27022721fa.0
 for <wireguard@lists.zx2c4.com>; Fri, 27 Feb 2026 13:28:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772227698; cv=none;
 d=google.com; s=arc-20240605;
 b=WhwU+lD/Abt8FhTrgBaTtoYpIDiyzREgb2CPG3OFzUZzljolbV26an1orIwjOZit4U
 Q/d6/xozQeNoGPCsh4UOKeMzcEThFdz+YYhSLGx9Z6GAYEgEcURHWDPBq57LbyRWQ/oi
 cZ/JNASF/2PiSriRBaCRYVa/NoFTIt93eE7F57t26d1wUyXd43BfrEhNRSp6j663DW2c
 nF4nMb64EAmeIULpKxw0fbkUoiidRyNHiZO69v/v/MHoFFwwdBzKxW7Ao1grhCaUux+s
 xg3DWcEXepnbtA9xf8oGHyOpfvYuw6HhuLdHT3xMyMvCjeSHTgnw0Z5UO06NTCAfOUr6
 Z+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TAjXkjyZASNgWBGDLsm2bP6YhvxM6ZSFNwcCwBSi054=;
 fh=/BFo+RY7kXm53mlPOtKGD29D83ltQRSdceyOY5kAX6I=;
 b=OH3PQ0wo5TCDFKsQhpfG4CNQFswPJMxaX9yFev/3jyF609k+oSNHGJEqI3A6Fu6M3U
 16r6xoK1NeOuXuwnw613kzOmcgq3IaT4cOKSUxMSv7jW4LUgmzFkYIkjd4x1Zet3Z5E8
 Invi8WmOc7OdT6yT5Ewbp2zqKXBn57MNLEPJi3uZsafWYqMflSIe/HzwaSRtMsN45cCt
 eePxUSrzFWIe9jq6NcfCPnsQoYs+X4ZgBStoQDJLLHE2jqqtvGULhhxTgbVcTNDQbCu8
 gkUKgho6mSUixtN4V/IKdy+kQvhe3z7gmlGPXvceP/fQ6j086Uqr9IRVYE42p7OFwzVC
 mdVg==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772227698; x=1772832498; darn=lists.zx2c4.com;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TAjXkjyZASNgWBGDLsm2bP6YhvxM6ZSFNwcCwBSi054=;
 b=ASLpbXn6qczZhlUOMqPz7yJqXL1L3h3TXtSOKReKVz2DZcFuzIKDu8Z9WtchE2gz/e
 UcDmQ32RurDL/ao7bCQNwwcEmbUgDzQ8mYZSgEZBBkA453UbhtDUw0xzuwSqcxfMfXYU
 jZ9SZ9lUBuZK/Vg5jE1oHLe037xlfV5wuYrzfWhY+rNwL+aHXCFbno86QtUGqqflEUNe
 EU0SgTpY+jhYsh9N8k0L1dtf7FET3booKbF8PvNt9Ju3/OmfsYzUSGNsZl4C973cbJ0g
 nFhDNBsW3kWYqhBwgCVmpvb5hAdf6O4NGon/ow/lru6PLU+2XaLhieVKRsbjlSYjq6E0
 YWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772227698; x=1772832498;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TAjXkjyZASNgWBGDLsm2bP6YhvxM6ZSFNwcCwBSi054=;
 b=NF5Py2GOL36yin2lKpir3L9xK3YD+0tJiX21b2OaTeDsPEb7/+FaCSpXewRD0hLOJz
 gk4Ppp3IyGHu4FmyIpqaQcAwOiB2qq0rpx04jgx0CN66BLvkzivIHjUxbWbhQ8u2qT9j
 NxWirb6XJ1iSudlQ0rENB6+XsJV2Ib/mX4D5PtKhLlS+RxF/r6QZFZtD2DUpQ1nQBW3S
 p2FRjm2DJsZBkuijSbq0fbFkaslmhACqbZTU4o8+GyPp4a0d2c89Sr5u8jxjEIdrkfow
 3CriQ+cpjbbeLAH+OIX6zp4Vdjn0IIx+xaCa+T920uzr46W2Hw47/WJacUet3cv5GxLb
 REiQ==
X-Gm-Message-State: AOJu0YzPYaG3MgeCfICnJG9AC4Iy4fsis/JzviXScm4kABWEScJcH6/O
 32BZA++ap6JeustHfFyh56wtamiphrdjluFSul045pVBJRbbY2nQgwfVRPdNAEaRo15x7xlkv4L
 7bfomtU4+gKzrHSsIDqOjxMxcFm3ePWU=
X-Gm-Gg: ATEYQzxQpOv7peompm76yIxtmiVwjzUT8ROWhhguyXlMXLyS36+lbhtg8UU/djvsjGq
 S1ZZIgCGQHv0YjJuIoSk8ZZu/Xm/DCGgUFjnEl0IUwFqQjpH/VZ/cevg+n3ngIiOrH7XFacDacG
 6Ts8foYudPSNvgBnakHEtQoFv+bAAX0eKSrOQKth2v1xTbooyDIwXb5AnG/q4prDrQRUmr6vZ4i
 kmTsgleWvY5EXMKvWa5XnDBi2q0hKhNx2bSJcQLnfybHWTL/TzeYuxBr46l7+4DI5gMqS0aP5BR
 dt3NHHrnSbH/Q16hHGq1qs0GFuZDFF3K
X-Received: by 2002:a2e:be1a:0:b0:385:c15f:6bd with SMTP id
 38308e7fff4ca-389ff73df24mr22322761fa.10.1772227697808; Fri, 27 Feb 2026
 13:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20260219193255.14334-1-katz.oded@gmail.com>
 <20260219193255.14334-2-katz.oded@gmail.com>
 <8e797830-9851-47f3-8e10-4126e295b4b9@amebis.si>
 <CAApnxP1TETDP1yQ-SgdhJ1RsyQ8HNRy9Vuk6jFqdyHx8okaUaA@mail.gmail.com>
In-Reply-To: <CAApnxP1TETDP1yQ-SgdhJ1RsyQ8HNRy9Vuk6jFqdyHx8okaUaA@mail.gmail.com>
From: Oded Katz <katz.oded@gmail.com>
Date: Fri, 27 Feb 2026 13:28:05 -0800
X-Gm-Features: AaiRm500DRRQ4KYqImVBKROrDck8mfP21GVMMYQko5f_a9Ssgx6Vg-OxXMdM98U
Message-ID: <CAApnxP3H7LjxDBfFoPMsjZ=fb1mosOaemLW-c5xgdhuzWQvzfA@mail.gmail.com>
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

We have found another issue with the driver code.
some race condition between "alertable" flag between driver and
user-side. causing driver to stall until new packet wakes it up.
We have seen some cases where it can be for periods of 5 sec.

we already made the fix, and I sent 2 approaches for that fix.
please let us know if you are planning to solve it in your repo?

regards and thanks,
Oded

On Fri, Feb 20, 2026 at 8:55=E2=80=AFAM Oded Katz <katz.oded@gmail.com> wro=
te:
>
> Hi Simon,
>
> Thanks for the update.
> FYI: the ReadULongAcquire() and WriteULongRelease() themself are good
> enough for getting and updating an atomic operation.
> however, after on thread updates the head, the second thread can't
> stay with the same atomic read value of the Head.
> - so assuming 2 thread read the Head on the same time so the 2 threads
> has same head.
> - now 1st thread takes the spin lock and updates the head
> - 2nd thread is pending the job until the spinlock is released and
> then it doing the job, but with the non-updated Head value
>      - so it will overrun the previous thread data and mess the ringbuffe=
r
>
>
> again thanks for providing the next release
> Regards,
> Oded
>
> On Thu, Feb 19, 2026 at 11:28=E2=80=AFPM Simon Rozman <simon.rozman@amebi=
s.si> wrote:
> >
> > Hi, Oded!
> >
> > First and foremost, thank you very much for taking time to look into
> > this and troubleshoot it.
> >
> > It was believed, that ReadULongAcquire() and WriteULongRelease() alone
> > provide atomic manipulation with Ring->Head on all modern platforms.
> > Hence, these calls were made outside the spinlock, to squeeze an extra
> > micrometer of performance.
> >
> > I could not directly apply your patch to the wintun repo, since it does
> > not follow our code style, commit message conventions and is not
> > Signed-off-by you.
> >
> > However, it would have been a terrible waste of your research if your
> > contribution wouldn't get into wintun, so I reworked your PR and applie=
d
> > it here:
> > https://git.zx2c4.com/wintun/commit/?id=3D607c181ea9fa0036d23598038e601=
9ad54db5ce4
> >
> > Please, stay tuned for an official WHQL-signed release.
> >
> > Lep pozdrav | Best regards,
> > Simon Rozman
> > Amebis, d. o. o., Kamnik
> >
> > On 19. 2. 2026 20.32, odedkatz wrote:
> > >      I observed that the Ring->Head was taken and manipulated later o=
n with just a `ReadULongAcquire` which isn't OK when 2 are trying to manipu=
late it later on based on the same received value.
> > > ---
> > >   driver/wintun.c | 11 ++++++-----
> > >   1 file changed, 6 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/driver/wintun.c b/driver/wintun.c
> > > index d1f3b9f..65cd97e 100644
> > > --- a/driver/wintun.c
> > > +++ b/driver/wintun.c
> > > @@ -284,13 +284,14 @@ TunSendNetBufferLists(
> > >       TUN_RING *Ring =3D Ctx->Device.Send.Ring;
> > >       ULONG RingCapacity =3D Ctx->Device.Send.Capacity;
> > >
> > > +    KLOCK_QUEUE_HANDLE LockHandle;
> > > +    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHand=
le);
> > >       /* Allocate space for packets in the ring. */
> > >       ULONG RingHead =3D ReadULongAcquire(&Ring->Head);
> > > -    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D Ring=
Capacity)
> > > +    if (Status =3D NDIS_STATUS_ADAPTER_NOT_READY, RingHead >=3D Ring=
Capacity) {
> > > +        KeReleaseInStackQueuedSpinLock(&LockHandle);
> > >           goto skipNbl;
> > > -
> > > -    KLOCK_QUEUE_HANDLE LockHandle;
> > > -    KeAcquireInStackQueuedSpinLock(&Ctx->Device.Send.Lock, &LockHand=
le);
> > > +    }
> > >
> > >       ULONG RingTail =3D Ctx->Device.Send.RingTail;
> > >       ASSERT(RingTail < RingCapacity);
> > > @@ -419,8 +420,8 @@ TunReturnNetBufferLists(NDIS_HANDLE MiniportAdapt=
erContext, PNET_BUFFER_LIST Net
> > >               Ctx->Device.Receive.ActiveNbls.Head =3D NET_BUFFER_LIST=
_NEXT_NBL_EX(CompletedNbl);
> > >               if (!Ctx->Device.Receive.ActiveNbls.Head)
> > >                   KeSetEvent(&Ctx->Device.Receive.ActiveNbls.Empty, I=
O_NO_INCREMENT, FALSE);
> > > -            KeReleaseInStackQueuedSpinLock(&LockHandle);
> > >               WriteULongRelease(&Ring->Head, TunNblGetOffset(Complete=
dNbl));
> > > +            KeReleaseInStackQueuedSpinLock(&LockHandle);
> > >               const MDL *TargetMdl =3D Ctx->Device.Receive.Mdl;
> > >               for (MDL *Mdl =3D NET_BUFFER_FIRST_MDL(NET_BUFFER_LIST_=
FIRST_NB(CompletedNbl)); Mdl; Mdl =3D Mdl->Next)
> > >               {
> >
