Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c4f6365
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 09:51:36 +0000 (UTC)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
 [209.85.218.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a43f64b
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Mar 2018 09:51:36 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id e9so8170943oii.0
 for <wireguard@lists.zx2c4.com>; Fri, 16 Mar 2018 03:02:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180316142547.2ecb70de@natsu>
References: <20180316142547.2ecb70de@natsu>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Fri, 16 Mar 2018 11:01:51 +0100
Message-ID: <CAKXLc7e3dYQn-LG_sBCDR=dUYt1dkrjo0EQszWAq5znD0by25g@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm.wg@romanrm.net>
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

On Fri, Mar 16, 2018 at 10:25 AM, Roman Mamedov <rm.wg@romanrm.net> wrote:
> Hello,
>
> I have a host which is on PPPoE and has 1492 as underlying MTU.
>
> When WireGuard starts by default, it sets MTU of its interface to 1420. All
> TCP connections trying to send a stream of data over the WG interface to that
> host, hang up (I test with iperf3).
>
> My first idea was to override the MTU for this specific host via adding a
> route:
>
> # ip -6 route add fd39:30::250/128 dev wg0 mtu 1412 metric 1
>
> # ip -6 route | grep ^fd39:30
> fd39:30::250 dev wg0  metric 1  mtu 1412
> fd39:30::/64 dev wg0  proto kernel  metric 256
>
> # ip route get fd39:30::250
> fd39:30::250 from :: dev wg0  src fd39:30::2  metric 1  mtu 1412
>
> However, this does not help at all. Even adding the corresponding route on the
> other side. Even using the "mtu lock" keyword instead of just "mtu". I am still
> puzzled why. Any ideas?
>
Isn't it because routing is done by WG itself, based on AlowedIPs, so
that routing table is not considered at all, after the packet is given
to WG?

Those are assumptions of how things work, I haven't looked at the code.

> What helps, is only reducing MTU of the entire wg0 interface to 1412. Then
> everything works fine. But it doesn't feel optimal to reduce MTU of the entire
> network just because of 1 or 2 hosts. I would rather use a couple of those
> mtu-override routes, if they worked.
>
You may need to pre-shape the packets for the "offenders", e.g.

ip6tables -t mangle -A POSTROUTING -o wg0 -d WHATEVERHOST -p tcp -m
tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1352

https://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-4.html#ss4.7

O, wait! You talk IPv6...

ip6tables -t mangle -A POSTROUTING -o wg0 -d fd39:30::250/128 -p tcp
-m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1372

You can also try setting the route MTU as above and then use "... -j
TCPMSS --clamp-mss-to-pmtu", although it may be more work and/or might
not work.

Cheers,
Kalin.
