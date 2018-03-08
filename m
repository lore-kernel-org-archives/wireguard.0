Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dcaada18
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:13:49 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdc8cf00
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 17:13:49 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Another roaming problem
In-Reply-To: <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
Date: Thu, 08 Mar 2018 18:23:23 +0100
Message-ID: <87h8pqlbw4.fsf@toke.dk>
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

> On Thu, Mar 8, 2018 at 5:59 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>>> and so I wonder if a simpler solution would also
>>>involve NAT -- namely, configuring "hair pin" NAT?
>>
>> What's that?
>
> It's the terrible vendor term for hitting the gateway through one of
> its IPs (say, the public one) and having it forward packets for you to
> another machine on the same LAN. The idea here, being, you'd get to
> keep using the same IP address for communicating, even when you're
> behind NAT in the private network. (This seems to work well for me at
> my house.)
>
> Wikipedia describes it in terms of the p2p discovery issue, which is
> slightly different, but still the same underlying concept:
> https://en.wikipedia.org/wiki/Hairpinning

Ah, right. In that case I think I probably didn't explain my setup well
enough. Let me try again:


I have a gateway device with two interfaces, one public and one private.
This device performs NAT, and is also the one running wireguard (as the
'server'). The client roams. So I have two cases:


C (public IP) --- (public IP) GW (private IP) -- [LAN]

In this case, C talks to GW on GWs public IP; everything works fine.

Second case:

[internet] --- (public IP) GW (private IP) -- [LAN] -- C (private IP)

Here, C talks to GW; it still tries to send packets to the public IP of
GW (because that is what it's configured to do), but because GW sees
that the source IP is on its internal subnet, it replies with a source
address in the private subnet. This works fine as long as the client is
on the LAN; but once it roams outside, it now thinks that the wireguard
server lives on the private IP of the GW, which is obviously can't reach
from its shiny new public IP.

So what I'd want to happen is that GW should keep using its public
IP as the source of the wireguard packets, even when talking to a client
on a directly-connected internal subnet. Or, alternatively, that C
should ignore the source address change of the packets coming from GW
and keep sending its packets to the public IP it was first configured to
use...

This is all orthogonal to NAT, as far as I can tell :)

-Toke
