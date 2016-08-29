Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f14dcd6
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 23:50:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18cab21f
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 23:50:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f2ad478c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 29 Aug 2016 23:50:47 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id f93so1998986lfi.2
 for <wireguard@lists.zx2c4.com>; Mon, 29 Aug 2016 16:57:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw64Uo+pV+ZoS3W4m8rx4+WOrjdnCtiTYr37dU54bHyhBg@mail.gmail.com>
References: <CAA93jw5so3XtG71hPj=LnDm2Opgk7b9q_ziYfMRmOKsmrzBssg@mail.gmail.com>
 <CAHmME9pLBK44L1VzBA2tPsYKsu4YWXNvtXyZBWDDfp+F7qcYuA@mail.gmail.com>
 <CAHmME9qhEyd4+=XcZbMAn9EXLX5ey0Ry8-pg7Rr4UVOZZfUXEw@mail.gmail.com>
 <CAA93jw77n=zkgyney+=hJZDs-56YAeA7bZvfeoh7eedB=zw0ag@mail.gmail.com>
 <CAHmME9qE0FAq5=8rOoYDS+89gOPJo4Us76+e9sndU1LLrqu__A@mail.gmail.com>
 <CAA93jw64Uo+pV+ZoS3W4m8rx4+WOrjdnCtiTYr37dU54bHyhBg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 30 Aug 2016 01:57:33 +0200
Message-ID: <CAHmME9qKRd3KsECmY90ciHEUxgkFmQJ-zWy9W2t4Maor42M-8Q@mail.gmail.com>
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

> well, you should see ect(3) if you pound the network interface. Things
> like tcp small queues get in the way so you won't see it with a simple
> single flow test against cake/codel/etc.
>
> something like 4 netperfs will do it.

It works!

01:40:57.962131 IP (tos 0x3,CE, ttl 64, id 51647, offset 0, flags
[none], proto UDP (17), length 1480)

I made this happen by giving `-P 50 -N -w 500M ` to iperf3.

> sudo apt-get install python-matplotlib python-qt4 netperf fping # some
> git clone https://github.com/tohojo/flent.git
> cd flent; sudo make install
> flent-gui *.gz
> I am a big fan of flent to generate tests with, and tcptrace -G on the
> capture of the decrypted interface and looking at the output via
> xplot.org (not xplot). Looking at the resulting capture on one end,
> you will see the CE going out, on the other you will see just the CWR
> and little dots showing the acks acknowledging the CE has been heard
> and acted upon.


Excellent, thanks for the suggestions on testing tools. I've been using iperf3
nearly exclusively, and indeed it seems like netperf and others are
substantially more powerful. I've also got a directory of horrible .c programs
generating packets for stress testing printing out text for me to pop into
Mathematica... Clearly my homebrewed rig isn't going to be useful for much
longer. I'll look into getting these setup.

> # Anyway, I'll join you in irc to look over what you doing.....

Sorry -- when you messaged me in there, I was just getting off a big 14 hour
international flight. I've got a long layover now, and probably I'll be in IRC
again if you want to pop in there. Though, I'm quite exhausted and might
collapse on some airport benches...

> Then by all means follow the existing latest code.

Well that was my question. Should I follow (A) or (B)? IPsec does (B);
everything else does (A). Does IPsec have a security reason for doing (B)? Is
there some denial of service attack that can be mounted, or some information
disclosure, or some sort of oracle attack? Or is (A) pretty much clearly
better and more robust under abuse, and IPsec is just behind the times?
Probably I shoul djust read the ECN RFCs to actually understand what all this
is doing and make up my mind.

> Postel is long dead, and the internet is a far more hostile place.
> so did cake manage to successfully ratelimit the output to 10Mbit's in
> this configuration?

It did. With I rate limited the actual link to 10mbps, and iperf3 got around
9mbps over TCP, which seems about right considering TCP and considering the
packet encapsulation overhead.

>
> cake's stats also show marks and drops. (tc -s qdisc show dev lo)

Seems to work:

    qdisc cake 8008: root refcnt 2 bandwidth 10Mbit diffserv4 flows
rtt 100.0ms raw
     Sent 82329355 bytes 95473 pkt (dropped 5295, overlimits 195966 requeues 0)
     backlog 137124b 150p requeues 0
    memory used: 502566b of 500000b
    capacity estimate: 10Mbit
                 Tin 0       Tin 1       Tin 2       Tin 3
      thresh      10Mbit    9375Kbit    7500Kbit    2500Kbit
      target      78.7ms      83.9ms     104.9ms     314.6ms
    interval     173.7ms     178.9ms     209.8ms     629.3ms
    Pk-delay         0us      93.9ms         0us         0us
    Av-delay         0us      91.2ms         0us         0us
    Sp-delay         0us      83.8ms         0us         0us
      pkts             0      100916           2           0
      bytes            0    84254676         318           0
    way-inds           0           0           0           0
    way-miss           0           1           1           0
    way-cols           0           0           0           0
      drops            0        5295           0           0
      marks            0        4660           0           0
    Sp-flows           0           0           0           0
    Bk-flows           0           1           0           0
    last-len       65536           0           0           0
    max-len            0        1494         187           0

> acks do not get ECN marks.

I'll need to think carefully about the infoleak aspects of allowing ECN. It
seems nearly as bad as the DSCP infoleak. Is this information that's okay to
be sent in the clear? I'm not quite sure yet.

> (I note that mosh is also ecn enabled, last I looked)

Cool. I recall when they added the DSCP priority, but I don't recall ECN. I'll
try that out. I'm a big Mosh user -- and the roaming feature of WireGuard was
inspired by it.

> I will. I got very busy today getting a "final" version of the
> fq_codel code for ath9k wifi tested. It's lovely. :) If you are into
> openwrt, we've got builds available at:
>
> https://lists.bufferbloat.net/pipermail/make-wifi-fast/2016-August/000940.html
>
> and patches due out tomorrow. It would be great fun to also start
> fiddling with wireguard with this new stuff. I think the right thing -
> now that you've found it - is to ape what the newer protocols do...
> (and someone shoul fix linux ipsec)

Excellent. I've just arrived in the mountains for a week and a half with my
family, so I have limited access to hardware, but I am very interested in
OpenWRT and WireGuard performance. Baptiste, a OpenWRT developer, hangs out on
this mailing list and got a WireGuard package in LEDE which is quite cool.
That's excellent about a faster ath9k driver.
