Return-Path: maximilian.pudelko@tum.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56dd6e59
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 12:16:31 +0000 (UTC)
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de
 [IPv6:2001:4ca0:0:103::81bb:ff89])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cb215fd
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 12:16:30 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 41K5xL23sKzyb2
 for <wireguard@lists.zx2c4.com>; Mon,  2 Jul 2018 14:22:46 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id VfHTwJYRMs5C for <wireguard@lists.zx2c4.com>;
 Mon,  2 Jul 2018 14:22:45 +0200 (CEST)
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
 [209.85.223.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 41K5xJ2hMMzyb7
 for <wireguard@lists.zx2c4.com>; Mon,  2 Jul 2018 14:22:43 +0200 (CEST)
Received: by mail-io0-f182.google.com with SMTP id i23-v6so14534981iog.10
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 05:22:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rKJQGJND76mFSFMdKJ+gf_kKQxOyd_rAnrVVUJkEZp5g@mail.gmail.com>
References: <CAJ5iZ8_X4Wk1BeLxdkWYViZRN+biJ--AA2w9CojJcciW_RmrZw@mail.gmail.com>
 <CAHmME9rKJQGJND76mFSFMdKJ+gf_kKQxOyd_rAnrVVUJkEZp5g@mail.gmail.com>
From: Maximilian Pudelko <maximilian.pudelko@tum.de>
Date: Mon, 2 Jul 2018 12:22:22 +0000
Message-ID: <CAJ5iZ88Yhz+5oq+BvbCQE8uK79zJ9UJPmtD8Sw-K92_L9afW6g@mail.gmail.com>
Subject: Re: Poor performance under high load
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Hi Jason,

>try the same test with 0.0.20180620 and 0.0.20180625
The Ubuntu ppa only contains version 0.0.20180625 as far as I can see
(apt-cache madison wireguard), so I only measured this version.
It's a bit (+0.1 Mpps) faster across the board and does drop to zero
later (~2.5 Mpps load). See the graph for details:
https://github.com/pudelkoM/MoonWire/blob/master/benchmarks/wireguard/results/0.0.20180625/encrypt-64.pdf

>Care to share your benchmark scripts?
No problem, but I doubt that these are integrate-able into a build
pipeline because they depend on libmoon (Lua wrapper for DPDK),
require at least 10 Gbit NICs and some manual data collection.
https://github.com/pudelkoM/MoonWire/tree/master/benchmarks


FYI: I'm also working on a WireGuard prototype based on DPDK to see
the performance impact of different network stacks. A very early
version that just receives, encrypts and forwards packets reaches
around 1.4 Mpps _on a single core_, so pretty promising if that can be
scaled up. But that's very far away from done (no handshakes,
hardcoded keys, single session, ...). See the same repository for
source.


Max


2018-06-26 17:57 GMT+00:00 Jason A. Donenfeld <Jason@zx2c4.com>:
> Hi Max,
>
> Thanks for doing this test; that's super useful. What you're
> describing is definitely not expected behavior. Think you could try
> the same test with 0.0.20180620 and 0.0.20180625? In particular, I'm
> interested to know whether a performance _regression_ introduced in
> 0.0.20180620 actually results in the correct behavior.
>
> Meanwhile, we (CC'd) have been working on implementing a lockfree
> queue structure, but we haven't seen any configurations yet where this
> actually results in a performance improvement.
>
> Care to share your benchmark scripts? Sounds like this could be really
> useful for directing our optimizations.
>
> Jason
