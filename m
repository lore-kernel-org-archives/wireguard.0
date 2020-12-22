Return-Path: <SRS0=uYrD=F2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C32C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 19:23:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF1423130
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 22 Dec 2020 19:23:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF1423130
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efb1df02;
	Tue, 22 Dec 2020 19:14:19 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ca66eab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 22 Dec 2020 19:14:17 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id g185so3172146wmf.3
 for <wireguard@lists.zx2c4.com>; Tue, 22 Dec 2020 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=ttUipjchUDsoQWx58NHfsVIRxkmMokKxS1kBWZ1NmQg=;
 b=iqAVAMWfX2TOps7H5hCSp3S4iYnLW6bYTnsEJ/mgEfWv+xfixvOs6te2cpFjMhjs/F
 1kFr9d4L7UCQY/bAhD3bkQNeKiGxNYpYsy8hqglShPePyz+DzfoFNtb7VuxET7s9gWff
 a26y96DdkZ/sVYvBnIC+u4F/ctwd8pgbJqciTjcn0IKAY+KyVIku7FzwI8IKfinVXiSU
 rVnqklTTOsORzyS8w9PWoMwZZdpTpx+3jKbyRcAC+kRW8WLSIeXE32KZhd79tCVs3fT9
 ypQQ7OpFbl+DWeEAXi1axM6Z/iCW7XbipWrICOwYihN7ZUUf8TgVIzw9ybp838LxLPpt
 baDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=ttUipjchUDsoQWx58NHfsVIRxkmMokKxS1kBWZ1NmQg=;
 b=sHzf6QnYyx9+7R2ctkItRmliOsQD9Iv9OMk4E5Kz//EeU+qcssoIIMtDFCoLG3JJ/F
 CzLduJccDqgQsixdcU+4HlUxoI+kmYWmZ3rD/o7yI0mnvBlFjXB05NS5Sp7tXdzBhGuY
 xqPHBZl0XwMEmO1FfFAtyofVCL1q4XkaIuSpl0zMVbKy4ulfRpMl65FN72bL6k5H4zN2
 wf4n/1XkZEHE2vka/l4UQreic/LfrwfVG7PU/v8eOmMm17nh9glYLMmBFG7Se+SS/kPV
 bKelXcXql5rzOepe59Mg9q8gJruc6iIfmmIkY7jDd9YUGPEvDab1kovzLnyx0lGfySWY
 3leA==
X-Gm-Message-State: AOAM530SidBpT6lY8xSwKckbSd9duzjMbXzO6gEZM1uslEqCmA2oLGvg
 9YzF+ofbPxOqymsn1MrfXMFEt50mbKrUBV1V
X-Google-Smtp-Source: ABdhPJxOu7tHYiSrxQA8pNslK2B9hkOpE1z1HU+nQWsGRIy7kkUU6cthTId1UOadxDHvbypHPqm4gg==
X-Received: by 2002:a1c:a1c1:: with SMTP id k184mr5580301wme.101.1608665007447; 
 Tue, 22 Dec 2020 11:23:27 -0800 (PST)
Received: from [192.168.0.102] (85-238-93-111.pool.digikabel.hu.
 [85.238.93.111])
 by smtp.gmail.com with ESMTPSA id l7sm28781965wme.4.2020.12.22.11.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 11:23:26 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
Mime-Version: 1.0 (1.0)
Subject: Re: wg trunk (TM) traffic isolation: VRF vs netns
Date: Tue, 22 Dec 2020 20:23:25 +0100
Message-Id: <58C6C0BE-F073-459F-92C6-F37CA78F4E24@tomcsanyi.net>
References: <20201220192149.bojbghrxm6g3yq7q@p51>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <20201220192149.bojbghrxm6g3yq7q@p51>
To: jrun <darwinskernel@gmail.com>
X-Mailer: iPhone Mail (18B92)
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

Using different network ranges for different groups of people + applying cor=
rect iptables rules shall be a simple solution, utilizing a single WG interf=
ace. People will get a static IP assigned in their respective range, so they=
 are not allowed to use anything else as source address, so cannot circumven=
t iptables.

Cheers,
Domi

> 22.12.2020 d=C3=A1tummal, 16:36 id=C5=91pontban jrun <darwinskernel@gmail.=
com> =C3=ADrta:
>=20
> =EF=BB=BF
> hello,
>=20
> my use case is, if possible, is to provide vpn to friends and family and a=
lso
> peering with other wg nodes (work etc). this obviously needs traffic isola=
tion
> and i have though about it for a while but don't have definitive answer.
>=20
> 1. on way i thought of doing is to have a point-to-point (dedicated wg int=
erface
> for each user) solution.
>=20
> 2. the other is to group interfaces based on the category of users (think f=
riends
> vs family vs even work).
>=20
> they both probably need writing up something for set-up and tear-down each=
 of
> interfaces which should be fine but both would need a way of isolating tra=
ffic;
> either between indivitual user's interface or between group interfaces. th=
ere is
> also the question of ACL'ing the site-to-site traffic for each group and/o=
r
> user.
>=20
> for this i've looked into VRF and netns; this has been brought up before
> here and other place but i don't seem to be able to read the conclusion:
> https://lists.zx2c4.com/pipermail/wireguard/2017-September/001706.html
>=20
> from outside it looks like cumulus devs like their VRF, and wireguard devs=
 lean
> recommend using netns
>=20
> https://www.wireguard.com/netns/
>=20
> that^ link is not a solution for me but i can think of ways to use netns f=
or
> my case.
>=20
>=20
> thoughts?
>=20
> - jrun
