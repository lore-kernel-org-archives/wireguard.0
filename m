Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5d821d42
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 14:03:59 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d39e520c
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 14:03:59 +0000 (UTC)
Received: from [172.16.3.204]
 (dslb-094-216-164-207.094.216.pools.vodafone-ip.de [94.216.164.207])
 by v32412.1blu.de (Postfix) with ESMTPSA id 2FB15202B2
 for <wireguard@lists.zx2c4.com>; Wed,  1 Mar 2017 15:05:48 +0100 (CET)
Subject: Re: [ wireguard-devel] Purge old peer
To: wireguard@lists.zx2c4.com
References: <CADdae-jn7qKK=sg7QdP-UeepBrZyUswV4LkABCXsrpzexymk3g@mail.gmail.com>
From: jens <jens@viisauksena.de>
Message-ID: <ec8f9393-44a9-2143-c5f8-ed7c027dd577@viisauksena.de>
Date: Wed, 1 Mar 2017 15:04:12 +0100
MIME-Version: 1.0
In-Reply-To: <CADdae-jn7qKK=sg7QdP-UeepBrZyUswV4LkABCXsrpzexymk3g@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 01.03.2017 14:47, Nicolas Prochazka wrote:
> Hello,
> we hare using wireguard with a lot of client, with a lot of
> dynamically generated peer key.
> So we have, server side, a lot of peers that are become obsoletes
> At this time, we delete peer , based on latest handshake > delta time
> , with wg command.
> Is the best thing to do ? is it possible to implement an auto purge of
> old peer ?
>
>
user handling, somehow "user-state" is something which may better
parseable in terms of "wg" output - but to implement it in wireguard
itself opens a whole lot of topics. And i prefer solutions build around
the kernel modul itself and keep it quite impossible to trigger an
invalidation of any peer (by manipulating time servers or exploiting
some strange timeissues like leap seconds, timezones etc.) - especially
since this is the special usecase for many2one connections, like your
Serverexample.

--=20
make the world nicer, please use PGP encryption
