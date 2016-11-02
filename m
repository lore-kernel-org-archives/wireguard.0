Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91aa1f9e
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:51:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d10604e
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:51:14 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abc4189e
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Nov 2016 10:51:14 +0000 (UTC)
Received: by mail-lf0-f45.google.com with SMTP id b14so9051641lfg.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 Nov 2016 03:52:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACpTwpEeP655i2KyxNzUHe7u9MHrvLsC2YMqpqvr44V3RTzg+w@mail.gmail.com>
References: <20161102103158.5305-1-Marc-Antoine@Perennou.com>
 <CAHmME9pN4bX=_8D6bKFV7bMJZpLHX_dmW68_fxLwuAarcKHY3w@mail.gmail.com>
 <CACpTwpE=YBt3FqyEvc-4dpL5Bn5E1Qrh_Rmt60RGS7d3ekDBug@mail.gmail.com>
 <CAHmME9r+TgFNfgCpZct9_WcgCfnx218dnSBvdQeq_q+BYuScbw@mail.gmail.com>
 <CACpTwpEeP655i2KyxNzUHe7u9MHrvLsC2YMqpqvr44V3RTzg+w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Nov 2016 11:52:18 +0100
Message-ID: <CAHmME9okXv55vgLkZw46b4xnu4_4vAHamTk+ez9Qo253U=yieg@mail.gmail.com>
To: Marc-Antoine Perennou <Marc-Antoine@perennou.com>
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

On Wed, Nov 2, 2016 at 11:45 AM, Marc-Antoine Perennou
<Marc-Antoine@perennou.com> wrote:
> On exherbo, everything (including the main arch) is cross compiled, so
> unprefixed
> toolchain is blacklisted, we use e.g. x86_64-pc-linux-gnu-pkg-config

Oh yea, I remember that. That's really awesome.

Okay, I committed something that does what you want in these two commits:

https://git.zx2c4.com/WireGuard/commit/?id=1ed544bd195b02ca59bab8e325e19e1e0567aa7c
https://git.zx2c4.com/WireGuard/commit/?id=adc0bf883c10c46ccea9cd934904c54faaf11a0d
