Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de3d2a4d
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 01:29:01 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efdbb616
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 01:29:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08aa4284
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 01:29:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f04939e3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 01:29:00 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id d5so13481045oti.3
 for <wireguard@lists.zx2c4.com>; Sun, 10 Dec 2017 17:36:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9owfe25ER4kS_jEOgMZO+eD5CZJnUqx1dz73k_z8VYYDg@mail.gmail.com>
References: <62f0dc7c-4eb4-523a-c548-ee2b2a6ec038@viisauksena.de>
 <CAHmME9owfe25ER4kS_jEOgMZO+eD5CZJnUqx1dz73k_z8VYYDg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Dec 2017 02:36:27 +0100
Message-ID: <CAHmME9pwMy=O+ZXJKFzosZmNxbjK+5dadnMQ7AX7wGggwO0N6Q@mail.gmail.com>
Subject: Re: [WireGuard] Header / MTU sizes for Wireguard
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Many people ask about the packet breakdown of WireGuard, and though
this is explained in [1] and [2], many find this ancient mailing list
thread, which now contains out of date information. So this email is
to bring the thread up to date, for folks who stumble upon it.

 The overhead of WireGuard breaks down as follows:

- 20-byte IPv4 header or 40 byte IPv6 header
- 8-byte UDP header
- 4-byte type
- 4-byte key index
- 8-byte nonce
- N-byte encrypted data
- 16-byte authentication tag

So, if you assume 1500 byte ethernet frames, the worst case (IPv6)
winds up being 1500-(40+8+4+4+8+16), leaving N=1420 bytes. However, if
you know ahead of time that you're going to be using IPv4 exclusively,
then you could get away with N=1440 bytes.

[1] https://www.wireguard.com/protocol/
[2] https://www.wireguard.com/papers/wireguard.pdf
