Return-Path: <SRS0=vJ13=EZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAC8C388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 20:01:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1776322261
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 19 Nov 2020 20:01:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="dTC/h8sa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1776322261
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c297504;
	Thu, 19 Nov 2020 19:56:11 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ebf95e8e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 19:56:08 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c27137b
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 19:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=iVK9JEDm5AM2dhf+bxEm2kMM6VI=; b=dTC/h8
 saJubvzKddkO5sUYCOl94VLK31aKOtDc7uS20/Qa1tztqa1LoJEdvf9c7EEu0Ko0
 7X8QrzBe4O17U/dgY6g4Mq6Jhf6s+xSKCC6D9tLgyIp6ufoC2M1jCrV7H19TJxAD
 2YytfeK5bkxa9aGfiHhvtyOK9FCvyuRGySAhadKGYTf7L31HMJZGHYm/VylWQXpm
 Kv6FA3OZkb4HU4EuQeb8Tw07Tlik1NQgLgrvrPgnuK6f1tu0wvfQMrkqErF/ttPd
 qwH1ALf1WI7fQ0BDFC/Br5hy5zoIofiq8/mnC4Q6C47Gwrb2Syy+DUhV5r6fkusR
 AfJe+N1NbjWvcoTA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id dcac8efc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Nov 2020 19:56:54 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id w5so6338912ybj.11
 for <wireguard@lists.zx2c4.com>; Thu, 19 Nov 2020 12:01:02 -0800 (PST)
X-Gm-Message-State: AOAM533XgTkAWag0kjJZJ8BakJ6Mia6UfumZGcSbcuNqOmIfb2W/Lo3N
 uUdMJyGueClfD1Dr/cxXEvG6Pt/piTfWy2iDt5s=
X-Google-Smtp-Source: ABdhPJxHXSVAc++4g1noFTIJpL3ALX3AsbR7xuGSTfDPrEjPM0mOWKnK3W6BfS3W4YRR1ZbmrXu8ahJJcRRZVKm6P0Y=
X-Received: by 2002:a25:16c6:: with SMTP id 189mr13998619ybw.306.1605816062400; 
 Thu, 19 Nov 2020 12:01:02 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuvDgxsr99R2qiOrXM20btnvnaiyAx7197jfcTauOt5CTA@mail.gmail.com>
 <CAHmME9oeZc7cruN2fayu+F+8BO0RiwGuA+dqzQRr5spnvhY6GA@mail.gmail.com>
 <CALaUSuuzQhTcDE_b6PPf=fXuOjbmVf7Tgzdz9DbWMxCJ8-2WUQ@mail.gmail.com>
 <CAHmME9oZvNQjCoShdMTQ2n0soTA0wNVVm9rPFcma0fP-6_9tsw@mail.gmail.com>
 <CALaUSuupA5bzEMb-NLRXVGy0n_nDWLoVVaDnU11e2iWmOO1RMw@mail.gmail.com>
 <CAHmME9qvj67wkqya20rq9ru4HEQeB=hjLYEp+Djs5ct0CV4SkA@mail.gmail.com>
 <CAHmME9q74TPPdOhrL67Zj23_8VxA75-ztd5VMGqyAob8XuD_TQ@mail.gmail.com>
 <CAHmME9pBVYY+eGzFtgZKY-1FfL8gVNJXAZ3PadtkyEsuUU55=A@mail.gmail.com>
 <CALaUSuvO4Tt4aa16BM0VihAqSBcKuF=Mxfo7m4Y5L2KkRurEkg@mail.gmail.com>
In-Reply-To: <CALaUSuvO4Tt4aa16BM0VihAqSBcKuF=Mxfo7m4Y5L2KkRurEkg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 19 Nov 2020 21:00:51 +0100
X-Gmail-Original-Message-ID: <CAHmME9pqL8seHpkQwHP-Oh+cN4hZXsw7MGH++x3R_ELj7S25-Q@mail.gmail.com>
Message-ID: <CAHmME9pqL8seHpkQwHP-Oh+cN4hZXsw7MGH++x3R_ELj7S25-Q@mail.gmail.com>
Subject: Re: WireGuard for Windows failed to start after update to v0.2.1
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

On Thu, Nov 19, 2020 at 8:39 PM Joshua Sjoding
<joshua.sjoding@scjalliance.com> wrote:
>
> I ran WireGuard for Windows version 0.2.2 all day yesterday and I've
> been running 0.2.3 today. Since the 0.2.2 release we've had no issues
> with the update process.
>
> If we run into any more issues we'll let you know. If you don't hear
> back you can assume all is well.

Great to hear! Thanks for the update on the update.

Jason
