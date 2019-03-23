Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C98C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 01:04:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4546821925
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 01:04:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="P6Q42uoX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4546821925
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c154594;
	Sat, 23 Mar 2019 01:03:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 833c08c3
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 01:03:37 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d86702a8
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 01:03:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67c63d20
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 00:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=xv5bzw
 qf45qP6xv4oKKVVChpuqI=; b=P6Q42uoXXyQEgihboSMvrR/9D9Rwn4gqO5pNvp
 +NaiTDD0AwBjj79Kw+YzPKt2mQ3b3HPRSBSYhRhyqeYJf5wdDN9vwmrarQcsEVNu
 OuNOOW2TEL6EwPqLu5JJe8nNiHeS+MNZDVYzP7WjFeY3HVIQ0s3wYnCTvLZw+U0K
 2Zetcomuo1On6EgGuXG17pKw4Ti5bx40ksm77I/V7/y04nEzzHQPDW1qpK/ub6oR
 PLs7GGeiY9AkQE8pfVpeKSIUTZQpGOkcluSCRxAxLQ98LJVigKDmH2u0yR/VPhsu
 LhrTRR/BQ6DbAZlUUCJqM89xbZLeL40Kito0r5LCi8l/vX5Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 79be5ae2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Mar 2019 00:42:25 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id m10so3545730otp.2
 for <wireguard@lists.zx2c4.com>; Fri, 22 Mar 2019 18:04:14 -0700 (PDT)
X-Gm-Message-State: APjAAAWoHZSlHjQnMvXCLBbJdF0eRQeyhA9/9FoFrv8WgVMzUtVr1sxQ
 3nFF2/+LrfgE8RHFC4pCffYU5IwZPOtgSvYEQjM=
X-Google-Smtp-Source: APXvYqyQq+PDUiQ9rsHHFFdCTWaYsrZ3GgO6O1rexFB/g012EvvUHqJsT1aEUGoSjlxnTO0x75Br1mylixf1mIgrXFw=
X-Received: by 2002:a9d:5501:: with SMTP id l1mr9015132oth.143.1553303053296; 
 Fri, 22 Mar 2019 18:04:13 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 22 Mar 2019 19:04:02 -0600
X-Gmail-Original-Message-ID: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
Message-ID: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
Subject: [ANNOUNCE] Wintun: Layer 3 TUN Driver for Windows
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 openvpn-devel@lists.sourceforge.net, 
 dev@nmap.org, Simon Rozman <simon@rozman.si>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi everybody,

[Cross-posting to WireGuard, OpenVPN, and Nmap/npcap mailing lists.]

Simon and I are pleased to announce the start of a new project, made
for WireGuard and for others too: Wintun, a layer 3 TUN driver for
Windows.

Homepage: https://www.wintun.net/

A TUN driver lets userspace programs act as virtual network cards,
reading and writing packets directly into the network stack, as though
they came from a real network adapter. While Linux and the BSDs have
had /dev/tun for ages, Windows typically hasn't had any native
facilities.

Recently, Microsoft released a VPN UWP API, but it's lacking in
features, documentation is under NDA, and after reversing it for a
bit, it doesn't seem capable of doing many of the more advanced
routing and roaming things we want. Indeed it turns out that having a
real network adapter and some basic file handles is much preferable to
layers of API and abstraction.

On the flipside, OpenVPN's tap-windows6 project and the numerous
drivers from SoftEther have all provided similar functionality for
many years, and these efforts have produced something moderately
stable. We were, in fact, quite inspired by SoftEther's Neo6 driver.
However, these projects were written in a different age, the era of
NDIS5, and then ported later to NDIS6. This means they haven't
benefited from things like Windows 7's NdisMediumIP, which allows for
native layer 3 tunneling, without having to do layer 2 emulation.
Drivers like OpenVPN's tap-windows6 also do some somewhat nasty
things, like emulate DHCP from inside the kernel for network
configuration. The code is old and complicated. As usual, I wanted
instead something tiny and dumb that we can reason about, which does
things in a "right" and "boring" way for a narrower use case: layer 3
TUN.

Wintun is our attempt at making a dumb layer 3 pipe, that doesn't do
anything fancy, and just shuffles bundles of packets between userspace
and the kernel driver. It's being used for WireGuard's Windows port.
We'd like to make it available and easy to use for other projects too
that need layer 3 userspace tunneling capabilities, like OpenVPN and
SoftEther. (Also, it may be just a matter of time before somebody
takes the tiny base of it, sticks the crypto in the kernel, and makes
WireGuard super fast on Windows.)

Have we succeeded in accomplishing our goals? Certainly not yet. At
the present moment [folks reading this in the future: check the date
of this email], I'd except for Wintun to be slower, buggier, and lower
quality than anything else out there. But we thought it'd be a good
idea to release sooner rather than later in order to have some more
eyeballs on it. It's the kind of codebase that _certainly_ needs some
cleanup and a thorough security audit. On the plus side, cloc(1) tells
me that it's only 950 lines. Still, NT programming is hard, and I'm
pretty certain we've made mistakes and left ugly corners. Consider
this email a statement of intent rather than an announcement of a
completed project.

So, if you're interested in NDIS programming and want to lend a hand,
don't hesitate to get in touch. We're eager for smart NT folks to help
us out.

Details are over on https://www.wintun.net/ where you may also find
rabbits bringing windows into tunnels. Enjoy!

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
