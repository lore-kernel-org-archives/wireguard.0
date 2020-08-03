Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D92EC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:21:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 021102067D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 16:21:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LeFUtfiI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 021102067D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1eeaaf62;
	Mon, 3 Aug 2020 15:57:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d533a3b1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 15:57:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17d90a00
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 15:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=/7wEb1Dou6QIrbwOCnXj+C53KVQ=; b=LeFUtf
 iIiwXT7JNDBZH4+VQsYK1Gj6ZRSrxdjTTC/vU7gVWQmBWiZxJFMtxd6FZK1pYOMh
 MdWFRBjHYx7TNh9+cy3Wj+GOC7HjjsXHp/COR71ruoAdwcK5sWgDYuX/R7qcoHyG
 oToojcXdlQN4H9LX4WRKEzButF3rpzybKN1PRDORlwjadMmxE5chn7r7ra9Fdd3f
 lDyfO1VUsDOaafdGVZ/lkfodnpvn1w77xcNxV2l79ydz1OnLFOT/qSqhIKNK7GnF
 Ufl+L4ui7Imf6e6ULeTMmBEaZEOFX2RQTJdHzbIJOdXgONPdfXbXpRvMpjijvBxf
 Gt91gZ/reP0qTEQw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id eb0c64d5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 15:57:10 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id l17so39113236iok.7
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 09:21:24 -0700 (PDT)
X-Gm-Message-State: AOAM533pwh4VLP103HDZi2/QQDdtbwJ963mGYv3B4yIqFOEzokPfgBjL
 TBbKdSDOC+ChZw/wlDZzIx8GKH89rba20Dsqujc=
X-Google-Smtp-Source: ABdhPJzMaKtIvYo+LnFXRNpHnm8efr9GvZg83DYmTmX5iA5+G9HL+yztUlmHmTSG5GpmOWkwvPVcmX1C9sKLUBkWOAE=
X-Received: by 2002:a05:6638:250f:: with SMTP id
 v15mr460680jat.75.1596471684233; 
 Mon, 03 Aug 2020 09:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
In-Reply-To: <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 18:21:13 +0200
X-Gmail-Original-Message-ID: <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
Message-ID: <CAHmME9oLOSwC4_55cUZpHoXU+m8L=QQ20aDcn-ia5sWxQ+3nDA@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: lists@noddingdog.org
Cc: wireguard@lists.zx2c4.com, unit193@ubuntu.com, apw@canonical.com
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

On Mon, Aug 3, 2020 at 6:15 PM NoddingDog <lists@noddingdog.org> wrote:
>
> Hello,
>
> I'd like to report a serious problem.
>
> I have a Dell XPS13 with Dell's OEM version of Ubuntu 18.04
>
> I had previously added the wireguard PPA and removed it as mentioned
> below.
>
> Now, when running sudo apt install wireguard, the system wants to
> install the following packages:
>
> linux-image-5.3.0-1032-gke
> linux-image-gke-5.3
> wireguard-tools
>
> These kernel images are **completely wrong** for the laptop (they are
> Google Container Engine kernel images). I didn't notice and borked my
> system by installing them. I had to load an old kernel and purge them
> before my system would work properly again.
>
> Maybe this needs fixing before too many other folks have the same
> problem.

Try running `apt update` first, and please let me know if that fixes the issue.

IIRC, Andy (CC'd as apw@) initially ported WireGuard to 18.04 with a
package bug, which he later rectified.

Jason
