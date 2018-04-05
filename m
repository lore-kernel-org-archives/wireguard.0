Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 64a22f18
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 19:37:26 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.smurf.noris.de [213.95.149.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 66889138
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 19:37:26 +0000 (UTC)
Subject: Re: Using WG for transport security in a p2p network
To: Ximin Luo <ximin@dfinity.org>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
 <CADX+UFjb3MyJbPMpA78m2j4ygtGxxR-No6kFEV265mf55tT7bA@mail.gmail.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <cbd41498-1510-65a3-6ada-d570936eed45@urlichs.de>
Date: Thu, 5 Apr 2018 21:49:31 +0200
MIME-Version: 1.0
In-Reply-To: <CADX+UFjb3MyJbPMpA78m2j4ygtGxxR-No6kFEV265mf55tT7bA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 05.04.2018 20:07, Ximin Luo wrote:
> In the typical WG use-case this is not an issue because the network
> admin controls both endpoints and can upgrade both simultaneously, but
> this wouldn't be the case for our p2p network.

Your p2p network would need to exchange v2 keys before upgrading. Thus,
as soon as you know that an endpoint supports v2 you also try to connect
to it that way. When the v2 connection succeeds, the other system knows
that you have its new key, thus it can disable v1 connections from you
(and vice versa).

You'll need to pre-define a private IPv6 address range (with enough
random bits in it that a collision with anybody's local address usage is
unlikely) for your wireguard network. To facilitate upgrades, you can
simply define two bits of that address range to be a rolling version
number and you're basically done: you just route each subnet to the
appropriate wireguard interface.

-- 
-- Matthias Urlichs
