Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d7911e0
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 08:47:32 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7099f83
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 08:47:32 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id b127so9930103wmf.5
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 02:01:32 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1523523686.12730.29.camel@gmail.com>
Subject: Re: wg-ip, a tool to assign automatic ip addresses to wireguard
 interfaces
From: ST <smntov@gmail.com>
To: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Thu, 12 Apr 2018 12:01:26 +0300
In-Reply-To: <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
 <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> from https://lists.zx2c4.com/pipermail/wireguard/2018-April/002595.html:
> > PS: you write that the "tool does not handle collisions", but does it
> > recognize and/or warn about them? I.e. if a peer with the newly
> > suggested IP exists already - will it warn?
> 
> No, no detection is attempted. The script will not warn you.
> 
> > For automation it would be nice to have some sort of "force" or
> > "keep-trying" options, so the tool regenerates the keys trying to find a
> > free IP and subsequently assigns it. With the enabled SaveConfig options
> > the new IP will be saved in the config file...
> 
> This is why there is a 'gen' command to make an ip for a single
> pubkey. I do not see a good way to extract that info from a particular
> wireguard interface, because this interface might not know all other
> peers involved in the network, so it I find it pointless to scan for
> collisions since you can do this and it will still go undetected.

You are right. Such a scan only makes sense on a "central server" which
knows _all_ other peers, but such a use case is quite common.

Another easy way to let all peers be aware of all peers (complete N:N
mesh) is through introduction of "includes" in the config file, as I've
recently proposed:

https://lists.zx2c4.com/pipermail/wireguard/2018-March/002561.html

Unfortunately there was no feedback on that suggestion...

> If you want absolutely want to be sure to generate a key pair which
> generates an ip that is garanteed to not collide with existing peers,
> it should be fairly straightforward. Assuming all the ips of existing
> peers are in the file 'ips':
> 
> for i in ($seq 1 1000); do # try 1000 times
>   privkey=$(wg genkey)
>   ip=$(echo $privkey | wg pubkey | xargs wg-ip gen)
>   if ! grep -qs "^$ip$" ips; then
>     echo privkey: $privkey
>     echo pubkey: $(echo $privkey | wg pubkey)
>     break
>   fi
> done
> echo "Could not generate a non colliding key"

Thank you! I'm not that experienced with bash scripting so this will be
useful!

What I was thinking to implement is the following: there is a central
publicly visible server with a script `add_peer` . Once called without
any arguments, the script is supposed to automatically add a new peer to
the configuration of the central server (i.e. to itself) and output a
complete corresponding configuration for the peer. This way you can span
a VPN automatically...

> I could add this to the script, but I figured that for the number of
> peers I have and for the network ranges I am using, it is utterly
> pointless. How many peers do you intend to have?

It will depend how popular the project will be. Theoretically it could
be 100'000 or even more peers. And for certain reasons I prefer to use
ip4.

> By the way, I just took care of removing all bashisms and I added
> automated testing of this script with the 'dash' shell. It should be
> safe to run on platform where bash is not present, such as openwrt.

Thank you!
