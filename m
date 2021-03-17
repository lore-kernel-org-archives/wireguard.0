Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDE1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 18:34:24 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 050EA64F4F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 18:34:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 050EA64F4F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0025a5b1;
	Wed, 17 Mar 2021 18:34:21 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1946d692
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1616006053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cjjMrT2xYrXsJqkFDsqRf8ReOoXS7j5fb6T1uzcyYzo=;
 b=qD+wxZr0oG+EVJ2pLqjWPun4ZHqCcYx9K2kTdzstNi342qoMRUPGHsGRYue6lNccWvzWG7
 sVJcgyoi0wI6jl9YpkSb+aWvz1LV/QkaTmD/9zp/D05mZw2h9JCmUZWDgdN4vWwlM8V/mC
 bPWxTnP+Oxda7A2CdgnDExyQXIR39S4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bfb82197
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 18:34:13 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id p186so41582015ybg.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 11:34:13 -0700 (PDT)
X-Gm-Message-State: AOAM533ChDzBM5fbwXcPTY2KMNWwZA2X4J9AI1hANkLWXzGXeLHvePRa
 6Rf8SPSi2BFsEfU3EkRt7qEcWsbSU9Lbe2xcirM=
X-Google-Smtp-Source: ABdhPJy2yTWXhL8i2ug5YvbJreL+NPFVFbQolWZ4rFVa1KmLQtXZ777TJ9LzTUGPdsAGPYCcn4aUXuX9ypsIt4lCZ5k=
X-Received: by 2002:a25:38c5:: with SMTP id f188mr6186822yba.178.1616006052690; 
 Wed, 17 Mar 2021 11:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
In-Reply-To: <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 Mar 2021 12:34:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
Message-ID: <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: Gordon Bergling <gbe@freebsd.org>
Cc: Kyle Evans <kevans@freebsd.org>, freebsd-arch@freebsd.org, 
 FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Gordon,

On Wed, Mar 17, 2021 at 6:53 AM Gordon Bergling <gbe@freebsd.org> wrote:
> I am not sure, if the removal is a great idea, a removal from
> releng/13 and stable/13 - possibly yes, but from main?
>
> This is still -CURRENT and -CURRENT should be central place for development,
> even if we have phabricator for review.

It looks like Kyle has gone ahead with the revert anyway, so
development is now happening at:

https://git.zx2c4.com/wireguard-freebsd/

And there are now regular snapshot releases:

https://lists.zx2c4.com/pipermail/wireguard/2021-March/006518.html

As for your objections, and the question of what -CURRENT should or
shouldn't be used for, I really have no idea as a community outsider.
But I do look forward to submitting it for proper inclusion in
-CURRENT after a few more cycles of development and refinement.
There's also the crypto question that I'd welcome some feedback on:

https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.html

> If the complete backout is happening, please don't forget the manual
> page. I have spend a lot of time on it, while OpenBSD made a good
> template.

Thanks for bringing this up; I had actually forgotten about that. Do
you want to re-add it and keep that current as we develop? If you
email me your SSH key, you can just commit it directly.

Jason
