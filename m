Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3055337a
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:33:02 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 69de2442
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 Dec 2016 18:33:02 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Multicast over a wireguard link?
References: <87fuli7itj.fsf@toke.dk>
 <CAHmME9o-0qccmg2zbM62fhi_KuEjtDoXZfBFPtf3yyhUKwtfiA@mail.gmail.com>
 <8737hiqx9k.fsf@toke.dk>
 <CAHmME9q2NOxMFptThz8boPSg4feTX92BHSge==zzjk3xDa0BrA@mail.gmail.com>
Date: Tue, 20 Dec 2016 19:40:06 +0100
In-Reply-To: <CAHmME9q2NOxMFptThz8boPSg4feTX92BHSge==zzjk3xDa0BrA@mail.gmail.com>
 (Jason A. Donenfeld's message of "Tue, 20 Dec 2016 19:22:40 +0100")
Message-ID: <87y3zaphq1.fsf@toke.dk>
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

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Tue, Dec 20, 2016 at 7:19 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@t=
oke.dk> wrote:
>> Can wireguard handle routed traffic to an endpoint. I.e. if endpoint A
>> has address 10.0.0.1/32 and endpoint B has a route 'ip route add
>> 10.10.10.1/24 via 10.0.0.1 dev wg0', would the traffic go where it's
>> supposed to?
>
> The `via` isn't relavent, since that only functions to determine which
> device to send it out of. All the ordinary routing table will do is
> direct it toward wg0. Once it hits wg0, then the allowed-ips entries
> are consulted to see where to send it (the "cryptokey routing table").
> See sections 2 and 3 of [1].

Right, but that means that even if multicast is added, a routing
protocol won't be terribly useful, since it can't tell wireguard which
subnets lives behind which peers. What I would need is to be able to
assign /32s (or IPv6 lladdrs) to the interface for each peer, and have
the kernel routing table determine which subnets should go to each of
those. My hope was that wireguard could then figure out where to send
the packet from the /32s (which would be in the wireguard config,
presumably).

-Toke
