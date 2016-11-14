Return-Path: nbd@nbd.name
Received: from nbd.name (nbd.name [46.4.11.11])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84ed0448
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 08:25:40 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, openwrt@bitsofnetworks.org,
 lede-dev@lists.infradead.org, wireguard@lists.zx2c4.com
References: <20161110030744.6402-1-Jason@zx2c4.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <5a31f30c-1fe3-8012-18d4-7545fd86d290@nbd.name>
Date: Mon, 14 Nov 2016 09:28:11 +0100
MIME-Version: 1.0
In-Reply-To: <20161110030744.6402-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=utf-8
Subject: Re: [WireGuard] [LEDE-DEV] [PATCH] kernel: expose configuration for
	padata
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 2016-11-10 04:07, Jason A. Donenfeld wrote:
> The padata API is a powerful framework for doing parallel jobs inside
> the kernel, on which various modules in the package feed can depend,
> such as WireGuard. There is no item text, so that it does not show up
> in menuconfig, as this is only supposed to be an option selected as a
> dependency. There as already precedent for this behavior, with
> CONFIG_KERNEL_RELAY, on which several packages depend.
> 
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
Please enable CONFIG_CRYPTO_PCRYPT in target/linux/generic/config-* instead.

- Felix
