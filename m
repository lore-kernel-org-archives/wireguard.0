Return-Path: riccardo@rcrdbrt.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f7180d2
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 09:51:14 +0000 (UTC)
Received: from mail.rcrdbrt.com (rcrdbrt.com [45.32.6.71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f03d63c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Apr 2018 09:51:14 +0000 (UTC)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Thu, 26 Apr 2018 11:52:08 +0200
From: Riccardo Berto <riccardo@rcrdbrt.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Troubleshooting WireGuard connections
In-Reply-To: <CAHmME9o2QrKz3rC9-h0i0KJrzgXkPksogL_EkSSitYwahjXW0g@mail.gmail.com>
References: <628776a245ad4895630fd727c80e8bf1@rcrdbrt.com>
 <CAHmME9rFZMXcjZgFQBrZHDCbqmYT+MdBEJmS6f6=5=F-7nrJBA@mail.gmail.com>
 <33d0fd1f4c60919b98b50e2b9d04fe78@rcrdbrt.com>
 <2c17e7ba2590353afa04fc1619d726c2@rcrdbrt.com>
 <CAHmME9oFYswr1KjBGiP+2iMHDGYmZhpv_SovCMT3xxMMErK19A@mail.gmail.com>
 <9896807f0c6cbee1c7c99647a3c289cc@rcrdbrt.com>
 <f541248bfc8b47975b34acbc1c7bfa9b@rcrdbrt.com>
 <CAHmME9rtK1JvGs3JNYo4Jd9RPuTX9hx0cJy+a=7vEAJkVVa_ng@mail.gmail.com>
 <CAHmME9rDJT5bOJdUn_b9nrUgBbfUWYu2cpQXRhWuAHOGcVczsw@mail.gmail.com>
 <CAHmME9okxTTCUtnJxCL9ERF1mFQN7_CzN4dM-sOL3KC4J6uBvA@mail.gmail.com>
 <4135c3da139c0ca98fafc5fd20d11b18@rcrdbrt.com>
 <ec6ebd88a3bedf31a721b887b7a5fdf9@rcrdbrt.com>
 <CAHmME9o2QrKz3rC9-h0i0KJrzgXkPksogL_EkSSitYwahjXW0g@mail.gmail.com>
Message-ID: <19998b2a9837b44301c733a15fd63ad0@rcrdbrt.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2018-04-25 13:51, Jason A. Donenfeld wrote:
> Hi Riccardo,
> 
> We really should debug this in real time. Perhaps pop into #wireguard
> on Freenode?
> 
> Jason

I investigated the issue I was having with the 2 rpi3s and I finally got 
it working somehow (aka without knowing exactly what I did wrong).

I've just arrived in my hometown and accessed a rpi2 that runs the alarm 
system of my parents' house. I completely ignored the firewall and port 
associations, I just configured a new WireGuard interface with my main 
WireGuard hub as a peer and it worked flawlessly.

So I disabled the firewall on both the rpi3s, got someone to disable the 
port associations of my apartment's router and managed to get both the 
"randomly" working rpi3s to work in outgoing and incoming traffic! There 
was a HUGE warm-up delay, though:

rpi3 pi # ping 10.0.0.1
PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
64 bytes from 10.0.0.1: icmp_seq=238 ttl=64 time=98.8 ms
64 bytes from 10.0.0.1: icmp_seq=239 ttl=64 time=97.2 ms
64 bytes from 10.0.0.1: icmp_seq=240 ttl=64 time=97.3 ms
64 bytes from 10.0.0.1: icmp_seq=241 ttl=64 time=97.1 ms
64 bytes from 10.0.0.1: icmp_seq=242 ttl=64 time=98.1 ms
64 bytes from 10.0.0.1: icmp_seq=243 ttl=64 time=97.0 ms
64 bytes from 10.0.0.1: icmp_seq=244 ttl=64 time=97.2 ms
64 bytes from 10.0.0.1: icmp_seq=245 ttl=64 time=97.5 ms
64 bytes from 10.0.0.1: icmp_seq=246 ttl=64 time=97.1 ms
64 bytes from 10.0.0.1: icmp_seq=247 ttl=64 time=97.1 ms
64 bytes from 10.0.0.1: icmp_seq=248 ttl=64 time=97.2 ms
^C
--- 10.0.0.1 ping statistics ---
248 packets transmitted, 11 received, 95% packet loss, time 256349ms
rtt min/avg/max/mdev = 97.068/97.463/98.844/0.524 ms

This got solved somehow by the `PersistentKeepalive` feature.

I think the whole issue I was having was related to the firewall/port 
associations and systemd's services start order that sometimes was right 
and some other time wasn't, hence the randomly working peers. I really 
don't know what I did wrong on the firewall side, though. Maybe it was 
the port association thing that got my network confused.

Ending morale: if you happen to have multiple peers on the same network, 
be very well aware of what you are doing with the ports/firewalls.

I'm still having quite a lot of bad UDP checksums though, from every 
peer. But the whole network works fine so I should just ignore them, 
right?

Kudos to Jason for this awesome Virtual Private Network, I'm speechless.
