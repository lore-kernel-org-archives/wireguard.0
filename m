Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 345bd3b4
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:09:44 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b16de93d
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:09:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18d6430c
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:09:44 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6d81ac7c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jan 2017 14:09:43 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id b126so482225962oia.2
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jan 2017 06:18:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
References: <CANA3KFU0THGCkVhCsEC4CMfoj394XetYZ_TebyFGTwYiDZ9cBg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 2 Jan 2017 15:18:24 +0100
Message-ID: <CAHmME9qS7ptMcCuvxcobi12hgfYdd4yYcOW5+D_uL6uOGq2f2A@mail.gmail.com>
Subject: Re: Built-in Roaming is limited due to a design fault adding STUN and
 TURN support would be good and make wire-guard connections more
 durable.
To: Peter Dolding <oiaohm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Peter,

That's a pretty bombastic and rambling way to put a simple point. I
believe you're conflating two different things. Let's break it down:

1. Dynamic IPs.
2. Both peers behind NAT.

With regard to dynamic IPs, the solution is to use a dynamic DNS
service, and simply use the DNS name as the endpoint. When you set up
the device after being disconnected, userspace will do the DNS lookup
to determine a current IP. When you're already connected to that IP,
WireGuard's roaming capabilities will automatically keep track of IP
updates.

With regard to NAT, this is where you want your STUN-like solution.
However, this does _not_ belong inside of WireGuard. This is where you
simply need some basic userspace utility to handle punching holes in
NAT/firewall, and then bringing up the WireGuard interface with the
discovered address/port. It's not that complicated. In fact, there was
already a substantial discussion about this on the list (did you check
the archives?), and I wound up writing a simple PoC utility for it:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching/README
It works well, though it of course needs work before it's
production-ready. Perhaps you could rewrite it to use your glib-based
libnice? Send an email here when you've got a github repo for
something like this, as I'm sure a few others on the list might
benefit from it too.

Jason
