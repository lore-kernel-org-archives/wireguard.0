Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEEF6C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:44:48 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB81160F48
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:44:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB81160F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95fdc306;
	Wed, 22 Sep 2021 22:42:20 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [2607:f8b0:4864:20::102c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d8fe4632
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:42:16 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id r7so2561220pjo.3
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SD/k4RB5c9+e3rHO94Ou2StG9do7mpnjg7zKvmhKoB0=;
 b=dsUsvpXVoYavRCWs40dh4SgkkHVpw9foov3l5wE98N9i8SZKFpUcfYQe/GFiWK2rZO
 i96wao/MtRDYDKeHTTQte3qr4AtEXgPqa0m/wWLbcspFsiSwe44IR3dytSPAzs2zJLvM
 vKtFZdJAqAX8jOitqfVOAPo2gpOEgtHtLcrdskxM8uQnQnaYy8ZELMXqRDFNm4Uj/wIG
 ekBM0Mc6/WkLLPhxfdFsATyvGC/RxK1SwFdgv/mjWq8wXzgmpNcs+EL8A2sjvDW01AVC
 K3ieNIsakbpkbNcI0wjsW0z/3olTNOu7AmMrtgUPfuJ8J8hh8o4gEKP3DcVKmK2aeRiN
 r1HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=SD/k4RB5c9+e3rHO94Ou2StG9do7mpnjg7zKvmhKoB0=;
 b=NoTJOD9LAJDsy/HurWvt/HUYeRco+/pUtK7DdD6lAlht+ebvak8YOezlQYLhnfYymP
 dS/pW0Zo3jIyNM0GdTCogkDuCV6fgQHPg7cDmC8AbbpC9TE6avbUhV0FGMlOxLxsWaJ7
 OkMJbsGrBhr9ZRzuZgsyoFsIF9SYaMO6fOocXpwaEhKH8x/ifCoZcEI8qqY+sFCclxmW
 DZYwtYXLVpfgDzOPY4mNACFLBZg8w+SzVZAJjDVNknnHid8a9zn0bJstXKu0KhxxeFyD
 jC38fR4q5Xea565mC8doBPuKtMi5xBsahawddU9y2HNxHT5WI0KmzuTb7cYORGiI0SNs
 kLww==
X-Gm-Message-State: AOAM5323Rxm74Xs3CjTow5REIHLI0YXnFBwpAnsW43LW97G1yp7fJnSX
 JgkaxAFWxPbhVN4lS/C0lk4=
X-Google-Smtp-Source: ABdhPJwmQG7m6ck6HYzFmojOJyRLlxIkLSEbOiJEGE/cFvd8srO2veZPXrozWsn3wCow3KfeA2xotg==
X-Received: by 2002:a17:90a:a88b:: with SMTP id
 h11mr1602350pjq.44.1632350535144; 
 Wed, 22 Sep 2021 15:42:15 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id u9sm3855146pgp.83.2021.09.22.15.42.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 15:42:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
Date: Wed, 22 Sep 2021 15:42:14 -0700
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>,
 Roopesh Chander S <roop@roopc.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <98EE8BF1-3F88-49F1-BEB4-436143FAF294@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <381D3BFE-1437-40F1-B79B-DAF82DE4F7D8@gmail.com>
 <CAHmME9r0xXq8XYJshVEnx0q8Sim7wuJ8gjy=_EszYf4Z020_Fw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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

Hey Jason,

> On Sep 22, 2021, at 3:35 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Is this on a fresh 14->15 transition? Or had you already loaded the
> old version on 15?
>=20
> The row turns red when it can't open the keychain reference. I'm
> curious whether that's because it was already deleted stupidly by the
> old version of the app during the 14->15 transition, or whether it's
> still there, but the new version of the app on 15 is unable to load
> it.

  I already had loaded the old version after installing iOS 15, so it =
probably was deleted, which is consistent with the red row. =
Unfortunately I don=E2=80=99t have any other iOS device, only those two =
that were upgraded to iOS 15 and ran the old Wireguard version already.

> Also, what happens if you twiddle the iCloud keychain setting?

  The behaviour didn=E2=80=99t change, although it probably doesn=E2=80=99=
t mean anything given the above.

  Regards,

Miguel Arroz=
