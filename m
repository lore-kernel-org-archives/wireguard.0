Return-Path: <SRS0=NPIR=XJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0670C49ED6
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 04:44:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E347F20693
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 14 Sep 2019 04:44:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mK4perDI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E347F20693
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6338294f;
	Sat, 14 Sep 2019 04:44:35 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db8cc8d4
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 04:44:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef03d36f
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 04:44:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27fc1ba0
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 04:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ypLrp3lJKSD+ZDOOWAEgvwdh8L4=; b=mK4per
 DI3IsWy+3t8isHffTVHQTJoTtSJPKWlwupH8DG9MPLyB4CB4UVCGsWe/m4r6Befg
 j6ozaDOBC6iQos7/lTtqoaaHM7zy2URdVSzBKql9ad10LtK+LrjCF7JybJqTgQBf
 cUWRVPttpIqAVarEQlayHvWgxNWdFAWZUL++KbBlUjAImtmPNjYhbQ7gAIksH3/E
 c3oN3AincpYgrnUkocEGGJeY97JeTg6KO9njuoqeU6iEPRZCUxKACTrZXt91qTdo
 J4ApxBga4I/RFu4MJWIeAbNV49Zh0RdBOF+O3tlr5TbF6ac8eYABdBLFd0oSGXfz
 MigdLHo4mrqZJeUQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8031606f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Sep 2019 04:00:14 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id z26so22067498oto.1
 for <wireguard@lists.zx2c4.com>; Fri, 13 Sep 2019 21:44:32 -0700 (PDT)
X-Gm-Message-State: APjAAAVU/MHqfKeoj0Yyf+PRurDubFbJpV5rhG/INt/ShHAKFbmPa5l/
 +HxQBPkpHkELkAWyLsrM/hXyx4cARHzTGfuvDBc=
X-Google-Smtp-Source: APXvYqwnPrmLuuGVMmA4BidO4vowRdSHL4kvYRU5W14y8HL0vGBZ0ZlZCCIUBUuq1w/Ik7yivP12/lYkrcNgUzmzbME=
X-Received: by 2002:a9d:7d91:: with SMTP id j17mr17543438otn.120.1568436271326; 
 Fri, 13 Sep 2019 21:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKRnFh4XvqYzPDVjy_NOpeHY+KgsRfEuHfEjWy9N1wfY9MwTg@mail.gmail.com>
 <CAHmME9oC+rYCVqv21-nGw_vyxzY5VhTHoa0mrnbOEShcczBN-g@mail.gmail.com>
 <816bb8ff-101f-2719-4b75-1d194c519aef@astrogeo.va.it>
 <CAHmME9odNo2d+=u1z7kNuXKy2HYzOqaHt_0N9Dz49kZFp4qW_g@mail.gmail.com>
 <9891ad84-a635-3922-2fb9-ceadd6cdb8fd@astrogeo.va.it>
In-Reply-To: <9891ad84-a635-3922-2fb9-ceadd6cdb8fd@astrogeo.va.it>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 13 Sep 2019 22:44:20 -0600
X-Gmail-Original-Message-ID: <CAHmME9qugc1AHqiHq39+GT2QjdyFx8QKEMhLev_6r+MNerwQ1Q@mail.gmail.com>
Message-ID: <CAHmME9qugc1AHqiHq39+GT2QjdyFx8QKEMhLev_6r+MNerwQ1Q@mail.gmail.com>
Subject: Re: WireGuard fails to build on CentOS 7.1908
To: Dario Pilori <dario.pilori@astrogeo.va.it>
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

Hey Dario,

Thanks for the explanation. I released a new snapshot today that
should include support for both RHEL 7.6 and 7.7. As soon as CentOS
7.7 comes out, I intend to drop 7.6 support entirely to continue with
the policy of supporting the latest RHEL only. It seems like there's
an awkward transition period while CentOS catches up to RHEL, so I'll
try to stay on top of that for 7.7->7.8 too.

Joe - can you bump the copr package?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
