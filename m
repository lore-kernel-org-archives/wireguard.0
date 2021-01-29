Return-Path: <SRS0=P56g=HA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16487C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 01:05:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B3F64DF1
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 29 Jan 2021 01:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B3F64DF1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=scjalliance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e74df4fb;
	Fri, 29 Jan 2021 01:02:19 +0000 (UTC)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c92fa154
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Jan 2021 01:02:18 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id u4so5425239pjn.4
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jan 2021 17:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=scjalliance.com; s=g5;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AuhaQpPngPsUD+m7ijA4PkPWpqKPvtKfBrYPiVL6YRg=;
 b=ZFIUCtOKOEWSJl053h45SOVhzZl3n+Ewb1K8KyxJuQgCRli3ftvGr1qjKGvv8wAy3A
 KwEDPLA3pVrAJggVpjFZqRcN4e4RqUqV0hah6AjDJfWMPCdDmY6vfKQ1Bv/qKv9v0itx
 UqukuE2U+R3JhhJwv/M2mco1gpv0V5UdDjpbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AuhaQpPngPsUD+m7ijA4PkPWpqKPvtKfBrYPiVL6YRg=;
 b=G2zuCMnrAGLHEIAKYexlNoDRehGFtnrMkg6kTa9tD21MIBvvtgNxsTtK8xCqtXAbEe
 ngJ+xsA/uzW6eP/2VM12gppnfpkN7SOafQ1kRKvgDUspQMyMt+eMVJcLjGf60gVQ1DRZ
 usj3au8um/f9tzqDf85ZWbSbRJXxIHCzjwr89W0G8mcpOtr2v5r+74U5xNSLLw/UJLmq
 J0FVE2yzbSnU5aDVhvqKHsM/xPwgqcfbvp5vFfVI3xLAk2hcgTR2v2TJWu/H9HAOYcqP
 8rgxdn2XcWxz4vA+tO3ZZ06iLhh5Q0OFruqOm3X+4qr/E00A6X4qwBMCLx5dTS/04rze
 XcfA==
X-Gm-Message-State: AOAM531w2NH6DOGrta7X+VAAAIxvWDHb2K/zyxrPXMU1p3+6orbSXm4R
 TcA5LOk2rUlLqemEKfO1fvH4BfZFHd6t7tuIa25x8qVyiJyR4syw
X-Google-Smtp-Source: ABdhPJzvxdVxGqor2NK52bwMChMciq6pnMoC9Bq4Y4ca4gXHk8mc6OutJdkebUaE0BIYTJjPANjYjgqGMXwNnzIXQp8=
X-Received: by 2002:a17:902:b18c:b029:da:fc41:baf8 with SMTP id
 s12-20020a170902b18cb02900dafc41baf8mr2043554plr.58.1611882135716; Thu, 28
 Jan 2021 17:02:15 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuuB=+ZDTsTaVs-pswd6fsu6CvZgO4b76HPGQZmwxssN0w@mail.gmail.com>
 <CAHmME9q5a1MVUQU3Hr=T32pjoW-=Hz+KyoBvvKgLgwQwWNoCYw@mail.gmail.com>
 <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
In-Reply-To: <af71a4b2-989a-da04-2fa6-9467ec58997f@pineview.net>
From: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Date: Thu, 28 Jan 2021 17:02:04 -0800
Message-ID: <CALaUSusBmLSAE3rYavFtEW5Bp+KoRVLfKFXga7Po+46KSGPbhg@mail.gmail.com>
Subject: Re: WireGuard for Windows tunnel deactivation after prolonged
 resolution failure during startup
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

Someone could power the laptop up but wait hours before they connect
it to their hotspot. For scenarios like that the current algorithm
seems insufficient.

My preference would be to listen for network changes while in a failed
state, then re-run the existing algorithm whenever a network
connect/disconnect occurs. This wouldn't cover cases where the
upstream ISP is having trouble, but it would probably be a big
improvement for us.

The best way to detect network changes on Windows is open for debate.
We've had great success with scheduled tasks that listen for events
10000 (connect) and 10001 (disconnect) in the
"Microsoft-Windows-NetworkProfile/Operational log" event log:

<QueryList><Query Id='1'><Select
Path='Microsoft-Windows-NetworkProfile/Operational'>*[System[(EventID=10000
or EventID=10001)]]</Select></Query></QueryList>

I don't know if that's helpful. There probably are better ways to
detect network changes, that's just what I've got off the cuff.

Joshua Sjoding
SCJ Alliance
IT Specialist
www.scjalliance.com


Joshua Sjoding
SCJ Alliance
IT Specialist
o. 360.352.1465, ext. 134
www.scjalliance.com

This communication may contain privileged or other confidential
information. If you have received it in error, please advise the
sender by reply email and immediately delete the message and any
attachments without copying or disclosing the contents. Thank you.


On Thu, Jan 28, 2021 at 4:39 PM Mike O'Connor <mike@pineview.net> wrote:
>
> Hi Jason
>
> I'm not a windows users so can not test, but it seems to me that
> Microsoft have API's to indicate the network status.
>
> This to indicate if there is a connection
> https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetgetconnectedstate
> This to indicate if there is route-able service. It seem this is
> deprecated for windows 10.
> https://docs.microsoft.com/en-us/windows/win32/api/wininet/nf-wininet-internetcheckconnectiona
> There is reference to a win10 version, in the notes.
>
> Not sure if this helps
>
> Cheers
> Mike
>
>
> On 29/1/21 10:53 am, Jason A. Donenfeld wrote:
> > Hi Joshua,
> >
> > Thanks for the bug report. Windows is usually all about heuristics.
> > Here's the current algorithm:
> >
> > - If the system has booted within the last 4 minutes, it retries 40
> > times. Otherwise it retries 10 times.
> > - If the resolution fails with a temporary error, or if it fails with
> > a permanent error but there's no available internet connection, then
> > we sleep for 4 seconds and try again.
> > - If we try the 40 or 10 times over the 160 or 40 seconds and don't
> > succeed, then we fail and shut down the service.
> >
> > It sounds like that set of heuristics isn't working out so great for
> > your use case. How long do those computers usually take to obtain an
> > Internet connection? If you could run some estimates on that, and come
> > up with some reasonable length of time ("not more than 3 minutes" for
> > example) then maybe we could just double that and make it the new
> > timeout? Or maybe you have a different idea?
> >
> > Jason
>
>
