Return-Path: <SRS0=mUUH=HB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E209C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Jan 2021 10:51:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A67364E05
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Jan 2021 10:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A67364E05
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef21e6f1;
	Sat, 30 Jan 2021 10:51:30 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e03002ad
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Jan 2021 10:51:29 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id v24so16055867lfr.7
 for <wireguard@lists.zx2c4.com>; Sat, 30 Jan 2021 02:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49t+TTmSB+lF4VPEY198yZB67oM0DbTNJ6Ly4suVd3I=;
 b=MkLpLoje1YNuCLs8cFZIocRcEE77kc4d+oTeTyjWO8mB5Gvv9BDIu2ia9he6sMukiE
 mwSviklDpfoceEYmG+iSCp6sKOvO7ONw81yOQOWHdHoQAd1iREfYSMyg584/MXFoo/uv
 m9ysnkkzfFl0U6HPZsQx9+8w7Uy5a1pWkocysPsKGR6lTJx8m5ZAcWqEIWUNLM946vLI
 lnZfoX0HOpa7xeNNcJH9QVPMvHRTGI2YRWqDUX/hE8pzXVq8KHf/xO8h/5KA3ikfrutB
 abNFLH2Tl8jTI/XbeETPp+f5jQv4kMvvbs6lKR9iH3yagcUUc4X4fRWNWWaBpPVW29CG
 VYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49t+TTmSB+lF4VPEY198yZB67oM0DbTNJ6Ly4suVd3I=;
 b=Vo54uMSVnfHMvfF4BYu1IcgsYILIK7nr3wgT6V7GlRiFZRnTZ305Zdh/oDb6/P9sSo
 8WuMP9MKg+u5PTQozGUzViiq0Zl0UngjlWsjr6sSSbcGYLF0ESaytIukNkCcbEXr/h68
 2/m7FAt4+hVNnGdnMJq6RAmFlPPIGwNMJLS+F/hzbWfXfkHrRDQBiJZOrHyj0LyMP5P5
 xyTzcjOIcyNn1TDCxoZbHuPfH6zgtM+/7eA6cEpxFq1jVT1wF9BbTDec2nxePwrba9qB
 U8rAWHZPBvyGel6b7iO8TELRPYJ//FOXCql26PlVynh4BiWY71w42t+2hg9szNcvKm6h
 C30A==
X-Gm-Message-State: AOAM530ePVL+fIH0ZFLb1yuu3X06BHTn/FWOvFMYvunm123uFlmjpJx+
 JenVPsErc38RR0ZzpIhpX5pb/VArwHtTOjCOC40=
X-Google-Smtp-Source: ABdhPJxFTwmjHGryiIeX7Hc1dIVd6Pvux5vkKISsLJYJHHLgp2Nmz3RH3P9mZlmvUHbUopVfHa1/rCM4USLTITq0Ktk=
X-Received: by 2002:a05:6512:224c:: with SMTP id
 i12mr4467585lfu.520.1612003888556; 
 Sat, 30 Jan 2021 02:51:28 -0800 (PST)
MIME-Version: 1.0
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9ojL5JxWh5Vn_RsBB8baLabhFvotAuSoQ61fJeht=2qEA@mail.gmail.com>
 <2dc629e2-93c9-4ed9-ea57-4318c8b62a73@gmail.com>
 <397bedc7-3913-08bb-a6f3-691d9fab663c@gmail.com>
 <CAN5wt5r9rQpYcCkshBimOARoAxx7T529oUw6RSNnr4q3_y_31g@mail.gmail.com>
 <CAN5wt5ojzay9uEjubrrivd6vZqOGNJ40M25ELzOYTK42zozijQ@mail.gmail.com>
 <fd327c99-b672-4d68-7298-72550f52a806@gmail.com>
In-Reply-To: <fd327c99-b672-4d68-7298-72550f52a806@gmail.com>
From: Christopher Ng <facboy@gmail.com>
Date: Sat, 30 Jan 2021 10:51:16 +0000
Message-ID: <CAN5wt5pZ_U4B8N0JJ0caZXB-iWPkkf2+Knk56XO0=tzUNVt8iA@mail.gmail.com>
Subject: Re: Fwd: Problems with Windows client over PulseSecure VPN
To: Peter Whisker <peter.whisker@gmail.com>
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

no problem.

On Sun, 24 Jan 2021 at 16:26, Peter Whisker <peter.whisker@gmail.com> wrote:
>
> Hi
>
> Thanks, maybe the powers-that-be would consider your change to be a fix
> and accept it into the next release? I guess by removing the default
> route I am causing the bind to fail as it doesn't know which interface
> to bind to which has the same result as removing the bind. The bit of
> code you removed certainly causes problems!
>
> Thanks
> Peter
>
> On 15/01/2021 10:32, Christopher Ng wrote:
> > ---------- Forwarded message ---------
> > From: Christopher Ng <facboy@gmail.com>
> > Date: Fri, 15 Jan 2021 at 09:46
> > Subject: Re: Problems with Windows client over PulseSecure VPN
> > To: Peter Whisker <peter.whisker@gmail.com>
> >
> >
> > i fixed this in my local build by disabling the binding in
> > defaultroutemonitor.go.  tbh i'm not sure what it's for, i found an
> > old discussion (about linux) about not binding to only one interface,
> > so i'm not sure why Windows binds to one interface.
> >
> > diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor.go
> > index 6ee95129..12456332 100644
> > --- a/tunnel/defaultroutemonitor.go
> > +++ b/tunnel/defaultroutemonitor.go
> > @@ -6,12 +6,10 @@
> >   package tunnel
> >
> >   import (
> > -       "log"
> >          "sync"
> >          "time"
> >
> >          "golang.org/x/sys/windows"
> > -       "golang.zx2c4.com/wireguard/conn"
> >          "golang.zx2c4.com/wireguard/device"
> >          "golang.zx2c4.com/wireguard/tun"
> >          "golang.zx2c4.com/wireguard/windows/tunnel/winipcfg"
> > @@ -50,18 +48,22 @@ func bindSocketRoute(family
> > winipcfg.AddressFamily, device *device.Device, ourLU
> >          }
> >          *lastLUID = luid
> >          *lastIndex = index
> > -       blackhole := blackholeWhenLoop && index == 0
> > -       bind, _ := device.Bind().(conn.BindSocketToInterface)
> > -       if bind == nil {
> > -               return nil
> > -       }
> > -       if family == windows.AF_INET {
> > -               log.Printf("Binding v4 socket to interface %d
> > (blackhole=%v)", index, blackhole)
> > -               return bind.BindSocketToInterface4(index, blackhole)
> > -       } else if family == windows.AF_INET6 {
> > -               log.Printf("Binding v6 socket to interface %d
> > (blackhole=%v)", index, blackhole)
> > -               return bind.BindSocketToInterface6(index, blackhole)
> > -       }
> > +       // disable this because if my peers are on different
> > interfaces...well i don't know how it can work.  i can't
> > +       // bind the socket to only one of them
> > +       /*
> > +               blackhole := blackholeWhenLoop && index == 0
> > +               bind, _ := device.Bind().(conn.BindSocketToInterface)
> > +               if bind == nil {
> > +                       return nil
> > +               }
> > +               if family == windows.AF_INET {
> > +                       log.Printf("Binding v4 socket to interface %d
> > (blackhole=%v)", index, blackhole)
> > +                       return bind.BindSocketToInterface4(index, blackhole)
> > +               } else if family == windows.AF_INET6 {
> > +                       log.Printf("Binding v6 socket to interface %d
> > (blackhole=%v)", index, blackhole)
> > +                       return bind.BindSocketToInterface6(index, blackhole)
> > +               }
> > +       */
> >          return nil
> >   }
> >
> > On Wed, 13 Jan 2021 at 17:06, Peter Whisker <peter.whisker@gmail.com> wrote:
> >> Hi
> >>
> >> I have managed to work around the issue caused by Wireguard sending
> >> packets via default route interface even though the route to the peer is
> >> over a different interface (the issue caused by IP_UNICAST_IF). My
> >> Wireguard peer is down a corporate Pulse Secure tunnel.
> >>
> >> I use a PreUp and PostDown script as follows:
> >>
> >> PreUp
> >> =====
> >>
> >> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
> >> if not defined ip set ip=%%a
> >> route add 0.0.0.0 mask 128.0.0.0 %ip% METRIC 1
> >> route add 128.0.0.0 mask 128.0.0.0 %ip% METRIC 1
> >> route delete 0.0.0.0 mask 0.0.0.0
> >>
> >> PostDown
> >> ========
> >>
> >> for /f "tokens=3" %%a in ('route print -4 0.0.0.0^| find "0.0.0.0"') do
> >> if not defined ip set ip=%%a
> >> route add 0.0.0.0 mask 0.0.0.0 %ip% METRIC 1
> >> route delete 0.0.0.0 mask 128.0.0.0
> >> route delete 128.0.0.0 mask 128.0.0.0
> >>
> >> This replaces the /0 default route by two /1 routes before bringing up
> >> the WireGuard interface. Traffic to the peer then gets sent down the
> >> correct route (why is this different from having a default route?). When
> >> the WireGuard instance is closed, it recreates the default route and
> >> removes the two /1 routes.
> >>
> >> Is there a way this could be done better in the Wireguard executable (I
> >> am currently using 0.3.4).
> >>
> >> Thanks
> >>
> >> Peter
> >>
> >> On 26/11/2020 13:11, Jason A. Donenfeld wrote:
> >>>> Is PulseSecure not setting up a /0 route? If so, then this is a known
> >>>> issue with the lack of policy routing on Windows.
