Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a557f883
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 10:57:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 209a2d5a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 10:57:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1bf03724
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 10:48:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 47275962
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 10:48:53 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id a7so13668924otk.9
 for <wireguard@lists.zx2c4.com>; Mon, 12 Feb 2018 03:04:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180212074255.GB5305@tuxmachine.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
 <20180212073501.GA5305@tuxmachine.localdomain>
 <20180212074255.GB5305@tuxmachine.localdomain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Feb 2018 12:04:19 +0100
Message-ID: <CAHmME9pvBg3OHLwun3uqdoCqmQBxxmwh1y2jxWUcdOKyZynNsA@mail.gmail.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey Baptiste,

On Mon, Feb 12, 2018 at 8:42 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Actually, now that I talk about it, it's not 100% true: on this system,
> there is a second wireguard interface that is not currently used (it's
> provisionned to connect a future router that is not yet deployed).
>
> The interesting part: this interface has a single peer which has no
> endpoint but a persistent keepalive.

That's a super useful observation! I'm guessing this will fix it:
https://git.zx2c4.com/WireGuard/commit/?id=c5c22fb9bad1807a612b6055e0049d68f4600605

I'm still analyzing everything to find other places where I might have
missed something, but hopefully the above does it.

Jason
