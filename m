Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 019b1c22
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 18:41:16 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e528a02
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 18:41:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8231c46
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 18:41:16 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 03409639
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 18:41:16 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id v84so552889695oie.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jan 2017 10:50:15 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 4 Jan 2017 19:50:14 +0100
Message-ID: <CAHmME9qEs=oHr=r=dfAeiL=QGXxOeNmuFUkrnbv7L4MBbHb+tw@mail.gmail.com>
Subject: distro packaging, makefiles, deps, systemd, new tools
To: Christian Hesse <mail@eworm.de>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Christian, Daniel, Dan, and other maintainers,

The next snapshot is going to have some improvements to the tooling,
and along with this comes a more complicated Makefile. I wanted to run
the changes by y'all (downstreams).

- The makefile now has a few WITH_{FEATURE}=yes|no environment flags,
as well as auto-detection. Documentation is here:
https://git.zx2c4.com/WireGuard/plain/src/tools/INSTALL
And the Makefile itself is here:
https://git.zx2c4.com/WireGuard/tree/src/tools/Makefile

Question: does this propose a desirable situation for you as a downstream?


- The wg-config script is now called wg-quick and is quite simple and
nice. Documentation:
https://git.zx2c4.com/WireGuard/about/src/tools/wg-quick.8
And source:
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick.bash

OpenWRT should _not_ ship this. NixOS probably should not ship this.
When systemd-networkd gets support for WireGuard, systemd-based
distros should not ship this. But everybody else who just wants a
simple rough script for quickly bringing up and down VPNs can ship
this, as it's a big help to users. It's installed according to the
documentation for the Makefile above.

- There's now an "upstream" systemd unit for wg-quick, called
wg-quick@.service. It's pretty simple:
https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick@.service

Question: does this unit seem sane to you? Can you ship it downstream
as is, or will you need modifications?

Thanks,
Jason
