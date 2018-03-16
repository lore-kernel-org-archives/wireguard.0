Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe60f91c
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:01:53 +0000 (UTC)
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
 [209.85.214.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 492064f5
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 02:01:53 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id w63-v6so294455ita.3
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 19:12:27 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com.
 [209.85.214.49])
 by smtp.gmail.com with ESMTPSA id n123sm3806249itb.31.2018.03.15.19.12.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Mar 2018 19:12:25 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f49.google.com with SMTP id z143-v6so629438itc.0
 for <wireguard@lists.zx2c4.com>; Thu, 15 Mar 2018 19:12:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
References: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
 <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
 <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Thu, 15 Mar 2018 22:12:25 -0400
Message-ID: <CAK_h9uEWM_VjQj_WHeFAqimTybJZFTxARZ_pK389FnBToRtxzw@mail.gmail.com>
Subject: Re: Allowed IPs Toggling
To: Steve Gilberd <steve@erayd.net>
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

Allowed-ips plays a variety of roles which at different times can be
mapped to several traditional network roles but one it doesn't really
play the role of routing table. Instead they act as a forwarding
information base for the wireguard interface matching ip addresses to
peers. Wireguard then makes forwarding not routing decisions based
upon this "FIB". Since it is acting as a FIB at any given time it can
contain only a single destination for any given entry.

If you want support for things like equal cost multipath (something
that will never be possible over peers on the same interface), route
failover and metric weighted routing than a routing process must get
involved to make the routing decisions, populate the routing table and
then manage entries in the "FIB" based upon the routing table. As it
stands today there are not, at least not readily publicly available,
any routing processes which can interact with WireGuard to do so. This
is why today to do any sort of dynamic routing with wireguard the
peers involved need to be assigned to different interfaces and
allowed-ips on them set to 0.0.0.0/0 or the total subset of ip
addresses which might ever traverse a peer under any routing
situation. Existing routing processes can then just treat them as
traditional interfaces and not worry about updating the "FIB".

On Thu, Mar 15, 2018 at 2:39 PM, Steve Gilberd <steve@erayd.net> wrote:
>> Allowed IPs is like a routing table; you can't have two routes for the
>> same set of IPs
>
> If this is the case, then wireguard does not have proper routing support.
>
> Normally, routing tables allow both multiple and overlapping routes prese=
nt.
> When making routing decisions, the most-specific route is chosen (e.g. a =
/29
> is higher priority than a /24 which overlaps with it). If there are two
> identical routes of the same size, then the one with the lowest routing
> metric is used.
>
> I can understand not allowing identical routes of the same size, as
> wireguard doesn't really have a concept of metric (although it could be
> useful for backup links). However, it really should allow overlapping rou=
tes
> of different sizes. There's no ambiguity with routing decisions, and it's=
 a
> standard feature that I would normally expect any IP routing stack to hav=
e.
>
> Cheers,
> Steve
>
>
> On Fri, 16 Mar 2018, 04:57 Samuel Holland, <samuel@sholland.org> wrote:
>>
>> Hello,
>>
>> On 03/15/18 10:31, Gianluca Gabrielli wrote:
>> > I was setting two peers on the server, but every time I re-add one of
>> > these
>> > two the other one is shown with (none) on "allowed ips" field. Of cour=
se
>> > that
>> > blocks communications with that peer. If I try to re-add it, then the
>> > other
>> > peer loses its configuration, same problem.
>>
>> Allowed IPs is like a routing table; you can't have two routes for the
>> same set
>> of IPs, or WireGuard doesn't know which peer to send the traffic to. You
>> want to
>> have non-overlapping Allowed IP ranges. This usually means that the rang=
e
>> of
>> Allowed IPs is smaller than the host's subnet. For example:
>>
>> Host A:
>> IP configuration for WireGuard interface: 192.168.123.1/24
>> Allowed IPs for Host B: 192.168.123.2/32
>>
>> Host B:
>> IP configuration for WireGuard interface: 192.168.123.2/24
>> Allowed IPs for Host A: 192.168.123.1/32
>>
>> The IP configuration tells the kernel which IP ranges are accessible via
>> the
>> WireGuard interface. The Allowed IPs tell WireGuard, which _subset_ of
>> those IPs
>> is associated with each peer.
>>
>> > Cheers,
>> > Gianluca
>>
>> Cheers,
>> Samuel
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
> --
>
> Cheers,
>
> Steve Gilberd
> Erayd LTD =C2=B7 Consultant
> Phone: +64 4 974-4229 =C2=B7 Mob: +64 27 565-3237
> PO Box 10019 The Terrace, Wellington 6143, NZ
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
