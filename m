Return-Path: paul@makrotopia.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5aedaa1b
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 03:40:46 +0000 (UTC)
Received: from fudo.makrotopia.org (fudo.makrotopia.org
 [IPv6:2a07:2ec0:3002::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a6764b8
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 May 2018 03:40:46 +0000 (UTC)
Date: Thu, 17 May 2018 12:40:55 +0900
From: Paul <paul@makrotopia.org>
Subject: Re: Need for HW-clock independent timestamps
To: Steve Gilberd <steve@erayd.net>
Message-Id: <1526528456.18498.0@mail.makrotopia.org>
In-Reply-To: <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
 <489c2f57-574a-1223-9c4d-266904e52c94@gmail.com>
 <20180515202126.yw57deh6st5ebnk6@kowloon>
 <CAKXLc7drht4CVexsCTXwHe-Z_RyFghAhQsXom=z9dtQuxQU48Q@mail.gmail.com>
 <20C72316-B8FC-4515-8DC8-8BC82BF3864F@cgws.de>
 <CAJQSx3at0rGtjPrpch2mcCqeTQCZVwaiG1kSHBW19Nk4McJxGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi all,

If I'm not mistaken replay attacks are checked here [1] and only 
compare integers with no reference to local time of the receiving node.

The sending nodes timestamp is generated via tai64n_now [2][3]. From my 
understanding this function could simply be changed to a auto increased 
counter, periodically saved on disc and increased on boot, following 
the approach described by Axel Neumann[4]. Mixing real timestamps and 
counter should be compatible to one another. Only drawback is see is 
that the overview function is likely mixed up [5].

All could be done by a patch specifically for HW-clock less devices or 
added to OpenWrt buildroot only[6].

Any reasons why such a patch could be bad?

[1]: 
https://github.com/WireGuard/WireGuard/blob/ddb82700a810c3f929e5a2fff00254b29eadc689/src/noise.c#L454
[2]: 
https://github.com/WireGuard/WireGuard/blob/ddb82700a810c3f929e5a2fff00254b29eadc689/src/noise.c#L353
[3]: 
https://github.com/WireGuard/WireGuard/blob/ddb82700a810c3f929e5a2fff00254b29eadc689/src/noise.c#L396
[4]: https://github.com/bmx-routing/bmx7/blob/semtor/bmx.c#L1397
[5]: 
https://github.com/WireGuard/WireGuard/blob/a7f2ceacb9ee09ab37302cddc0ce15a96fd95e70/src/tools/show.c#L25
[6]: 
https://github.com/openwrt/openwrt/tree/master/package/network/services/wireguard/patches

Just a few thoughts regarding GPS:

On Thu, May 17, 2018 at 5:32 AM, Steve Gilberd <steve@erayd.net> wrote:
> > $20 would increase the HW cost of many typical community-networks 
> (CN) deployments significantly.
> 
> This seems unlikely. In most cases, $20 is notably less than the cost 
> of a single node.

I'd doubt that. People massively use TP-Link 841 (~20$, 100%) or 
Uqiquity Nanobeams (~60$, 34%) as node hardware.

> > Plus requiering more knowledge, maintenence, and power supply for 
> sometimes solar-powered setups... no USB.
> 
> If that's a concern, then put the GPS on nodes where those 
> constraints aren't a problem. You only need GPS on a few nodes (or 
> one node if you don't care about redundancy). Most nodes will get by 
> just fine with just plain NTP, and can happily fetch their time from 
> the GPS nodes, or from other non-GPS nodes with a correct time sync.

This was already answered and found as unusable as it introduces 
additional configuration of all nodes, firewall rules, etc?

> 
> > It is really NOT as simple as it sounds to plug a $20 GPS !!!
> 
> It's not particularly complicated either. The actual setup of the 
> devices isn't particularly difficult, and you're already touching 
> these nodes to set up wireguard on them, so "I have to touch the 
> config" isn't a barrier in this case.

Opening and closing (in a waterproof manner) the previously mentioned 
Nanobeam is not particularly trivial. Also it introduces a whole stack 
of device specific knowledge. As stated before, this changes the 
configuration from "enter wireguard credentials" to "{open, buy 
additional, glue} hardware, setup {wireguard, gps, more?}.

For me it looks like a problem solvable in software (as done for the 
BMX routing protocol). Why even bother to get hardware involved?

Sunshine,
Paul
