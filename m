Return-Path: tim@sedlmeyer.us
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7525571
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:58:44 +0000 (UTC)
Received: from mail-it0-x241.google.com (mail-it0-x241.google.com
 [IPv6:2607:f8b0:4001:c0b::241])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b732cde
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:58:44 +0000 (UTC)
Received: by mail-it0-x241.google.com with SMTP id q4-v6so2429835ite.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 03:01:27 -0700 (PDT)
Return-Path: <tim@sedlmeyer.us>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com.
 [209.85.214.48])
 by smtp.gmail.com with ESMTPSA id f25-v6sm178926ioh.68.2018.05.10.03.01.25
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 May 2018 03:01:25 -0700 (PDT)
Sender: Timothy Sedlmeyer <tim@sedlmeyer.us>
Received: by mail-it0-f48.google.com with SMTP id 70-v6so2441220ity.2
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 03:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
In-Reply-To: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
From: Tim Sedlmeyer <tim@sedlmeyer.org>
Date: Thu, 10 May 2018 10:01:14 +0000
Message-ID: <CAK_h9uEAjU7+7o=yVf3n4mAwekBn6eL1COyX2k1pz5UV-VZpYQ@mail.gmail.com>
Subject: Re: WG load balancing?
To: matthias@urlichs.de
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, May 10, 2018 at 5:22 AM Matthias Urlichs <matthias@urlichs.de>
wrote:

> Hello list,

> Assume a branch office with two uplinks to the Internet that wants to
> use WG to talk to the main office, using both of these uplinks in
> parallel (assuming they're both up) for better uplink speed (and for
> redundancy if they aren't). Now the obvious idea is to create two WG
> interfaces on each side, and add a couple of firewall rules to make sure
> that packets fwmarked 1 go out on the first uplink, and so on.

> That's the easy part. The hard part is how to teach the kernel to load
> balance its default route between the WG interfaces. I tried to use a
> libteam or bonding interface to tie them together, but apparently WG
> isn't Ethernet, so that doesn't work.

> I thought about using a GRE tunnel, but tunnels have fixed endpoint
> addresses =E2=80=93 somehow I don't think it'd be a good idea to create t=
wo
> wireguard interfaces with the same IP address =E2=80=A6 and I don't reall=
y want
> to do heavy-handed address mangling on every packet. Losing all
> connectivity whenever I happen to flush my firewall tables doesn't
> appeal to me.

> Ideally I would like the kernel's wireguard interfaces to be compatible
> with teaming =E2=80=A6 any takers?

> --
> -- Matthias Urlichs


> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

If you are in kernel >=3D4.4 you can use hash-based multipath routing. A ha=
sh
by default based upon source and destination address will be calculated and
flows matching the hash will be assigned to a particular path. If need to
better balance traffic you can configure the kernel to use source and
destination ports as part of the hash also. The kernel will assign hashes
to the links in a manner that balances the traffic across them. You can
also assign weights to each path and the kernel will assign traffic
according to the ratio of the weights.

For example to equally balance the traffic between 2 wireguard interfaces
the command would be:

ip route add default nexthop dev wg0 weight 1 nexthop dev wg1 weight 1

If you wanted to send 5 times as much traffic over the 2nd link:

ip route add default nexthop dev wg0 weight 1 nexthop dev wg1 weight 5
