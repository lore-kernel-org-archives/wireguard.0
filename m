Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d54df109
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:59:48 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 997d4442
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:59:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2205922a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:59:48 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6496a5a0
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Dec 2017 17:59:48 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id p3so15509604oti.5
 for <wireguard@lists.zx2c4.com>; Mon, 04 Dec 2017 10:06:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171204172937.GA11936@black.transpect.com>
References: <20171204160159.GA27666@black.transpect.com>
 <CAHmME9o3+SBZfsWLUczAxKOxmBcWeJYyx_wpGnk_sXNbb8aZgA@mail.gmail.com>
 <20171204172937.GA11936@black.transpect.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 4 Dec 2017 19:06:27 +0100
Message-ID: <CAHmME9oksyuGfxEAxeoSmdwaiYhLZjyVSeZc7LCCYcc3KwnRLg@mail.gmail.com>
Subject: Re: What are the options for stopping and starting?
To: Whit Blauvelt <whit@transpect.com>
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

Hi Whit,

> Also, what's "SaveConfig" about?

I understand more the nature of your inquiry now. If you're talking
about "SaveConfig", then you're referring to the use of wg-quick(8),
which is just a dumb wrapper around wg(8) and ip(8). In this case, the
commands you want to use are `wg-quick up` and `wg-quick down`.
SaveConfig=true means that the existing state of the device is saved
to the config file on `wg-quick down`. You can also do it manually via
`wg-quick save`. So, if you want to add peers or change things at
runtime, use wg(8) to do that, and then save those changes back to the
configuration file via `wg-quick save`.

If you're not using wg-quick(8), then you're already running commands
like `ip link add wg0 type wireguard` to add a new interface, after
which you likely configure it using wg(8). To remove it, the command
is then `ip link del wg0 type wireguard`. The quickstart documentation
on the website should show this.

> say. My impression so far is that wg-quick probably shouldn't be used at all
> outside of a specific road-warrior situation. Is that correct?

wg-quick(8) is useful for all sorts of things. Use it while it's
useful. If you find yourself wanting to do something that doesn't seem
obvious via wg-quick(8), don't use it, and roll your own trivial bash
script instead. WireGuard is meant to be easy to script. wg-quick(8)
is mostly just the bash script I wrote for my own usage - YMMV.

> So "setconf <interface> <configuration-filename>" is the basic equivalent of
> "service reload" or the like. Okay.

Sort of but not quite. You're thinking about this all wrong though and
you're going to get into trouble. There aren't services or daemons.
You can add and remove interfaces (ip link add/ip link del). You can
assign ip addresses to those interfaces (ip addr add/ip addr del). You
can assign routes that point to those interfaces (ip route add ... dev
wg0/ip route del ... dev wg0. You can set the link up or bring it down
(ip link set up/ip link set down). You can assign private keys and
peers and other wireguard-specific atrributes to the interface (wg
set/wg setconf/wg addconf). At no point is there a daemon. You make
interfaces. You configure them. You remove them.

> Is there a preferred way to take WireGuard fully down?

ip link set wg0 down, just like you would take down any other
interface. To remove an interface, the command would be ip link del
wg0. Same as the rest of Linux networking.

> I'm not complaining. Just trying to help get clarity for myself and others.

You can head into #wireguard on Freenode, if you'd like additional
help. You can send "others" there too. There are lots of knowledgeable
people there.

> I'm also trying to fully understand the "kill switch" discussion in the
> wg-quick man page. Is it the case, given standard use of wg (without
> wg-quick), that its wg interfaces are available for unencyrpted traffic just
> if wg itself isn't actively sitting on them? Or is this vulnerabilty
> specific to wg-quick usage?

There's not a vulnerability either way with a properly configured
setup. Those example iptables lines in the man page are to prevent
leaks in case you're additionally doing various stupid things.

Jason
