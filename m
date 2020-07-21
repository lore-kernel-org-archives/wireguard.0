Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE97C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:43:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DBA20717
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 12:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uf1bDhvx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DBA20717
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f1e7a6d;
	Tue, 21 Jul 2020 12:20:28 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 98a58144
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:20:25 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a89c6a0e
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=yLPKMLfCsx7x
 fJqAXiSuW6uPtIk=; b=uf1bDhvxgeKOLpitPhSbvonTKtL9h82AlC/iHm1yl9Gc
 gk8FO+bNMmpP5eJfAIZSLhJRxLNCkC4fnARpb5U9BkikoUgnTpgZbNkdkK9imzdZ
 qnJ3NldEqbSTS7XBOSKPfLECEn2K+npQLKQow2xn1+Jght3Lcqw+cebj53ISuclC
 YGTos1z88VcnQbYnCBBzMmLdiTKYoF+sjqsQQoVyWaV5iSV4IR3NtCB0rnNNbph5
 G0Wq0dkq2aNcCU7394BvZ0b0aXJtonPIFHS84JdNRzHM1AJqzRscTHhG4JcPUBlu
 vz1RiUhhYr91vrVkSPSRzzvlfv2M8Z2icaeppjG4xg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bd713146
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 12:20:23 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id l1so21175200ioh.5
 for <wireguard@lists.zx2c4.com>; Tue, 21 Jul 2020 05:42:55 -0700 (PDT)
X-Gm-Message-State: AOAM533VRLXrGaLBHOvH/+aQ8KKlJORUObLMX5zp9m8s33cY7f14lEbO
 nCF0CuUmIwZV6xYqzDDwajKhsGcI844tNX86ccg=
X-Google-Smtp-Source: ABdhPJzPgvmR6Gyqt5iMtk/Au4y0NQ2A49fUV5m3YpPi3dVboRvjDrDbzXqjgGZUtcVWBBYFtpI0pW779oSVQJvby9s=
X-Received: by 2002:a6b:5813:: with SMTP id m19mr27488507iob.29.1595335374912; 
 Tue, 21 Jul 2020 05:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <065501d65ea2$3e652fe0$bb2f8fa0$@lindenberg.one>
 <CAHmME9qr_ZPyhK1V5ENDdNtfk0cn0pb=Ne2T_FEYwaFHtuwWCw@mail.gmail.com>
 <067601d65ea7$1b71a3b0$5254eb10$@lindenberg.one>
 <20200720201456.6dfc12df@natsu>
In-Reply-To: <20200720201456.6dfc12df@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Jul 2020 14:42:44 +0200
X-Gmail-Original-Message-ID: <CAHmME9pgC=NKY4-m659PwAO=xov1MfRjvy5-MAdWSJ6A+32TXw@mail.gmail.com>
Message-ID: <CAHmME9pgC=NKY4-m659PwAO=xov1MfRjvy5-MAdWSJ6A+32TXw@mail.gmail.com>
Subject: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
To: Roman Mamedov <rm@romanrm.net>
Cc: Joachim Lindenberg <wireguard@lindenberg.one>, 
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

On Mon, Jul 20, 2020 at 5:15 PM Roman Mamedov <rm@romanrm.net> wrote:
>
> On Mon, 20 Jul 2020 17:04:46 +0200
> <wireguard@lindenberg.one> wrote:
>
> > Yes, it is up to date.
> > Joachim
> >
> > -----Urspr=C3=BCngliche Nachricht-----
> > Von: Jason A. Donenfeld <Jason@zx2c4.com>
> > Gesendet: Monday, 20 July 2020 16:49
> > An: Joachim Lindenberg <wireguard@lindenberg.one>
> > Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
> > Betreff: Re: Wireguard on Ubuntu 18.04.4 (LTS)?
> >
> > Is your system fully up to date? `apt update && apt upgrade`?
>
> Seems like it's available only starting from Ubuntu 19.10:
> https://packages.ubuntu.com/search?keywords=3Dwireguard&searchon=3Dnames&=
suite=3Dall&section=3Dall

All set now:
https://packages.ubuntu.com/bionic-updates/wireguard
