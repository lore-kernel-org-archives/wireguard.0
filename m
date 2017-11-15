Return-Path: markus.woschank@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 689ab3fc
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 18:33:57 +0000 (UTC)
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
 [209.85.218.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43038458
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Nov 2017 18:33:57 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id l138so6600780oib.7
 for <wireguard@lists.zx2c4.com>; Wed, 15 Nov 2017 10:38:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
From: Markus Woschank <markus.woschank@gmail.com>
Date: Wed, 15 Nov 2017 19:38:11 +0100
Message-ID: <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
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

+1 on restricting the peer endpoint in non-roaming mode.

Personally, i would even go so far as to make it the default - meaning
if one does not specify an endpoint roaming is enabled and if the user
explicitly specified the endpoints address to not not allow any other
IPs for that peer. Keep expectations (some, definitely I) have
consistent with the behaviour.
I don't see the point in allowing other IPs to connect if an endpoint
IP has been specified - more confusing then helpful IMO.

Anyway, I would be most happy with my personal favourite, but at least
having the option is better than not having it (nob).

Markus


On 14 November 2017 at 10:59, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Hey folks,
>
> WireGuard has been built with the general rule that unauthenticated
> data doesn't influence state. There has always been one exception to
> this: roaming. The source IP address when roaming is always
> unauthenticated, and replies always happen to the source that prompted
> the reply. This means there is all sorts of mischief you can do. I
> thought it might be useful to write down a bit of this mischief.
>
> If an active man in the middle modifies a source address, he can have
> reply packets sent elsewhere, for a very limited amount of time, until
> either the encapsulated connection is dropped or the key expires and a
> handshake is needed. This kind of disruption, however, isn't that much
> different from what an active man in the middle already can do, by
> just dropping packets, or generating packets, etc.
>
> If an active man in the middle modifies a source address to be a
> server he controls, which then relays encrypted packets between the
> destination and the original source, then the sender and receiver will
> communicate through this server rather than directly. The
> communication is, of course, encrypted and authenticated, so there's
> no chance of tampering. It's mostly then just a waste of bandwidth
> resources of the attacker, to have to relay all of these unreadable
> and unmodifiable packets. However, this does make it possible to
> _extend the duration_ of a man in the middle attack, even if the man
> in the middle can't do anything with the packets. For example, an
> attacker at a coffee shop could change the endpoints to his relay
> server; when you go home, you'd ostensibly still be using that relay
> server.
>
> Is this a meaningful attack? Does anybody care? Can this be used for
> something interesting? When it comes to security of these things,
> "probably" is usually a better answer than "no". For example, even
> though the attacker with the MITM relay can't read or modify any
> packets, he may still be able to do timing correlation attacks, if he
> controls many points on the Internet. But was WireGuard ever supposed
> to protect against correlation issues? Correlation issues already
> exist without the relay anyway. And for what it's worth, Tor doesn't
> really deal with that either. So maybe this doesn't really matter. But
> perhaps there are worse things one can do with this primitive. And
> perhaps there's even further mischief.
>
> There is a mitigating factor in this that further makes it mostly not
> a practical concern: people who are looking up their endpoints using
> DNS are likely to want requery that DNS entry based on its TTL (or
> sooner in the case of dynamic IPs), in which case this aspect of
> extending the duration of an active MITM mostly goes away. However,
> telling people to use DNS to prevent against something something
> doesn't really seem like comprehensive advice. But it is a mitigating
> factor worth mentioning.
>
> So there are two attitudes toward this mischief. The first is to just
> say it doesn't matter. WireGuard's crypto is resilient to all types of
> men in the middle, and the fact of extending the duration of a man in
> the middle doesn't change the fact that WireGuard's crypto is still
> resilient. The other approach would be to add an optional exclamation
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
> Regardless of which attitude we pick, I thought it might be a decent
> idea to write this down on the list. This is not really new -- roaming
> has been discussed in the literature for a long time now -- but it is
> interesting. And of course I'm interested to hear your thoughts.
>
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
