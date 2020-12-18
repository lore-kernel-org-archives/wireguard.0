Return-Path: <SRS0=2ZxM=FW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43BF6C4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 23:53:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 725F921D79
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 18 Dec 2020 23:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 725F921D79
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f582f830;
	Fri, 18 Dec 2020 23:44:33 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5f86e904
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 23:44:30 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e287fae
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 23:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=ZbDqM9psgCy2pZpXiEAI3i3Kg6Y=; b=ywFtER
 qJOv+AH8WooH/axo1a71NsF0hksM+DyDB5LTbFQn/dKqCG5iMTzSSZRcXYEDxFZ0
 oNBaM3QVdhq0U77fnftGdFMDRpIUcAnF2NoTHEUj4fmBngKLAXTu19SExNjWHqco
 WYYJrD73+ntxFcyiXi9mnQZr2hzyY4KogG+yD5d6AsiAGb9SX4CDFvEc2hWr8GxF
 ibrlQbBDC1HUrSIvDwMMkJ4rHvThdwYdDgGHgAWVON9j4kMEMzuPnBAlLLJ0W6sH
 99Ntqmx+Ng6Bm1PT07QbJiAIaTDraO1KbXaZsXq6Rm59j1qojAzB5mDwmZBpYjyN
 sF14OhypEdUoUrtA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0a413e8b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 18 Dec 2020 23:45:16 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id j17so3455222ybt.9
 for <wireguard@lists.zx2c4.com>; Fri, 18 Dec 2020 15:53:12 -0800 (PST)
X-Gm-Message-State: AOAM532uL7cy19+R3Yp8GEgTIFVjzsB58qNMTF/3fA4L9sFUeKswyFuG
 U17QF4Rsb/XaC300xcKOO0f4q0OROOWnoNb0Me0=
X-Google-Smtp-Source: ABdhPJydTIaJbFf9UBH55WVSy9xIhLHh2zToqO7lRvCINsQcCbjl8Y0ayyfJLNPxufERO/F2XNMpSWp75KwGCnfWBok=
X-Received: by 2002:a5b:78d:: with SMTP id b13mr9248289ybq.123.1608335591825; 
 Fri, 18 Dec 2020 15:53:11 -0800 (PST)
MIME-Version: 1.0
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
 <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
In-Reply-To: <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 19 Dec 2020 00:53:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
Message-ID: <CAHmME9pZq6pMV9W2EiYRP_mOLkQXVDpdB83kEFsiuhEH807bzA@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi again,

On Thu, Dec 17, 2020 at 10:53 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> However, they rejected the iOS update, due to the link in the version
> info window to https://www.wireguard.com/donations/ that we've had on
> there for two years. You can see their rejection here:
> https://data.zx2c4.com/apple-asks-me-to-remove-donation-link-from-app.png
> https://data.zx2c4.com/the-screenshot-that-apple-provided.png
>
> Not wanting to hold up getting this fix deployed, I quickly removed
> the link and resubmitted to the App Store:
> https://git.zx2c4.com/wireguard-apple/commit/?id=a4fc0f64b8bca8afae5abab37b81ba0b45836975
>
> So now the process of getting that fix deployed on iOS starts from the
> beginning again. It could take another 24 hours. It could take a full
> month. The process is opaque, and try as I may, I don't know what else
> I can do to get the fix out faster.

They rejected the submission with the donation link removed, citing
the existence of the donation link in the old build and providing a
screenshot of the old build, rather than the new build. I sent them a
response pointing out that they reviewed the wrong build, looking at
the old build rather than the new build, and I sent them a photo of
the new build as installed from Test Fight. My experience with Apple
here is that if you respond to their rejection with anything at all,
you automatically get put in a bin of at least a week wait time. I
hope that doesn't happen here. But, anyway, another day has gone by,
and we're still waiting on Apple to ship the fix to you all.

My response to them was:

> Hi,
>
> Looking at that screenshot, I think you might have tested the old build. The
> one I submitted is build 21, which removes the donation link, rather than
> build 20. But in the screenshot you've attached, it shows "(20)" and it also
> shows the donation link. So that leaves me pretty confused about what's
> going on. The link is definitely gone in build 21, and I definitely
> submitted build 21, and looking again at my build submission, it says build
> 21.
>
> Attached is a photo of build 21 running from Test Flight on my iPhone.
> Notice how the build number says 21 and the donation link is gone.
>
> Could you take another look?
>
> Thanks,
> Jason

I hope this gets cleared up soon. Maybe I'll watch Terry Gilliam's
Brazil on repeat while waiting.

Jason
