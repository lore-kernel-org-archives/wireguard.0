Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73243C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 14:36:06 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B83964F06
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 14:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B83964F06
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea691404;
	Thu, 25 Feb 2021 14:36:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bea5977d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 14:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614263756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GZqecAxVNgko9KXJnUTSghIjR+flVr/q8qBZZs8Yuc0=;
 b=Q8DHOHIJb6F5S6NcP91MmYYN1Lwe1nSHNoZtHCqBHbkJdticXJNJgJC9YCx3GxBEeLXodK
 ffZXSCns78o/UcB5AmzCnuMBWq8UjS+LzV+V1i/L2SqXBlsJQNGjbdhlQfNoIULrkKy2NY
 z6TYNOlRqNhIJcaKfx+uSr76qWLiGYk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7ff392b3
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 14:35:56 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 133so5597296ybd.5
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 06:35:56 -0800 (PST)
X-Gm-Message-State: AOAM531pjNqpU5vMH70DnC7dAxACETmvno6il/iePZOvgrBY59uuj4xs
 eVJdQdlKFD5Hcv6KrCDtiQ7tyQouayNy5lo53a8=
X-Google-Smtp-Source: ABdhPJwfDzQ5MccUqWb7kWEd+InMKc6uNkr9jDtPIes0hbpb//1vzrYJ1B5lGEtqEZ6mxwcjGwYDLnmx2BiWF3mywiQ=
X-Received: by 2002:a25:2d1f:: with SMTP id t31mr4692373ybt.239.1614263756070; 
 Thu, 25 Feb 2021 06:35:56 -0800 (PST)
MIME-Version: 1.0
References: <CAEK8JBCS9gUXFRFpBS5pns_BZ_fKWHPV3+VrxtqEpt4kA0m1Vw@mail.gmail.com>
 <CAHmME9oj6v43HtVHFh7fwUT4WO7bpDsAMq-9eLREWStoEJcJRA@mail.gmail.com>
 <CAEK8JBCg94R_AgrS6ek7DEUjEiCGFE4M3utipCRDLj5VUQa0vA@mail.gmail.com>
In-Reply-To: <CAEK8JBCg94R_AgrS6ek7DEUjEiCGFE4M3utipCRDLj5VUQa0vA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 15:35:45 +0100
X-Gmail-Original-Message-ID: <CAHmME9rKdyBq-Ky1jwnUuE4vzbqES2H_J=QnnfB45ifQ0mjTGw@mail.gmail.com>
Message-ID: <CAHmME9rKdyBq-Ky1jwnUuE4vzbqES2H_J=QnnfB45ifQ0mjTGw@mail.gmail.com>
Subject: Re: Windows 10 has poor bandwidth when using wireguard
To: Feng Li <lifeng1519@gmail.com>
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

Hi Feng,

Great to hear!

You wrote:
> In the LAN environment, the download speed is 40MB/s through WIFI to access the peer.
> When the wireguard starts, the speed is down to 8MB/s.
And now:
> The speed is up to 25MB/s, 2x faster than the previous version.

So new speed is 3.125x old speed.

I'll keep thinking about the problem space and try to get us up to the
full 40MB/s.

Jason
