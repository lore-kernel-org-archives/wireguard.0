Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5f017c2
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 04:45:21 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d13f474
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Nov 2017 04:45:21 +0000 (UTC)
Date: Sat, 11 Nov 2017 13:48:56 +0900
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com
Subject: WireGuard Upstreaming Roadmap (November 2017)
Message-ID: <20171111044854.GA7956@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi folks,

This relates to WireGuard [0].

Following a very nice conference with the Linux kernel networking subsystem
community [1,2], I thought it might be a good idea to spell out the roadmap
for the coming months and the trajectory into upstream, based on my
discussions with several developers and maintainers. There are several threads
of this, the biggest of which surrounds the kernel code base, but there are
some other ends of the WireGuard project as a whole that are also relevant.

The current biggest blocker is issues with the crypto API. Before WireGuard
can go upstream, I intend to embark on a multi-pronged effort to overhaul the
crypto API. I very much need to sync up with Herbert regarding my plans for
this, and start spec'ing things out a bit more formally, so I can begin
concrete discussions with him. I intend to base my work both on feedback
from linux-crypto/Herbert and from the cryptographic research community. I
hope to go to RWC2018 [3] and the subsequent HACS workshop for the academic
engagement side, but of course like all the work I do on the kernel, things
will be highly based in engineering, rather than purely academic, practices.

Dave has strongly encouraged me to post patches sooner rather than later.
So I think before the crypto API is ready to go, I'll likely post a [RFG] --
request for grumbles -- patch set to netdev, in order to have some code
review, so as to gauge where we're at. This patch set will use my current
crypto API, not the kernel's crypto API, with it mentioned in the opening that
I intend to switch to the kernel's crypto API when it looks like the one used
here. This way we'll get early feedback so that the later real [PATCH] series
will go more smoothly.

There are a few WireGuard features that some of you have been waiting for. At
the urging of some folks at the conference, I intend to submit a "core"
WireGuard to upstream, and then use future releases to build on top of that,
to make the initial upstreaming process go as easily as possible. Therefore,
there are three big TODO items that may _or_ may not go in after upstreaming:

 - In-band control messages [possibly not]
 - Netlink multicast event notification
 - GRO integration

Of these, it's most likely I'll implement GRO and leave the other two until
after, but this may change. Since WireGuard already does GSO, it would make
sense to implement the other side of things too. There's also a longer more
ambitious roadmap [4], filled with both easy coding-related things and longer
term design things, but that's out of scope for this email, though many of
which will likely be completed before submission time.

There are also six other threads of development that are ongoing, which I
intend to put a bit more focus on too in the near future:

  - The userspace implementation. I'd like to bring this up to deployment
    quality, which naturally fits into the next area.

  - Mobile apps. It's fairly easy to integrate the userspace implementation
    with existing APIs. The current Android app already works well with the
    kernel module, but of course people want this more easily deployed.

  - Mac and Windows support for the userspace implementation. These are
    already mostly done, but the APIs used may in fact change, so there may
    still be a bit of work to do here before we're satisfied.

  - Bindings and libraries. Now that we have a stable Netlink API, we can
    start making nice wrappers for the various languages people like to use.
    It remains to be seen whether or not a C "libwireguard" is needed, since in
    that domain, talking Netlink directly is often a better choice, but I do see
    some potential for a pywireguard and the like. This will also be essential
    when the already mentioned plans for event notification and the possibly
    excluded control messages materialize.

  - More formal verification. While we have the cryptographic protocol
    verified, there are still more places where formalism is quite helpful,
    proving more state machines, and even proving C implementations to be
    correct. Work and research is ongoing in this domain.

  - Integration into network managers and routing daemons (mesh and
    traditional). Work has already begun here on systemd-networkd, and others
    are looking into daemons like babel and bird.

So that's where we're at. I hope to have a RFG submitted in the next several
months, and hopefully we gather some nice momentum and get the work
upstreamed and the project completed soon, for some definition of "complete".

If you'd like to work on WireGuard, or simply have any questions, don't
hesitate to email me.

Regards,
Jason


[0] https://www.wireguard.com/
[1] https://www.netdevconf.org/2.2/
[2] https://www.wireguard.com/presentations/
[3] https://rwc.iacr.org
[4] https://www.wireguard.com/todo/
