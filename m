Return-Path: admin@hda.me
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d52f96a
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:47:45 +0000 (UTC)
Received: from sender-of-o52.zoho.com (sender-of-o52.zoho.com [135.84.80.217])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6eabf043
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jan 2017 21:47:45 +0000 (UTC)
Date: Wed, 04 Jan 2017 22:56:43 +0100
From: Anonymous Anonymous <admin@hda.me>
To: "wireguard" <wireguard@lists.zx2c4.com>
Message-ID: <1596b7bf859.e783e8a093776.4934627496686115328@hda.me>
In-Reply-To: 
Subject: Re: distro packaging, makefiles, deps, systemd, new tools
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

We could move wg-quick in separate package in case hardly useful networkd support will be implemented.
As, for now it obviously reasonable to ship it inside wireguard-tools package. 
Also, are bash completions for wg-quick came with WITH_BASHCOMPLETION or with WITH_WGQUICK itself?

On Wed, Jan 4, 2017, at 12:50, Jason A. Donenfeld wrote:

> When systemd-networkd gets support for WireGuard, systemd-based
> distros should not ship this. But everybody else who just wants a
> simple rough script for quickly bringing up and down VPNs can ship
> this, as it's a big help to users. It's installed according to the
> documentation for the Makefile above.
> 
> - There's now an "upstream" systemd unit for wg-quick, called
> wg-quick@.service. It's pretty simple:
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick@.service
> 
> Question: does this unit seem sane to you? Can you ship it downstream
> as is, or will you need modifications?
> 
> Thanks,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 
