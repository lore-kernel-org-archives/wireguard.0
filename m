Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A168C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 23:51:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E606C2075E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 23:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="y9EHX/XH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E606C2075E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3399d4c;
	Thu, 18 Jun 2020 23:32:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 75a665e6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:31:58 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 433873ee
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=NcZtDTjzBfI4iB98dh7sHbema0s=; b=y9EHX/
 XHCXEaI2tQP9detQg1UXJvMdd5LMnfxUlKYQC3t+R/PB6htTVNzFYqn5fcRA3kKE
 v2igPuVFYx0QoY0D9j3Pw7Vzn9gXhfrFknO2cwGWLgdreIwx99JtU0cz6+pFSwvP
 wzV5qEnwfY+poDjCGqUh/LNprH1q2Ob/2aP1SPideIOZUTffT5XBWZ+10QQq/2+q
 73tvnrRUijJetpLAzRBcBRrDOpNccAGKK+P6fBtXxfk7I1CwyuueMCpuZygpUeBN
 8SDAR2Go7mkIyW2Qar+iccu+o6fXQI6wFWFa1mvarZqGB+zlbdveHL6G7kIfhNII
 nYyf4od7ODv17SWg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67a4691d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 23:31:57 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id i25so9370391iog.0
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jun 2020 16:50:14 -0700 (PDT)
X-Gm-Message-State: AOAM532y1FTgbHwduE77l3Ys/FjhuzeWPix81Z47x13O0vTZBq5Fk6Hb
 dN7+XUATecGVctXiV9YTs2AFzUs4PiFbUw5JAOc=
X-Google-Smtp-Source: ABdhPJyKOuhtQ7hrfmaPzESzGSUlMk2k96LQMLAzN9djbqz4zOUMzlkXNP7YJ7eCRqB0YkINEeWqXRdFc05rSAVipmo=
X-Received: by 2002:a6b:4e1a:: with SMTP id c26mr1364962iob.25.1592524213619; 
 Thu, 18 Jun 2020 16:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <CALjTZvbpu1Lw0j9dtXZPmVS+i-OnopUo+zuqtoQLnABQGw-SqQ@mail.gmail.com>
 <CAHmME9r3nPwmUoYYrj0PnUStd1ACSmdFAO4Qv2cZtmiLspOW1g@mail.gmail.com>
 <CALjTZvbtjVwpyV+AMX4htssTbwTHV45mQeokUr952D_GbtFPvw@mail.gmail.com>
 <CALjTZvZRerzWqaqhY2U=m44n5taLEsY99uEt2=ZNCe27=LYbLA@mail.gmail.com>
 <CAHmME9otC1mOqR2tLB55BVQQpNPvCMUGa1E4jfMYYXNp6_31BA@mail.gmail.com>
 <CALjTZvZ4wqZZ7_Fk-YHaxT9uuWnS4n9dLm4ZXSy1UM3riv+NuQ@mail.gmail.com>
 <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
In-Reply-To: <CAHmME9qWrBTCsBr7s6oLD0zuBMzZUD2OV3s-tgDwV0W7bb9Utw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jun 2020 17:50:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9ozm7KiT3rkDpAF=1p_g7QU6-6fxncZB1S4tfm5v2DGqQ@mail.gmail.com>
Message-ID: <CAHmME9ozm7KiT3rkDpAF=1p_g7QU6-6fxncZB1S4tfm5v2DGqQ@mail.gmail.com>
Subject: Re: wireguard: unknown relocation: 102 [ARMv7 Thumb-2]
To: Rui Salvaterra <rsalvaterra@gmail.com>
Cc: OpenWrt Development List <openwrt-devel@lists.openwrt.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hey Rui,

I fixed it! It turned out to be caused by -fvisibility=hidden undoing
the effect of the binutils fix from a while back. Here's the patch
that makes the problem go away:

https://git.zx2c4.com/wireguard-linux-compat/commit/?id=178cdfffb99f2fd6fb4a5bfd2f9319461d93f53b

This will be in the next compat release.

Jason
