Return-Path: dave.taht@gmail.com
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
 [209.85.214.67])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89ba93cf
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 23:17:16 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id x131so551730ite.3
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 16:24:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
 <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
 <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
From: Dave Taht <dave.taht@gmail.com>
Date: Mon, 29 Aug 2016 16:24:05 -0700
Message-ID: <CAA93jw64Uo+pV+ZoS3W4m8rx4+WOrjdnCtiTYr37dU54bHyhBg@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] fq, ecn, etc with wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Aug 29, 2016 at 2:00 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
>> Nice to see you so quickly being productive. I am still constructing a
>> reply to your previous message.
>
> Awaiting it's arrival :)
>
>> In re-reading over your message, I think not dropping the packet when
>> there is an outer CE marking and no ecn enabling in in the inner
>> packet is probably the right thing, by Postel's law, if not, by the
>> RFCs.
>
> Vxlan, geneveve, ipip, and sit all log & drop for the last condition.
> Xfrm (IPsec) does not.
>
> The RFCs seem to indicate that it should be dropped though. Check out
> the function here, used by vxlan, geneveve, ipip, and sit:
>
> (A) https://git.zx2c4.com/linux/tree/include/net/inet_ecn.h#n166
>
> IPsec uses this much shorter function here, on which I've modeled mine:
>
> (B) https://git.zx2c4.com/linux/tree/net/ipv4/xfrm4_mode_tunnel.c#n18

Then by all means follow the existing latest code.

Postel is long dead, and the internet is a far more hostile place.

>> Are you in a position to test this? (pie and fq_codel both support
>> ecn. My go-to script for testing stuff like this locally are the
>> sqm-scripts, or cake, and enabling ecn in /etc/sysctl.conf
>>
>> https://www.bufferbloat.net/projects/codel/wiki/CakeTechnical/
>>
>> tc qdisc add dev eth0 root cake bandwidth 10mbit # or ratelimit with
>> the sqm-scripts and fq_codel or pie with ecn enabled
>>
>> and enabling ecn in /etc/sysctl.conf
>>
>> sysctl -w net.ipv4.tcp_ecn=3D1
>>
>> And aggh, there's another part of your message I missed, and I haven't
>> answered the first one yet.
>
> Cool. I didn't even have the qdisc functions compiled into my kernel! But
> anyway I went ahead and compiled your module and modified iproute2, and t=
hen
> modified src/tests/netns.sh as follows:
>
>     diff --git a/src/tests/netns.sh b/src/tests/netns.sh
>     index 1c638d4..294dea6 100755
>     --- a/src/tests/netns.sh
>     +++ b/src/tests/netns.sh
>     @@ -58,6 +58,11 @@ ip netns del $netns2 2>/dev/null || true
>      pp ip netns add $netns0
>      pp ip netns add $netns1
>      pp ip netns add $netns2
>     +n0 sysctl -w net.ipv4.tcp_ecn=3D1
>     +n1 sysctl -w net.ipv4.tcp_ecn=3D1
>     +n2 sysctl -w net.ipv4.tcp_ecn=3D1
>     +n0 /home/zx2c4/iproute2-cake/tc/tc qdisc add dev lo root cake
> bandwidth 10mbit
>     +
>      ip0 link set up dev lo
>
>      ip0 link add dev wg0 type wireguard

so did cake manage to successfully ratelimit the output to 10Mbit's in
this configuration?

cake's stats also show marks and drops. (tc -s qdisc show dev lo)

> After that, I ran it and then looked at tcpdump at the lo device that con=
nects
> the two namespaces (see netns.sh for an explanation of how this works). I=
 saw
> lots of things like this:
>
> 22:41:40.386446 IP (tos 0x0, ttl 64, id 56003, offset 0, flags [none],
> proto UDP (17), length 121)
>     127.0.0.1.2 > 127.0.0.1.1: UDP, length 93

acks do not get ECN marks.

(I note that mosh is also ecn enabled, last I looked)

> 22:41:40.386552 IP (tos 0x2,ECT(0), ttl 64, id 56005, offset 0, flags
> [none], proto UDP (17), length 1480)
>     127.0.0.1.1 > 127.0.0.1.2: UDP, length 1452
> 22:41:40.387776 IP (tos 0x2,ECT(0), ttl 64, id 56006, offset 0, flags
> [none], proto UDP (17), length 1480)

This shows the marking making it to the outer header. But you should
see 0x3 whenever the qdisc engages it.

>     127.0.0.1.1 > 127.0.0.1.2: UDP, length 1452
>
> These are the outer encrypted UDP packets. I assume that the decrypted da=
ta
> inside is an ACK followed by two data packets. ECT is marked for the data
> packets, then.
>
> Does this mean it works? How precisely do I test correct behavior?

I am a big fan of flent to generate tests with, and tcptrace -G on the
capture of the decrypted interface and looking at the output via
xplot.org (not xplot). Looking at the resulting capture on one end,
you will see the CE going out, on the other you will see just the CWR
and little dots showing the acks acknowledging the CE has been heard
and acted upon.

example of the latter:

http://www.taht.net/~d/typical_ecn_response.png
http://www.taht.net/~d/typica_ecn_response_closeupt.png

Don't have a pic of the former handy. A *really good intro* to
tcptrace an xplot are in apple's
presentation on ecn here, starting 16 (or was it 24?) minutes in:

https://developer.apple.com/videos/play/wwdc2015/719/

(without a mac, you can just download the video)

>> Short answer is - stick with 0.
>
> Okay. In that case, when outgoing, the ECN calculation will always be:
>
> outgoing_skb->tos =3D !INET_ECN_is_ce(inner_skb->tos) ? (inner_skb->tos
> & INET_ECN_MASK) : INET_ECN_ECT_0;
>
> Can you verify this is correct?
>
>> This is not correct. (I think my definition of in and out are different)
>>
>> if (INET_ECN_is_ce(outer_skb->tos) && inner_skb->tos & 3 !=3D 0) //
>> sorry don't have the macro in my head
>
> See (A) and (B) above. They seem to do what I'm doing.

I will. I got very busy today getting a "final" version of the
fq_codel code for ath9k wifi tested. It's lovely. :) If you are into
openwrt, we've got builds available at:

https://lists.bufferbloat.net/pipermail/make-wifi-fast/2016-August/000940.h=
tml

and patches due out tomorrow. It would be great fun to also start
fiddling with wireguard with this new stuff. I think the right thing -
now that you've found it - is to ape what the newer protocols do...
(and someone shoul fix linux ipsec)

--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
