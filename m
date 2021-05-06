Return-Path: <SRS0=FUvr=KB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C7CC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 15:59:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A399610E7
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 May 2021 15:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A399610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=manojav.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6fd0e691;
	Thu, 6 May 2021 15:59:53 +0000 (UTC)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4fb3fac2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 6 May 2021 15:59:52 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id u20so7670657lja.13
 for <wireguard@lists.zx2c4.com>; Thu, 06 May 2021 08:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manojav.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TwTo/IpRQhjUyEVGs/D6fQxMIf1Fw4G8vhqnwl+sBYU=;
 b=a+S5RRKS/MDTHppGp+Z7QXUjA2N3sQ8O+DdbVwSfp/x42PoR6T6XwmLbM3I7UCqFzz
 dNdzdmQpPRsV9+ORjQaMASo4rJj59eJ+kw3GMsTJp/PQCfyDZm5fU3KLbXz3Mo7emPkg
 QeAq8OAOZCKfWq4ZvwLCIelydt0lFv6ZKTJ8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TwTo/IpRQhjUyEVGs/D6fQxMIf1Fw4G8vhqnwl+sBYU=;
 b=BRi+W72zDeS0BHbGpuuJZQbxd+ngAtgpmnRIbbDd1KkqFrhQ1MJmbyqyw0qpjV3Zoh
 DIJ1fUg2CxyWTKfbyMXVZoYghjJu/w44TzCL/x8v5t06xBwJHjJjaqRiyBTTZD4NRU7k
 AiviVagESgl6UiG3aJXwcnog6Ql/yiD/0qI4Jr5UhSb3AfooE6BRzvF5f9KcZ7gt5H1P
 7Qzy34VtVpi5MsoX8dbfZk3D4PUOk7B7xy5qEY2tWhsgVTBMOPWJ8qYjP/6mqjgfF+yZ
 M8vFS9GI/NWGdCu4WmJbSr3tNWJ/tC6UpJ5P4cM8q4PFv7soxY4bTLXo7aADNemHnqqI
 K6nQ==
X-Gm-Message-State: AOAM530OB49b1koXnSioCVWUeEe0SruPD0WYXcSUOEaJBSbryzBxCK2Q
 tSaTNhLhZ9cVGULLMFDqHwhn/RO4MJdhB6MiOAFDQA==
X-Google-Smtp-Source: ABdhPJwdgMenyOWbWCnxcOMdnG9OxxzPiaO2ZLVeivzJIhSeWteGHJjUFUBsS2Lrue48tm0B8NWbAiS44tIKzAPRGxA=
X-Received: by 2002:a2e:8899:: with SMTP id k25mr3947481lji.449.1620316791442; 
 Thu, 06 May 2021 08:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAGaAVNVPhaXnRyS8TaNddNEGJqGBcW=5cWyb1c=vV0yeOovwqQ@mail.gmail.com>
 <CAHmME9o+aSX5f_KZ9UKWNdKUwpjnMU3iKn1e8bBdTvsDCqfceg@mail.gmail.com>
 <CAHmME9pVOKrLPqD-g1LTe-62_0boi=jQ16WFe6-7deCUJPgyMQ@mail.gmail.com>
 <CAGaAVNWDMLAP3FdBPUh33iyVpMSBLTzVEH8_LGXKsS8ebzwjQA@mail.gmail.com>
 <CAHmME9rLSSaaREtMPh9OYuO-oe363KF-VJcpQQHr8=54oDiAiA@mail.gmail.com>
 <CAGaAVNUyrQEppHMmTZe_WyohDPEopyupB2iaTj45peeq5qU9vg@mail.gmail.com>
 <CAGaAVNUQ1+R7MtUYm2Not1J+pWkkKxQw384RYxAkjCsAuiigFg@mail.gmail.com>
 <CAHmME9rMv2PDQL-SWUX0x6QENSMgmonooS8vvdjerBDsmXQSDQ@mail.gmail.com>
 <CAGaAVNUMaRjvpPXqJaSm7JNq=PoxzfTkXgftvXrCVOkkNx0NUw@mail.gmail.com>
 <CAHmME9oTyAAbEmu1-7Mv-tx6UxnXTa3-i6=+fro84U286h+RMg@mail.gmail.com>
 <CAGaAVNXqqvdxWOO7Yr4Zrjh_Z-O8kCkbGJguhs=bD04CA=n_eQ@mail.gmail.com>
 <CAHmME9pfFUrzAcT26OUnWPvTUgD=PtNc2fV6bz6+N1rOYiyCVg@mail.gmail.com>
In-Reply-To: <CAHmME9pfFUrzAcT26OUnWPvTUgD=PtNc2fV6bz6+N1rOYiyCVg@mail.gmail.com>
From: Manojav Sridhar <manojav@manojav.com>
Date: Thu, 6 May 2021 11:59:25 -0400
Message-ID: <CAGaAVNUgdUmqR0wzh0qo0bwj_4kquhegAzQ5sum4_VMRzpbxsw@mail.gmail.com>
Subject: Re: kp's and mem corruption?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Christian McDonald <rcmcdonald91@gmail.com>
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

Jason,

With some help I was able to get the latest if_wg.ko built. I have
been running the triggering bash script for a while now and not
managed to trigger it. However prior to installing the latest snapshot
it happened one more my on firewall (just provided as FYI) in the
middle of the night as part of normal usage.

Thanks for jumping on this! looking solid again!
Manoj

On Thu, May 6, 2021 at 8:10 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Manojav,
>
> 0.0.20210503 is now in ports, which contains these fixes.
>
> Jason
