Return-Path: chm.duquesne@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e785d27
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 11:28:46 +0000 (UTC)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
 [209.85.223.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db981a47
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Apr 2018 11:28:46 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id s9so2410279ioc.3
 for <wireguard@lists.zx2c4.com>; Thu, 12 Apr 2018 04:42:47 -0700 (PDT)
MIME-Version: 1.0
Sender: chm.duquesne@gmail.com
In-Reply-To: <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
References: <CAHLp1Yk8oz-agDoJzKuU1SK9zsFL7HKep02r-n3hNcrYffp-CQ@mail.gmail.com>
 <CAHLp1YndY6g+WdQbNOYdo5AdGR22doGZN0_cVc+f2pG=bn8F-Q@mail.gmail.com>
From: Christophe-Marie Duquesne <chmd@chmd.fr>
Date: Thu, 12 Apr 2018 13:42:25 +0200
Message-ID: <CAHLp1YkNypEBTK3MWN9hOgBt9p1jh1z76U0tdGTccbJ_PeA=Pw@mail.gmail.com>
Subject: Re: wg-ip,
 a tool to assign automatic ip addresses to wireguard interfaces
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Weird. Once again, I did not receive this answer and saw it on the
online archive.

from https://lists.zx2c4.com/pipermail/wireguard/2018-April/002598.html:
> > I could add this to the script, but I figured that for the number of
> > peers I have and for the network ranges I am using, it is utterly
> > pointless. How many peers do you intend to have?
>
> It will depend how popular the project will be. Theoretically it could
> be 100'000 or even more peers. And for certain reasons I prefer to use
> ip4.

With this amount of peers, using such a method is a very, very bad
idea. Even in the 10.0.0.0/8 range, so a 24 bits address space,
generating pseudo-random ip addresses will not work. In that space,
the probability of collision for a new peer is about 1-e^(- n^2/ 2^25)
(see https://en.wikipedia.org/wiki/Birthday_problem#Approximations).
- With n=2^12 (4096 peers), that is a 40% chance.
- With n=2^13 (8192 peers), that is 85 %.
- With n=2^14 (16384 peers), that is 99.9%
- At n=2^15... My calculator already approximates this to 100%, and we
are not even close to your target (32768 peers, we need to quadruple
this to reach 100.000 peers).
This means that randomly generating an address which does not collide
with existing peers is increasingly more expensive, for each new peer.
You will re-try more and more before you can generate a key pair that
yields a non colliding ip address. This is simply not doable.

Long story short, you need a proper central server that will find the
next ip address, or you need to stick to ipv6 (and in that case the
address space makes it pointless to do that check).
