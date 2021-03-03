Return-Path: <SRS0=MYpk=IB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052DCC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 12:04:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3E7601FA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  3 Mar 2021 12:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3E7601FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dresearch-fe.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65bea9a7;
	Wed, 3 Mar 2021 12:01:30 +0000 (UTC)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cb47e431
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 3 Mar 2021 12:01:28 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id m25so12632033oie.12
 for <wireguard@lists.zx2c4.com>; Wed, 03 Mar 2021 04:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ULCVPshbtMh8yfRW9eB/8Q1p83VUscpPYJYlhVxXff4=;
 b=RvjZPjqPiQmYcF/qthOmpd9O6fey+TLyWVD57J4ucri82ylW90ydAUHJ8PkYvQc8Za
 M7WUgsXdR+v9fFxxXQBO0A1v4PWQVK6G2bOVQbO39wKBAj9+gOJIVcNrFv/B8zmn63KT
 tY9d7f8QQfKuC8nYh3Tl0X1vpzHl9xAMOTVZkKO0BtyD1tDfmSoQ67ZM4Yq8bueoZymF
 o3rIkSNTUanoQ9ddEPqNnUbuxeKooFa97XtO28JGtH6IkSirY8ga+kEeblh2Xy0f5Zgf
 kDbbKV0ZgBRtrMJCkIj4laDXDbvsA+a2IyDoN5NGkt+gIhFDJhRcyac0ZCHyo1ANWJRa
 iwvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ULCVPshbtMh8yfRW9eB/8Q1p83VUscpPYJYlhVxXff4=;
 b=Vep8Acj7QSEuaAH+RvhgAiCdg22C/k2KB7AryMNOxIKvZfQaBXtk4YHCVVEz2Jbwak
 ZBAGJOWRgcMEess2e3mz8c1N6ZEazzWXC9ZT/FRDceLhpAsCyJ5kkXSKuk5Z5NLmfR6Y
 0LrGiuQQ95hPuatLpt/4/NF0eUe5ljZLOLQtKaAfSEkleB0SawC45gg2DS+swnNsXifY
 +NwILR8g9vDDaVgTWynIHrLel2DlQinRtjZ8IizNGt/mPgkM7YODZbd2tuidiXAUGFbF
 HvuEyH0OBfG37bwzFe0DE8ppQji7aHwQ1hq0d+JkyixvZZnoMhnaeWOvxYxl3fTS9mBK
 rtOA==
X-Gm-Message-State: AOAM531861AvYhOjb5aPYBtrqJ2R+jmjLYYzOEsUUE0t4NSYqXE9FYtu
 qXJIBEOqpy8fRYS41Or7XiHTXbA2qh2bkOwjrlhlfc57cOpskA==
X-Google-Smtp-Source: ABdhPJwKczDTKmKdLsmX8fR6l27AbYtkTXcyjfa4ZUmTOqRlH1eRjGpvRdq5EdvJFvmj1Fy4oWpBo6gwV6DQjs9jzNo=
X-Received: by 2002:a05:6808:56b:: with SMTP id
 j11mr6761557oig.159.1614772887202; 
 Wed, 03 Mar 2021 04:01:27 -0800 (PST)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
In-Reply-To: <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
From: Heiko Kendziorra <kendziorra@dresearch-fe.de>
Date: Wed, 3 Mar 2021 13:01:16 +0100
Message-ID: <CAA4ESQ25R2RDo9Pr5z+-i8+i-0_d_aGGJb0At+4ba0n1=cv0aQ@mail.gmail.com>
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Peter Whisker <peter.whisker@gmail.com>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Jakson,
your hint  helped for my Problem:
https://lists.zx2c4.com/pipermail/wireguard/2021-February/006431.html

Thanks a lot!

Am Mi., 3. M=C3=A4rz 2021 um 11:59 Uhr schrieb Jason A. Donenfeld <Jason@zx=
2c4.com>:
>
> Hey Peter,
>
> I had a strange idea for how to fix this without requiring
> recompilation or removal of that code.
>
> 1) Enable DangerousScriptExecution:
> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklms=
oftwarewireguarddangerousscriptexecution
>
> 2) Add a PostUp line to your [Interface] section:
>
> PostUp =3D wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
>
> 3) Try it and tell me if it works?
>
> Regards,
> Jason



--=20
Mit freundlichen Gr=C3=BC=C3=9Fen =E2=80=A2 With best regards
Heiko Kendziorra
---------------------------------------------------------------------------=
--------
Heiko Kendziorra
Softwareentwicklung =E2=80=A2 Software Development

DResearch Fahrzeugelektronik GmbH
Tor 2, Aufgang R (R03.020)
Wolfener Stra=C3=9Fe 36
12681 Berlin

Phone: +49 (30) 515 932 - 265
Fax:     +49 (30) 515 932 - 77

Mail:  kendziorra@dresearch-fe.de
Web: www.dresearch-fe.de

General Management  =E2=80=A2 Gesch=C3=A4ftsf=C3=BChrung: Dr. Michael Weber=
, Marc-Oliver Brammann
Amtsgericht Berlin Charlottenburg; HRB 130120; Ust.-IDNr. DE273952058

Kunden Support/Customer support:
Mail: support@dresearch-fe.de
Hotline +49 (30) 515 932 112, Mo. - Do. 10:00 Uhr - 16:00 Uhr,
Freitags von 10:00 bis 13:00 Uhr
