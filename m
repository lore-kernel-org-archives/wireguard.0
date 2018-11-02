Return-Path: <SRS0=Sa1Q=NN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E6BC32789
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 08:37:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D062081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  2 Nov 2018 08:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKAv2HCx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D062081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 183cf4a7;
	Fri, 2 Nov 2018 08:33:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85b3ede6
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 08:33:18 +0000 (UTC)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81f75ed2
 for <wireguard@lists.zx2c4.com>; Fri, 2 Nov 2018 08:33:18 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 189so1816214qkj.8
 for <wireguard@lists.zx2c4.com>; Fri, 02 Nov 2018 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AOY1JXDZYA7//UVDATrlt5hOnQOM86gIml3BJVNxv8I=;
 b=JKAv2HCxqaslX3SpQI/PhSeWJ8QZlZJ+rDvAY62pDXa0qF24m5vr6QjP6bj+BKbj2p
 spMerNeQmw1LYzIsybhlo9g8yTdN8ahoUo5sH71I57L1ma0HNHLzZCeCKlwIwk/fXCKm
 CLQzdQDmQ0q/kKiIeqxMqDX6zCPatCTkwoPVgxPAY0ZdmrAhMYeemo8NP6jjgI/ucQhZ
 VhYbYfSpfkR+7UizQtnjgEjuFLjYJCSJQFLUvpbbDXBFbv8ekfNngi+4r4oniwLvMW3r
 ohE468re/rbIiQ1fAHEpmlep0dd432uRi/bt8PRrzilPqULF9ZVtlJJgjfDZGzYV8wCk
 jbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AOY1JXDZYA7//UVDATrlt5hOnQOM86gIml3BJVNxv8I=;
 b=c5PN9VypjgPlTncDrSjYcsBfHezLlt5E9CnCDgbwnXmfD2a80/V7sqTw7LiFCUEw+i
 JeFI7CcciqYjodvK/c9eCHzITEbrxrS/2RdAS296/ejF9JSYTolTEtWLM0+FUVKKFn7X
 18bIRGOCeK2T3pnD3KR96hQypig8ZIxj8aSWdFgLAyJQSCCPMpWeD040e0t/ya8sS4RL
 PL8/lelIGeXRIWHr4IEENahJvinu9ANKvdAcl+bPSBB5c1wTfllpdYrkE6MizOzbhvsW
 irPdDruuPZiHabw3H+khXqgnl7x8aPN+3cJURzAgfInkalgG8zzGAYYS2sBYtGqLRxFb
 TXgQ==
X-Gm-Message-State: AGRZ1gLakYr2mCwEj63OOGF2HjQ5EH6bI3aGQqKvG1Y3KrE2ahr8b9CF
 Rqpgk1XHNg1ifnZmpPtbHwGXYIR6PmG9+MchRhM=
X-Google-Smtp-Source: AJdET5eVpGm/ATg5pwUrqqzl5+wfTyy0hNhjH93tyfMtiLY4GlStTildFbZWo9l3rm9ugIFQ/zpNDBJRG6rdj0Bllio=
X-Received: by 2002:a37:5108:: with SMTP id
 f8-v6mr9138079qkb.288.1541147827732; 
 Fri, 02 Nov 2018 01:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <CANcuY=qyERAxMcREiBJutdYbGX-tJPMhUdmxN_=TwQHiamiaNw@mail.gmail.com>
 <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
In-Reply-To: <CAKXLc7ctgDjAKSyB-DaET8spbgnF9hpf4uBKbRwZY_jVb4YZvg@mail.gmail.com>
From: Laszlo KERTESZ <laszlo.kertesz@gmail.com>
Date: Fri, 2 Nov 2018 10:36:55 +0200
Message-ID: <CANcuY=rmGfTqicDna4zzxdMrK5R31u7d9TvFqCC=Mv_mpnRrzQ@mail.gmail.com>
Subject: Re: F Droid build 0.0.20181031 broken
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7708412710351412243=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7708412710351412243==
Content-Type: multipart/alternative; boundary="000000000000d189a40579aa7011"

--000000000000d189a40579aa7011
Content-Type: text/plain; charset="UTF-8"

The error is when you try to connect to an already configured tunnel.

On Fri, Nov 2, 2018, 09:39 Kalin KOZHUHAROV <me.kalin@gmail.com wrote:

> On Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ <laszlo.kertesz@gmail.com>
> wrote:
> > The current FDroid build (version 0.0.20181031) is broken. The Gui
> starts but it states "Unknown userspace Go version" and the tunnel
> activation action results in an error.
> >
> Hmm... just installed (1st time) and started it, seems fine (haven't
> configured it yet).
> What is your configuration?
>
> Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on
> XT1905 phone.
>
> Kalin.
>

--000000000000d189a40579aa7011
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The error is when you try to connect to an already config=
ured tunnel.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, N=
ov 2, 2018, 09:39 Kalin KOZHUHAROV &lt;<a href=3D"mailto:me.kalin@gmail.com=
">me.kalin@gmail.com</a> wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On =
Fri, Nov 2, 2018 at 8:26 AM Laszlo KERTESZ &lt;<a href=3D"mailto:laszlo.ker=
tesz@gmail.com" target=3D"_blank" rel=3D"noreferrer">laszlo.kertesz@gmail.c=
om</a>&gt; wrote:<br>
&gt; The current FDroid build (version 0.0.20181031) is broken. The Gui sta=
rts but it states &quot;Unknown userspace Go version&quot; and the tunnel a=
ctivation action results in an error.<br>
&gt;<br>
Hmm... just installed (1st time) and started it, seems fine (haven&#39;t<br=
>
configured it yet).<br>
What is your configuration?<br>
<br>
Here: stock (no root) Android-8.1.0 (3.18.71-perf-gd0e0d1a kernel) on<br>
XT1905 phone.<br>
<br>
Kalin.<br>
</blockquote></div>

--000000000000d189a40579aa7011--

--===============7708412710351412243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7708412710351412243==--
