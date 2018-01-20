Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77447702
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 12:15:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3e4356b
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 12:15:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b43cf90
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 12:07:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a708eeb4
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 12:07:05 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id a184so2965787oif.7
 for <wireguard@lists.zx2c4.com>; Sat, 20 Jan 2018 04:19:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87bmhp3zv6.fsf@fifthhorseman.net>
References: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
 <87bmhp3zv6.fsf@fifthhorseman.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 20 Jan 2018 13:19:37 +0100
Message-ID: <CAHmME9oGTe0J7YXp+b1hn_4ux6Upi+BMhgst++ppcnGmgbciyA@mail.gmail.com>
Subject: Re: decoupling version dependencies from metapackage in debian/ubuntu?
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Hey Daniel,

> as explained earlier, this isn't a launchpad bug, it's a function of
> running with a rolling distribution (debian unstable and ubuntu PPAs
> both have this characteristic), where there is no coordinated
> cross-platform release schedule.

Ahh, interesting. I'm surprised there isn't an atomic replacement that
occurs only once all dependencies and reverse dependencies are
resolvable.


> If the netlink interface is actually stable, then at least as simple as
> the current arrangement (and probably more robust) to instead set up the
> dependency versioning to be at least the first version of both packages
> which agree to the stable netlink interface contract.
>
> I know that we moved from ioctl to netlink in 0.0.20171001 -- was the
> interface fully stable already by that snapshot?  if so, then i'd just
> change those metapackage dependencies to (>= 0.0.20171001) and assume
> that mixing and matching anything beyond that point is an acceptable
> choice for the package resolver.
>
> if i do that, i'd ask you to be really clear and explicit in each new
> snapshot if you think it introduces a backward-incompatible interface on
> either side of the netlink boundary.  if that happens, it's not the end
> of the world, i just want to be aware of it so that i can explicitly
> bump the dependency threshhold in the metapackage.
>
> what do you think?

This all sounds good and reasonable to me. My intention is that the
current Netlink API _is_ stable. I had the Netlink maintainer take a
look at it before it went live, and things checked out, and now
systemd-networkd is using it, so the idea here is that that API is a
stable one. If for whateverunfortunatereason it did break, this would
of course be a sufficiently large deal that I'd go through the pains
of multiparty notification, coordination, and such.

Jason
