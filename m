Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E69C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB836206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 08:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GoLt7gZS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB836206D8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc601de;
	Fri, 24 Jul 2020 08:32:55 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 20645450
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:32:53 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95ad045b
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=no51doC5mwjc1ztox0l1F1ryEck=; b=GoLt7g
 ZSplumyAG3kBfikpWU1Uh/rXMiS9UZ4Fa9bm2bIaa4tTnsab3XjqIUTL0FY/j5qj
 6vBBgsqEOjhd/AWd5g/u6MI7ArDL6xs2tJhUGYMsHXuiE6KUJKG9IOzBOJNIB9Vy
 G94Om4neIjU8RiS3eiLvwBANA/YHbdX3Wlq7qUpP+4teUcJA+5VByNocWwNz9d2L
 v0u1mY/91yQMCIsXY5F8LdrHzNnpj8g2RgTm85V63XCcUcavGYBW70xfGgowMidh
 3ZTPbo2i/e+pbMW+PK566IibUGTeTR/W7fgxNnKsIs2cafg9zxm9ZqfkLaSPXk1V
 cIXHIMbdEexOUYLg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 95e635f6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:32:53 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id v6so9102265iob.4
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 01:55:46 -0700 (PDT)
X-Gm-Message-State: AOAM533/RXAPYfL/KPNv7+yqc+DdssjL+Oas3jRMekOrN2IF1JLhPDDB
 7uY9PkUF14mkGzdQPdoz8T0mwi9gOn2TS3/ka+w=
X-Google-Smtp-Source: ABdhPJx4mg2NdnhEdvObSQ8t5aUzgVhcKeVezcr4ybgy50LyGIrAG662M+4oZDN13i4VciBD9wFWEevtjAvkZU4baGQ=
X-Received: by 2002:a6b:5c17:: with SMTP id z23mr9324365ioh.67.1595580946314; 
 Fri, 24 Jul 2020 01:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200721155826.29f29036.peter@petergarner.net>
In-Reply-To: <20200721155826.29f29036.peter@petergarner.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 10:55:35 +0200
X-Gmail-Original-Message-ID: <CAHmME9o+CZRBjNoGdBguNqap5nJP75YqdmO5Mbd=w636w+GZFg@mail.gmail.com>
Message-ID: <CAHmME9o+CZRBjNoGdBguNqap5nJP75YqdmO5Mbd=w636w+GZFg@mail.gmail.com>
Subject: Re: Using OneRNG hardware RNG can I get wireguard to use /dev/random
To: peter garner <peter@petergarner.net>
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

On Fri, Jul 24, 2020 at 10:27 AM peter garner <peter@petergarner.net> wrote:
>
> Hi List,
>
> Platform: Raspberry Pi4B, Raspbian Buster 10.  This device dedicated to
> wireguard. uname -a: Linux wireguard 4.19.118-v7l+ #1311 SMP Mon Apr 27
> 14:26:42 BST 2020 armv7l GNU/Linux. wg-quick is dated May 22 08:11
>
> I've used my OneRNG v3.0 external device to recreate my SSH moduli and
> am now looking to recreate my wireguard keys.
>
> According to the Wireguard docs it uses /dev/urandom:
> https://gist.github.com/rmoriz/58f1768218a4fbc4b318615bfb85111d
>
> fd = open("/dev/urandom", O_RDONLY);
>         if (fd < 0)
>                 return fd;
>         ret = read(fd, out, len);
>         close(fd);
>
> The OneRNG utilises /dev/random though - is there any way I can get
> wireguard to use /dev/random instead (without recompiling) ?

We're not going to change the wireguard-tools source for this.

But if you need to hijynx it, just use mknod to make /dev/urandom
point to the same device node as /dev/random. I'd recommend finding a
better solution, however, to whatever randomness situation you have
going on.
