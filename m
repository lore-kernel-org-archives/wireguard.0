Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 527b75b5
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 09:37:36 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8184dd09
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 09:37:36 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: George Walker <georgewalkeriv@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: The case for anycast (contra move semantics for unicast
 AllowedIPs).
In-Reply-To: <CAC92Z13zi6Gsq2CGwohZSEcF04Sa+m+WO3yCzWjXvn4DZuy-Rg@mail.gmail.com>
References: <CAC92Z13zi6Gsq2CGwohZSEcF04Sa+m+WO3yCzWjXvn4DZuy-Rg@mail.gmail.com>
Date: Fri, 20 Apr 2018 11:37:46 +0200
Message-ID: <87wox2xlp1.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Juliusz Chroboczek <jch@irif.fr>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

George Walker <georgewalkeriv@gmail.com> writes:

> Hi Jason, Juliusz, Toke, Dave, et. al.,
>
> A year ago we discussed Multicast addressing and the move semantics for
> allowedIPs.

Yeah, whatever happened to actually implementing that? :)

> Recently, I've been mulling over move semantics and their
> implication for WireGuard's support for anycast addressing.
>
> Unlike Multicast addresses, there are no designated address ranges for
> anycast: an anycast address is just a unicast address that's
> advertised in more than one place. As I understand it, the move
> semantics for allowedIPs preclude anycast addressing, as IP addresses
> can only be assigned to one peer at a time. This makes me wonder if it
> might be more correct to allow unicast allowedIPs to be assigned to
> more than one peer, treating them as anycast in that case.

That is not how anycasting works. You don't actually get more than one
path to an anycast address, and you don't duplicate any packets
(otherwise TCP would break, as you say). What anycast does is just that
it announced the same address in multiple places *at the control plane*,
and each router can then pick the closest path to that address and
install that one route in its data plane.

The AllowedIP configuration in WireGuard is the data plane configuration
(i.e., it corresponds to the kernel FIB). So supporting anycast at that
level doesn't make sense; you'll need to decide which peer gets your
"anycast" traffic. To the extent that anycast makes sense as a concept
at all on top of a VPN, you'd need to run some sort of control plane
(e.g., a routing protocol; there's a WireGuard GSOC that looks into
that) which would then configure appropriate AllowedIP configs into
wireguard.

> Also, if memory serves, move semantics account for a large proportion
> of the troubleshooting requests that show up on this list, suggesting
> to me that the status quo --elegant though it is!-- may not be
> especially intuitive.

This is probably a separate point that might be worth exploring further ;)


-Toke
