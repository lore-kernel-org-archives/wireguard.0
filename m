Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a7c833e
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 00:56:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1483091e
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 00:56:35 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 075072d4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 00:56:35 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id q132so86750759lfe.3
 for <wireguard@lists.zx2c4.com>; Fri, 01 Jul 2016 17:59:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <abcdfe33-f758-fa4d-b886-596373480187@viisauksena.de>
References: <abcdfe33-f758-fa4d-b886-596373480187@viisauksena.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 Jul 2016 02:59:33 +0200
Message-ID: <CAHmME9qcE165HNmAmTeMTx7dRNrhgzRmkXV_9qPrYVHQLN5VaQ@mail.gmail.com>
To: jens <jens@viisauksena.de>
Content-Type: text/plain; charset=UTF-8
Cc: kontakt <kontakt@freiburg.freifunk.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fastd comparison wireguard ?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jens,

I have read fastd, and I think it's a neat project. I thought it was
cool to see it using FHMQV-C; WireGuard is based on Noise, which in
turn was heavily influenced by the [F]HMQV family. Fastd is a lot more
complex than WireGuard, and does a lot more -- cipher agility, layer 2
-- things that WireGuard has deliberately left out. Fastd has also
been around longer, and they actually have a release >= 1.0 (18!),
whereas WireGuard is still in an unreleased experimental phase.
Generally fastd looks cool. I haven't audited their code thoroughly,
so I can't speak to the code quality, implementation security status,
or crypto particulars.

WireGuard will definitely be faster, by virtue of being in kernel
space and possibly other general performance improvements, and I think
you might benefit from the simplicity of WireGuard too. If you're
using OpenWRT, I think a package for there is in the works, and the
package maintainer will probably inform the list when it's ready. Keep
in mind that WireGuard is experimental, but if you would like to try
it out, I'd be very interested to learn your experience with it --
what worked, what didn't, the performance characteristics, and so
forth. We're a new project here, so feedback like that is very useful
for shaping our direction.

Keep me posted!

Jason
