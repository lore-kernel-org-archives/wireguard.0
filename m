Return-Path: <SRS0=T23V=JZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9C8C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 21:30:32 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7F5961441
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 21:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7F5961441
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e401234;
	Wed, 28 Apr 2021 21:30:29 +0000 (UTC)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b600b299
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Apr 2021 21:30:28 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h10so76028459edt.13
 for <wireguard@lists.zx2c4.com>; Wed, 28 Apr 2021 14:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PV9KfvM4ssVCmaok/Q5CShSjAa97vwXmn74igysuK9w=;
 b=qweYaYx3pNG8Q1ywMzfGIcdgnZ08OFsy9h9JFB0JnvMlbmAeCyd5MX+CNVu8N3Nf5D
 eCv6ASwAR1b8LLLfqmLFKlBS8tf45JTSaDhf+XQC5fdogapbjUtMsu+MNCxNngrVcAta
 373hpzvn7uTn96uOuzHz9vEdi8cwPmaxniDtyN1EcANOrH0Jr1ChJh54dOzKkXlsnIxY
 aAdUGEVLKv6Kwz6gsWw4awEQe48jcbsze18E6EDeb+aPL7Ctjp02bgyAdkhLNAHgU+h+
 GuIbmMdVqPFupk49OdTUGpo1COyXMvRjDELrCbLsBZtjsOsqPyroeamQZxRY1tLxhjmt
 9VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PV9KfvM4ssVCmaok/Q5CShSjAa97vwXmn74igysuK9w=;
 b=dykeOnmtUNjMf8wRK8tEkFBfRSDy+7g/T7VScZtT/4BlVcgk1XKGZtzQCP5MDd8S5A
 kVDUeWgbpqubszcxdkKRk6rewYMwDwOsgkkIxLJ/opXvCdc8Y2A9+f90MUEFhsSE6JiN
 Mrq/N4BnHYpwan7Ksv/eafO0upTfJQzpcezUu+m8iYiFmQ/q00AMsfu7qeVDf/KG22X/
 VAbaSlRfigqji0EjVe24By+NVGpe1sbZfTqAnx788ae/PkaiTnew7Jy8vznuoHyRXUO+
 5Y+/khRVCUSADRhcEWT8bNuBCWTjaAqWcfEClOHYnZEuGG/VRAbSUgeTwH2any7u1ooX
 7fWA==
X-Gm-Message-State: AOAM533UXU4vJBThtmEPviXsP5RY+MkYMTjJF//aOiQWq8u5aJupF+ZY
 B+d2hEFi+P6dWMoK57M3aM5aQaCDbPxGIyGKDys=
X-Google-Smtp-Source: ABdhPJwLmxO4SQuEnKjnAAg4tHyuKYWOdP8Bor/yA8q3OP+EB5DUC22h2Ph7bKGDB5nE7ErJqjKTF4MIVV5bEk/iI9A=
X-Received: by 2002:a05:6402:708:: with SMTP id
 w8mr11918101edx.49.1619645427622; 
 Wed, 28 Apr 2021 14:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAOSAzkKgZS_-tRkbo10gZ3CrTfNPfBUuBUwY4bMY+W0Ynj_pNg@mail.gmail.com>
 <CAOSAzkJJiv6uqVgdPqCYpGqabti3bmDrBU1gAX8Oy7ZqikuYNw@mail.gmail.com>
 <8720b8df1b0d4226a4c93d056c9b0b97@rozman.si>
In-Reply-To: <8720b8df1b0d4226a4c93d056c9b0b97@rozman.si>
From: Johnathan Clarke <johnathanclarke@gmail.com>
Date: Thu, 29 Apr 2021 07:29:59 +1000
Message-ID: <CAOSAzkJKXpQiqC2KRotUjcTQWx1En2pM7Q4di=4=d8rccCk1Rw@mail.gmail.com>
Subject: Re: Error when connecting from windows client
To: Simon Rozman <simon@rozman.si>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

Hi Simon

the setupapi.dev.log

>>>  [Delete Device - ROOT\NET\0000]
>>>  Section start 2021/04/28 15:52:49.399
      cmd: "C:\Program Files\WireGuard\wireguard.exe" /tunnelservice
"C:\Program Files\WireGuard\Data\Configurations\Home.conf.dpapi"
     dvi: Query-and-Remove succeeded
<<<  Section end 2021/04/28 15:52:49.531
<<<  [Exit status: SUCCESS]


>>>  [Configure Driver Package - c:\windows\system32\driverstore\filereposi=
tory\wintun.inf_amd64_65b8959a2d220b06\wintun.inf]
>>>  Section start 2021/04/29 07:27:04.869
      cmd: "C:\Program Files\WireGuard\wireguard.exe" /tunnelservice
"C:\Program Files\WireGuard\Data\Configurations\Home.conf.dpapi"
     sto: Source Filter  =3D Wintun.Install
     sto: Target Filter  =3D ROOT\NET\0000
     inf: Class GUID     =3D {4d36e972-e325-11ce-bfc1-08002be10318}
     inf: Class Options  =3D Configurable
     inf: {Configure Driver: Wintun Userspace Tunnel}
     inf:      Section Name =3D Wintun.Install
     inf:      {Configure Device: ROOT\NET\0000}
     inf:      {Configure Device: exit(0x00000000)}
     inf: {Configure Driver: exit(0x00000000)}
<<<  Section end 2021/04/29 07:27:04.917
<<<  [Exit status: SUCCESS]


>>>  [Restart Device - ROOT\NET\0000]
>>>  Section start 2021/04/29 07:27:04.926
      cmd: "C:\Program Files\WireGuard\wireguard.exe" /tunnelservice
"C:\Program Files\WireGuard\Data\Configurations\Home.conf.dpapi"
     dvi: Device Status: 0x01802001
     dvi: Install Device: Starting device 'ROOT\NET\0000'. 07:27:04.932
     dvi: Install Device: Starting device completed. 07:27:04.946
!    dvi: Device pending start: Device has problem: 0x38
(CM_PROB_NEED_CLASS_CONFIG), problem status: 0x00000000.
<<<  Section end 2021/04/29 07:27:04.959
<<<  [Exit status: SUCCESS]


>>>  [Delete Device - ROOT\NET\0000]
>>>  Section start 2021/04/29 07:27:05.018
      cmd: "C:\Program Files\WireGuard\wireguard.exe" /tunnelservice
"C:\Program Files\WireGuard\Data\Configurations\Home.conf.dpapi"
     dvi: Query-and-Remove succeeded
<<<  Section end 2021/04/29 07:27:05.093
<<<  [Exit status: SUCCESS]

On Tue, Apr 27, 2021 at 7:54 PM Simon Rozman <simon@rozman.si> wrote:
>
> Hi,
>
> > 2021-04-26 14:45:33.382398: [TUN] [Home] Creating Wintun interface
> > 2021-04-26 14:45:33.519928: [TUN] [Home] [Wintun] CreateAdapter:
> > Creating adapter
> > 2021-04-26 14:45:33.828328: [TUN] [Home] [Wintun] SelectDriver: Using
> > existing driver 0.10
> > 2021-04-26 14:45:34.289159: [TUN] [Home] [Wintun] CreateAdapter:
> > Failed to setup adapter (status: 0x0): The operation completed
> > successfully. (Code 0x00000000)
>
> Your log indicates that the adapter device was created, but has a problem=
 code with a STATUS_SUCCESS problem status. I have reintroduced the problem=
 code check in https://git.zx2c4.com/wintun/commit/?id=3D2881164bff0e819f6b=
0b6d5fc5d3a185ecb47457. This should evaluate the Wintun adapter state with =
better precision.
>
> Meanwhile, can you please examine your C:\Windows\INF\setupapi.dev.log fi=
le for clues. (Note that a 0x1f/0xc0000495 problem code/status is normal wh=
en Wintun adapter is created early at boot. Hence the STATUS_PNP_DEVICE_CON=
FIGURATION_PENDING check in the code.)
>
> Regards, Simon



--=20
--Johnathan Clarke
--  --

Please consider something when reading this message. It was handwritten and
sent from a black computer. No iPhone. No iTypos. No iApologize.

DISCLAIMER: This email could contain confidential information, is for
the intended recipient only and blah blah blah.. If you are not the
intended recipient, sorry. Email transmissions cannot be error-free or
guaranteed to be delivered (correctly) and are constantly intercepted,
corrupted, destroyed, arrive late or incomplete and often contain
viruses. The sender does not accept any liability for damage as a
result of the transmission of this e-mail. Any views or opinions
expressed in this email are solely those of someone else and do not
represent anyone else's. Void where prohibited by law or Common Sense.
WARNING: Not following instructions as laid out in this disclaimer is
unlikely to result in legal action or otherwise. Thankyou Olger
