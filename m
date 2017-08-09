Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29e23c04
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 19:56:40 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5ce55c23
 for <wireguard@lists.zx2c4.com>; Wed, 9 Aug 2017 19:56:40 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Egbert Verhage <egbert@eggiecode.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Anonymous Anonymous <admin@hda.me>,
 "WireGuard mailing list" <wireguard@lists.zx2c4.com>
Subject: Re: Advising in packages to load new module or reboot
In-Reply-To: <1502277405.1043.2.camel@eggiecode.org>
References: <20170808231612.GA24254@zx2c4.com>
 <1502277405.1043.2.camel@eggiecode.org>
Date: Wed, 09 Aug 2017 13:05:14 -0400
Message-ID: <87mv78r7sl.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed 2017-08-09 13:16:45 +0200, Egbert Verhage wrote:

> Ow, that it is a common problem.
> I think your patch is a nice updated.
>
> So I got some time left and build a patch (pull request) on github
> here: https://github.com/EggieCode/wireguard-ppa/pull/24

thanks for writing this notification, Jason, and for including it in
your ubuntu ppa, Egbert.

I'm wondering whether the advice it gives is correct and thorough enough
for non-gentoo users, though.

If i "rmmod wireguard && modprobe wireguard" won't my configuration be
lost?  You point out that you might want to tear them down gracefully
first.  But then no mention of needing to bring them up again later?

Aren't there additional commands that the admin will have to do to have
a *functional* wireguard implementation, and those commands might
differe based on their userspace layout/configuration/policy?

The simplest instruction for the upgrade (which is probably offensive to
all of us here) is to say "you should reboot your machine for the
wireguard upgrade to take effect" -- that gets us the benefit of any
userspace wireguard configuration that happens during system
initialization to happen, without having to guess/poke/prod at the
user's networking config while live.

Also, for an administrator doing this over ssh, we might want to warn
them that taking these steps will lock them out if they're connecting
via ssh on top of wireguard, right?

      --dkg
