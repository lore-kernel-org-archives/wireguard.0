Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf641a33
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:41:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9112da7b
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:41:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01ade3cd
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:41:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4b8cb2ac
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 13 May 2017 22:41:16 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id h4so98385641oib.3
 for <wireguard@lists.zx2c4.com>; Sat, 13 May 2017 15:52:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170513073721.GD22218@tuxmachine.polynome.dn42>
References: <20170513073721.GD22218@tuxmachine.polynome.dn42>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 14 May 2017 00:52:11 +0200
Message-ID: <CAHmME9pgLtP4z-vvuHxH4ST2f6ZeHhKZXM8FnyrRnxojYDsGGQ@mail.gmail.com>
Subject: Re: Performance of Wireguard on Infiniband 40G
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
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

Hey Baptiste,

Awesome test! Thanks for reporting the results.

On Sat, May 13, 2017 at 9:37 AM, Baptiste Jonglez
<baptiste@bitsofnetworks.org> wrote:
> Using iperf (TCP mode) over the wireguard interface, performance was
> around 1.6 Gbit/s.  In bidirectional mode (iperf -d), performance was
> 700 Mbit/s + 800 Mbit/s.

Indeed the current multicore algorithm has a lot of issues. Samuel,
CCd, is going to be doing some work on optimizing this algorithm this
summer.

> After raising the MTU of the wireguard interface to 65450, performance
> went up to 7.6 Gbit/s (unidirectional iperf).

It makes sense that it'd be higher, since CPUs work best when running
uninterrupted, but still this indicates that padata is a very
suboptimal algorithm. Expect some improvements on this in the coming
months. Hopefully you'll be able to test on similar hardware at some
point when things are finished.

> Note that infiniband has a MTU of 65520 bytes, but Wireguard still selects
> a MTU of 1420 bytes for its interface.

Yea the 1420 is just a hard coded "default". I probably add something
clever to autoselect an MTU when configuring the first peer's first
endpoint (by computing the route and taking its interface's mtu and
doing subtraction, etc), but the long term solution, I think, will be
to do some more clever PMTU situation from within WireGuard. I'm still
working out exactly how to do this, but it should be possible.


> - Xeon E5520 @2.27GHz (2 CPUs, 4 cores each)
> - Mellanox ConnectX IB 4X QDR MT26428

*drools* That's some awesome hardware!

> - iperf 2.0.5

iperf2 has the -b bidirectional mode which is nice, but it seems like
most people are using iperf3 now. Out of curiosity, is there a reason
for preferring iperf2, beyond the -b switch?

Jason
