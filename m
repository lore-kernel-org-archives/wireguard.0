Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3326DC43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:13:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF1FC2196F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:13:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gHxQ85Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF1FC2196F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c4a8c998;
	Fri, 6 Sep 2019 19:13:45 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1a75865a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:13:43 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fb5637f
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 19:13:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b7c3c7a
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iKcNQ81cBfogH2hszFqP1I6zx0c=; b=gHxQ85
 XqPbpNrzI+fL0LgLOmFQ5yHHESd5IgSpDVdDvlDd6w5E8WalO+euahbJ1h+1EcDo
 EJYSJFtLefILnsYGkfKZ6EAWLLycsM5GX164ToPITNOLYdC6uRRvulyHrmGjua8z
 kLPQCiPEtHTt5LDxpVbVXG24Q0va8gYF7lt5f5IoUmH4zdFHDLhJMgyJPd3JVcu4
 LQUsPi0bDU6G83JxFmO/bsMmgKxBFkuce2bvkD6+QdfRjEvW+q343/NUVue7qXgf
 9PGbd923tclH/UhzM4AvlM/U8TTUXGyhB+VZ2Sa6ywyHF1Nee0/3Lu/deAXHv3Hz
 KZ7ddNmU1Nz0jopg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a2de5e2c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 6 Sep 2019 18:30:22 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id b80so5843039oii.7
 for <wireguard@lists.zx2c4.com>; Fri, 06 Sep 2019 12:13:43 -0700 (PDT)
X-Gm-Message-State: APjAAAXwBS0Ijn/8P01Btq+//u0CAD5CREkvRc2O8jVa+N7Pv6IqWyTX
 BI6SnnzXzMtTodOD1N1BfoblaSAKTLhZX5FIMMk=
X-Google-Smtp-Source: APXvYqxu4/FELlqA3XPs0nusrztv9Fq7mlnun5gcWYrOeHHcLHoW2G6ps0ASqKbTen8+Okwek8RWud1DKrMtH2NVQMw=
X-Received: by 2002:aca:edd4:: with SMTP id l203mr8706850oih.52.1567797222909; 
 Fri, 06 Sep 2019 12:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <etPan.5d6fa131.739987c8.17679@gmx.de>
In-Reply-To: <etPan.5d6fa131.739987c8.17679@gmx.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 6 Sep 2019 13:13:23 -0600
X-Gmail-Original-Message-ID: <CAHmME9r5Wza8g=-LBHDQ1mcPUQOsovkN5jXRHszsGzVRNFE8ow@mail.gmail.com>
Message-ID: <CAHmME9r5Wza8g=-LBHDQ1mcPUQOsovkN5jXRHszsGzVRNFE8ow@mail.gmail.com>
Subject: Re: Wireguard installation on Ubuntu 16.04 / kernel 4.4.0-161-generic
 fails
To: Martin Jurasik <martin.jurasik@gmx.de>
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

Thanks for the report. Ubuntu's kernel team made an error in
backporting a patch from mainline. They're aware of this error, but
they're unable to rectify it for another 7 weeks, which clearly isn't
an acceptable amount of downtime for WireGuard servers. So yesterday
we made a new WireGuard release that works around this issue. Then,
this morning, Egbert, the maintainer of our Ubuntu package, published
a new Ubuntu package for our new release. So you should be all set by
running `apt update && apt upgrade`. Sorry for the hassle. I'm not too
happy about this situation myself, and I'm going to try to figure out
how the Ubuntu kernel people can make sure they don't break WireGuard
in the future with some sort of CI.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
