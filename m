Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6816578c
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:20:58 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b052f7b7
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8943859
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:20:58 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 88751297
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Oct 2017 21:20:58 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id c77so8013797oig.0
 for <wireguard@lists.zx2c4.com>; Thu, 26 Oct 2017 14:22:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
References: <CAHmME9q0m1rEfc_CFsb3qv6oQ97QOjtPDxe6yY+D+0aAApE9Yg@mail.gmail.com>
 <3a761178-19bc-1d01-b6a8-9fb801312d47@solidadmin.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Oct 2017 23:22:42 +0200
Message-ID: <CAHmME9q3g3622k6C+pcvb_EpA9NdedTmmE59vohUR3nF3fyuvg@mail.gmail.com>
Subject: Re: Fixing wg-quick's DNS= directive with a hatchet
To: Joe Doss <joe@solidadmin.com>, Martin Hauke <mardnh@gmx.de>,
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

Hi Joe & Martin,

The latest proposal for what we're discussing lives here:
https://git.zx2c4.com/WireGuard/commit/?h=jd/dns-hatchet

> The hatchet proposal sounds fine for a short term solution,

The Debian maintainer of WireGuard has been talking me out of doing
this. If I don't ship the hatchet, the solution will be:

- Things work fine on
arch/gentoo/nix/slackware/void/alpine/exherbo/freebsd/netbsd/normallinuxdistros.
- DNS entries aren't exclusive but otherwise work on debian/ubuntu, if
the debian resolvconf is installed rather than openresolv.
- Everything is broken on Fedora (and OpenSUSE?), where there's no
openresolv or resolvconf of any kind.

In other words, the situation is split down the traditional lines of
the linux distro political landscape. Most distros do the sensible
thing. Debian does something bizarre and different but that is vaguely
compatible though not entirely. Redhat holds out in favor of
systemdnetworkmanagerblabla rather than going with the established
standard.

So, if I don't ship the hatchet, then I'll leave it to you to handle
making things not totally fail in Fedora, as they do now. Is this
okay? You could choose to fix this by just shipping the hatchet patch
yourself. Or you could try to integrate things a bit deeper with
whatever networkmanagersystemdresolveddhclientscript situation is
being used there. (Probably the hatchet is a bit easier though.) What
would you think of doing that?

Regards,
Jason
