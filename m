Return-Path: me.kalin@gmail.com
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
 [209.85.161.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d7cf0b8
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 05:12:14 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id a10so26314226ywa.1
 for <wireguard@lists.zx2c4.com>; Sun, 20 Nov 2016 21:15:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rfB709DCnqiXG2L7kMwCx0bgiSXi2C2LwYR=bX-trNzw@mail.gmail.com>
References: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
 <CAHmME9rfB709DCnqiXG2L7kMwCx0bgiSXi2C2LwYR=bX-trNzw@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 21 Nov 2016 14:15:17 +0900
Message-ID: <CAKXLc7fQmf=LVrkJ3C5XAYRdimjxNT=xGey9W+qivqLpV+XO7A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
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

Hello Jason,

Thanks for the answer!

On Sat, Nov 19, 2016 at 10:14 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Funny enough, I can't remember the exact interworkings of that script,
> because I didn't write it. A guy named zhasha in #wireguard did. I'll
> ask him to document it; that could be useful. I know another gentoo
> dev was working on a WireGuard gentoo page for the wiki.
>
I tested a few things, it is almost working.

So, I needed to save a running config (`wg showconf wg0
>/etc/wireguard/wg0.conf`), then put this in `/etc/conf.d/net`:

config_wg0="192.168.13.12/24"
wireguard_wg0="/etc/wireguard/wg0.conf"

Finally, symlink to net.lo:

  ln -nfs net.lo /etc/init.d/net.wg0

Then `/etc/init.d/net.wg0 start` and `/etc/init.d/net.wg0 stop` work
as expected.

EDIT: Add this to /etc/rc.conf to make things run smoothly:
rc_hotplug="!net.wg?"


However `/etc/init.d/net.wg0 restart` sometimes fails silently...
I am trying to reproduce it, but cannot get the pattern of failures.
It outputs all fine to the console, but there is no actual interface created...

$ /etc/init.d/net.wg0 restart
 * /etc/init.d/net.wg0 uses runscript, please convert to openrc-run.
 * Bringing down interface wg0
 *   Removing WireGuard interface wg0 ...


              [ ok ]
 * Bringing up interface wg0
 *   Creating WireGuard interface wg0 ...


              [ ok ]
 *   Configuring WireGuard interface wg0 ...


              [ ok ]
 *   192.168.13.12/24 ...


              [ ok ]

$ ip l show dev wg0
Device "wg0" does not exist.

# NOT WORKING!


$ /etc/init.d/net.wg0 start
 * /etc/init.d/net.wg0 uses runscript, please convert to openrc-run.
 * WARNING: net.wg0 has already started, but is inactive

$ /etc/init.d/net.wg0 zap
 * /etc/init.d/net.wg0 uses runscript, please convert to openrc-run.
 * Manually resetting net.wg0 to stopped state

$ /etc/init.d/net.wg0 start
 * /etc/init.d/net.wg0 uses runscript, please convert to openrc-run.
 * Bringing up interface wg0
 *   Creating WireGuard interface wg0 ...


              [ ok ]
 *   Configuring WireGuard interface wg0 ...


              [ ok ]
 *   192.168.13.12/24 ...


              [ ok ]

$ ip l show dev wg0
34: wg0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1423 qdisc
noqueue state UNKNOWN mode DEFAULT group default qlen 1
    link/void

# WORKING

 $ /etc/init.d/net.wg0 restart
 * /etc/init.d/net.wg0 uses runscript, please convert to openrc-run.
 * Bringing down interface wg0
 *   Removing WireGuard interface wg0 ...
 * Bringing up interface wg0
 *   Creating WireGuard interface wg0 ...


              [ ok ]
 *   Configuring WireGuard interface wg0 ...


              [ ok ]
 *   192.168.13.12/24 ...


              [ ok ]

$ ip l show dev wg0
36: wg0: <POINTOPOINT,MULTICAST,NOARP,UP,LOWER_UP> mtu 1423 qdisc
noqueue state UNKNOWN mode DEFAULT group default qlen 1
    link/void


I tried to debug a few things and my observation is that "sometimes",
interface is reappearing after `ip link delete dev wg0`...
Any ideas? I thought am not running any automagic daemons (systemd,
networkmanager, etc.).
But... there is some systemd code lurking may be.
Anyway, I added it to be NOT hotplugged:
$ grep wg /etc/rc.conf
rc_hotplug="pcscd !net.wg?"

And it seems to work! Otherwise the interface gets marked as
hotpluggable and is being recreated/killed (see the first number  on
`ip link show dev wg0` constantly growing)

> In other words, if the argument is a file path, it is passed to
> setconf, and otherwise they're passed to set. You can then use the
> other ordinary netifrc values for setting the IP addresses.
>
yep, apparently!

> A somewhat reasonable place to store config files would be in
> /etc/wireguard, and make sure that directory is chmod'd to 700, since
> it contains private keys.
>
Yes, I am glad I guessed this settings, before your mail!

Cheers,
Kalin.
