Return-Path: mardnh@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e506110a
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 10:06:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c53a4993
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Oct 2017 10:06:30 +0000 (UTC)
Date: Fri, 27 Oct 2017 12:07:58 +0200
From: Martin Hauke <mardnh@gmx.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
Message-ID: <20171027100758.ovqslypy4wexa3bw@gmx.de>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
 <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Jason,

On Thu, Oct 26, 2017 at 11:22:42PM +0200, Jason A. Donenfeld wrote:
> The latest proposal for what we're discussing lives here:
> https://git.zx2c4.com/WireGuard/commit/?h=jd/dns-hatchet
> 
> > The hatchet proposal sounds fine for a short term solution,

I also like this approach.

> The Debian maintainer of WireGuard has been talking me out of doing
> this. If I don't ship the hatchet, the solution will be:
> 
> - Things work fine on
> arch/gentoo/nix/slackware/void/alpine/exherbo/freebsd/netbsd/normallinuxdistros.
> - DNS entries aren't exclusive but otherwise work on debian/ubuntu, if
> the debian resolvconf is installed rather than openresolv.
> - Everything is broken on Fedora (and OpenSUSE?), where there's no
> openresolv or resolvconf of any kind.

SUSE/openSUSE also does not ship resolvconf/openresolvconf so it's also
affected.

> In other words, the situation is split down the traditional lines of
> the linux distro political landscape. Most distros do the sensible
> thing. Debian does something bizarre and different but that is vaguely
> compatible though not entirely. Redhat holds out in favor of
> systemdnetworkmanagerblabla rather than going with the established
> standard.

SUSE has it's own system called netconfig for handling changes to the
name resolution.

https://github.com/openSUSE/sysconfig/blob/master/doc/README.netconfig
https://github.com/openSUSE/sysconfig/blob/master/doc/netconfig.8

For the interface-handling SUSE is using wicked:
https://github.com/openSUSE/wicked
https://doc.opensuse.org/documentation/leap/reference/html/book.opensuse.reference/cha.basicnet.html#sec.basicnet.nameres
https://www.suse.com/documentation/sles-12/book_sle_admin/data/sec_basicnet_manconf.html

The long term solution should be a proper integration into these frameworks.
That's also something on my personal TODO-list since some time :-)

I also have to speak with some SUSE-people since I remember
discussions some of the functions of netconfig should be replaced with
someting else (maybe even systemd).

> So, if I don't ship the hatchet, then I'll leave it to you to handle
> making things not totally fail in Fedora, as they do now. Is this
> okay? You could choose to fix this by just shipping the hatchet patch
> yourself. Or you could try to integrate things a bit deeper with
> whatever networkmanagersystemdresolveddhclientscript situation is
> being used there. (Probably the hatchet is a bit easier though.) What
> would you think of doing that?

Shipping the hatchet will give the affected distributions some time
for a proper distro-specific integration.

best regards,
Martin
