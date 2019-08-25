Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D25C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:54:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE67E2070B
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:54:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Lqew/x3Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE67E2070B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68c9a01d;
	Sun, 25 Aug 2019 15:52:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18a813d3
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:52:42 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d1cad0f2
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:49:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8f57dbc5
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=mXM/omscPFf1
 W3bxPol3HdRjTBM=; b=Lqew/x3Z/vUJUls2q0PScn9wU9c9JI/7Xwc3eRq3W3gy
 vFdGwjATEcGzQ4ZXsaD4wImXiQD8YJD2pU4kzE7xk/gRJN03BNBCItZmhhg7Sxcv
 l6S1V2N1oFumdbQC7DyYPmhHfSRiwicZ7DbNyE8FbJTtl2lBeZDl8lSiLl1nbq+S
 SM2XgVt2SxXatE9oKwMBlSc+GZBdBSpgg6sy53QnXjhP5Ri7scvN6yXqWBX5NDgE
 BQ1e6rfVAmFAuRVLRmcgzQiRLsk6Oex/EOSHoYj/ZidCX31DJBe71ieDD+e92Syg
 wh3KwEX07hdFV25XVejUJXBYShXvKAe6oX6+gjv+DA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9c7efc06
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:08:01 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id y7so4906562uae.10
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:49:49 -0700 (PDT)
X-Gm-Message-State: APjAAAVjHuGe6EbUw0S3MgJp9GJE+ic9Jc5EE6zHvfGsEATRGSHuLi+n
 DPEqgOH1qIn11LbKN8+rVUovM7Z22axlMLWUqOM=
X-Google-Smtp-Source: APXvYqzBBHPYZYJnrdX0WF1XPHW2OFqnBjW//C9Bhw/rBbmSsAh/x8YtSYqm6POmK5oG5ZYMOfK2bdHc8jWxk/IlNlE=
X-Received: by 2002:ab0:63c3:: with SMTP id i3mr6730469uap.7.1566748188756;
 Sun, 25 Aug 2019 08:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAKZtF0rY6AZzyjwyAo5wtTqcS2GoOGPaUA1XVgGOaG_ZZ=rSbg@mail.gmail.com>
In-Reply-To: <CAKZtF0rY6AZzyjwyAo5wtTqcS2GoOGPaUA1XVgGOaG_ZZ=rSbg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:49:37 -0600
X-Gmail-Original-Message-ID: <CAHmME9qEoKtVVQLpuQ1MPrFvspcG+V03o-ZEzuaCQS19JuXwMw@mail.gmail.com>
Message-ID: <CAHmME9qEoKtVVQLpuQ1MPrFvspcG+V03o-ZEzuaCQS19JuXwMw@mail.gmail.com>
Subject: Re: Wireguard-rs implementation
To: Claude Richoux <crichoux@janestreet.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Sun, Aug 25, 2019 at 9:47 AM Claude Richoux <crichoux@janestreet.com> wrote:
>
> Hi there,
> I am reimplementing the noise protocol, and I decided to test against wireguard-rs to check my KDFs. After some confusion, I noticed that the Blake2s HMAC function is incorrect (it disagrees with pycryptodome, openssl, and Cloudflare's BoringTun implementation). I guess I'm just wondering what the status is on wireguard-rs? I saw it on git, so I assumed it was working, but maybe not?

Mathias is hard at work on wireguard-rs, so there are likely all sorts
of broken or unfinished things in there. The good news is that its
development finally has some great momentum. The not as good news is
that you'll have to wait a tad bit longer for it to be complete.

https://www.wireguard.com/repositories/ has the status of each of our
projects, by the way.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
