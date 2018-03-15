Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 603f75f3
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 15:46:28 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c41a64fc
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 15:46:28 +0000 (UTC)
Subject: Re: Allowed IPs Toggling
To: Gianluca Gabrielli <tuxmealux@protonmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
Date: Thu, 15 Mar 2018 10:56:56 -0500
MIME-Version: 1.0
In-Reply-To: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 03/15/18 10:31, Gianluca Gabrielli wrote:
> I was setting two peers on the server, but every time I re-add one of these 
> two the other one is shown with (none) on "allowed ips" field. Of course that
> blocks communications with that peer. If I try to re-add it, then the other
> peer loses its configuration, same problem.

Allowed IPs is like a routing table; you can't have two routes for the same set
of IPs, or WireGuard doesn't know which peer to send the traffic to. You want to
have non-overlapping Allowed IP ranges. This usually means that the range of
Allowed IPs is smaller than the host's subnet. For example:

Host A:
IP configuration for WireGuard interface: 192.168.123.1/24
Allowed IPs for Host B: 192.168.123.2/32

Host B:
IP configuration for WireGuard interface: 192.168.123.2/24
Allowed IPs for Host A: 192.168.123.1/32

The IP configuration tells the kernel which IP ranges are accessible via the
WireGuard interface. The Allowed IPs tell WireGuard, which _subset_ of those IPs
is associated with each peer.

> Cheers,
> Gianluca

Cheers,
Samuel
