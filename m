Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1626cc9f
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 02:52:22 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e3802d3
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 02:52:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8220A20974
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 22:54:02 -0400 (EDT)
Message-Id: <1508986442.581908.1151315616.1C72E382@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
In-Reply-To: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
Date: Thu, 26 Oct 2017 15:54:02 +1300
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

It looks ... really elegant to me.  That said, it could end up being
super confusing.  I definitely second Kalin's comments about adding a
comment header to /etc/resolv.conf.wg-quick.wg0

I was going to ask about unlinking, but you've addressed that in your
follow-up.

All that's left is for me to hat-tip your Paulsen reference.  I still
have that book at home, probably been 20 years since I've read it. 
Linux certainly has an abundance of porcupines buried in the terrain.

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Thu, 26 Oct 2017, at 11:43, Jason A. Donenfeld wrote:
> Hi,
> 
> A sensible way to manage DNS on a distribution is via openresolv's
> resolvconf(8) [1]. Various networking utilities can call resolvconf
> with various arguments, and resolvconf will handle everything.
> 
> Resolvconf offers two useful options: metric via -m and exclusive via
> -x. The metric options imply controls the order of entries in the
> subsequent /etc/resolv.conf. The exclusive option sets the provided
> nameserver to be the _only_ one listed in /etc/resolv.conf. This
> general system works great and is what wg-quick(8) uses at the moment.
> 
> Debian (and by extension Ubuntu), however, ship with a butchered
> resolvconf [2] that silently ignores the -m and -x options. Instead,
> Debian's resolvconf orders the entries of /etc/resolv.conf according
> to some pre-defined interface naming heuristics, and does not allow
> for an exclusive mode at all. wg-quick thus uses openresolv's -m 0 and
> -x arguments, described above, but does so for an interface called
> "tun.wg0". The "tun." prefix tricks Debian's resolvconf into ordering
> WireGuard entries first, but still not exclusively.
> 
> Meanwhile, Fedora does not ship resolvconf at all, and instead either
> uses NetworkManager or dhclient-script, depending on the configuration
> of a variable inside of some file in /etc/sysconfig/network-scripts/.
> I haven't really looked at how to coherently interface with all the
> possibilities, and I'm kind of reluctant to look.
> 
> So I have three options: 1) require openresolv, 2) punt the issue to
> distro package managers, by making wg-quick "source" a file in
> /usr/lib/wg-quick/dns.bash that provides the distro-specific
> DNS-setting function, or 3) the hatchet, described below.
> 
> Before I describe the hatchet, though, it might be worthwhile to
> remind ourselves of the three goals of DNS setting in this
> environment: a) be the exclusive DNS entry, b) restore the previous
> settings when the wireguard interface is removed, and c) not allow
> other things on the system (like roving dhcp daemons) to overwrite our
> settings.
> 
> The hatchet works as follows. On interface addition:
> 
> # echo nameserver 1.2.3.4 > /etc/resolv.conf.wg-quick.wg0
> # [ -f /etc/resolv.conf ] || touch /etc/resolv.conf
> # mount -o ro --bind /etc/resolv.conf.wg-quick.wg0 /etc/resolv.conf
> # unlink /etc/resolv.conf.wg-quick.wg0
> 
> On interface removal:
> 
> # umount /etc/resolv.conf
> 
> This achieves all goals. Goal (a) is achieved because we're mounting
> over the existing /etc/resolv.conf, so we blow away old entries. Goal
> (b) is achieved because unmounting reveals the original file just
> below it. Goal (c) is achieved because we're mounting as read-only; we
> can't even remove the file without unmounting.
> 
> So, I'm leaning over going with (3) the hatchet rather than (2) the
> distros, because I think this will likely work more universally.
> However, it's a hatchet. And hatchets have sharp dangerous blades, and
> Linux is not the rewarding bush terrain of Gary Paulsen.
> 
> Can anybody think of any potential issues with this?
> 
> Thanks,
> Jason
> 
> 
> [1] https://roy.marples.name/projects/openresolv
> [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=860564
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
