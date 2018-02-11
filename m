Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22312bc6
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Feb 2018 18:15:09 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75f4f8bb
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Feb 2018 18:15:09 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>, wireguard@lists.zx2c4.com
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
In-Reply-To: <20180211134837.GC12558@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
Date: Sun, 11 Feb 2018 13:20:14 -0500
Message-ID: <87r2prs80x.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Baptiste--

On Sun 2018-02-11 14:48:37 +0100, Baptiste Jonglez wrote:

> On a x86_64 VM with quite a lot of Wireguard traffic (~300 GB per day), I
> am seeing a memory leak with wireguard 0.0.20171221-5.  System is Debian
> stretch, kernel 4.9.65-3+deb9u2, wireguard package from unstable.

oof, thanks for this report, and for the really useful graph
visualization.

it's troubling that the changes correlated with the memleak are both a
kernel upgrade *and* a wireguard upgrade, since that kind of conflation
might be difficult to tease apart.

i'm curious from the graph -- do you know what happened at the start of
week 6 where there's a sawtooth?

If you still see a leak with the latest wireguard, i'd appreciate if you
could test the current kernel with 0.0.20171011-1 to see whether you can
isolate the problem to the kernel.  i'm not recommending running
0.0.20171011-1 for the long term, but it should still be wire-format
compatible with other implementations and will help with debugging to
have the comparison.

regards,

        --dkg
