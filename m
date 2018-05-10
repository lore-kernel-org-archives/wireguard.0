Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dea6d71
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:53:15 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26922890
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 09:53:14 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Subject: Re: WG load balancing?
In-Reply-To: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
References: <910c1abf-a7cf-443d-f0c1-8b682d0e6084@urlichs.de>
Date: Thu, 10 May 2018 11:55:49 +0200
Message-ID: <87fu2zyguy.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Matthias Urlichs <matthias@urlichs.de> writes:

> Hello list,
>
> Assume a branch office with two uplinks to the Internet that wants to
> use WG to talk to the main office, using both of these uplinks in
> parallel (assuming they're both up) for better uplink speed (and for
> redundancy if they aren't). Now the obvious idea is to create two WG
> interfaces on each side, and add a couple of firewall rules to make sure
> that packets fwmarked 1 go out on the first uplink, and so on.
>
> That's the easy part. The hard part is how to teach the kernel to load
> balance its default route between the WG interfaces. I tried to use a
> libteam or bonding interface to tie them together, but apparently WG
> isn't Ethernet, so that doesn't work.
>
> I thought about using a GRE tunnel, but tunnels have fixed endpoint
> addresses =E2=80=93 somehow I don't think it'd be a good idea to create t=
wo
> wireguard interfaces with the same IP address =E2=80=A6 and I don't reall=
y want
> to do heavy-handed address mangling on every packet. Losing all
> connectivity whenever I happen to flush my firewall tables doesn't
> appeal to me.

You could create GRE tunnels on the internal IP addresses of the
wireguard interface? Or use the kernel's ECMP routing as suggested by
Tim :)

-Toke
