Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BD3FC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 19:39:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 220382224A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 19:39:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=scjalliance.com header.i=@scjalliance.com header.b="jtyWphd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 220382224A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25470053;
	Thu, 19 Nov 2020 19:34:31 +0000 (UTC)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [2607:f8b0:4864:20::535])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 953ffb19
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 19:34:30 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id t21so5167850pgl.3
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 11:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/n4Kk2+gDOhY8oYqMB4ujdCu0ozWYMBxU4UBjZFlMB8=;
 b=jtyWphd4dYWHurYRTxugYq7Lq73Gwtz+TMGRWN+tY3iT8YkX4wUdV/KSuESxFEbr9Q
 473C4UJbKMdkKcOKjLSHdKYrbyzPVzOqqZgxc09tHflwpg8saCBhddaKfyq8x11eGagO
 OkjfRts0B81aCgy3Xls3fmHkPYsCQZqOT7Gb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/n4Kk2+gDOhY8oYqMB4ujdCu0ozWYMBxU4UBjZFlMB8=;
 b=nDUv8IuaTbZOdxYRrDYsWcAKdi+X7aq0B0T630eREMQeGdu6VdsKkBKykiF0NaBuL+
 KDJnZoG5WExJf3IPFq/hVlEqR2ALXR24ipNCWa7YfM4Q/4/cz4VLL6PxeOYNwZHrC/TG
 34EW3tH2d6ScTwcAL8YvkGTgoVMtRtsmlDcLhIsKiojkPWK+4KmKCS2gZdkmrEq59xPP
 PKywvVk4q1A2Az7mPH1n+mqgUmilibfGAy+/3Sj+L7FrdEsAus4NKcB5QxaZxbzyWFKK
 jluv0cJaaXWdaXWLySMxouYZ7+V8U21i/wYL76YtUvlfM3Kx86CYymQEybUH3sMGS53F
 aKxw==
X-Gm-Message-State: AOAM533kQHMzUjZL5xKqBcymjr10D1SI1kk209TG3VkgKcYkaKfcwrWa
 zvz5bKpMSVpvlZonN9F+O2xaIYi8DWVsy/5VqRxKsQ==
X-Google-Smtp-Source: ABdhPJxUFjxlE6v0Oq+V6FruehNH97aPc5qxX9DgpPg7zc1JWfONXLZ8zrFhyR9e07XKsWUAUAY1bBCgO7nzQqYKo28=
X-Received: by 2002:a17:90a:9f46:: with SMTP id
 q6mr2478234pjv.126.1605814762990; 
 Thu, 19 Nov 2020 11:39:22 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
 <CALaUSuupA5bzEMb-NLRXVGy0n_nDWLoVVaDnU11e2iWmOO1RMw@mail.gmail.com>
 <CAHmME9qvj67wkqya20rq9ru4HEQeB=hjLYEp+Djs5ct0CV4SkA@mail.gmail.com>
 <CAHmME9q74TPPdOhrL67Zj23_8VxA75-ztd5VMGqyAob8XuD_TQ@mail.gmail.com>
 <CAHmME9pBVYY+eGzFtgZKY-1FfL8gVNJXAZ3PadtkyEsuUU55=A@mail.gmail.com>
In-Reply-To: <CAHmME9pBVYY+eGzFtgZKY-1FfL8gVNJXAZ3PadtkyEsuUU55=A@mail.gmail.com>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Thu, 19 Nov 2020 11:39:11 -0800
Message-ID: <CALaUSuvO4Tt4aa16BM0VihAqSBcKuF=Mxfo7m4Y5L2KkRurEkg@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

I ran WireGuard for Windows version 0.2.2 all day yesterday and I've
been running 0.2.3 today. Since the 0.2.2 release we've had no issues
with the update process.

If we run into any more issues we'll let you know. If you don't hear
back you can assume all is well.

Cheers!

Joshua Sjoding
SCJ Alliance
IT Specialist
www.scjalliance.com
On Wed, Nov 18, 2020 at 5:41 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Hi Joshua,
>
> A new version is now released, which should address all the issues you
> found. Let me know how things go...
>
> Jason
