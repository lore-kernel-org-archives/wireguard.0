Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360E8C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Jun 2022 08:51:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 374a08ba;
	Wed, 1 Jun 2022 08:51:02 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 68373d65
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Jun 2022 08:51:01 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so5582554pjo.0
 for <wireguard@lists.zx2c4.com>; Wed, 01 Jun 2022 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XAI7KzME8y/drygF4KuP2OLhEV0qOpnKlPdJPUxTsfY=;
 b=i4v7ZBeQ8vNVq9A1IM2d6fcfrG05WEkLKzYKoqALe5bcN1e5O2mqMCLVHpBfGZpyQO
 NfCssYpWS1O4wmPjCJZpJPkTs17I+yoSNYyo5LZFCSCpofk4l3SvPrrGJbm1ULX77aE7
 lGEC7OJOrZ4HFcaoqBB13WbxPxYq5x7IGUjWuxAHzf99vqoqyA+OucXmd/32yHvOO5Ak
 We7SCOAzBed9dMECeULk7XSAj8aJY/2oSPpiFPZcUwOmfSfn4A9/AZRu09cTZ/eUjPsY
 +tTrouBcpGAC+gGVOAqm1kFgJ5S9gwH48cMv2LzLYXLHx6Vk16DMPrEhYcWStGMlY2j5
 jW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XAI7KzME8y/drygF4KuP2OLhEV0qOpnKlPdJPUxTsfY=;
 b=o2ubVNjiaZu3PfbVHuulMRQOd0IgOgKLmkz1v4x7rpaESbA9zBLON550HNsd41MCED
 sAqvr2CJo+/FJsXWiY+YBt5EVLuGUp7Am8d8mT6kQSc+2QG9jodtNc/ut86Wa07NkfVr
 T/Kpaa8HgzMRRIgET8ozqfoXH5mWvQ9pZMbt7O8wjRh6Lqu5PS29DnFBTvmSkGAQZw8P
 ECBVaSG52M+EIIBleqlQYh/WUqiU3sDzBecWLcoe3QMiAEt+UwTz2qm2X8ErLr0HpvTr
 z6lQhyZK1e6MyMimNl4IAGj0Pfzmc5SjToGhlhboO3BmfL9sWXfPNFrp/no7i2bCW1wt
 /GtA==
X-Gm-Message-State: AOAM533gk226VE3H0oQZ7t5xZ1DLA+cFfVVrPJAQlITaEAVf79Al5MIV
 77c0bwlrmpbO776EvRcTbwqGzk3Zm44wTfVnUWo=
X-Google-Smtp-Source: ABdhPJywlcTJW3POvl7nbO17zQR0HYLRT7EZ2L6eCQAuW07wX3efqSPK5vyIXtVt3Q3Fhf0XtI459Lgcj7YoQ2R1WiU=
X-Received: by 2002:a17:903:1cb:b0:165:1055:a56 with SMTP id
 e11-20020a17090301cb00b0016510550a56mr2773835plh.150.1654073459499; Wed, 01
 Jun 2022 01:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
In-Reply-To: <CABBZOs=CRGXaYmajx6GLJMU0sxZbda=qDgKsiB_KM_k3DygCJg@mail.gmail.com>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Wed, 1 Jun 2022 10:50:48 +0200
Message-ID: <CAA6-MF84eCwegH3UcQuqrL7YaCQULf5=KafQYZPVJWATEtfL0Q@mail.gmail.com>
Subject: Re: How to improve Wireguard speed?
To: Houman <houmie@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Den ons 1 juni 2022 kl 09:49 skrev Houman <houmie@gmail.com>:
> Hello,
> I'm compiling the latest stable Wireguard on Debian 11.
> git clone https://git.zx2c4.com/wireguard-tools
> make -C wireguard-tools/src -j$(nproc)
> sudo make -C wireguard-tools/src install
>
> However the speed is not that impressive.  I have a VPS with 4 vCores
> and 8 GB RAM on 1 Gbps network.  The VPS is located in London and so
> am I.
>
> With wireguard enabled I get 117 Mbps
> Without wireguard I get 506 Mbps
>
> That's a drop of 75%. What are the factors to improve the download rate?

That seems like very poor values, I would make two tests, one local to
the VPS and one test local to the other end (which you left out of the
description) and see which one is the limiting box. People (including
me) have easily gotten speeds at 1-2 gigabit on 10GE networked
computers and VPSes and several gigabits on loopbacks, so the fault is
not simply using wireguard.

If you check the results of the nightly builds for x86_64 at
https://www.wireguard.com/build-status/ you find several iperf3 runs
that end up over 2-3 Gbit/s when a box is talking "to itself" so it's
not the crypto or the tunnel that prevents you from filling up the
gigabit link. Perhaps the VPS isn't giving you a lot of cpu? Perhaps
the test reacts poorly to the lowered MTU for using (any) tunnel in
between?

-- 
May the most significant bit of your life be positive.
