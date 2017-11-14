Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 678a7790
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:49:18 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dc4c758
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Nov 2017 13:49:18 +0000 (UTC)
Received: from ibughas.pair.com (localhost [127.0.0.1])
 by ibughas.pair.com (Postfix) with ESMTP id E45401165C
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 08:53:24 -0500 (EST)
Received: from macpro.priv.abelbeck.com (wsip-70-165-110-240.om.om.cox.net
 [70.165.110.240])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by ibughas.pair.com (Postfix) with ESMTPSA id 9DD111165B
 for <wireguard@lists.zx2c4.com>; Tue, 14 Nov 2017 08:53:24 -0500 (EST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: Roaming Mischief
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAKXLc7efXWWg16XZtAEVCskG8hWWJj0ge+FDax-X5onR2AWU2Q@mail.gmail.com>
Date: Tue, 14 Nov 2017 07:53:23 -0600
Message-Id: <5E8A8905-15B2-43DB-BC28-415D0A13216B@lonnie.abelbeck.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKXLc7efXWWg16XZtAEVCskG8hWWJj0ge+FDax-X5onR2AWU2Q@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Nov 14, 2017, at 4:30 AM, Kalin KOZHUHAROV <me.kalin@gmail.com> =
wrote:

> On Tue, Nov 14, 2017 at 10:59 AM, Jason A. Donenfeld <Jason@zx2c4.com> =
wrote:
>> The other approach would be to add an optional exclamation
>> mark to the end of an endpoint specification
>> (Endpoint=3Dmy.server.whatever.zx2c4.com:51820!), that would prevent
>> servers from roaming; the client would still roam in the eyes of the
>> server, but the server, would no longer roam in the eyes of the
>> client. In other words, an option -- gasp, a nob! -- to disable
>> roaming on a per-by-peer one-sided basis. As you know, I don't really
>> like nobs. And I'd hate to add this, and then for people to use it,
>> and then loose some nice aspects of roaming, if it's not really even
>> required.
>>=20
> I have been wondering along those lines of roaming...
> There are certain use cases that require no roaming at all, e.g. a
> small set of servers that don't change IP.
> Anyway, a somewhat limited "roaming" can be achieved via DNS/hosts, if
> one trusts that system.
>=20
> While seamless roaming is a feature you use often I guess, my personal
> preference is to have it optional and explicitly specified, e.g. I
> have a few mobile devices (laptop, tablet), that only talk to 1 (or
> few at most) fixed IP (or DNS at least) "servers" (yes I know WG is
> P2P) and via those to the rest of the fixed hosts. So in this scenario
> (somewhat hard to achieve by {ip,nf}tables), I'd rather spec who is
> talking to whom, who can roam, etc.
>=20
> As for the syntax, and I hate to suggest that, adding a new option
> (breaking compatibility) like "AllowRoaming=3Dyes|1" with default
> AllowRoaming=3Dno is what I would like, instead of somewhat vague "!" =
at
> the end.

Kalin, I don't care for the somewhat vague "!"  notation either ... =
reads NOT to me.

But, I would not break compatibility, I suggest adding a "paranoid =
option" EndpointFixed ...
--
EndpointFixed - Optional, defaults to 0|no, endpoint roaming is enabled =
by default,. Set EndpointFixed to 1|yes to disable endpoint roaming.  =
Ignored if Endpoint is not defined.
--

As a side-benefit, the documentation of this option provides some =
quick-reference documentation to the operation of WireGuard.

Lonnie
