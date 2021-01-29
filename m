Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDA1C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:23:47 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86AB064D9E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 00:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86AB064D9E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75561c5d;
	Fri, 29 Jan 2021 00:23:43 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2386296c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 00:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1611879818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hj+wXykF/qybVOKaEWVLNJES5c9WB0qH1NNMO/C83Vs=;
 b=dPToHqWo8Lb09lOumd1bRRgp0ObBYEErjfeymcAN/QkJAZCunZgi2UodAhoT/oOVfV+99C
 wJLe8ltSWR9fAKmnAxcHNtsIDTVeWU2aRS5ES3zdR/OcWSsgHNvNiAWHN0DAGdD0Hw6qim
 yvzoBGri4a32rTAazFLKUtvtT7rW0Qs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ed112242
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 00:23:38 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id d81so7556153iof.3
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jan 2021 16:23:38 -0800 (PST)
X-Gm-Message-State: AOAM5322pLbcL61lblyilFIXvmqH/iWeAGfpAWIwS4rjVok5ALFhP6yk
 aeZaNXs1eE+V6F3BJgMqZUSKA9AAklfKDNAiq00=
X-Google-Smtp-Source: ABdhPJzPQqMlTGKnbjXstnZ5cdiQWOaHAght+/vwuII7t+91xK8eA8dq06lPGM6O4LqiWWUNmXv0yTkY9HiVC9/cceA=
X-Received: by 2002:a02:cf8c:: with SMTP id w12mr1532283jar.84.1611879817447; 
 Thu, 28 Jan 2021 16:23:37 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
In-Reply-To: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 29 Jan 2021 01:23:25 +0100
X-Gmail-Original-Message-ID: <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
Message-ID: <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
Subject: Re: WireGuard for Windows tunnel deactivation after prolonged
 resolution failure during startup
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

Hi Joshua,

Thanks for the bug report. Windows is usually all about heuristics.
Here's the current algorithm:

- If the system has booted within the last 4 minutes, it retries 40
times. Otherwise it retries 10 times.
- If the resolution fails with a temporary error, or if it fails with
a permanent error but there's no available internet connection, then
we sleep for 4 seconds and try again.
- If we try the 40 or 10 times over the 160 or 40 seconds and don't
succeed, then we fail and shut down the service.

It sounds like that set of heuristics isn't working out so great for
your use case. How long do those computers usually take to obtain an
Internet connection? If you could run some estimates on that, and come
up with some reasonable length of time ("not more than 3 minutes" for
example) then maybe we could just double that and make it the new
timeout? Or maybe you have a different idea?

Jason
