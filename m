Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6faa2625
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:19:00 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c131547d
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:19:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5360e1fd
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:20:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e35c95dc
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 01:20:55 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id n65-v6so22289504oig.6
 for <wireguard@lists.zx2c4.com>; Sat, 05 May 2018 18:21:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
References: <73430f93-d7fa-777b-df24-ef4cb0021f0b@gmx.net>
 <CAHmME9q-wmyXw7pyLRK3YLDZxCHgKaPbx2ZJe75Yrnb4BQzwCQ@mail.gmail.com>
 <8d2259a4-15cf-d036-7dd8-fb18e8311aac@gmx.net>
 <CAHmME9q3YF87P9u3WXuXPU9nUZtXPWmRS0raw_8p6Gy-CghJdg@mail.gmail.com>
 <493b3bdf-3cf0-5594-dd7e-4b9c8d84e74c@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 May 2018 03:21:09 +0200
Message-ID: <CAHmME9r5cwdfDaHCbO50UhREG9z2zv39y+32YYwAYJEfsGDgVA@mail.gmail.com>
Subject: Re: WG interface to ipv4
To: vtol <vtol@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Cc: wireguard <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sat, May 5, 2018 at 10:18 AM, =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <v=
tol@gmx.net> wrote:
> It would certainly instill more confidence in network security/control

Why? Can you outline the threat model?

As I mentioned earlier, to disable v6 socket creation, pass
ipv6.disable=3D1 on the kernel command line, or just unload the v6
module. If you're worried about the Linux v6 stack being a pile of
scary bugs, then you certainly want to be doing this already, and not
relying on simply disabling v6 routing within that network namespace,
which you're doing with the conf.default.disable_ipv6=3D1. In other
words, if you don't want v6 for reasons of attack surface, then you
should actually be disabling v6 properly.

> Which brings up the next point, I have asked previously twice about -
> wildcard ip 0.0.0.0 . How to bind WG to a particular iface/subnet, as  a
> another matter of network security?

Why is this a matter of network security? WireGuard will ignore
packets that don't have the correct authentication tag. If you're
receiving authentic packets, you're receiving authentic packets, and
the origin shouldn't matter, in terms of the packets' authenticity. In
other words, if an attacker has stolen a private key, this is the
problem to address. Anyway, regardless of this, if you want to filter
out packets coming from a certain interface, a certain subnet, or any
other characteristics, use netfilter and make these preferences
explicit in your rules, rather than the implicit details of listening
sockets.
