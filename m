Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
 [209.85.220.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 73d3acf8
 for <wireguard@lists.zx2c4.com>; Sat, 3 Sep 2016 16:12:09 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id v123so153617964qkh.2
 for <wireguard@lists.zx2c4.com>; Sat, 03 Sep 2016 09:19:34 -0700 (PDT)
MIME-Version: 1.0
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 3 Sep 2016 09:19:31 -0700
Message-ID: <CAA93jw6ay3EDeOYi80fzkjXt=j0AAFveEMRhnb=gBiND8DNwhg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] doing crazy ipv6 stuff
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I built wireguard on the rasberry pi 2. Aside from complaining about
padata not being enabled, it worked. I did a bunch of benchmarks and
despite dealing with some queuing issues (as described in an earlier
thread and in some email with jason, and maybe one day a blog entry)
everything worked as advertised. yay!

(there are a ton of "kernel-header" .debs for raspbian, the right one
is "raspberrypi-kernel-headers")

Two notes: on that kernel release (4.4.13-v7)

an ipv6 link local address was not created on the wg device. (on my
x86 (4.7) one is). Not sure if that matters. Then I got crazy - said
to myself, hmm, can I make babel work over this? (babel relies on ipv6
link local multicast).

On the 4.4 rpi box, even after manually putting in a fe80::whatever/64
address, putting babeld -D wg0 on it ended up with no packets showing
up in the tcpdump -i wg0.

I fiddled with crazy stuff, like adding support for transport of the
fe80 and ff02::1:6 multicast addresses...

peer: aD5ecbdSHoSPQUyr8p1KYjoS8JWADcFVF6n4dwtsfkQ=3D
  endpoint: 172.26.16.3:41414
  allowed ips: 10.192.122.0/24, ff02::1:6/128, fe80::/64, fd78::/64

on the x86 box, I do see babel succeeding in dumping packets in there.
(I don't have another x86 box to test with at the moment).

I really don't know if this stuff should work or not. My gut says even
attempting limited multicast capability over a vpn ends up in a world
of hurt....

a thought in terms of endpoint mobility - being able to migrate
between ipv4 and ipv6 and back would be kind of nice in some ways.

( https://arxiv.org/pdf/1502.02402.pdf )

and: I can go bug the pi folk to enable padata.

I am not in a position to provide benchmarks of the pi2 today, it's on
the other end of a very slow wifi link, and I was using wireguard for
a weird purpose - by turning on and off vpn encapsulation I could
easily test the "codel" portion of the new fq_codel for wifi code.
(and the new ecn support in wireguard worked!)

I can say it pushed 20Mbits, no problem.
--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
