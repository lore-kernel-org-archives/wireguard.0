Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE330C43334
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jun 2022 15:58:34 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4feba9f9;
	Thu, 30 Jun 2022 15:56:56 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f898e669
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 15:56:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D08760FC3
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 15:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF40C341CB
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 15:56:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="gEKbgW+H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1656604609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G0pnffnj16mXjcRVGqXmVnyLf6LHutayunGQr1x9RuQ=;
 b=gEKbgW+HpEJWEkrszRlmVuseMKC17v+mEZX3vN1hImDfacQNYbtdrQGyTeHzCLYfraCOSC
 LJ5d0LOpU4hpfTYdDUyjRMyY1AnrsofpJgazdqM+GDs6uPlcc0hDfpymkgmJGNs11MJUSX
 o15tGWlRErdG5XLhnlrkc98SLZBZg8k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e29090d5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2022 15:56:48 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id a7so7580986ilj.2
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2022 08:56:48 -0700 (PDT)
X-Gm-Message-State: AJIora/r0yEKVdzkBard9ZXBW/oTZjUm8bD+SI4Gf7neBcomZp3xxtdR
 4apE6zbsLdnb0FG8E3S0vPvSaa2dnzXByDFUH5s=
X-Google-Smtp-Source: AGRyM1uj5TweGLGJQXLZM8+NpmJoe23t5ut7KXm4sMtHaIO0+mjT95RwKY7HUjR//xMJF+O1luDLx6xs/Iz0nQneLG4=
X-Received: by 2002:a05:6e02:1c0e:b0:2da:87c1:5f17 with SMTP id
 l14-20020a056e021c0e00b002da87c15f17mr5645296ilh.133.1656604608077; Thu, 30
 Jun 2022 08:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <23929467-11c2-cdf2-3841-2a837ba58b51.ref@yahoo.com>
 <23929467-11c2-cdf2-3841-2a837ba58b51@yahoo.com> <Yr2L9759Ek63KV1F@zx2c4.com>
 <dd586079-c81b-4715-e818-4cf7f0ddf4d8@yahoo.com>
In-Reply-To: <dd586079-c81b-4715-e818-4cf7f0ddf4d8@yahoo.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 30 Jun 2022 17:56:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9p2OYSTX2C5M0faKtw2N8jiyohvRqnAPKa=e7BWynF7fQ@mail.gmail.com>
Message-ID: <CAHmME9p2OYSTX2C5M0faKtw2N8jiyohvRqnAPKa=e7BWynF7fQ@mail.gmail.com>
Subject: Re: CONFIG_ANDROID
To: tlhackque <tlhackque@yahoo.com>
Cc: WireGuard Mailing list <wireguard@lists.zx2c4.com>
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

On Thu, Jun 30, 2022 at 5:53 PM tlhackque <tlhackque@yahoo.com> wrote:
> If you also want to make sure that the key isn't in memory longer than
> that time (e.g. to avoid capture on a dump or device loss), you could
> also set a timer (of the sort that wakes the CPU from sleep) that clears
> the key at that time.

Waking up the CPU some time later to clear a key sounds like a bad
waste of power. And such wakeup timers aren't universally available
and dependable. Plus, the last thing people want is having WireGuard
wake up your laptop from sleep while it's in your bag. You're now
proposing all sorts of terrible complexity, instead of the much more
simple and covers-all-real-practical-cases of "is it android or is it
not?" KISS.

Jason
