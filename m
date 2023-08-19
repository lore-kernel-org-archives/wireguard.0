Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07269EE49AB
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 20:28:37 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae7e12f6;
	Sat, 19 Aug 2023 20:14:21 +0000 (UTC)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [2607:f8b0:4864:20::102f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dab62f5c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 03:34:27 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-26934bc3059so1895982a91.1
 for <wireguard@lists.zx2c4.com>; Fri, 18 Aug 2023 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692416065; x=1693020865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
 b=IqtJwsF0pUQX7izyHeTreyTJTJhKy5hiG0L5LG7pklRm5ruz2z314lR30cJBIft8IF
 lHOgWqUBHxsrHRZ/n+H1wKK9DAmo6l6M6vOqnptgdlcjmAJVnPdA6vRI0gXUbNjLjw2O
 HaCa2GQWI2H3P/PJF/kO6bmYeR/Nyn9f2ZprmcA/D0k+kc6aE9gt4/58CgSA7F801jjd
 XX+T7G5Lv1/7anA6wENrFajkkBfdYnNLgzsdEjOaJ3u6npvNqyydM0GqNQ4HtJ58/8Bk
 W4eV1DvzXq38mo16H9W9Oyvm8s/Iciep4KukBQTEpuiauG6fJdSHO4J2dBeLWJsNSNRu
 GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692416065; x=1693020865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vOjVxX/Eg0iGmCqhVv5cIZBql9TtO2CXYAj6O50hbSE=;
 b=S284fDgr32xvJl23A8+SQv2aPKGXMldrekUjp4ucXsD1rrM9QzY9u3/BM3tx8Ym+gM
 Wl78oaOeQJbOnzJwrkfLFRZUjLPVK1xO9HRmjVEvBITYqz3JU7+8WPaD0QKRQiaXmKUH
 +eMW1lifUz3IICbE9wTzLey4VALcN2G2M53sUjourJ9rPO8BYAK8fybpc0OHpijkbrbu
 V0QLi0xkYZY5LSFyb23qTy6/dcrqYRVFS4r95phTNWYaiMf3J3DMZtDgEG+0cweUQp/t
 FVov+6HUaldumKrOv1aD3LCTOl5jQDDisZtN0DOR2wV9EsHsFsQvqsiXvf9OFUPsOE05
 hlKw==
X-Gm-Message-State: AOJu0YzcQhLYm1sYw1U1+Z1jU0j7eICaVVEORxrBuT/wlofRza22V1S1
 fV0EhC/toTejBbgKPgADEsKGkvAKCfHvhmI4Prk=
X-Google-Smtp-Source: AGHT+IFpp0VHvCZv9YQH2C6BH14eA1+BcCpaZ1w5QpKfP5/3cQ/4jDAUwPVhdHrKttxLAuvWHcInuMfoJccdrJLxiGs=
X-Received: by 2002:a17:90a:64ca:b0:25d:d224:9fb9 with SMTP id
 i10-20020a17090a64ca00b0025dd2249fb9mr1389535pjm.24.1692416065235; Fri, 18
 Aug 2023 20:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <38e1a01b-1e8b-7c66-bafc-fc5861f08da9@gmail.com>
 <86e329b1-c8d7-47bf-8be8-3326daf74eb5@infradead.org>
 <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
In-Reply-To: <78a802c5-3f0d-e199-d974-e586c00180eb@infradead.org>
From: Jesse T <mr.bossman075@gmail.com>
Date: Fri, 18 Aug 2023 23:33:49 -0400
Message-ID: <CAJFTR8T-Fdu_aKapP+Lb6pLYo_ykXwXw6rFZNGR5=WKU1QwUPQ@mail.gmail.com>
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 "Jason A . Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com,
 linux-arch@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, Vineet Gupta <vgupta@kernel.org>, 
 Brian Cain <bcain@quicinc.com>, linux-hexagon@vger.kernel.org, 
 Greg Ungerer <gerg@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, 
 linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-sh@vger.kernel.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Josh Triplett <josh@joshtriplett.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org, 
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 19 Aug 2023 20:14:11 +0000
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

On Fri, Aug 18, 2023 at 7:44=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi Jesse,
>
> I replied to your comment a few days ago, but for some reason
> your email to me contains:
> Reply-To: 20230816055010.31534-1-rdunlap@infradead.org
> so it wasn't sent directly to you.

Sorry about that I messed up the email headers...
>
> My former reply is below.
>
> On 8/16/23 20:15, Randy Dunlap wrote:
> > Hi Jesse,
> >
> > On 8/16/23 15:45, Jesse Taube wrote:
> >> Hi, Randy
> >>
> >>> diff -- a/init/Kconfig b/init/Kconfig
> >>> --- a/init/Kconfig
> >>> +++ b/init/Kconfig
> >>> @@ -1790,14 +1790,6 @@ config DEBUG_RSEQ
> >>>
> >>>         If unsure, say N.
> >>>
> >>> -config EMBEDDED
> >>> -    bool "Embedded system"
> >>> -    select EXPERT
> >>> -    help
> >>> -      This option should be enabled if compiling the kernel for
> >>> -      an embedded system so certain expert options are available
> >>> -      for configuration.
> >>
> >> Wouldn't removing this break many out of tree configs?
> >
> > I'm not familiar with out-of-tree configs.
> > Do you have some examples of some that use CONFIG_EMBEDDED?
> > (not distros)

Buildroot has a few.
It won't immediately break Buildroot and Yocto as they have a set version,
but it could be confusing for anyone updating the kernel.

> >
> >> Should there be a warning here to update change it instead of removal?
> >
> > kconfig doesn't have a warning mechanism AFAIK.
> > Do you have an idea of how this would work?

No, unfortunately. As you said without a warning it would be overlooked so
a change would not be necessary.

A possible solution is to check in a header file with:

#ifdef CONFIG_EMBEDDED
#warning "CONFIG_EMBEDDED has changed to CONFIG_EXPERT"
#endif

Does anyone else have an opinion on this?
Since kconfig doesn't have a warning mechanism the patch seems fine as is.

Thanks,
Jesse Taube
> >
> > We could make a smaller change to init/Kconfig, like so:
> >
> >  config EMBEDDED
> > -     bool "Embedded system"
> > +     bool "Embedded system (DEPRECATED)"
> >       select EXPERT
> >       help
> > -       This option should be enabled if compiling the kernel for
> > -       an embedded system so certain expert options are available
> > -       for configuration.
> > +       This option is being removed after Linux 6.6.
> > +       Use EXPERT instead of EMBEDDED.
> >
> > but there is no way to produce a warning message. I.e., even with this
> > change, the message will probably be overlooked.
> >
> > ---
> > ~Randy
>
> --
> ~Randy
