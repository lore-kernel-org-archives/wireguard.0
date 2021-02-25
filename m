Return-Path: <SRS0=+PYL=H4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D291C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Feb 2021 12:34:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33DB60231
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 26 Feb 2021 12:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33DB60231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28285541;
	Fri, 26 Feb 2021 12:34:02 +0000 (UTC)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [2607:f8b0:4864:20::d31])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 31636b5c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 20:23:21 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y202so7322012iof.1
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 12:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eHIL+rC9L1AfzUjb0UrlmwNQsBSQs70sc1D/N1uHIuY=;
 b=stxQpMmMa/0/Ojzlyh2t0ziuZQJvlaOACBvx9kAGcU7DMJnqhQnzUb8WDY0HUg7Ze7
 Vt7kP6XS/QnkVAk8V3RVcY70BVisGnfjycR8ncTAS5IVLliG5e6Bj/KPqhNuKHnmsGcG
 8bPSssLKktEzD8XmVb4R3x+5/KU8NhW4FankV3Xwa8EuNwbyFc9OX2cxa2vCTXp2u3Au
 dx3HGr7tW+kLcpmZCkDC6nXcQTfF0lhDA/trLQCi20ZLbQ69WLJkom5ZeLCqiQzg4dJJ
 DWtfEm/pvXsI3ErdikktrdhMEp0AVnIn3O+YtlWm1ft/cSq/C7rder5Y0YzvhV3ZXGd0
 9gSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eHIL+rC9L1AfzUjb0UrlmwNQsBSQs70sc1D/N1uHIuY=;
 b=hSsB7gPujOho+J1UO9WQ3DmmFYa2NPAqkaDL30EMUXqWPmaT4w2AXkFUEWMyE2Xrre
 joeG5/G3iPvSqoqZbKRMSAUNU0Vjc6+rwlgpWDbh+vwiP1bOK/jepRW9hDtKZAGpXX3d
 jtj9raWwFk0cmyNThrB4rXlPJ0q5DJfC/lxwQPWoRyh7MvpCBbXEuzgl0aFSyPdEFx0L
 7ymIetaNoX/GQKi0z5DOglUmKR/MCuPokMLfQTVv/geX3TT1XRkm9F4GPgb7to1znWRD
 ClMulVuhoZk84bJ8NyW4wAA/9u7iMnHqt5jCYqxbptTQfPms22q0Y/x5Er+Fz62wURdf
 Wq8Q==
X-Gm-Message-State: AOAM532i3l983Mrz45y7bnUFlIRKJfU07WJ4byv/xhKdUvCD1/72mKiu
 iN0L5jGFsZkIdijxcqM1LydNk1YdJPZTgrU7TXE=
X-Google-Smtp-Source: ABdhPJz38xJvOEQhkcqENsLsQ1jL4khCj47hf/fh71b/k+nYTINnTB1MZ6ZsFg3lGE9DgZF25ZFOc2D/GnyTnw24ZzY=
X-Received: by 2002:a02:6d09:: with SMTP id m9mr4847773jac.70.1614284600306;
 Thu, 25 Feb 2021 12:23:20 -0800 (PST)
MIME-Version: 1.0
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
 <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
 <CADjMg7VHCX04+UgCY4AwLub5=otDJ9dTHMLdX16OVDZoDG88xQ@mail.gmail.com>
 <CADjMg7WuZ-W0bRPM9oCXT6CnVSdYK=fMRANna7XimtEkerOerw@mail.gmail.com>
 <CAHmME9qNVFuf170GEObu1_d=F=snG94qE1Y+KWZJ5DEeL_14Vg@mail.gmail.com>
 <f9d3c90b-57d7-a0fb-2c28-9a5ba8b8e103@gmail.com>
In-Reply-To: <f9d3c90b-57d7-a0fb-2c28-9a5ba8b8e103@gmail.com>
From: Devanath S <s.devanath@gmail.com>
Date: Thu, 25 Feb 2021 12:21:52 -0800
Message-ID: <CADjMg7UzeURgQPd9+XDsOLAOQZJa_7Nsz6UKgyXWHBzTC4E+eA@mail.gmail.com>
Subject: Re: wireguard-go on windows
To: Matt Layher <mdlayher@gmail.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 26 Feb 2021 12:34:01 +0000
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

Hi  Jason/Matt,

I could try running any debug binaries or debug patches, that you want
to run to troubleshoot the issue. Plz, advice.

Regards,
Dev

On Thu, Feb 25, 2021 at 12:15 PM Matt Layher <mdlayher@gmail.com> wrote:
>
> A glance at
> https://github.com/WireGuard/wgctrl-go/blob/master/internal/wguser/parse.go#L48
> seems to indicate that we treat the first "blank" line produced by
> bufio.Scanner (which strips \n) as a sentinel to stop parsing, which
> would mean something like "errno=0\n\n" would parse the errno and be
> done once it interprets the final line "\n".
>
> The tests seem to indicate this works as expected, but I don't regularly
> develop on Windows and welcome PRs if something has changed.
> - Matt
>
> On 2/25/21 12:54 PM, Jason A. Donenfeld wrote:
> > + Matt Layher
> >
> > Hi Davanath,
> >
> >> We are trying to use wgctrl way of configuring the wireguard devices
> >> and facing issues while creating/configuring the wireguard device on
> >> windows.
> >>
> >> 1) First problem was while creating the wintun device using wintun.dll
> >> and using wgctrl for configuring it.  It hangs in
> >> wgclient.ConfigureDevice api()
> > wgctrl works with wireguard. wireguard uses wintun, but wireguard is not wintun.
> >
> >> 2) So tried to first create the device through wireguard.exe. And then
> >> used wgctrl way to configure it, but wgClient.Devices() is not able to
> >> get the devices on our test windows boxes (even though it works on my
> >> development machine)
> > This sounds like a potential bug in wgctrl.
> >
> > Matt -- I wonder if there's a bug in the parser, recently unearthed by
> > a change in wireguard-go. Specifically, uapi stipulates that requests
> > and responses end with \n\n. Is it possible that you're relying on the
> > socket to EOF, instead of looking for the \n\n? Recent wireguard-go
> > keeps the socket open, in case you want to send one request after
> > another.
> >
> > Jason
