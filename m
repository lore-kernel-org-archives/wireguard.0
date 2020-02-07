Return-Path: <SRS0=RHSj=33=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7664CC352A2
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:26:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F029120726
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  7 Feb 2020 11:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="r9QuDH6d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F029120726
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4c010c5b;
	Fri, 7 Feb 2020 11:24:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id befad108
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 11:24:45 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d2ade926
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 11:24:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 102754da
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 11:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=cq9rn/rodNISIcgjNypUuW0LVx0=; b=r9QuDH
 6dRU6AgbMWCywvldLFBhi+OUF12uNdXnmBrx1mFqaU/MiXB3q8bckDG46W9eq2Uj
 ITWiM537dmw/rg4k3vWa7A8Y7ueZLjRTq3XBcL7pptt/EbrueuVOIrkPM59+rHTJ
 yA0MJBfEeR4oeUTfO0uE4KcJ0rMMf1hmcC0EjyKx+o118ZKTBr48lxK0BZMJ4T1g
 Eq9uFJWVwCDnsTdEYrDdZ+tIh9SQf4aMdtO28s43Gje7Ud3J/wCW021A09eUTvk9
 9cmK8Is3aI1AQGx017IAfmwuDvQXdw6VIOuoPmItA50IgQJfftMUhMq15OMdFdfB
 O9GlEGwa3yPifG5w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8404f6de
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 11:24:45 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id g64so1789347otb.13
 for <wireguard@lists.zx2c4.com>; Fri, 07 Feb 2020 03:25:56 -0800 (PST)
X-Gm-Message-State: APjAAAVEqvcCV3vx1B2u6KNLa+VkcoWyB+4VTgbafGSJVCyH/W6Gqa0A
 72qr0dm8yGS0BBzIiM1DYRoPlPgOjTOWTlNd/3k=
X-Google-Smtp-Source: APXvYqxp4MmjNYTOyGt4INNLLcno5XuuLl78SPFwI364CHsgiS5VYjdTeai4Gff3d2xtyte/ozKTq6UG6T8SI5T0Y2s=
X-Received: by 2002:a9d:24c8:: with SMTP id z66mr2373928ota.52.1581074755939; 
 Fri, 07 Feb 2020 03:25:55 -0800 (PST)
MIME-Version: 1.0
References: <7bd93b7f-adef-e1b7-252b-1616914a6e4f@posteo.net>
In-Reply-To: <7bd93b7f-adef-e1b7-252b-1616914a6e4f@posteo.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 7 Feb 2020 12:25:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9pC5Ki=Rnj-W+=t7CZtmVP9aUQJRL0bCzV1MHm3eO60NQ@mail.gmail.com>
Message-ID: <CAHmME9pC5Ki=Rnj-W+=t7CZtmVP9aUQJRL0bCzV1MHm3eO60NQ@mail.gmail.com>
Subject: Re: Building module on Mint on 5.4 kernels: fatal 'make' errors
To: Nicholas Joll <najoll@posteo.net>
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

Seems to be a Mint DKMS problem maybe? Are they shipping clang but
building kernels with gcc, or vice versa?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
