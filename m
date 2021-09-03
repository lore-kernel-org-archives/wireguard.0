Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB28C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C2FA60F14
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C2FA60F14
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wades.im
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c1f55d5;
	Sun, 5 Sep 2021 11:12:53 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8cddbdd1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 14:57:48 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id t12so12113856lfg.9
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 07:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wades-im.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=Ri/WcgPLyRm+pycluTv/bCUVTgFmC6TZWQoE5JOgldU=;
 b=ksC+b481CglsdxmIKtmepgJAu5Y8OUVacQbeG8J6Pge+hmVA5dHUiyUYJUZa2T8Grb
 lyAO5L4zgK7FLxym30czwgWr4g+FqW6YuljCW8QYWRoCyne4rYUej29rrF6ruXtaSsGU
 DIh9UvMxl4fpojWVymvMr9lo9ySk+7SWZDC8SNiS9dwYYJU9LisTEE5jYZ+/8b+S+e4e
 /nhycJLTr67BXDUH9xSU3XD+rVDhZ8V7SwFCLQYxagjk+CiG5D7TbKa1DAe8LOrA8sd6
 X/7WidAr3wQFRAWGcOHQlG/ZL/F/FANgsaVhXscDiRlAz749uJE8mAaMEYu+D1nB0lpE
 QLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=Ri/WcgPLyRm+pycluTv/bCUVTgFmC6TZWQoE5JOgldU=;
 b=LbvU37b+5bvKabZAJ9kYky+34c8GWrb5WM1Sv/XLqQTOLcGJ55wxqeYlS1ccwKFVee
 YcXNaqYiBmKi+br6VIxL/YXHQXnXTAlfohIQpJ/IJUhOdFnmmJ5WZbKrK97qw6nHzJ36
 llZ1UTS0ElOdwIcaNZq2vyu+yZtNeB3K/q6GkHf1FFru22DMZcMcbLxLbfIbSx3U5dGC
 Gi/5zWwqIofnkt6Rs8KnNQhQ3zSWNUKMb4rQwHcgCeZjTMImJrSLu4x5lJYznIDyMbZq
 p9McgR5Rnkk6ccASx/6wMrUhZ4poRVjrG3/7BquG9Zi9IAq3K2FIJVgqLnnc3+5Qy78q
 nRJA==
X-Gm-Message-State: AOAM530WKZ009oJKPyznL0VwvWY6nPK4VnBRQTxZ8Hr2KLO8s/m8Zzco
 Dmk9W4wn5/F1EgPzhdzxJ6VVx8pdAkEV1g3knW6/SjHVks8NGw==
X-Google-Smtp-Source: ABdhPJzdLKUurN2WfvYBc7yK9C68RMbHTckUb8skvMl4HXGT9+JxCHFY68NVJLRwutiv4Nv/wTzmComVGhi3v5jaLps=
X-Received: by 2002:a05:6512:304f:: with SMTP id
 b15mr3028020lfb.462.1630681066884; 
 Fri, 03 Sep 2021 07:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <03143d09-112a-d28c-f79e-d97c01f7b1d2@sys.casa>
In-Reply-To: <03143d09-112a-d28c-f79e-d97c01f7b1d2@sys.casa>
From: Wade Simmons <wade@wades.im>
Date: Fri, 3 Sep 2021 10:57:36 -0400
Message-ID: <CAF63tRoz2pRTJe=sJoiZNPW-gqajQObqc2m0HDvwUfBw0v2TAA@mail.gmail.com>
Subject: Re: Invoking sendmmsg from Go.
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Sep 2021 11:12:49 +0000
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

On Wed, Sep 1, 2021 at 9:59 AM john@sys.casa <john@sys.casa> wrote:
> Given that, I was wondering if anybody knows a way to interface with
> sendmmsg from Go?

As an example, the golang.org/x/net/ipv4 package implements WriteBatch
using sendmmsg:

- https://pkg.go.dev/golang.org/x/net/ipv4#PacketConn.WriteBatch

You can either use that method, or peek at the source code to see how
the syscall is called.

-- 
Wade Simmons
