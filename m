Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD508C28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D94A206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 10:51:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D94A206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85f296c6;
	Wed, 6 May 2020 10:36:29 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 42a564f9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 20:44:24 +0000 (UTC)
Received: from mail-qk1-f180.google.com ([209.85.222.180]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1Mgek6-1ivdGW3yuq-00h4Xx for <wireguard@lists.zx2c4.com>; Tue, 05 May 2020
 22:51:53 +0200
Received: by mail-qk1-f180.google.com with SMTP id i14so3847434qka.10
 for <wireguard@lists.zx2c4.com>; Tue, 05 May 2020 13:51:52 -0700 (PDT)
X-Gm-Message-State: AGi0PuYBqFQ5geremAR1Os6MR/xVTXhgHRNAI6SOZM/75TqovxXuaJhg
 AcmiDyxSxVKdgKxQKu246szsnlFtnceUYG27LQc=
X-Google-Smtp-Source: APiQypLeVpLfwvXnNr/kh8i7h3BF2MM1Zc18IcQzr8YZsPeSIkoUm3Eo4GM+Wy9kCf4P/OTrcCYa62E4Z/KzmhLco3M=
X-Received: by 2002:a37:b543:: with SMTP id e64mr5487687qkf.394.1588711911720; 
 Tue, 05 May 2020 13:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200505141327.746184-1-arnd@arndb.de>
 <CAHmME9oTO7DiWCXoeCBjmPOBMoZQ2hUhHjZ4_oi-nVP_9pRpSg@mail.gmail.com>
In-Reply-To: <CAHmME9oTO7DiWCXoeCBjmPOBMoZQ2hUhHjZ4_oi-nVP_9pRpSg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 May 2020 22:51:35 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3vno7BYwJZna8w1spRCcou2veXSbQZefnUbPpswkRGzQ@mail.gmail.com>
Message-ID: <CAK8P3a3vno7BYwJZna8w1spRCcou2veXSbQZefnUbPpswkRGzQ@mail.gmail.com>
Subject: Re: [PATCH] net: wireguard: avoid unused variable warning
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Greg KH <gregkh@linuxfoundation.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:4Pj2xn41cmm9a6fQTPqcParHXH6sh4CAKrT4WoJ3SRYF4AcGm2P
 PuABRO1mtqw+WPPZMeXwQ5cm7eO2ON/SPEcqTXf1dpGAOpKqeiNGw0ZhXn0XFLdQLsBxucl
 OUGIAkPZkQbltUkEw4FsS9Ysv/1Gd5HdIpJ4EwOfV1SUGyVIam7IgAVGkj+TpCAw7cIWEiK
 sFI4QKbH+8Hz5z/K25dew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZmLdlb+VW3g=:goBAo7ncpFWxht4NuYFd/n
 iPSqG00L8fqrz4LB0pbWsDXera5NV808IvmJvw9n4iQ9NvehayZ06aIw+6q+ZS24/W6tntwy/
 9jv2H7QPjZgvq1b8p4fsuTW9/qqyFFXgxXCNcfCau6ZKC5K2VvEzebNT78u1VaoSy9QfzsWV8
 E35R5PZDhirRRE/bDhkwJxpDmer2roAYtQl5Ed4cWUsHc2FRoAoF0XjchFRrlkgPn6xy3ceGE
 RPxK7UqXd1yooN69NKP5e0We1e2IbZAiEqKUTDGO3Z3Xwt4rPbmcp2kwVPrVkeqJ5BJ0aFiMn
 FOfxmngeLiHuw4uFNnyoW7E4dnE82HDMABus4Gzzqh+SoA8a9QGFn7qqNjDPK8iCduZlg+eEY
 OFA1IO+77qiJ27mycWWe4cvm6F2b4tSJFe8pLU5XAh9qJl8ecbwOLR5qS84z5fBWwsK+2Gzuw
 ElE/kWLjrILKWNIJ6XLAlRqE3MOvbGC6dJntJ9XzqsEM3OO7xrf7pwXAk4qC5CR96NcLc/bw3
 PJBI+3+gPlJ2neDYpIXP2S7c3jTRK5l1GbY99GZ77EALXHmm+/xLFg8pAjeG46NMmlKmhwfx3
 7u3Si5kKJy/R20Ge0fx6RSjEphp3KDZN5/7FYHfu0ISUYefLIyyacUds/ebyqx1YArHPuGde0
 DMq38AstB6QdYWMKzdhJH69PgPtM4eBy8s3sTyz1f8C2d15RFav8UvDy4TVbTpWl8sWe1x01t
 JBn+vhfSmiJBZ5zVvSmrcORjwTWaH6IpsGYDFQ5DGuRwBLv7IOi1svSRcF2kS1edrE6jK2fZB
 5YjcpbKtPYW7DLibaXdZ/UYWcmTS2w9sWeYwoh4Rn/DGqwbXNo=
X-Mailman-Approved-At: Wed, 06 May 2020 12:36:21 +0200
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

On Tue, May 5, 2020 at 10:07 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Tue, May 5, 2020 at 8:13 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > clang points out a harmless use of uninitialized variables that
> > get passed into a local function but are ignored there:
> >
> > In file included from drivers/net/wireguard/ratelimiter.c:223:
> > drivers/net/wireguard/selftest/ratelimiter.c:173:34: error: variable 'skb6' is uninitialized when used here [-Werror,-Wuninitialized]
> >                 ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
> >                                                ^~~~
> > drivers/net/wireguard/selftest/ratelimiter.c:123:29: note: initialize the variable 'skb6' to silence this warning
> >         struct sk_buff *skb4, *skb6;
> >                                    ^
> >                                     = NULL
> > drivers/net/wireguard/selftest/ratelimiter.c:173:40: error: variable 'hdr6' is uninitialized when used here [-Werror,-Wuninitialized]
> >                 ret = timings_test(skb4, hdr4, skb6, hdr6, &test_count);
> >                                                      ^~~~
> > drivers/net/wireguard/selftest/ratelimiter.c:125:22: note: initialize the variable 'hdr6' to silence this warning
> >         struct ipv6hdr *hdr6;
> >                             ^
>
> Seems like the code is a bit easier to read and is more uniform
> looking by just initializing those two variables to NULL, like the
> warning suggests. If you don't mind, I'll queue something up in my
> tree to this effect.

I think we really should fix clang to not make this suggestion, as that
normally leads to worse code ;-)

The problem with initializing variables to NULL (or 0) is that it hides
real bugs when the NULL initialization end up being used in a place
where a non-NULL value is required, so I try hard not to send patches
that add those.

It's your code though, so if you prefer to do it that way, just do that
and add me as "Reported-by:"

> By the way, I'm having a bit of a hard time reproducing the warning
> with either clang-10 or clang-9. Just for my own curiosity, would you
> mind sending the .config that results in this?

See https://pastebin.com/6zRSUYax

       Arnd
