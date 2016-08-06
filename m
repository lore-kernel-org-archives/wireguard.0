Return-Path: vladimir.matweev@gmail.com
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
 [209.85.223.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c10a161
 for <wireguard@lists.zx2c4.com>; Sat, 6 Aug 2016 13:09:24 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id b62so322578707iod.3
 for <wireguard@lists.zx2c4.com>; Sat, 06 Aug 2016 06:13:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA++JTc1titv0hq6ZFpPJxLHupAD5HuY421b=C7PfnC9wihXM4A@mail.gmail.com>
References: <CA++JTc1titv0hq6ZFpPJxLHupAD5HuY421b=C7PfnC9wihXM4A@mail.gmail.com>
From: Vladimir Matveev <vladimir.matweev@gmail.com>
Date: Sat, 6 Aug 2016 16:13:17 +0300
Message-ID: <CA++JTc1e4T-qC+ozuLdgm=AZ9OYR0vyn2-fb0hfpP1T0295v8Q@mail.gmail.com>
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] Unable to configure routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Oh, I think that I have found what I was doing wrong. I have set the
allowed IPs for the server peer on my laptop to 10.9.0.0/24 instead of
0.0.0.0/0, and therefore all packets intended for other hosts (i.e.
for routing) were dropped by Wireguard immediately. Changing allowed
IPs setting to 0.0.0.0/0 immediately helped, and routing now works.

Best regards,
Vladimir

2016-08-06 15:36 GMT+03:00 Vladimir Matveev <vladimir.matweev@gmail.com>:
> Hello,
>
> I wanted to try Wireguard so I decided to test it on my laptop to
> route all connections through my VPS. I have set up it on the VPS with
> the following config file:
>
> [Interface]
> PrivateKey = <server private key>
> ListenPort = 41414
>
> [Peer]
> PublicKey = <client public key>
> AllowedIPs = 10.9.0.0/24
>
> On my laptop I have the following file:
>
> [Interface]
> PrivateKey = <client private key>
>
> [Peer]
> PublicKey = <server public key>
> Endpoint = <VPS public IP>:41414
> AllowedIPs = 10.9.0.0/24
>
>
> I configured a wg0 interface both on the server (10.9.0.1) and on the
> client (10.9.0.2) and also configured the firewall on the VPS to pass
> UDP packets for the 41414 port through, as well as masquerading for
> packets coming from 10.9.0.0/24.
>
> Afterwards I was able to reach the laptop from the server and vice
> versa using their wg0 addresses just fine. However, I wasn't able to
> route any connections through the VPS from the laptop.
>
> On the server, as I have said already, I have set up masquerading for
> 10.9.0.0/24. On the client I've added a route like this:
>
> ip r add 178.63.151.224 via 10.9.0.1 dev wg0
>
> Then, when I try to ping 178.63.151.224, I get errors like this:
>
> % LANG=C ping 178.63.151.224
> PING 178.63.151.224 (178.63.151.224) 56(84) bytes of data.
> From 10.9.0.2 icmp_seq=1 Destination Host Unreachable
> ping: sendmsg: Required key not available
> From 10.9.0.2 icmp_seq=2 Destination Host Unreachable
> ping: sendmsg: Required key not available
> From 10.9.0.2 icmp_seq=3 Destination Host Unreachable
> ping: sendmsg: Required key not available
> ^C
> --- 178.63.151.224 ping statistics ---
> 3 packets transmitted, 0 received, +3 errors, 100% packet loss, time 2000m
>
> Naturally, no other connection to this host gets through. Also, it
> seems that in this case no packets even reach the server, I can see it
> in the tcpdump -i wg0 output on the VPS. If I try to ping 10.9.0.1
> from the laptop, I get correct responses and I also see them in the
> tcpdump output, and I'm able to connect to the server itself just
> fine.
>
> I tried configuring the route without "via 10.9.0.1", like it is
> described in the documentation (although I don't understand how it
> should find the correct gateway address in such configuration), but to
> no avail - the errors are exactly the same.
>
> What am I doing wrong here?
>
> uname -a on the laptop:
>
> Linux hostname 4.6.5-2-ck #1 SMP PREEMPT Wed Jul 27 18:33:05 EDT 2016
> x86_64 GNU/Linux
>
> uname -a on the VPS:
>
> Linux hostname 4.6.4-1-ARCH #1 SMP PREEMPT Mon Jul 11 19:12:32 CEST
> 2016 x86_64 GNU/Linux
>
> Both computers are running Archlinux, with Wireguard 0.0.20160722
> built via DKMS.
>
> Thanks.
>
> Best regards,
> Vladimir
