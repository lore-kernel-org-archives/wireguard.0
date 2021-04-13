Return-Path: <SRS0=j77k=JK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63182C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 22:09:20 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78C4361220
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 13 Apr 2021 22:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78C4361220
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee390806;
	Tue, 13 Apr 2021 22:09:17 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f45837df
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Apr 2021 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618351752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nUXLO71XYamrEcvNslGHZ+W/+eNu3IzxJMlrHxuFDMc=;
 b=QLNtWMnJ4y6Xbr4AaF7xBiHF2bAgpA3HSqIaRheqfGZ+blt+XnjUtt/2eqzZrzPVDMyCM6
 prmZ9naLYleQC2fPIL2DzS6f/uIRS7p2zWYzaBmbCm0ch/XmVPpfKG0iLdT5fAi7Wc6O3S
 nJ4N5ZNo4cgvcKtjuyaFjh9ZLQnhIiE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8b8c130d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Apr 2021 22:09:12 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 82so19880360yby.7
 for <wireguard@lists.zx2c4.com>; Tue, 13 Apr 2021 15:09:12 -0700 (PDT)
X-Gm-Message-State: AOAM533ZGtbJXkpWNQ0q4JG5jsmwg/r5ZjFC9D3c9jcSLZXkQPb2I29+
 m/4HQ0bwjKmXKTwMURy4UZbFRlksPv98t+2By7E=
X-Google-Smtp-Source: ABdhPJzP90jsqqRW+G86DnMixZaAdAPTMLzEiRTixFXFje3xrp6cIgRqPVZ2WQnS3FbvhxVEWg87IJNrtWikoj9NI70=
X-Received: by 2002:a25:be09:: with SMTP id h9mr20483928ybk.239.1618351751786; 
 Tue, 13 Apr 2021 15:09:11 -0700 (PDT)
MIME-Version: 1.0
References: <6e259ab359c7f93f8f1119df0ba7b285cd4f53d1.camel@infradead.org>
 <CAOw_LSHa5aERnm8etcBywJV4QmW_9BesXvBYSvjKPVZ=a+whXg@mail.gmail.com>
 <26fc1c68fa495407b5c4c46a56abdb5dfe639280.camel@infradead.org>
 <CAOw_LSHbJ-SwNc8nqFC0KDrY+ah25gfLNyYQf83mb9sSO9=R8A@mail.gmail.com>
 <1f5dfe333c4e8d228773241cffadc9913d7829c7.camel@infradead.org>
 <a1bee48639cb40299118c53d4fa8fe7a@rozman.si>
 <fb3e80d74068cd8464c44f1cb435b71d1170c659.camel@infradead.org>
 <CAOw_LSGV8V9aLg-UdN4SE5s5o7NFfeyH+Q+mWMrvrBYp06aT=w@mail.gmail.com>
 <9940aef2c1064fc785b51ac860020a18@rozman.si>
 <38E774FD-16C8-4788-8C31-634A7AA4248A@infradead.org>
 <CAHmME9okm3CTc0Q9sEdQksaGuDS4DV3ceczQX+aSDH-K9R9YOA@mail.gmail.com>
In-Reply-To: <CAHmME9okm3CTc0Q9sEdQksaGuDS4DV3ceczQX+aSDH-K9R9YOA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 13 Apr 2021 16:09:01 -0600
X-Gmail-Original-Message-ID: <CAHmME9pupX_RtsfNEA0N4bSG44rQNzGYyt4cDWXMK495Bu43Dw@mail.gmail.com>
Message-ID: <CAHmME9pupX_RtsfNEA0N4bSG44rQNzGYyt4cDWXMK495Bu43Dw@mail.gmail.com>
Subject: Re: Allowing space for packet headers in Wintun Tx/Rx
To: David Woodhouse <dwmw2@infradead.org>
Cc: Simon Rozman <simon@rozman.si>, Daniel Lenski <dlenski@gmail.com>, 
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

On Mon, Apr 12, 2021 at 11:03 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Sorry I'm a bit late to this thread. I'm happy to see there's a
> prototype for benchmarking, though I do wonder if this is a bit of
> overeager optimization? That is, why is this necessary and does it
> actually help?
>
> By returning packets back to the Wintun ring later, more of the ring
> winds up being used, which in turn means more cache misses as it spans
> additional cache lines. In other words, it seems like this might be
> comparing the performance of memcpy+cache no-memcpy+cachemiss. Which
> is better, and is it actually measurable? Is it possible that adding
> this functionality actually has zero measurable impact on performance?
> Given the complexity this adds, it'd be nice to see some numbers to
> help make the argument, or perhaps reasoning that's more sophisticated
> than my own napkin thoughts here.

I've moved these improvements to this branch while we wait for
additional argumentation:
https://git.zx2c4.com/wintun/log/?h=sr/api-improvements
