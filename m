Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98a3f479
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:27:12 +0000 (UTC)
Received: from mail-ot0-f173.google.com (mail-ot0-f173.google.com
 [74.125.82.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb6e5698
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 10:27:11 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id u10so8850952otc.12
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 02:31:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Tue, 14 Nov 2017 11:30:56 +0100
Message-ID: <CAKXLc7efXWWg16XZtAEVCskG8hWWJj0ge+FDax-X5onR2AWU2Q@mail.gmail.com>
Subject: Re: Roaming Mischief
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Tue, Nov 14, 2017 at 10:59 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> The other approach would be to add an optional exclamation
> mark to the end of an endpoint specification
> (Endpoint=my.server.whatever.zx2c4.com:51820!), that would prevent
> servers from roaming; the client would still roam in the eyes of the
> server, but the server, would no longer roam in the eyes of the
> client. In other words, an option -- gasp, a nob! -- to disable
> roaming on a per-by-peer one-sided basis. As you know, I don't really
> like nobs. And I'd hate to add this, and then for people to use it,
> and then loose some nice aspects of roaming, if it's not really even
> required.
>
I have been wondering along those lines of roaming...
There are certain use cases that require no roaming at all, e.g. a
small set of servers that don't change IP.
Anyway, a somewhat limited "roaming" can be achieved via DNS/hosts, if
one trusts that system.

While seamless roaming is a feature you use often I guess, my personal
preference is to have it optional and explicitly specified, e.g. I
have a few mobile devices (laptop, tablet), that only talk to 1 (or
few at most) fixed IP (or DNS at least) "servers" (yes I know WG is
P2P) and via those to the rest of the fixed hosts. So in this scenario
(somewhat hard to achieve by {ip,nf}tables), I'd rather spec who is
talking to whom, who can roam, etc.

As for the syntax, and I hate to suggest that, adding a new option
(breaking compatibility) like "AllowRoaming=yes|1" with default
AllowRoaming=no is what I would like, instead of somewhat vague "!" at
the end.

Just my 2 (EUR) cents.

Cheers,
Kalin.
