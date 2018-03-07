Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcaaa731
 for <wireguard@lists.zx2c4.com>; Wed, 7 Mar 2018 00:22:00 +0000 (UTC)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
 [74.125.82.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb270b0c
 for <wireguard@lists.zx2c4.com>; Wed, 7 Mar 2018 00:22:00 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id g97so479571otg.13
 for <wireguard@lists.zx2c4.com>; Tue, 06 Mar 2018 16:31:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9ogYdW3AUUC6qQRkmq2ndEqk0MHxt0sVF=BKvdNQKZO3A@mail.gmail.com>
References: <871sgwna50.fsf@toke.dk>
 <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
 <87y3j4luw4.fsf@toke.dk>
 <CAHmME9ogYdW3AUUC6qQRkmq2ndEqk0MHxt0sVF=BKvdNQKZO3A@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Wed, 7 Mar 2018 01:31:05 +0100
Message-ID: <CAKXLc7diB1tx9oHJ9JRio84wrrbEqPu7nLi7WAY83h9nqT0g4w@mail.gmail.com>
Subject: Re: Roaming between IPv4 and IPv6?
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Tue, Mar 6, 2018 at 11:14 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
> On Tue, Mar 6, 2018 at 11:08 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@t=
oke.dk> wrote:
>> I think the idea of configuring both v4 and v6 on startup and caching
>> them is a reasonable idea. Maybe even configure all available addresses
>> when doing the initial DNS lookup? Or is that awkward to do?
>
> You mean taking one v4 and one v6? That's probably possible. Since
> getaddrinfo has complicated ordering logic, this probably be best
> expressed as something like "endpoint" and "secondary endpoint" when
> told by userspace, with them then being swapped when the FIB complains
> about trying to route to one of them.
>
A slight simplification/generalization will be to define a peer in
terms of and ordered C-list of IP addresses (whether v4 or v6), 0 or
more (currently 0 or 1 IP+port).
Then sending will try the first and move to the next, possibly adding
a "bad score", until one of the endpoint is reachable; then keep using
it until it fails again.
Those IP addresses may come from say A records of a certain host (this
is not WG land anyway), slapping a default port at the back.
Add a fat warning that the more unreachable IP addresses you add, the
more delays will be introduced.
(of course, to make things simple, a peer is defined as knowing the
secret key; changing IPs, and ports and allowed_ips does not matter)

Another GSoC idea, LoL.

Cheers,
Kalin.
