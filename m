Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e530ca94
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:44:03 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 80222583
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Mar 2018 19:44:03 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id h8-v6so18463642oti.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Mar 2018 12:55:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
References: <CA+Hw3eZtBT6mrALQBLznKxQ8bEnB2YTKr7UjJ=Q+G=iAV9Z+HQ@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Sun, 25 Mar 2018 21:55:29 +0200
Message-ID: <CAKXLc7esjS+7AnznSiQ+knHUn_Jkp1Q15iDuoc+k1m+_WeyLHg@mail.gmail.com>
Subject: Re: can't ping remote side IP range from WG instance
To: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
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

I am really not sure, but let me have a stab:

On Sun, Mar 25, 2018 at 11:19 AM, Adri=C3=A1n Mih=C3=A1lko <adriankoooo@gma=
il.com> wrote:
> auto wg0
> iface wg0 inet static
>   pre-up ip link add dev wg0 type wireguard
>   post-up wg setconf wg0 /etc/wireguard/wireguard.conf
>   post-up ip link set dev wg0 up
>   post-up ip route add 192.168.1.0/24 via 192.168.5.1 dev wg0
>   post-up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>
* I guess that should be
post-up iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

Please try to use generic OS commands to describe the situation
whenever possible (avoiding or in addition to LEDE-specific config).
e.g.
`ip addr`
`ip route`
`wg`

* Any other iptables rules? Try disabling all FW first. (also on Ubuntu ser=
ver)
* Any bridging (often the case in LEDE)?
* run tcpdump/tshark to see what is going on

> Everything is working great,
What exactly is working?

> except that on the "Pi Zero with Wireguard" I can't access/ping remote de=
vices in the 192.168.1.0/24 range, only the remote server 192.168.1.54.
> From any other machine in the same "A side" I am able to access devices i=
n the 192.168.1.0/24 range, just from the Pi Zero itself not.
>
So the difference here is (looking from inside Pi0), "other machine"
traverses the FORWARD chain, while "Pi Zero with Wireguard" traverses
OUTPUT (then reply via INPUT).
I guess fixing the MASQUEARADE line will do it (on both sides).

Being able to ping only the router of a remote net means that it
doesn't route the echo-request:
* due to FW policy
* due to "bad src address" (e.g. if you somehow manage to ping from
1.1.1.1 (via many tunnels) to 2.2.2.2 and 2.2.2.2 cannot directly
reach 1.1.1.1)
{I am guessing Pi0 sends ping from wg0/192.168.5.2 to Ubuntu
wg0/192.168.5.1, forwarded to 192.168.1.100, it has no route to
192.168.5.2, so sends it to 192.168.1.1 as default... asymmetric route
blocking?)

* on 192.168.1.100, run tshark to see if you even get an echo-request
packet when you try to ping it.
* What is the route to 192.168.5.2 on 192.168.1.100? (on 192.168.1.100
run `ip route get 192.168.5.2`)

And before doing any of the above, sit down and draw a map, with
colorful pens for wired and WG connections. It does help, trust me.

Kalin.
