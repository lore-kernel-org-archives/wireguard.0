Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 02f0d250
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 19:46:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id becbf047
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 19:46:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f9198a5
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 19:46:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e515b450
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 19:46:10 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id f66so12512580oib.2
 for <wireguard@lists.zx2c4.com>; Fri, 27 Oct 2017 12:48:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <079f400c-a2ed-9f11-c8e1-a7a7da1074b9@createc.ro>
References: <fe5fcf1b-a7d1-6f6c-1561-4b1b1fa4e326@createc.ro>
 <079f400c-a2ed-9f11-c8e1-a7a7da1074b9@createc.ro>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 27 Oct 2017 21:48:01 +0200
Message-ID: <CAHmME9o-4CNR6TD10j1zzAt1VCR95xEs076AnbstxSto3CQYew@mail.gmail.com>
Subject: Re: wg-quick add_route
To: Lucian Cristian <luci@createc.ro>
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

Hey Lucian,

If you're using WireGuard for real purposes and not just for a quick
"turn it on turn it off" situation with a remote endpoint, then
wg-quick probably isn't the right tool for you. Instead, I think
you'll be better off just calling wg(8) and ip(8) normally.

The usage of WireGuard in general is supposed to be trivial enough
that you can script this without too much fuss. After all, wg-quick
itself is just a silly little bash script trivially wrapping some
common functionality.

I think if we go down the road of adding a nob for every possible
configuration, you'll wind up having to spend time learning about
which nobs map to which sequence of commands, which will be more
complex than just doing it yourself.

So, I think probably I wouldn't accept such a patch, and you'd be
better off just scripting 4 lines yourself:

ip link add wg0 type wireguard
wg setconf wg0 path/to/conf.conf
ip addr add 10.0.0.1/24 dev wg0
ip link set wg0 up

Especially if you're using rip+eigrp, you already know what you're
doing, and this shouldn't be too difficult for you.

I'm happy to bikeshed this if you'd like; other opinions are always
interesting. But my initial instinct is that needless complexity is
needless.

Jason
