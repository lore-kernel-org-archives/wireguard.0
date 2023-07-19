Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F2EB64DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 19 Jul 2023 07:18:33 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 272bd23a;
	Wed, 19 Jul 2023 07:18:31 +0000 (UTC)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7be04e3e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jul 2023 07:18:29 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f14865fcc0so6997e87.0
 for <wireguard@lists.zx2c4.com>; Wed, 19 Jul 2023 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689751108; x=1692343108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pVX2sPDw+DWb/GS2tOcFuCZloAr9HeWMoOE7zgzcjAc=;
 b=46aG0lZeboqdGiAS3eFFsz1BdFW5SyG3PcURkaVy++rO2QUmH/5GA7Ds3UCheEDPie
 ta0nTEan440qy9SUXufv+C507Rv8Zy46oI7FMjICPvF3corilTesdXYmhGovu3mo5X0w
 gAiXp7a5HZJR4Z3U0eNy6w5ATufEJgZdgXaTxk+U6Hi08trqMkoePhYmQxbP1RkQgzw9
 t6KmjzTwVjUdZaIikUufDiQ4O2cd8R1eAL36Ck5N710TPh96eNsCZeYCuAyi2AVq6gjD
 IK8/lhB1J117tQfoKq677dzObHwG7aYPdvuqPoB6xoBi3N15CLZbUear1wma6jLbCQ/u
 JPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689751108; x=1692343108;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pVX2sPDw+DWb/GS2tOcFuCZloAr9HeWMoOE7zgzcjAc=;
 b=BvrWPXBq21eEAYim6c0B5ECj5Ha47yayoUhaIFcRZZYkkFTVRyZOQAl5HXSjFcdgDg
 fGfXRLhlJtuT66pQFg8BeMJr5jwLQ2mYXxTC8Rjf/wsYi2eD/Dcj93STOODFmMYgWq8D
 QqCnYrfP7v1q0qqKULaTHg4FAq9zHKzAS8cwldJp2xXn2bzkmcvH3pYJ6O2lZX/aFTzs
 XoLbofsoGTfvs0Fpt086hcIWYx93DHoboGlocrg1Bxu1sCMrgoj/5NtuvZ8OTlzrfFSc
 WHMspGtQYhUnQEeDJJDJwbIF2WFxe5KGD8EylnYyQ4B4E7YJ80AmFrLC2cHt/O3wQX1c
 H1zw==
X-Gm-Message-State: ABy/qLZsy4jIXJkop/+gqSLn0z9I7KzfL0wi8TT+QAr91BRUxZVOZT5s
 DgqS4Kx22VN8U3WhegBc4TdsprPp7fXqiMgBw+3EhjrPZeAgrlhq/rk=
X-Google-Smtp-Source: APBJJlHS5nTB31lrBs2t8tPY5lYDwtRsYt79WF3JVNrVSr1cjUl5chfsffOJ6UvHWTqxyKHiJyGrGgkuKbmpBZGZfOc=
X-Received: by 2002:a19:5506:0:b0:4f7:5f7d:2f9b with SMTP id
 n6-20020a195506000000b004f75f7d2f9bmr139829lfe.1.1689751107740; Wed, 19 Jul
 2023 00:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230719091342.789107a9@parrot>
In-Reply-To: <20230719091342.789107a9@parrot>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 19 Jul 2023 09:18:14 +0200
Message-ID: <CACT4Y+bsdEDukXi02RKWuEa-BYajP=4w5B-7KEUqf--HOVPVjg@mail.gmail.com>
Subject: Fwd: WireGuard Mailling List
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?UTF-8?B?TWFyZWsgS8O8dGhl?= <m.k@mk16.de>
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

Hi,

I was asked to forward this to the list because the author has
problems reaching it.
It looks legit:

---------- Forwarded message ---------
From: Marek K=C3=BCthe <m.k@mk16.de>

Hello,

the WireGuard logo is a Chinese dragon. Does he/she have a name? What
could you call him/her? The background is that I want to make a mod for
[UnCiv](https://github.com/yairm210/Unciv) and would like to incorporate
there various motifs of computer life - among others, the dragon of
WireGuard. Therefore he/she needs - at least for my purposes - a name.
What would you call it?

--
Marek K=C3=BCthe
m.k@mk16.de
er/ihm he/him
