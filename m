Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF74EC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:37:14 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5682610A0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:37:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5682610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7db9ab1;
	Wed, 22 Sep 2021 22:31:41 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fca25e78
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:31:37 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id dw14so3126839pjb.1
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jqgTg0VwPaIrOqH8Izg00oD21Pm97APtedQMwhmfyaM=;
 b=naq1ObPXXlxWdV9Aa8W5zZleNPr1/Op4IX5Oe/kOgjt+QMEHB0/EfOZDDPhcSqGbcB
 AAKazeiOnRwPgPWcfIbC2GxTKQSBWxO/xpGFiWoc3bvhxIBalQY6gCOVys+OzHKVIyIO
 Awg4wMwyfieDq2Tjuu9/unCF3swTY/VhKOVxP05PYKQpcjxq/83himvWTuJgCCZdWe57
 K+6tUIL9gkSgB84E+MspE6v7OXjZjcW/zsUcFsQN3ybHTAwdqZGofsoKgE6FXnoJOTYI
 GlEdEYoW2/yU2gLZcEaPG2n+GT4P7GyKdAqMFP+9BU0sb07wEwbhZl75b7h1bri/rvIe
 +WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=jqgTg0VwPaIrOqH8Izg00oD21Pm97APtedQMwhmfyaM=;
 b=yOehRC0WN6YttC2dvbxg/8G0xvyH2mSIUHvYF3k9nKOeit2/8mXVmBKq//tDdjWSwC
 p/sX0pV7u66TunK3WWNN+Uzl8okKZ3GI89uHpJ9g2aw9AUNiMH/j+SDPwmbC7ECW98IQ
 lE+8iyKmYV+vtEiz+qqeLX8gJvUCxaMUfShehnv5G8IhJ9cw53sWpcHIOym6zhaeqCEh
 lb4aYBWNl0mu0pKgwzWR4fXJt8k797HpFWm4Nm0XTMa7DZDuT7ncf6bEwbmwBAZcPM7+
 oah2bTirI3Tzlhwv/2vr1QisXBWEx9wRkw1P3R7f9ERr053ZdsqhQXtMnHm3yjf9Zr4g
 uoeA==
X-Gm-Message-State: AOAM531SAcEsWIsIVUjGNf4Qu/PzUujyLaE6ShWh/bq4U568AhCePDOf
 cXR5KeexxR7lPbHJJlr1YiRU9mZNBgE=
X-Google-Smtp-Source: ABdhPJz1OslhUdrR1Uy6SnfC2oJigh5Jvayatz2FgsBn6jytzvB8D1uXvLmSf0xRc1pSgwBd2E5R2A==
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr1468888pju.227.1632349896102; 
 Wed, 22 Sep 2021 15:31:36 -0700 (PDT)
Received: from smtpclient.apple (216-19-179-128.dyn.novuscom.net.
 [216.19.179.128])
 by smtp.gmail.com with ESMTPSA id b142sm3502469pfb.17.2021.09.22.15.31.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Sep 2021 15:31:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
From: Miguel Arroz <miguel.arroz@gmail.com>
In-Reply-To: <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
Date: Wed, 22 Sep 2021 15:31:35 -0700
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, Anatoli <me@anatoli.ws>,
 Roopesh Chander S <roop@roopc.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <381D3BFE-1437-40F1-B79B-DAF82DE4F7D8@gmail.com>
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
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

Hi Jason,

  After the update, when I launch the app on the iPad, the row in the =
tunnel list has a red background, and the first time I launched it, the =
switch started switching very quickly between connected and =
disconnected. Also, nothing at all shows on the right side when I click =
it (not even the empty sections that were appearing before, it=E2=80=99s =
just a blank view). The tunnel also got disconnected when I launched the =
app, and is not connecting any more.

  On the iPhone (where I had already recreated the tunnel), also after =
the update, everything seems fine.

  Regards,

Miguel Arroz


> On Sep 22, 2021, at 3:15 PM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>=20
> Hi again,
>=20
> A new app has been released for both iOS and macOS. Please test it out
> and let me know how it goes.
>=20
> Jason

