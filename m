Return-Path: <SRS0=nAhE=O3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B11C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FE461374
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Oct 2021 23:35:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91FE461374
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b629194;
	Thu, 7 Oct 2021 23:35:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a42eff35
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Oct 2021 23:35:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 629E461381
 for <wireguard@lists.zx2c4.com>; Thu,  7 Oct 2021 23:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="RUzdsbYa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1633649746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jSFXdb3dCEV/+otUCcWhxrbJx0O/xk3ksXelWc8GCHA=;
 b=RUzdsbYa/kU2nCMqNszqFy+8cF2tgW0eLhg1MTPVa3Ywf5Vv5J83kllLuFUAnKu/NejsQc
 G6//91butDI0XEjU1OamZav9CtcavLGVEfKUKJKdgpogU/f6r03M+hJ8XaPza6zfVBFHDW
 R6jYnNAnSj93Xz9H3DQcp6SynbTdW34=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c05702fd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Oct 2021 23:35:46 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id v195so17208167ybb.0
 for <wireguard@lists.zx2c4.com>; Thu, 07 Oct 2021 16:35:46 -0700 (PDT)
X-Gm-Message-State: AOAM5301DH1zZwh1RoA70qWy1tMTqFYL1tpYykwccFNLI6Xxmod7qUjU
 gjNcqPvrfnpIsa576DEfl55JtJ+Kd/KfxYfgpH0=
X-Google-Smtp-Source: ABdhPJxGOaPqdmXnMKteeXPYCYoYHQy0fRwkT370hL6PpT2zDsVJI0toiBC97KTBOOWRCAG7Y59+cGuMIaAezlq8Kgg=
X-Received: by 2002:a25:bd03:: with SMTP id f3mr7719479ybk.412.1633649744563; 
 Thu, 07 Oct 2021 16:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
 <20201112090313.GB3500@trivini.no>
 <CAH8yC8=azrpN=EOP9XsTDe2NwmqQquSpEuqidtS2rVFw8x+5Ew@mail.gmail.com>
 <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
In-Reply-To: <CAHmME9rZHaDRRk2-c9kzhUapTRiVxybkwS2Ung_HgSCAVyOw4Q@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Oct 2021 17:35:33 -0600
X-Gmail-Original-Message-ID: <CAHmME9rZeksrVkbn1qOAFEtKs4F872N07EJNU5iHXSsGLi_TSg@mail.gmail.com>
Message-ID: <CAHmME9rZeksrVkbn1qOAFEtKs4F872N07EJNU5iHXSsGLi_TSg@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Jeffrey Walton <noloader@gmail.com>,
 =?UTF-8?Q?Berge_Schwebs_Bj=C3=B8rlo?= <berge@trivini.no>, 
 Laslo Hunhold <dev@frign.de>, Panagiotis Kalogiratos <nodens@abnormalfreq.com>,
 Neal Gompa <ngompa13@gmail.com>, 
 Phillip McMahon <phillip.mcmahon@gmail.com>, Roman Mamedov <rm@romanrm.net>, 
 Reiner Karlsberg <karlsberg@softart-ge.com>, samuel.progin@gmail.com, 
 paul.montgomery@netprotect.com
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

Hey again,

About a year later, WireGuard on Windows keeps becoming more advanced
and integrated into the operating system, with better service
notifications, high speed multi-packet transmission, device arrival
notifications, software device management, and so on... the common
theme being that these are all made possible by Windows 8+ APIs. So
we're now carrying well over 1000 lines of Windows 7 compatibility
code, polyfills, and sometimes outright reimplementations. This is
nobody's idea of fun, and having lots of extra code (that receives
less and less testing) is usually a recipe for things to go wrong. The
added burden of Windows 7 slows progress on newer platforms.

So I really would like to sunset Windows 7 support at some point. The
party cannot go on forever.

However, according to [1], Windows 7 still makes up about 15% of
Windows installs. And I know for a fact that some pretty large
WireGuard deployments are running on Windows 7 boxes, sometimes
installed inside of ATMs... Whether or not that's a good idea, it is
happening. What to do?

My current thinking is to follow the Chromium project, or at least
watch attentively and see the fallout from their decision. After a 6
month extension due to the pandemic, Google is set to retire Windows 7
support in Chrome on January 15, 2022, which is exactly 100 days from
now. There are still some open questions, though: will Microsoft
follow by sunsetting Windows 7 support for Edge, or will they keep it
on life support even longer? Will Mozilla follow Chromium's decision
as well? Is tracking Chromium's decision sensible? It might be: web
standards tend to move awfully fast these days, and without an up to
date web browser, will Windows 7 users upgrade to Windows 11 [or
Linux]? It might not: the most important Windows 7 holdouts may well
be embedded machines that don't care about browsers anyway?

If anybody's thinking on this has evolved, I'd love to hear thoughts.

Thanks,
Jason

[1] https://gs.statcounter.com/windows-version-market-share/desktop/worldwide/
