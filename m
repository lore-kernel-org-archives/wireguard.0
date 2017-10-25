Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16bde0fb
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 22:42:12 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd7432a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 22:42:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf7ba06f
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 22:42:12 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9e2c03cb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Oct 2017 22:42:12 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id j126so2673488oib.8
 for <wireguard@lists.zx2c4.com>; Wed, 25 Oct 2017 15:43:50 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 00:43:49 +0200
Message-ID: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
Subject: Fixing wg-quick's DNS= directive with a hatchet
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

A sensible way to manage DNS on a distribution is via openresolv's
resolvconf(8) [1]. Various networking utilities can call resolvconf
with various arguments, and resolvconf will handle everything.

Resolvconf offers two useful options: metric via -m and exclusive via
-x. The metric options imply controls the order of entries in the
subsequent /etc/resolv.conf. The exclusive option sets the provided
nameserver to be the _only_ one listed in /etc/resolv.conf. This
general system works great and is what wg-quick(8) uses at the moment.

Debian (and by extension Ubuntu), however, ship with a butchered
resolvconf [2] that silently ignores the -m and -x options. Instead,
Debian's resolvconf orders the entries of /etc/resolv.conf according
to some pre-defined interface naming heuristics, and does not allow
for an exclusive mode at all. wg-quick thus uses openresolv's -m 0 and
-x arguments, described above, but does so for an interface called
"tun.wg0". The "tun." prefix tricks Debian's resolvconf into ordering
WireGuard entries first, but still not exclusively.

Meanwhile, Fedora does not ship resolvconf at all, and instead either
uses NetworkManager or dhclient-script, depending on the configuration
of a variable inside of some file in /etc/sysconfig/network-scripts/.
I haven't really looked at how to coherently interface with all the
possibilities, and I'm kind of reluctant to look.

So I have three options: 1) require openresolv, 2) punt the issue to
distro package managers, by making wg-quick "source" a file in
/usr/lib/wg-quick/dns.bash that provides the distro-specific
DNS-setting function, or 3) the hatchet, described below.

Before I describe the hatchet, though, it might be worthwhile to
remind ourselves of the three goals of DNS setting in this
environment: a) be the exclusive DNS entry, b) restore the previous
settings when the wireguard interface is removed, and c) not allow
other things on the system (like roving dhcp daemons) to overwrite our
settings.

The hatchet works as follows. On interface addition:

# echo nameserver 1.2.3.4 > /etc/resolv.conf.wg-quick.wg0
# [ -f /etc/resolv.conf ] || touch /etc/resolv.conf
# mount -o ro --bind /etc/resolv.conf.wg-quick.wg0 /etc/resolv.conf
# unlink /etc/resolv.conf.wg-quick.wg0

On interface removal:

# umount /etc/resolv.conf

This achieves all goals. Goal (a) is achieved because we're mounting
over the existing /etc/resolv.conf, so we blow away old entries. Goal
(b) is achieved because unmounting reveals the original file just
below it. Goal (c) is achieved because we're mounting as read-only; we
can't even remove the file without unmounting.

So, I'm leaning over going with (3) the hatchet rather than (2) the
distros, because I think this will likely work more universally.
However, it's a hatchet. And hatchets have sharp dangerous blades, and
Linux is not the rewarding bush terrain of Gary Paulsen.

Can anybody think of any potential issues with this?

Thanks,
Jason


[1] https://roy.marples.name/projects/openresolv
[2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=860564
