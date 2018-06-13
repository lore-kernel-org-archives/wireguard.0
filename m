Return-Path: paul@mjr.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81c2abff
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 07:54:40 +0000 (UTC)
Received: from mjr.org (mjr.org [212.13.216.238])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b939a13
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Jun 2018 07:54:40 +0000 (UTC)
Message-ID: <ae8cd01fb2f30682efbae8b2f8b9cd98aaaa9353.camel@mjr.org>
Subject: Re: Kernel lockup with (debian) 4.16.0-2-rt-amd64
From: Paul Hedderly <paul@mjr.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Jun 2018 08:58:24 +0100
In-Reply-To: <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
References: <46bd903565f6b1114b1d9f6bafa7db77bf3b5090.camel@mjr.org>
 <CAHmME9rtHVwfSdy4DDFYmgw06zVerbN8oP88ZZ5ahoJB3PPTFw@mail.gmail.com>
 <CAHmME9qqBFU44wBQ2r3bWk8e7BpGQhY_U6oBg14SJA3Y05aC=A@mail.gmail.com>
 <CAHmME9qW8udKYrcdwgFK6qcabAJ8vDqijek0UcRmFTGTcUdznw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, 2018-06-13 at 03:58 +0200, Jason A. Donenfeld wrote:
> Hi Paul,
> 
> The current patch I'm now considering is here:
> https://git.zx2c4.com/WireGuard/patch/?id=17fb4ff6064e10bb91bf2ccf653
> 4bfdf767a9b90

Ahh!

Last night I recompiled with your first patch and left the machine
running - this morning it was frozen again :(


prh@brix:~$ sudo modinfo /lib/modules/4.16.0-2-rt-
amd64/updates/dkms/wireguard.ko
filename:       /lib/modules/4.16.0-2-rt-
amd64/updates/dkms/wireguard.ko
alias:          net-pf-16-proto-16-family-wireguard
alias:          rtnl-link-wireguard
version:        0.0.20180531-1
author:         Jason A. Donenfeld <Jason@zx2c4.com>
description:    Fast, secure, and modern VPN tunnel
license:        GPL v2
srcversion:     6BC9480277BB8058D75035C
depends:        udp_tunnel,ip6_udp_tunnel
retpoline:      Y
name:           wireguard
vermagic:       4.16.0-2-rt-amd64 SMP preempt mod_unload modversions

But although the machine froze I dont see the BUG's in the kernel log. 

So honestly I'm wondering if that freezing is just a coincidence with
the bug you found since I didnt see a BUG... However I could run the
non-rt kernel for 13 days without freeze but cant run the -rt- kernel
without freezing for more than a few hours. Do you think think the bug
could cause that?

I need to run the non-rt today to get some work done and I'll run the
-rt- with the new patch this evening if thats ok.

The other "weird" errors are there, but I've just rebooted to the non-
rt kernel and I'm getting those "ERROR block_reap:328: [bandwidth] bad
exit code 1" a lot still... but searching specifically on those is
pointing to i3blocks... indeed killing i3blocks does stop them, so
something in my i3blocks config is screwy. Woops! I was confused
because the logs show them being trapped by gdm3.

Many thanks for your help and brilliant code.
