Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC94C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 00:23:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C1DF208E3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 00:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="EacQw4TE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C1DF208E3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12ee5344;
	Wed, 2 Jan 2019 00:20:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b86173a
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 00:20:49 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 21b1ea3a
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 00:20:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d49d2705
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 00:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=X/WcGVwfhy9XRd4GeMK8DY4eIsU=; b=EacQw4
 TEWAosS3X9tu20mjXwL1l3Xbn+n2aXVZhtO9kpaYCy4PgOqkoHxsbKQxTtpclNA7
 0/PSmUDHEAz2hhWI91Cz065XpbXn0WQB1Di7HUOLmXsCWbl8XTyUH4yR1+dVa+m/
 MvUVSi5xl9RYucUwT05dIq9SHdNv1dEmK/OX/sbynZ7J5XyrV8nooYk2y4cNbkMo
 XIM7mgco42KUg4xeiPR91a6AqS1B5/W9UQBONfut4xiQLC1KVVojV1YCSqGxgTso
 bDQL3uW5uI4icdBDlwMszc5Fmc2ZAQq9XSy/zaIujBsK7aw/CrE/mIDy1D6ZgjaI
 ksius7HXk6ZigZsw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45ff9154
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Jan 2019 00:11:34 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id j21so24003755oii.8
 for <wireguard@lists.zx2c4.com>; Tue, 01 Jan 2019 16:23:07 -0800 (PST)
X-Gm-Message-State: AA+aEWZzCgXDvmnC271sHeN9uJ1wjWnoJ6nhBJL5RaIxqQb8cnRuynh0
 Am5tOjfNuQWuHzZ2PqLlj9AEKGmPFVWpTDXggtA=
X-Google-Smtp-Source: AFSGD/WzRTg37GFnj5pr1nyuvUIyYjz0S/dgE3x6YXrSIpkC3a0yuti9mrBtm21VAhIeq+vhAjsmwPojKF+4O/TYLOM=
X-Received: by 2002:aca:2c05:: with SMTP id s5mr29310926ois.190.1546388586669; 
 Tue, 01 Jan 2019 16:23:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9pvcrTnbzSvAS3Q1CbPRdZMctuyBmuCyxX0wa_k+A-0tw@mail.gmail.com>
 <20190101215007.15f15e05@leda>
In-Reply-To: <20190101215007.15f15e05@leda>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Jan 2019 01:22:55 +0100
X-Gmail-Original-Message-ID: <CAHmME9puWpU-acT_sAE4qvg6ENAkvwpxMEU7czYUwtdMUQPLVg@mail.gmail.com>
Message-ID: <CAHmME9puWpU-acT_sAE4qvg6ENAkvwpxMEU7czYUwtdMUQPLVg@mail.gmail.com>
Subject: Re: binary module for arch?
To: Christian Hesse <mail@eworm.de>
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

Hi Christian,

On Tue, Jan 1, 2019 at 9:50 PM Christian Hesse <mail@eworm.de> wrote:
>
> "Jason A. Donenfeld" <Jason@zx2c4.com> on Mon, 2018/12/31 01:58:
> > Hey Christian,
> >
> > I noticed there are now two distro-built packages for wireguard for
> > arch -- wireguard-lts and wireguard-arch. These seem probably more
> > convenient for most people than the dkms one. What would you recommend
> > in terms of updating wireguard.com/install/ ? And do you plan on
> > depreciating the dkms one at some point, or do you think it will
> > remain useful for certain users?
> some people gave their legit reasons to keep wireguard-dkms. I have to add
> another one: It is a build-dependency for the binary modules packages. So it
> will stay definitely. ;)

Makes sense. I was mostly wondering about that first question though:
what would you recommend I put on wireguard.com/install/ for Arch
users?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
