Return-Path: <SRS0=7A+2=6T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4606C47247
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 04:04:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56166206B8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  5 May 2020 04:04:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="G4znk52s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56166206B8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id feb02195;
	Tue, 5 May 2020 03:51:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c642e93a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 03:51:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f83edbd8
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 03:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+WEVCZasyksj6JzlEppx8oSJuO8=; b=G4znk5
 2s66hH3Njv6OODRN3cVbDrjfg9OFmUyPMgcSBeYmtG6z0qUqZuC8xDg9xR3QPY1z
 diU2VQXarzRbz2Q3lvUv+TI9OFVbe4nEvineqvHnxAtYfgYCVC9je8jQxurK7qBt
 8K+iw7tohqqQ3XaqLfkzuE3fAhfxkr57YFfSAe+8+/RCNR8vae3hG89mqjopwgmW
 ZAMaFUHQDgikVlw1k6rviA36X2SC8xZFv8WxBlXaeKqLKK3RdrjzEtsf7JKlHI1U
 P/mc53eSyUe3QyfiTzro1vmVid31caTEvxyH1+iMTRtFUE4zxDWK0ttCgGL/PFBH
 LQHhycn/i49g6rAA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e244a93d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 May 2020 03:51:10 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id b12so550534ion.8
 for <wireguard@lists.zx2c4.com>; Mon, 04 May 2020 21:03:40 -0700 (PDT)
X-Gm-Message-State: AGi0PuZkj4FpwWZ52aRz3gOASwj6Q1hUq799xfWnPNl5HJytE/14J0zc
 PEIDDp6+qKri/w82dKM7+FniBWC3obvSQLvoklo=
X-Google-Smtp-Source: APiQypLEBfh6aRD0vqAyM2MNUNnQkT/H6JyrWnsWVj62Gtgu7st1+M8PAKUCiq90euVssmXI/u2iMGGejss7ilLyieE=
X-Received: by 2002:a5e:9401:: with SMTP id q1mr1517998ioj.80.1588651419334;
 Mon, 04 May 2020 21:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <6565463c-0a99-9137-5cc2-714e2fbd6dfc@rub.de>
 <CAHmME9qDMiNh90_zA9KsFX-OaHNUHnw5=e65jH3PdXg1n7nyFw@mail.gmail.com>
 <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
In-Reply-To: <20328df0-e2dd-1653-9fc1-1fb06cbc054f@rub.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 May 2020 22:03:26 -0600
X-Gmail-Original-Message-ID: <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
Message-ID: <CAHmME9rnxp2QYjhu1vU+2K1GaoM2hupz5uJGpo_8z4t=E2-boQ@mail.gmail.com>
Subject: Re: Ubuntu kernel >= 5.3.0-52.46 breaks DKMS build for
 wireguard-linux-compat >= 1.0.20200429, patch included
To: Pascal Ernster <pascal.ernster+wireguard@rub.de>
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

Hi Pascal,

On Mon, May 4, 2020 at 9:52 PM Pascal Ernster
<pascal.ernster+wireguard@rub.de> wrote:
>
> Hi Jason,
>
>
> [2020-05-05 03:37] Jason A. Donenfeld:
> > Can you confirm to me whether or not this patch fixes the issue on
> > both 19.10 and 18.04-hwe?
> >
> > https://git.zx2c4.com/wireguard-linux-compat/commit/?id=1325bedf8ee3d69ed58460b7a8fee96d949f67da
>
> I don't have a 19.10 machine to test on, but at least on an 18.04
> machine with the 5.3.0-52.46 kernel, it works as intended.
>
> However, building the module for the previous 5.3.0-51.44 kernel fails
> now, and it doesn't fail when I use my original patch.

Right. The compat layer, in order to keep it maintainable in the long
term, only supports the latest distro frankenkernel for each distro
release. The latest 14.04, 16.04, ..., RHEL7, RHEL8, SLE 15, and so
forth.

>
> Note that as of now, 5.3.0-51.44 is still the latest "official" HWE
> kernel for 18.04, and 5.3.0-52.46 is only available from Ubuntu's
> "bionic-proposed" repo.

Ahh, you're running -proposed, gotcha. So I guess I should wait until
this hits the main repo. Any idea when they usually do that?

Jason
