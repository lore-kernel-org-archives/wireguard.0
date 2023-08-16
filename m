Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E52C001B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Aug 2023 07:47:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae6e10a6;
	Wed, 16 Aug 2023 07:47:54 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id be970b4b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Aug 2023 07:47:52 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-58a24ac48eeso26748827b3.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Aug 2023 00:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692172071; x=1692776871;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HkTNstwI73s4YFo3/SQhtE6/OXSa9yBSjbdY7mJiIyI=;
 b=JXaXyIUNkpA1LFszh3cQIIdp1pgkUkDKqtC2b+izuX0tj+k4GOQkjDThXXZBrw6ip+
 T/PJefzDqKSUqfwhMHgitGzW3euvolOUjooUFVEP+7Zwf5C84QWtWU3lKItTq4dOEVtn
 Ae3YXSmvftkRrkFJ9R8Qs4mBLRICR0gRqlffOuQxWUpdPpPDhKHMHwq3/7tTeAP0/h1H
 ++flwh+y0lDZ+PRMLmhuRu/r8UOQt2RckeU6QhDm7LiaXBI6Agf4yntW6mEnR6UYJzgB
 DhlSg6nTczFGNnrtJiRSHaqdZrlx6fFGySeHQF8VTA2v4I8qWoRjvEP17Wmmiguu+dBP
 fRVg==
X-Gm-Message-State: AOJu0YwVGzMTMriAJxdL//y7Kgv0GlHdEOfRvdc6KECoOhucU6NVKuga
 d2OASqXT9fbqh9cRq7MEwnB9tYpDX4IzBw==
X-Google-Smtp-Source: AGHT+IE7ncuk3744aALCEK1uwbOENzcDPTo1kxaxfVnmiBPe1AXyD9mOVKriJxy1YLJN49jvAsnwWA==
X-Received: by 2002:a81:4fd1:0:b0:577:21ff:4d47 with SMTP id
 d200-20020a814fd1000000b0057721ff4d47mr1278982ywb.7.1692172071495; 
 Wed, 16 Aug 2023 00:47:51 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 d203-20020a0ddbd4000000b0057a560a9832sm3884026ywe.1.2023.08.16.00.47.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Aug 2023 00:47:51 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-d684d7a2a67so4106830276.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Aug 2023 00:47:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:76c:5715:b4a3 with SMTP id
 de17-20020a05620a371100b0076c5715b4a3mr1484328qkb.13.1692171688197; Wed, 16
 Aug 2023 00:41:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230816055010.31534-1-rdunlap@infradead.org>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2023 09:41:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
Message-ID: <CAMuHMdWF0LseSGK6=aodXaoK9D16mxok4DDRs=gKoGox8k6zjg@mail.gmail.com>
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

Hi Randy,

On Wed, Aug 16, 2023 at 7:50=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Makes perfect sense to me.

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
