Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1ffa2a0
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:28:50 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6a6e6c9
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 20:28:50 +0000 (UTC)
Message-ID: <1513024581.24175.8.camel@gmx.de>
Subject: Re: Reading configuration from stdin
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 11 Dec 2017 21:36:21 +0100
In-Reply-To: <CAHmME9oozPm64FhRtTmohsTsghxYgeattRixbKo_bm9Ru9kNDg@mail.gmail.com>
References: <1512909832.1336.19.camel@gmx.de>
 <CAHmME9oozPm64FhRtTmohsTsghxYgeattRixbKo_bm9Ru9kNDg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, 2017-12-11 at 05:24 +0100, Jason A. Donenfeld wrote:
> I'd suggest the following for a WireGuard NetworkManager plugin:
> 
> 1. If you want to do stuff for wireguard-p2p, can you make it a
> separate "extra" plugin, so that the generic WireGuard one is
> globally
> useful? And then people who use the p2p stuff can use a separate
> plugin that piggybacks upon the first?
I can try. Should be easy to rip out the p2p stuff once it's done.


> 2. Write it in a language that will be accepted by upstream. I have
> no
> clue their thoughts on Rust.
No idea, either. However, I am not really a fan of writing GTK in C
(with all the manual reference counting and stuff). Let me first write
it in Rust and make it work. Then I can still port it back to C.

> 3. Rather than calling wg(8), maybe it's best to speak the Netlink
> API
> directly? I can give you a hand with this, if you want. The API is
> documented in this header:
> https://git.zx2c4.com/WireGuard/tree/src/uapi/wireguard.h
Not a bad idea, I think in the mid/long term I should do that!

> > Would it make sense (aka be secure) if we make it possible to call
> > 'wg
> > setconf wg0 -' so the wg tool does not read the configuration from
> > a
> > file but from stdin? Same for 'wg set wg0 private-key -' and 'wg
> > set
> > wg0 psk -'?
> 
> wg-quick(8) does this precise thing, and generally this is a fine way
> of passing config information. However, usually you can get away with
> using the more explicit /dev/stdin or /proc/self/fd/0, as Aaron
> suggested. Are there reasons to prefer - over /dev/stdin?
> 
> Jason
