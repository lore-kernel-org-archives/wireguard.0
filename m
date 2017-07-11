Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bf74ffc
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 10:05:01 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6f924290
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 10:05:01 +0000 (UTC)
Message-ID: <1499768576.988.3.camel@eggiecode.org>
Subject: Re: Debian-based configuration for wireguard
From: Egbert Verhage <egbert@eggiecode.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, jomat+wireguard.io@jmt.gr
Date: Tue, 11 Jul 2017 12:22:56 +0200
In-Reply-To: <87ziccyoo1.fsf@fifthhorseman.net>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
 <35cd4d321a82ba05aa4e118979bc5a87@jmt.gr>
 <20170710025323.GC31153@zx2c4.com> <1499716437.988.1.camel@eggiecode.org>
 <87ziccyoo1.fsf@fifthhorseman.net>
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

Hey dkg,
 

On Mon, 2017-07-10 at 17:20 -0400, Daniel Kahn Gillmor wrote:
> 
> thanks for these pointers, Egbert!
> 
> i have a few questions about the proposed modification for ifupdown:
> 
>  * do we really want this to be a new interface type instead of
>    extending the capabilities of some other configuration type?
Was easy for me to recognize the wireguard interface as a config type
in a network/interface config.
And wanted to learn how the package of ifupdown work.
> 
>  * if we can't just extend an existing type, wireguard seems more
>    analogous to the "tunnel" type than to the "static" type, which is
>    what this seems to have evolved from.
Indeed it is just a copy of the static type and I have not seen the
tunnel type.
> 
>  * it looks to me like configuring a wireguard link this way will
>    require an entry in /etc/network/interfaces (or interfaces.d)
> *and* a
>    config file in /etc/wireguard/*.conf.  It seems like it would be
>    cleaner to have all the configuration in one place, no?
Yes I would be cleaner, but the config of wg can change so I have keep
it separate.
> 
>  * would you consider submitting these changes to ifupdown in the
> debian
>    BTS?  Is there a reason that they should remain in your PPA?
Nop, just a proof of concept (My case used with ansible to rollout ~10
machines). 
> 
> fwiw, some of us do also run debian systems without ifupdown these
> days.
> I'm looking forward to systemd-networkd integration personally :)
Me to, I hope in the next ubuntu lts ifupdown has been replaced with
systemd-networkd. Then works _network-online.target_ proper in a
systemd service. (And ofc the wg is in the main stream kernel).

I made the update to ifupdown when wg-quick was not around.
Besides that, the only thing I don't like about wg-quick if you put
0.0.0.0 in the AllowedIPs it automaticly make a default route to the wg
endpoint.

Greetz,
Egbert
