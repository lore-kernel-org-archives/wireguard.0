Return-Path: samuel@sholland.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7590bf0a
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:41:18 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94966bae
 for <wireguard@lists.zx2c4.com>;
 Thu, 15 Mar 2018 18:41:18 +0000 (UTC)
Subject: Re: Allowed IPs Toggling
To: Steve Gilberd <steve@erayd.net>
References: <NRNcntoOUgLRhHI2D7GnuCHirY9j2pMH83ET-HFr4qoamFy7aIIkR_ZVcKa0wTTbQ-SfhLEr5zih04Hs-FwFaj4UenOksFs8XCMp8yKnZEk=@protonmail.com>
 <db7326ed-e0f5-c1ee-ea61-30ef6d6fa3b3@sholland.org>
 <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <8debf4cc-572f-2a75-39c6-e109ebb8e73b@sholland.org>
Date: Thu, 15 Mar 2018 13:51:45 -0500
MIME-Version: 1.0
In-Reply-To: <CAJQSx3Y3EXWhtHJGi40kjYiha9nZHYs4i8v9LbbdO4PHaGnDnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

On 03/15/18 13:39, Steve Gilberd wrote:
>> Allowed IPs is like a routing table; you can't have two routes for the same
> set of IPs
> 
> If this is the case, then wireguard does not have proper routing support.
> 
> Normally, routing tables allow both multiple and overlapping routes present.
> When making routing decisions, the most-specific route is chosen (e.g. a /29 is
> higher priority than a /24 which overlaps with it). If there are two identical
> routes of the same size, then the one with the lowest routing metric is used.
> 
> I can understand not allowing identical routes of the same size, as wireguard
> doesn't really have a concept of metric (although it could be useful for backup
> links). However, it really should allow overlapping routes of different sizes.
> There's no ambiguity with routing decisions, and it's a standard feature that I
> would normally expect any IP routing stack to have.

WireGuard *does* support overlapping ranges of AllowedIPs on different peers. It
doesn't support having *identical* ranges of AllowedIPs on different peers,
which was the situation here. (You're correct, there's no concept of a metric.)

> Cheers,
> Steve

Cheers,
Samuel
