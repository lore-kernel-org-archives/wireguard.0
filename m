Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9fd3662
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 19:20:41 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b32e8c0
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 19:20:41 +0000 (UTC)
Message-ID: <1516389840.1131.2.camel@eggiecode.org>
Subject: Re: decoupling version dependencies from metapackage in debian/ubuntu?
From: Egbert Verhage <egbert@eggiecode.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Daniel Kahn Gillmor
 <dkg@fifthhorseman.net>
Date: Fri, 19 Jan 2018 20:24:00 +0100
In-Reply-To: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
References: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Fri, 2018-01-19 at 14:21 +0100, Jason A. Donenfeld wrote:
> Hey Egbert, Daniel,
> 
> Someone in #wireguard is getting weird errors about version
> dependencies between packages. I started looking into it and noticed
> the strong coupling between the metapackage version and the other two
> packages' versions.
> 
> The users' issue seems mostly like an Ubuntu problem: they build
> _all,
> _amd64, and _x86 immediately, but delay the other architectures until
> later. So, the user in #wireguard was using an aarch64 board, which
> pulled in the newer _all package, but that package was unable to
> subsequently satisfy its architecture-specific dependencies, since
> they hadn't been built yet. Annoying Launchpad bug; news at 11.

This sucks and most strangest about it that it states that it starts in
17 hours.
https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+build/14252
241

Even with a simple test on my personal PPA is states that I starts in
20 hours. 

> 
> But regardless of Launchpad particularities, I was wondering what the
> motivation is for coupling versions together. Since the Netlink
> changes, there should be compatibility between the tools and the
> module. Does that mean it's not useful for the metapackage to do
> strong coupling? Or is there some other factor this is accounting for
> that I don't know about.
> 

If you want the merge the 2 packages it can be a bit tricky.
First of you need to remove the old packages wireguard-dkms and
wireguard-tools by the next upgrade and sure not the overwire any
config and not to create conflicts with the old dpkg package.

Second thing is that not everybody installs dkms and tools package, for
example in a lxd containers I only install wireguard-tools to init a
wireguard interface.

Besides that packages like virtualbox have a extra package for dkms if
what that, it does not depend on the dkms package.

Maybe for now remove the metapackage in the PPA?

Greetz,
Egbert
