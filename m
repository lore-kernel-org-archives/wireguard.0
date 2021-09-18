Return-Path: <SRS0=rvRf=OI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C961DC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Sep 2021 00:27:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFEE561052
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Sep 2021 00:27:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFEE561052
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f0baa64c;
	Sat, 18 Sep 2021 00:27:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37b710de
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Sep 2021 00:27:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CC0961164
 for <wireguard@lists.zx2c4.com>; Sat, 18 Sep 2021 00:27:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CziZzMQ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631924847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rq14Ypm3Le61eD38o3wBr1UQS9HKr4dUVzWOMqsW9w4=;
 b=CziZzMQ8g063zpJng04lmpY7tuEdG/+miW7cVFozQHQiwebtd3SE2VSuvt5zGrjsBmqHDX
 JTGJ22yBqy7K9oDVdZxzK6HFiywjOisJ/MYkpFT7mPccmExb8y7Nf+q1G3b2mCScyq14na
 93S0dokL0hq3O1El7dqu62NI6LEQOo0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 853469e1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Sep 2021 00:27:27 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id f22so22836363qkm.5
 for <wireguard@lists.zx2c4.com>; Fri, 17 Sep 2021 17:27:27 -0700 (PDT)
X-Gm-Message-State: AOAM533uj65aG7nrFoZJ0Hu96mbzlFbGeqpBS2VlLs+ZwfdjIr3tuOj2
 mzBRQw6f7vFJRM3cGaQgpz83Oy8DrIo42LGXME4=
X-Google-Smtp-Source: ABdhPJwYapMYkxr+9NsWtp4GJKBQp/3RqrTKDCNN567scwyZs1G+m4ojQ0Vqocc2V/X1YWVsOI6mec635kiHBCYyFUk=
X-Received: by 2002:a5b:d48:: with SMTP id f8mr16199066ybr.449.1631924846907; 
 Fri, 17 Sep 2021 17:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <YQgrCfqIL2SWfF6G@zx2c4.com>
 <CAHmME9ruyCFABTB1S1RYC5CSCBWPr2eqCZDCszDX4NZNR-vi9g@mail.gmail.com>
 <CAH8yC8=m72gvv3U-mbs5ib3eT79m+VNAX9s3muj63mHgoaD7Ew@mail.gmail.com>
In-Reply-To: <CAH8yC8=m72gvv3U-mbs5ib3eT79m+VNAX9s3muj63mHgoaD7Ew@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 17 Sep 2021 18:27:15 -0600
X-Gmail-Original-Message-ID: <CAHmME9pvZ=Sj25cMJKQi+JH-PPN5AiiVSWe0eLnxVRSDtpDa+Q@mail.gmail.com>
Message-ID: <CAHmME9pvZ=Sj25cMJKQi+JH-PPN5AiiVSWe0eLnxVRSDtpDa+Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuardNT, a high-performance WireGuard
 implementation for the Windows kernel
To: Jeffrey Walton <noloader@gmail.com>
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

Hello Jeff,

On Sun, Sep 12, 2021 at 3:55 PM Jeffrey Walton <noloader@gmail.com> wrote:
> One month to move into the next phase may be a bit tight for some
> folks. 30 days is probably fine for a developer or standalone
> installation, but some organizations cannot move that fast.
>
> I've worked in US Financial and US Federal, and some changes take
> longer to approve. Some organizations have processes in place that
> require approvals from management. It may take months to get a Change
> Control Request approved.
>
> When I worked at Treasury a trivial change could take two or three
> months and it required management signoffs and complete testing before
> being released to the production network. Nearly everyone dreaded a
> Change Control Request.

I'm not sure I really follow this line of reasoning here. You've
divided the into two categories:
A) "a developer or standalone installation" that is presumably
frequently upgrading in order to have the latest in greatest.
B) "US Financial and US Federal" and similar organizations for whom
changes require extensive paperwork and reliability testing.

For group (A), the gradual three phase rollout outlined in the initial
email works very well, as it means each component gets an appropriate
amount of testing depending on the phase, with related rollback
controls. It's group (B) that you've raised a concern about. But, if
each change for (B) requires paperwork and reliability testing,
wouldn't _that_ procedure also catch issues? Obviously a downside of
not updating like (A) does is that you miss timely security updates,
but I assume that (B) argues that their slow processes of sign-offs
and testing and paperwork increases reliability and accountability,
which may well be more important for (B). And it would seem that those
processes basically accomplish the same thing as the three phase plan
that's available to group (A) does. So it doesn't seem like anybody is
left out. Unless, of course, all those sign-offs and testing aren't
_actually_ testing anything meaningful, and they're just a Brazilesque
paperwork nightmare, in which case, with regard for neither security
nor reliability, what does it matter either way?

Anyway, there's no exact timeline of precisely 30 days. It will be a
good time after nobody has reported a bug. While products have "go to
market" deadlines, projects have the luxury of being on the "when it's
ready" schedule, which means we don't need to rush. At the same time,
I very much look forward to the reduced maintenance burden of no
longer maintaining duplicate code paths in the wireguard-windows repo.
The jd/remove-wintun branch has a commit that removes about a thousand
lines, which isn't _that_ much, but those are lines that are a bit
stressful in the sense that abstraction layers and duplicated code
paths are common sources of bugs, so they require extra vigilance from
me (and auditors).

> It may be noteworthy... on Windows OSes, the trend is to move stuff
> out of the kernel and into userspace to reduce risk. For example,
> Microsoft moved parts of the GDI out of the kernel and into userspace.
> So some folks may actually want the userland architecture to reduce
> risk.

I don't think it actually makes a practical difference in this case:
the userspace tunnel service retained SeLoadDriverPrivilege so that it
could *unload* Wintun when quitting. Besides, WireGuard was made to be
implemented in operating system kernels; figuring out how to do that
in a minimally scary way was an original thrust of the project. Linux,
OpenBSD, FreeBSD, and now NT.

Jason
