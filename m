Return-Path: me.kalin@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26c61618
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 15:19:32 +0000 (UTC)
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
 [74.125.82.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 517833f8
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 15:19:32 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id m22-v6so27618850otf.10
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 08:32:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
From: Kalin KOZHUHAROV <me.kalin@gmail.com>
Date: Thu, 5 Apr 2018 17:32:20 +0200
Message-ID: <CAKXLc7cy72yeFHSWtvC052-GNRRJOsHO4yzdAi0PcrZwL52aqw@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Ximin Luo <ximin@dfinity.org>
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

Hello Ximin,


On Thu, Apr 5, 2018 at 5:22 AM, Ximin Luo <ximin@dfinity.org> wrote:
> Our network churn is not expected to be very heavy, perhaps on the order of
> ~30 new connections per node per week or so. So any extra latency in the initial
> connection caused by this separation of layers, should not be significant.
> However this churn is probably higher than what current typical WG usages
> get exposed to.
>
Few times a day, I would even say few times per hour is a very normal use and
should not be strange, AFAIK.

> I'm also wondering how easy this would be to program. It would clearly be
> much more heavyweight than simply opening a socket, but I guess it can be done
> via invocations of the `wg` or `wg-quick` tools. Has anyone had any experience
> with this level of WG automation, could you share your thoughts?
>
Definitely not "hard", it will depend more on what you are trying to
achieve exactly.

> Would the program need any extra system-level privileges?
>
Yes for sure ;-D Adding interfaces is a admin task, using sudo or
similar should be trivial.

> Ideally we wouldn't need root, of course - does that mean we're forced to wait for a userspace WG library such
> as wireguard-rs? I understand there is a performance penalty here, but I'd have
> to run benchmarks to know if this affects our use-case significantly.
>
I don't think performance matters in your case, as it will be only
during setup; once setup,
all data goes to a socket/kernel and it doesn't matter how it was set up.

> Once the network is live, we'd need the transport protocol to be relatively
> stable, or at least be easily upgradeable - perhaps using the noise
> negotiation subprotocol to support two protocols during network upgrade times. This is
> an extra requirement that seems beyond WG's current main use-case so I was also
> wondering if that is something that you guys plan to cover.
>
Making it "support 2 protocols" in the design phase is a good practice
for availability.
It will introduce complexity, maintainability issues and thus possible
security issues.
Working out a "maintenance mode" might be easier.

Cheers,
Kalin.
