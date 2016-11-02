Return-Path: Marc-Antoine@perennou.com
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9152b0cb
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:45:02 +0000 (UTC)
Received: from mfilter6-d.gandi.net (mfilter6-d.gandi.net [217.70.178.135])
 by relay5-d.mail.gandi.net (Postfix) with ESMTP id 17F2C41C0D7
 for <wireguard@lists.zx2c4.com>; Wed,  2 Nov 2016 11:46:07 +0100 (CET)
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
 by mfilter6-d.gandi.net (mfilter6-d.gandi.net [::ffff:10.0.15.180])
 (amavisd-new, port 10024)
 with ESMTP id RuaCk6lmKdoT for <wireguard@lists.zx2c4.com>;
 Wed,  2 Nov 2016 11:46:05 +0100 (CET)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
 (Authenticated sender: sendmail@perennou.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id B894041C093
 for <wireguard@lists.zx2c4.com>; Wed,  2 Nov 2016 11:46:05 +0100 (CET)
Received: by mail-wm0-f54.google.com with SMTP id n67so28259481wme.1
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:46:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r+TgFNfgCpZct9_WcgCfnx218dnSBvdQeq_q+BYuScbw@mail.gmail.com>
References: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
 <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
 <CACpTwpE=YBt3FqyEvc-4dpL5Bn5E1Qrh_Rmt60RGS7d3ekDBug@mail.gmail.com>
 <CAHmME9r+TgFNfgCpZct9_WcgCfnx218dnSBvdQeq_q+BYuScbw@mail.gmail.com>
From: Marc-Antoine Perennou <Marc-Antoine@perennou.com>
Date: Wed, 2 Nov 2016 11:45:44 +0100
Message-ID: <CACpTwpEeP655i2KyxNzUHe7u9MHrvLsC2YMqpqvr44V3RTzg+w@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [PATCH] tools: allow better build system
	configuration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2 November 2016 at 11:42, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Okay, I thought that might be the case. That's the situation on Gentoo too.
>
> Secondly, why the pkg-config abstraction? When is it not called
> pkg-config and when is it not in PATH?

On exherbo, everything (including the main arch) is cross compiled, so
unprefixed
toolchain is blacklisted, we use e.g. x86_64-pc-linux-gnu-pkg-config
Supporting PKG_CONFIG env var seems like something quite common, as that(s
how the pkg-config autotools integration works, for example.
