Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acce0657
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 09:10:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4af9ca4a
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 09:10:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60ea981c
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 09:01:32 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9ecc159
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 5 Mar 2018 09:01:32 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id c83so11516436oib.1
 for <wireguard@lists.zx2c4.com>; Mon, 05 Mar 2018 01:19:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
References: <41222FCF-F9F5-4FEC-AA71-73C48F4DA4BA@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 5 Mar 2018 10:19:35 +0100
Message-ID: <CAHmME9r95cjSXK8YitGuHxFp0EfrMKhQEGXL5Ux=rMXLt=U5FA@mail.gmail.com>
Subject: Re: Tunsafe Windows client for wireguard (not opensource yet they say
To: Henrique Carrega <hcarrega@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Henrique,

Thanks for posting this.

Please stay away from this software, and generally be wary of
closed-source WireGuard implementations trying to fill the void. This
one was written by a community-unfriendly proprietary author, and
we've got little way of ensuring protocol compliance or basic
security. Especially from my discussions from him, it's clear what
he's up to, and this seems like some nastiness. Should I spend my time
reverse engineering this software and discovering zero-days? Probably
not a good use of my time, despite my usual love of this sort of
thing.

One aspect of the WireGuard project is that we're taking development
very carefully and slowly, not jumping to premature releases, and
really studying every bit of what we produce in order to ship the
least-vulnerable and most-correct code we possibly can. We're still
shipping code -- it's not an approach that results in a complete
standstill -- but it does mean that in these intervening periods,
there will be propheteers and cowboys coming out of the woodwork to
fill the void.

It's quite easy to make a tiny tunneling protocol that's reasonably
fast and does a few things; if you look on Github there are hundreds.
It's quite another thing to write robust and secure software intend to
last for a long time. That's what we're working on here.

Fortunately we have two very nice projects that are rapidly
approaching maturity: one in Go and one in Rust. I fully welcome
future OSS authors into the project. When I'm back from visiting
family at the beginning of April, I think we'll be in a good place to
have a few first releases.

I'll also do what I can to see that people aren't peddling junk and
calling it wireguard, so as to reduce user confusion, but this of
course isn't a very easy endeavor. I'm open to suggestions on how to
approach this.

Regards,
Jason
