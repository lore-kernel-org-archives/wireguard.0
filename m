Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b2f2ad1
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 14:33:03 +0000 (UTC)
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
 [209.85.216.180])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6db7248
 for <wireguard@lists.zx2c4.com>; Fri, 2 Mar 2018 14:33:03 +0000 (UTC)
Received: by mail-qt0-f180.google.com with SMTP id j4so12089422qth.8
 for <wireguard@lists.zx2c4.com>; Fri, 02 Mar 2018 06:41:56 -0800 (PST)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
References: <CAHLp1YmDybu01qzrH4-=8U0Cm7__3myF4p75iejBB5Zd+AKs8g@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Fri, 2 Mar 2018 15:41:34 +0100
Message-ID: <CAHLp1YkeCV5KxT2npcSOVb_vyB5oWFY2vq4bA12QLFFeJytzvA@mail.gmail.com>
Subject: Re: Assigning addresses with avahi-autoipd
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

The lack of answer suggested nobody was familiar enough with
avahi-autoipd, so I am giving more details.

According to the manpage, avahi-autoipd is an implementation of
https://tools.ietf.org/html/rfc3927.html. To achieve autoconfiguration
of their ip address, hosts randomly select an address "in the range
from 169.254.1.0 to 169.254.254.255 inclusive" (section 2.1), then
"test to see if the IPv4 Link-Local address is already in use"
(section 2.2) by "broadcasting an ARP Request for the desired address"
(section 2.2.1). The document also says that for this to work, "a
broadcast sent [...] by any host from that set of hosts can be
received by every other host" (section 1.2)

So the first question would be: any chance wireguard can broadcast ARP request?

Now for my question about resolving ".local" hosts, the concept is
called mDNS and maps to https://tools.ietf.org/html/rfc6762. The
protocol is summarized as "Clients performing DNS-like queries for
DNS-like resource records by sending DNS-like UDP query and response
messages over IP Multicast to UDP port 5353". The general idea is that
"Any DNS query for a name ending with ".local." MUST be sent to the
mDNS IPv4 link-local multicast address 224.0.0.251 (or its IPv6
equivalent FF02::FB)" (section 3).

So the second question is about whether wireguard supports
broadcasting udp packets to 224.0.0.251 or the ipv6 equivalent
ff02::fb (I don't know why the RFC used capital letters). Digging in
the mailing list, I found a thread from end of 2016
https://lists.zx2c4.com/pipermail/wireguard/2016-December/000811.html
stating that this was currently not possible. Then, there is this
answer https://lists.zx2c4.com/pipermail/wireguard/2016-December/000813.html
which says that "It's not complicated in theory, but I wonder if this
would be genuinely useful".

I would like to say that the decentralized nature of wireguard would
make it ideal for combining it with decentralized protocols such as
avahi-autoipd or mDNS, so please support this!

Best,
Christophe-Marie
