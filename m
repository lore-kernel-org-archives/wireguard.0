Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c7e0789c
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:33:22 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 041fde12
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 02:33:22 +0000 (UTC)
Date: Mon, 10 Jul 2017 04:51:27 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: Debian-based configuration for wireguard
Message-ID: <20170710025124.GB31153@zx2c4.com>
References: <20170709213020.GF22784@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20170709213020.GF22784@tuxmachine.polynome.dn42>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Baptiste,

On Sun, Jul 09, 2017 at 11:30:20PM +0200, Baptiste Jonglez wrote:
> Hi,
> 
> I wrote up some configuration I use for Wireguard on Debian:
> 
>     https://wiki.debian.org/Wireguard#Configuration_on_Debian
> 
> The goal is to reuse functionalities from /etc/network/interfaces, which
> is quite natural on Debian.  Simple use-cases like the point-to-point
> tunnel don't need wg-quick at all.

Terrific, thanks! Indeed, having nice integration into OSs' native
configuration interfaces is preferred.

Jason
