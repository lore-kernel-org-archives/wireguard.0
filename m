Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf70653
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:18:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2210f777
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:18:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 89c63ebb
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:09:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8ec29477
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Jan 2018 13:09:16 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id t35so1355856otd.13
 for <wireguard@lists.zx2c4.com>; Fri, 19 Jan 2018 05:21:43 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 19 Jan 2018 14:21:42 +0100
Message-ID: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
Subject: decoupling version dependencies from metapackage in debian/ubuntu?
To: Egbert Verhage <egbert@eggiecode.org>,
 Daniel Kahn Gillmor <dkg@fifthhorseman.net>
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

Hey Egbert, Daniel,

Someone in #wireguard is getting weird errors about version
dependencies between packages. I started looking into it and noticed
the strong coupling between the metapackage version and the other two
packages' versions.

The users' issue seems mostly like an Ubuntu problem: they build _all,
_amd64, and _x86 immediately, but delay the other architectures until
later. So, the user in #wireguard was using an aarch64 board, which
pulled in the newer _all package, but that package was unable to
subsequently satisfy its architecture-specific dependencies, since
they hadn't been built yet. Annoying Launchpad bug; news at 11.

But regardless of Launchpad particularities, I was wondering what the
motivation is for coupling versions together. Since the Netlink
changes, there should be compatibility between the tools and the
module. Does that mean it's not useful for the metapackage to do
strong coupling? Or is there some other factor this is accounting for
that I don't know about.

(Apologies in advance if I've managed to misunderstand dpkg again.)

Jason
