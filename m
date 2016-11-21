Return-Path: a63dbd90.dNq.dMV.H.oxNDgt+wireguard=lists.zx2c4.com@bnc.mailjet.com
Received: from o22.p4.mailjet.com (o22.p4.mailjet.com [178.33.221.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ceef50c3
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 14:03:28 +0000 (UTC)
Message-Id: <a63dbd90.dNq.dMV.H.oxNDgt@mailjet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
From: Joakim Sindholt <opensource@zhasha.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 21 Nov 2016 15:06:53 +0100
In-Reply-To: <CAKXLc7fQmf=LVrkJ3C5XAYRdimjxNT=xGey9W+qivqLpV+XO7A@mail.gmail.com>
References: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
 <CAHmME9rfB709DCnqiXG2L7kMwCx0bgiSXi2C2LwYR=bX-trNzw@mail.gmail.com>
 <CAKXLc7fQmf=LVrkJ3C5XAYRdimjxNT=xGey9W+qivqLpV+XO7A@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] What is a good way to ingrate (as of now) wireguard
 into openrc in Gentoo?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Mon, Nov 21, 2016 at 6:15 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> 
wrote:
> config_wg0="192.168.13.12/24"
> wireguard_wg0="/etc/wireguard/wg0.conf"
> 
> Finally, symlink to net.lo:
> 
>   ln -nfs net.lo /etc/init.d/net.wg0
> 
> Then `/etc/init.d/net.wg0 start` and `/etc/init.d/net.wg0 stop` work
> as expected.

Yep, that's how it's supposed to be used

> EDIT: Add this to /etc/rc.conf to make things run smoothly:
> rc_hotplug="!net.wg?"

I have not experienced any issues like this.

> However `/etc/init.d/net.wg0 restart` sometimes fails silently...
> I am trying to reproduce it, but cannot get the pattern of failures.
> It outputs all fine to the console, but there is no actual interface 
> created...
> 
> [...]
> 
> I tried to debug a few things and my observation is that "sometimes",
> interface is reappearing after `ip link delete dev wg0`...
> Any ideas? I thought am not running any automagic daemons (systemd,
> networkmanager, etc.).
> But... there is some systemd code lurking may be.
> Anyway, I added it to be NOT hotplugged:
> $ grep wg /etc/rc.conf
> rc_hotplug="pcscd !net.wg?"
> 
> And it seems to work! Otherwise the interface gets marked as
> hotpluggable and is being recreated/killed (see the first number  on
> `ip link show dev wg0` constantly growing)

Interesting. I've had problems with other programs interfering in the 
past,
most notably dhcpcd which would nuke my routing rules, but never this.
The script is basically just a whittled down version of the pppd.sh 
script
and should work in much the same way. I just hacked it up rather quickly
so it's very possible that I missed something really important.
I'm running an otherwise bog-standard clean gentoo install with pretty 
much
nothing installed and this issue hasn't presented itself so far.
It's being updated today so I'll get on it if I can reproduce it.
Pretty weird though...
