Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8ca8c25
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:24:00 +0000 (UTC)
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84753585
 for <wireguard@lists.zx2c4.com>; Mon, 7 May 2018 13:24:00 +0000 (UTC)
Received: by mail-oi0-x234.google.com with SMTP id p62-v6so25048706oie.10
 for <wireguard@lists.zx2c4.com>; Mon, 07 May 2018 06:26:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c940ea93-e022-27ba-f906-783b0a7d3c1a@gmx.net>
References: <c940ea93-e022-27ba-f906-783b0a7d3c1a@gmx.net>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 7 May 2018 15:26:00 +0200
Message-ID: <CAKXLc7cC7V7z2GTZr4q0rM4Ju8q9e7u50OkNRCbTsoYiaSskhg@mail.gmail.com>
Subject: Re: WG endpoint node exit to inet and DNS resolver
To: vtol <vtol@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, May 7, 2018 at 1:21 PM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vt=
ol@gmx.net> wrote:
> 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1 as WG endpoint node
> WG 0.0.20180420-1
> DHCP no
> Firewall off (both server and client)
> wg-quick not utilized
>
> Which DNS resolver is utilized by the clients inside a WG tunnel, the
> client's resolver or the server's? And can this be tweaked in WG?
>
There are no "clients inside a WG tunnel", only traffic inside the tunnel :=
-D
On a standard linux, this is controlled by /etc/resolv.conf whether or
not there is VPN.
/etc/resolv.conf can be (mis-)managed by dhcp clients and other daemons.
For most boxes I use dnscache running on 127.0.0.1 and I do
occasionally configure it to forward queries to another cache (so
/etc/resolv.conf is never touched).


> Clients are connecting to the endpoint node and subnets each end are
> reachable through the tunnel. The traffic to the inet from the WG however=
 is
> not escaping via the server's default route. Added the IPS's gateway node
> (81.x.x.x) to the WG iface but that did not provide inet connection for t=
he
> connected clients.
>
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use
> Iface
> 0.0.0.0         81.x.x.x    0.0.0.0         UG    0      0 0 eth0
> 81.x.x.x    0.0.0.0         255.255.255.255 UH    0      0 0 wg0
> 192.168.120.0   0.0.0.0         255.255.255.0   U     0 0        0 wg0
>
Not sure what you want to do here...
Assuming your other end of the WG tunnel is say 192.168.120.1, then
you should add it as a default gw (and it should route your packets).
ip route add default via 192.168.120.1
(no need for `dev wg0` at the end I think)

Kalin.
