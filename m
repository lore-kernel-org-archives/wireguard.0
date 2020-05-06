Return-Path: <SRS0=yJRU=6U=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02C5CC28CBC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 21:38:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 605A320643
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 May 2020 21:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBGTdzo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 605A320643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e54457eb;
	Wed, 6 May 2020 21:25:01 +0000 (UTC)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22ea9867
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 May 2020 21:24:59 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id mq3so1640725pjb.1
 for <wireguard@lists.zx2c4.com>; Wed, 06 May 2020 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=wXG4Zm8YeQIc0+HbhOR/5e8OweeYfF4no2gzfMJFMu0=;
 b=iBGTdzo+pQQaoBiTeSOGq0ltnRijat1h9U6sENWD6J8X9z6KXCcBf+Cogy3P7eU/sM
 QmY/ORK5y93L2gXxNnMtsSafebJ8CJ/iTj/GvjqS0kTtqJ2YJFbnNXaAUYc5przB+cj9
 Z+wFY7I253fNT5xAv5D4yC1cibV88g2Tncy/mTrTzGdmZ2Lnn5+Z0Si1oOypJIU/fKrw
 3mS804nHgTSQmzX3q/DXURF1j7wZM+NqG+XWYY/DzxNsUSf6x3hUL3sRbRRadN9aoPZM
 zVcIcum4vc+JOSquidNXpr0Gj7hnLPDaAX2J8VvLmc11l2BkUNMfktH6zESRtspk+uNn
 Gzjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=wXG4Zm8YeQIc0+HbhOR/5e8OweeYfF4no2gzfMJFMu0=;
 b=JTbN13ZDVWeT1KWQGbeUxKX7Hd19kEtqaCLLex4KI0aDhOZ8Hxi8griBemaPtwUl8h
 HZGZkoe8QpskpP+rSlnGN3pcJ0duNE59Il2iyqTP88my7XcbgOlmWNDs9QlIwjESpYe9
 Z1zBL1/NYqoBlhLaELBn+l0DJc/t/WAuVNxquF1YUQHuNtrTKY1VFaV7OtDfkqq1AS0G
 aY2JRUK+PyGX9M0SR71MzXRlTZLAXAZ2/y9S3Z63fdZ5EWSvoie2xHxWjGsQPMYaohDV
 xjZIXejfHHnkLe+uC0m1mqKGTmwmrX4vN7Srgl7Lfr/DkkaiE+xV02/XFxoaVuhz+4zP
 p7CQ==
X-Gm-Message-State: AGi0PuaReZ7AwLYdv+o8sEglSRNYQmZpPkeYVDqlsBF1OZkiCJiQn8tt
 /VkRDPR1VuyXsIxpAls3fsOV9UvaDJNXeSTcPEE=
X-Google-Smtp-Source: APiQypIpBokRXeBPMETtHbNMilshAraBEzJ2oNmB53HJ0AFIThD53umVrCdVea0JhKOeqJ6IGQXSDERnITawFfh4FD0=
X-Received: by 2002:a17:90a:c702:: with SMTP id
 o2mr11491402pjt.196.1588801061007; 
 Wed, 06 May 2020 14:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAKmhVkoE_fL59VJqqXoGHX_S3E9+h=KwyNchWSBrEfPHrpNyoQ@mail.gmail.com>
 <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
In-Reply-To: <71c12e22-c7b6-9753-cc44-aac0f51592ff@pallas.us>
From: Mo Balaa <buddybalaa@gmail.com>
Date: Wed, 6 May 2020 16:37:29 -0500
Message-ID: <CAKmhVkrRbb_KncDjhM6gMcJRpCrK6WcB1Ed=WfVhScDHw96Gjw@mail.gmail.com>
Subject: Re: WireGuard over WireGuard
To: Derrick Lyndon Pallas <derrick@pallas.us>
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
Reply-To: buddybalaa@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Was hoping setting them both to automatic would just work; but after
some fiddling that appears to be the issue.

What is the optimal MTU for the inner WireGuard tunnel if the outer
one is set 1420?

Thanks

On Wed, May 6, 2020 at 12:59 PM Derrick Lyndon Pallas <derrick@pallas.us> wrote:
>
> Have you checked your MTUs? ~Derrick
>
>
> On 5/6/20 9:57 AM, Mo Balaa wrote:
> > We are running WireGuard over WireGuard. It appears to work well;
> > however I am noticing some applications struggle to work reliably.
> > Lots of failed page loadss / timeouts. Any pointers on how I could go
> > about debugging these issues?
> >
> > Any general pointers on running WireGuard over WireGuard? One note
> > about my deployment is that it uses socat to transparently proxy the
> > inner tunnel between devices.
> >
> > The setup looks something like this:
> > tunnel 1 (iOS) -> socat -> tunnel 0 -> Linux (tunnel 0) -> (tunnel 1)
> >
> > Thanks for the feedback.
