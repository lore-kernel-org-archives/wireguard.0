Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acf30048
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 16:03:14 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a03c0e95
 for <wireguard@lists.zx2c4.com>;
 Sun, 18 Feb 2018 16:03:14 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [PATCH 1/1] wg(8): rephrase wording on AllowedIPs
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <dead030cd0d96f25e6229931c9199b13a90578c4.1518955260.git.daniel@lublin.se>
Date: Sun, 18 Feb 2018 10:10:35 -0600
Message-Id: <11619261-079F-4ABC-869D-FF23E3C4DB35@lonnie.abelbeck.com>
References: <cover.1518955260.git.daniel@lublin.se>
 <dead030cd0d96f25e6229931c9199b13a90578c4.1518955260.git.daniel@lublin.se>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Feb 18, 2018, at 6:02 AM, Daniel Lublin <daniel@lublin.se> wrote:

> +AllowedIPs \(em a comma-separated list of IP (v4 or v6) addresses =
with CIDR
> +masks, declaring the sources of incoming traffic that are allowed =
through the
> +peer, and as well defining which destinations of outgoing traffic =
that will be
> +directed through the peer. The catch-all \fI0.0.0.0/0\fP may be =
specified for
> +matching all IPv4 addresses, and \fI::/0\fP may be specified for =
matching all
> +IPv6 addresses. May be specified multiple times. Required.

Personally, in an effort to make this more clear, from this reference:
Cryptokey Routing
https://www.wireguard.com/#cryptokey-routing

This quote offered clarity to me ...
--
When sending packets, the list of allowed IPs behaves as a sort of =
routing table, and when receiving packets, the list of allowed IPs =
behaves as a sort of access control list.
--

Lonnie
