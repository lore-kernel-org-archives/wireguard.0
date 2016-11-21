Return-Path: f4136414.dNq.dMV.2g.oxNfmO+wireguard=lists.zx2c4.com@bnc.mailjet.com
Received: from o119.p4.mailjet.com (o119.p4.mailjet.com [178.33.221.119])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79ceefab
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Nov 2016 13:51:44 +0000 (UTC)
Message-Id: <f4136414.dNq.dMV.2g.oxNfmO@mailjet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
From: Joakim Sindholt <opensource@zhasha.com>
To: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Mon, 21 Nov 2016 14:55:06 +0100
In-Reply-To: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
References: <CAKXLc7fAG5xErC_vU40qOwxKxWbLAavKmomNwjOiRP=Fh+0tGg@mail.gmail.com>
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

On Fri, Nov 18, 2016 at 12:42 PM, Kalin KOZHUHAROV <me.kalin@gmail.com> 
wrote:
> Hello,
> 
> I have been testing a few things between Gentoo and few OpenWRT 
> boxen, so far so good. Just saw that Luci config landed, recompiling 
> now.
> 
> This brings me to "What is a good way to ingrate (as of now) 
> wireguard into openrc in Gentoo?" question.
> 
> I have my scripts, I just found out about 
> /lib64/netifrc/net/wireguard.sh but I couldn't find a way to edit 
> /etc/conf.d/net so that I can integrate it.
> 
> Since Jason is a Gentoo user/dev I thought that is already solved :-D

I'm the idiot who wrote it, not Jason - direct your frustration towards 
me :)

The idea is that the wireguard_$if variable is passed to 'wg set' or 
'wg setconf',
depending on whether or not it's a single argument and a file.
You join this with config_$if which is passed to 'ip address', and 
optionally
routes_$if to create custom routes and 'rules_$if' which is passed to 
'ip rule'.

There are a couple of problems with this - the number I've experienced 
being that
dhcpcd has no respect for network config it didn't create and so it 
will happily
nuke the ip rules every time it renews the dhcp lease.

> An example static config for the simple case of
> 
> host_A:wg0<----->wg0:host_B
> 
> and
> 
>               /-->wg0:host_B
> host_A:wg0<--||
>               \-->wg0:host_C
> 
> (say where A,B,C share some private subnet) will be appreciated.

You can directly follow the terminal examples from eg. the quickstart 
page.
Interface creation is automatic so you just need a 
config_wg0=ip-addr-line and
wireguard_wg0=wg-set-line and you're golden.

> Any good "default" way to store config files? Private keys?
