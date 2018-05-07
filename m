Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a41685d2
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 06:47:29 +0000 (UTC)
Received: from mail-oi0-x22f.google.com (mail-oi0-x22f.google.com
 [IPv6:2607:f8b0:4003:c06::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ef280c13
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 06:47:29 +0000 (UTC)
Received: by mail-oi0-x22f.google.com with SMTP id w123-v6so15193986oia.4
 for <wireguard@lists.zx2c4.com>; Sun, 06 May 2018 23:49:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
 <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 7 May 2018 08:49:27 +0200
Message-ID: <CAKXLc7dHZ3kjvgaFcEza80SJPZ-CEdu72DJOE5ny2cD4BX-z8Q@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I've written that yesterday, but forgot to post it, it was left in the Draf=
ts...
While some of the content was touched upon already, so I tried to edit
it to reflect the current state of this thread...

On Sun, May 6, 2018 at 3:21 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Sat, May 5, 2018 at 10:18 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 =
<vtol@gmx.net> wrote:
>> It would certainly instill more confidence in network security/control
>
> Why? Can you outline the threat model?
>
It is not exactly a "security model", rather that KISS or limit attack
surface, disable what is not needed principle.
Also it speeds up security audits :-) By (at least my) definition, a
security audit needs to check (at least) all exposed surfaces, so
reducing them at the core helps tremendously.

> As I mentioned earlier, to disable v6 socket creation, pass
> ipv6.disable=3D1 on the kernel command line, or just unload the v6
> module.
>
I tried both, without success... On a freshly booted box:
# dmesg |grep command
2018-05-06T08:33:34,000000+0200 Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz root=3D/dev/sda ro rootdelay=3D3 net.ifnames=3D0
ipv6.disable=3D1

# lsmod |grep wireguard
wireguard             141025  0
ip6_udp_tunnel          1367  1 wireguard
udp_tunnel              1859  1 wireguard
ipv6                  253477  1 wireguard
# lsmod |grep -P "ipv*6"
ip6_udp_tunnel          1367  1 wireguard
ipv6                  253477  1 wireguard

# rmmod ipv6
rmmod: ERROR: Module ipv6 is in use by: wireguard
# rmmod -f ipv6
rmmod: ERROR: could not remove 'ipv6': Resource temporarily unavailable
rmmod: ERROR: could not remove module ipv6: Resource temporarily unavailabl=
e

Hmm... Oh yes, on that kernel I forgot to enable
CONFIG_MODULE_FORCE_UNLOAD  ... oh yes, will retest later.

Well... so, this does disable listening on udp6 socket though `netstat
-unelp|grep udp6` :-)

But it does load ipv6 and ip6_udp_tunnel anyway without needing them appare=
ntly.

For a real security and ipv4-only box, I will not compile the ipv6
stuff at all, but I often try to keep same kernel config for boxes
that do use ipv6 and those that don't.
And as mentioned already, there are use cases where one wants to
enable some services on ipv4 others on ipv6 and some on both (and I
thing of WG as a service in the broad sense).

>> Which brings up the next point, I have asked previously twice about -
>> wildcard ip 0.0.0.0 . How to bind WG to a particular iface/subnet, as  a
>> another matter of network security?
>
> Why is this a matter of network security? WireGuard will ignore
> packets that don't have the correct authentication tag. If you're
> receiving authentic packets, you're receiving authentic packets, and
> the origin shouldn't matter, in terms of the packets' authenticity. In
> other words, if an attacker has stolen a private key, this is the
> problem to address.
>
Well that is true in the simplest of scenarios - trust a box
ultimately (box has private keys, not "user").
May be I want to detect/prevent when some network changes (box gets
moved, stollen,  BGP hacked, etc.).
Hard thinking of an example...
I trust (the voice of) of my friend calling me from his registered
phone, but will do additional "checks" if s/he suddenly calls me from
unknown phone or my parents' house number...
(and yes numbers can easily be spoofed, as well as IP addresses)

> Anyway, regardless of this, if you want to filter
> out packets coming from a certain interface, a certain subnet, or any
> other characteristics, use netfilter and make these preferences
> explicit in your rules, rather than the implicit details of listening
> sockets.
>
Well, again it is a choice of complexity. If one wants
defense-in-depth, it is better to be able to control it at the source
as well.
Of course, this will add complexity by definition, but should at least
not affect default case.

I know there are 10, LoL, types of users:
* those who want everything to "just work, don't care how, and of
course be secure"
* the security freaks, who want something to work if and only if they
enabled it (and spent some time learning the technology) and does only
what it is configured to and nothing extra

Keeping both camps happy is a _hard_ task, if at all possible. One
step forward, that usually works, is for one camp to show working code
that the other camp is not turned off by.

Disclaimer: I am professionally squished into the 10nd camp :-^D

Cheers,
Kalin.
