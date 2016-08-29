Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89dde9e6
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 20:53:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d15c9a49
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 20:53:49 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80973ee7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 20:53:49 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id b199so109784219lfe.0
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 14:00:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
 <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Aug 2016 23:00:36 +0200
Message-ID: <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
To: Dave Taht <dave.taht@gmail.com>
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

> Nice to see you so quickly being productive. I am still constructing a
> reply to your previous message.

Awaiting it's arrival :)

> In re-reading over your message, I think not dropping the packet when
> there is an outer CE marking and no ecn enabling in in the inner
> packet is probably the right thing, by Postel's law, if not, by the
> RFCs.

Vxlan, geneveve, ipip, and sit all log & drop for the last condition.
Xfrm (IPsec) does not.

The RFCs seem to indicate that it should be dropped though. Check out
the function here, used by vxlan, geneveve, ipip, and sit:

(A) https://git.zx2c4.com/linux/tree/include/net/inet_ecn.h#n166

IPsec uses this much shorter function here, on which I've modeled mine:

(B) https://git.zx2c4.com/linux/tree/net/ipv4/xfrm4_mode_tunnel.c#n18

> Are you in a position to test this? (pie and fq_codel both support
> ecn. My go-to script for testing stuff like this locally are the
> sqm-scripts, or cake, and enabling ecn in /etc/sysctl.conf
>
> https://www.bufferbloat.net/projects/codel/wiki/CakeTechnical/
>
> tc qdisc add dev eth0 root cake bandwidth 10mbit # or ratelimit with
> the sqm-scripts and fq_codel or pie with ecn enabled
>
> and enabling ecn in /etc/sysctl.conf
>
> sysctl -w net.ipv4.tcp_ecn=1
>
> And aggh, there's another part of your message I missed, and I haven't
> answered the first one yet.

Cool. I didn't even have the qdisc functions compiled into my kernel! But
anyway I went ahead and compiled your module and modified iproute2, and then
modified src/tests/netns.sh as follows:

    diff --git a/src/tests/netns.sh b/src/tests/netns.sh
    index 1c638d4..294dea6 100755
    --- a/src/tests/netns.sh
    +++ b/src/tests/netns.sh
    @@ -58,6 +58,11 @@ ip netns del $netns2 2>/dev/null || true
     pp ip netns add $netns0
     pp ip netns add $netns1
     pp ip netns add $netns2
    +n0 sysctl -w net.ipv4.tcp_ecn=1
    +n1 sysctl -w net.ipv4.tcp_ecn=1
    +n2 sysctl -w net.ipv4.tcp_ecn=1
    +n0 /home/zx2c4/iproute2-cake/tc/tc qdisc add dev lo root cake
bandwidth 10mbit
    +
     ip0 link set up dev lo

     ip0 link add dev wg0 type wireguard

After that, I ran it and then looked at tcpdump at the lo device that connects
the two namespaces (see netns.sh for an explanation of how this works). I saw
lots of things like this:

22:41:40.386446 IP (tos 0x0, ttl 64, id 56003, offset 0, flags [none],
proto UDP (17), length 121)
    127.0.0.1.2 > 127.0.0.1.1: UDP, length 93
22:41:40.386552 IP (tos 0x2,ECT(0), ttl 64, id 56005, offset 0, flags
[none], proto UDP (17), length 1480)
    127.0.0.1.1 > 127.0.0.1.2: UDP, length 1452
22:41:40.387776 IP (tos 0x2,ECT(0), ttl 64, id 56006, offset 0, flags
[none], proto UDP (17), length 1480)
    127.0.0.1.1 > 127.0.0.1.2: UDP, length 1452

These are the outer encrypted UDP packets. I assume that the decrypted data
inside is an ACK followed by two data packets. ECT is marked for the data
packets, then.

Does this mean it works? How precisely do I test correct behavior?

> Short answer is - stick with 0.

Okay. In that case, when outgoing, the ECN calculation will always be:

outgoing_skb->tos = !INET_ECN_is_ce(inner_skb->tos) ? (inner_skb->tos
& INET_ECN_MASK) : INET_ECN_ECT_0;

Can you verify this is correct?

> This is not correct. (I think my definition of in and out are different)
>
> if (INET_ECN_is_ce(outer_skb->tos) && inner_skb->tos & 3 != 0) //
> sorry don't have the macro in my head

See (A) and (B) above. They seem to do what I'm doing.
