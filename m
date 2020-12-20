Return-Path: <SRS0=TH/E=FY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F2CC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 22:54:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F3C22CBB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 20 Dec 2020 22:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F3C22CBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec8e7bc8;
	Sun, 20 Dec 2020 22:45:44 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id aae21478
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 20 Dec 2020 22:45:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g20so10976302ejb.1
 for <wireguard@lists.zx2c4.com>; Sun, 20 Dec 2020 14:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CkUdFQL9wTy5eVddbtblAdpoMySIjvJH2/4TCpnWDYw=;
 b=mlrRLK1HsyUYpmtKQO5hZ7jK9l/ohEobbUKnT9ywxExc8wWj5g9+vOaBI9JKGh/qV3
 n1faYGPEGUMsGxTdXNNlGtWpTE/7FqFXd5pE6JTxL76nSG84w6Q/jeqYqpyaAzk/olSt
 Uig1Lew8K4M9jhdrpmEhnQOKavaemkC351DW4GJ/bXtwmuF20bmKtneF4LrZ5bseFD5N
 HVB2TjwOQFJo1K4TF7uBBSX7A4dbYh1IQXCX53Xmu1JiUJ6R4IiuEJAqzu2ifeF1ljwc
 qaWagGIGV/eApESGUprlAlFrNLSfuMoMLKqOiaU+qng9ZgldDL9nRuC9j2ngmuaGm73a
 WFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CkUdFQL9wTy5eVddbtblAdpoMySIjvJH2/4TCpnWDYw=;
 b=Zxhw2EHx7S6X2ZHWHJtWqwJTmwyHbLbd3M0JzSLy3eGtQOOyrC/tZYYUbnrEQxQSI1
 qA0Y4PwRrShXoWjIOAR18ghyBE4RMpYI44CUPTMnAKpSmmjQiFB6rOC76viocL3aN0cK
 vT++2Jm7vcQKkK8bXHKRdz3RTief6D7iK3cUjJ3sWCjxhDnOvC892nv5faw6zQOD1BMh
 3BJhXVBs1lZ/JcV1cGTrVaA4rfsDKQTBUPpgtjwd8H1N2HSVaiF/Xjfn86CizqOP9fFx
 /OuGQNqCn30PHXZ7gxGF+SahdFWs2vOP/4T+q+v/H5b2btBmiiY0GV/goLq2l7YvoNO5
 VZcw==
X-Gm-Message-State: AOAM5315TUVrjVA5JHGzAHZLCgBBSm5CfaRKRzCINR+QGgYQEEUDcAba
 2vd/kCe8wodE9XOPA3dPNevPqgsG9ABslANPi6k=
X-Google-Smtp-Source: ABdhPJyyxWaNbwpS09ArdttQuf9u1W8a+7gjDzEjjLiJVTUBwJLU3NBmJ465hLs63yRqen1EV/J2sftVxMElk+7b0A4=
X-Received: by 2002:a17:906:814a:: with SMTP id
 z10mr12906125ejw.96.1608504875637; 
 Sun, 20 Dec 2020 14:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CAF-5T9H9wiZZ7qT_r5PYhj0q6cHogdjXQx38PDQ3QXXm3SftJg@mail.gmail.com>
 <CAHmME9p6U_11+caCpxtaQd=b8OhGf51sW+CH1fRDpALNcyM4MQ@mail.gmail.com>
 <CAF-5T9EZ34sRrs=o8KiKUBbbUxLbbyZ0_RfOJLOpHcW4n_DbEw@mail.gmail.com>
 <75011a3f-c143-d88e-c5c9-b13fd5999e3e@westermo.com>
In-Reply-To: <75011a3f-c143-d88e-c5c9-b13fd5999e3e@westermo.com>
From: Ronan Lucio <ronanlucio@gmail.com>
Date: Mon, 21 Dec 2020 11:54:24 +1300
Message-ID: <CAF-5T9FRtAGnZ9aPReLn83kCJgwmkijSBvutoJkyoxYcLEHhhQ@mail.gmail.com>
Subject: Re: Default route on windows
To: Matthias May <matthias.may@westermo.com>
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

Hi Matthias,

I'm not sure I got your point, but I don't think so.
I'll have to do some additional tests and will got back later with
more detailed data.

Thanks,
Ronan

On Mon, Dec 21, 2020 at 10:19 AM Matthias May <matthias.may@westermo.com> wrote:
>
> On 20/12/2020 19:18, Ronan Lucio wrote:
> > Hi Jason,
> >
> > I did it, but in this case, I got no Internet access
> >
> > On Sun, Dec 20, 2020 at 1:21 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >>
> >> Add 0.0.0.0/0 to your AllowedIPs.
>
> What is your remote end?
> Does it forward your traffic, and NAT it towards the internet?
>
> BR
> Matthias
