Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27e73a69
 for <wireguard@lists.zx2c4.com>; Wed, 7 Mar 2018 08:47:20 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31f26968
 for <wireguard@lists.zx2c4.com>; Wed, 7 Mar 2018 08:47:20 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Roaming between IPv4 and IPv6?
In-Reply-To: <CAKXLc7diB1tx9oHJ9JRio84wrrbEqPu7nLi7WAY83h9nqT0g4w@mail.gmail.com>
References: <871sgwna50.fsf@toke.dk>
 <CAHmME9oF2TUQiO=xCeoMD2ajbG+16netREXD3YCem=j7HmwkoA@mail.gmail.com>
 <87y3j4luw4.fsf@toke.dk>
 <CAHmME9ogYdW3AUUC6qQRkmq2ndEqk0MHxt0sVF=BKvdNQKZO3A@mail.gmail.com>
 <CAKXLc7diB1tx9oHJ9JRio84wrrbEqPu7nLi7WAY83h9nqT0g4w@mail.gmail.com>
Date: Wed, 07 Mar 2018 09:56:43 +0100
Message-ID: <87po4gl0vo.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Kalin KOZHUHAROV <me.kalin@gmail.com> writes:

> On Tue, Mar 6, 2018 at 11:14 PM, Jason A. Donenfeld <Jason@zx2c4.com> wro=
te:
>> On Tue, Mar 6, 2018 at 11:08 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
toke.dk> wrote:
>>> I think the idea of configuring both v4 and v6 on startup and caching
>>> them is a reasonable idea. Maybe even configure all available addresses
>>> when doing the initial DNS lookup? Or is that awkward to do?
>>
>> You mean taking one v4 and one v6? That's probably possible. Since
>> getaddrinfo has complicated ordering logic, this probably be best
>> expressed as something like "endpoint" and "secondary endpoint" when
>> told by userspace, with them then being swapped when the FIB complains
>> about trying to route to one of them.
>>
> A slight simplification/generalization will be to define a peer in
> terms of and ordered C-list of IP addresses (whether v4 or v6), 0 or
> more (currently 0 or 1 IP+port).

Yeah, this is basically what I meant: Resolve *all* A and AAAA records
of the configured hostname (for bonus points: get the port number from
SRV records), and stuff them all into the kernel, which will then use
all of them as possible candidates for connecting and use whichever
works (or do happy eyeballs, or something).

However, yeah, this is maybe a bit overkill, but could be a cool idea
for GSOC.

For a simple v4/v6 roaming fix, having one v4 and one v6 configured and
switching between them when the FIB state changes would probably
suffice. I think I would add a v6 preference, though; otherwise it'll
never roam back to v6 once it's on v4 unless the client connects to a
v6-only network.

So something like: If v6 FIB becomes routable, try the v6 address and
switch to that if it works; if v6 FIB becomes unroutable, switch to v4
address...

-Toke
