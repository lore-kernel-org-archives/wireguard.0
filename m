Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4991EC3A59F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E544A206B7
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 12:28:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9awa8t1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E544A206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9e3dd7ac;
	Mon, 26 Aug 2019 12:28:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bf7af19
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:30:14 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f26f2c2f
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 09:30:13 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id l7so35722036ioj.6
 for <wireguard@lists.zx2c4.com>; Mon, 26 Aug 2019 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMEDYFBLpbEEckkBJHKS/0xLp8uDa1bWshHhXNClojs=;
 b=M9awa8t1sLOLpB8LMgsxjf0mioZ5DumHlAbsFSotT9p7XYM9M0/asQunmOlTi5Zxfr
 pEahj3qm0Ta9iDxqrz/rKjd68zqpVnTUUJ24+L6faPHmEdbM3x7Mn5RErUSQyaOeY87T
 /qyllB7kIPKLrfUdSZ0f78saP3dTnr3t+aaZytJWqLPoeFBedIcaYPOcVCUewKTVhHU9
 H08dt3b4PCdEXcRi/Ymbw2NifQWd7/A9VS+2CLrVKp58wPMJrIiNODTlIKYIxFQ0m4Mc
 SwHB2CXlHNs9S+wnwigyyiK0DoqOIRUQ5d2ORiSvKfm+M0cdohIYPtW2YJiRirw37WkF
 hyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMEDYFBLpbEEckkBJHKS/0xLp8uDa1bWshHhXNClojs=;
 b=CpMCfsoCDJGugozNscHz/IcyKg5GGlKJ9VIHtLc432+tlQTHGkBDH8fos5Fqm7EHVi
 ZvLodv71vzItlZ28WIXAYIzcfvV8Fh6hTcU5ZtpKWwqYzyxQVURET9KI4RWw3GJkxRPR
 kfvQdMAvfpGxLdh8guArZtKWUIz/ov2PYloZSdJdUkl3ij1+g0XKQRS0/ltjL/yzRzGj
 0JeWlVPZ5zFIj3VMSPAKyU+5UEtsIVQ3Nh37LDc30QY3vy5tfVSIYgD/RIYozIT/7jpq
 mVtjK+dk/liVw1xDrD2P+vYfdWZMazh6wv3OU3r00pUSia7W5loigijD/JF6ICUozO4U
 xUUw==
X-Gm-Message-State: APjAAAUBtyN8eo9GZVtn9qHk8Sq/eOQCASgI1zrNvcLWgKcKYob3tTUZ
 6MnSwzumWrwTsrXL0bugDSO0WjH3mIka2/7DbH0=
X-Google-Smtp-Source: APXvYqzf4/1Gh029ffEYfDt2PDn1U5K/SQv+LgGbelqWiixHXdnnwob/f1GKbyIUfu2k6b4EfKExDu7haQ7wmOJfQeA=
X-Received: by 2002:a02:a383:: with SMTP id y3mr17459121jak.6.1566811813141;
 Mon, 26 Aug 2019 02:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
 <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
 <CANH_QeYk=1HyuOFgg2_1YxHNyR9keWH883BD90bKvQn3im497g@mail.gmail.com>
 <CAHmME9pxw2u=Su1jccf58iFPqvfY-opCSEJ3_TLtzjAA3tgYQw@mail.gmail.com>
 <CANH_QeaEDZ-UMZ_G_Zem7HhVBBZf7gaK1VnTZjTgVd+w1Th1pA@mail.gmail.com>
 <CAHmME9pLLpPTJ+f2r0t0gh08nTrKZ8qGLgoL4o5NFoaUj_1KGQ@mail.gmail.com>
In-Reply-To: <CAHmME9pLLpPTJ+f2r0t0gh08nTrKZ8qGLgoL4o5NFoaUj_1KGQ@mail.gmail.com>
From: Vasili Pupkin <diggest@gmail.com>
Date: Mon, 26 Aug 2019 12:29:53 +0300
Message-ID: <CANH_QeZs5BhNumC6tDO=QiNARVbW02L8wRx=r-XLGNE-8u8c3A@mail.gmail.com>
Subject: Re: Linux kernel 5 different behavior
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Mon, 26 Aug 2019 14:28:33 +0200
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

On Mon, Aug 26, 2019 at 5:09 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > Usage of fwmark is my current workaround. If the same user id of an
> > outer packets is not a bug then ignore it.
>
> I can see arguments both ways. Do you recall off hand the last kernel
> version that had the prior behavior? I'd like to try to find the
> commit and read the rationale upstream.

I see the difference now between 4.18.0 and 5.0.0 kernels, the closest
I can get with readily compiled kernels on my distro. According to
`iptables -t mangle -A OUTPUT -j LOG --log-uid` on kernel 4.18 outer
packets have UID=0 if original packets were sent from system processes
and do not have associated UID at all if original packets were sent by
the user. On kernel 5.0 they always inherit UID.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
