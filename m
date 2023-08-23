Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D055EC6FA8F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Aug 2023 17:18:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a0515b07;
	Wed, 23 Aug 2023 17:14:55 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b7048b88
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Aug 2023 17:14:53 +0000 (UTC)
Received: janet.servers.dxld.at; Wed, 23 Aug 2023 19:14:52 +0200
Date: Wed, 23 Aug 2023 19:14:51 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Marek =?utf-8?B?S8O8dGhl?= <m-k-mailling-list@mk16.de>
Cc: wireguard@lists.zx2c4.com, luizluca@gmail.com
Subject: Re: IPv6 and PPPoE with MSSFIX
Message-ID: <20230823171451.ld2fwslkl6blv6y2@House.clients.dxld.at>
References: <CAJq09z6Dz3idziDgB-3-VOVa=YEWk6ZOrLOwLTBctRb5VkLMLA@mail.gmail.com>
 <20230823165840.7bf3b910@parrot>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230823165840.7bf3b910@parrot>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

On Wed, Aug 23, 2023 at 04:58:40PM +0200, Marek Küthe wrote:
> PPPoE adds 8 bytes of overhead so that an MTU of 1432 can be used. I
> also have to do this at home with my DSL line for example.
> The MTU should be set on each side (on both peers) for this to work.

Oh, I just realized I used the 1432 MTU in my earlier reply based on
Marek's math but since Luiz's underlay network is IPv6 this is not actually
correct. MTU=1440 is only correct on top of IPv4, for IPv6 the "optimal"
MTU is 1420 so with PPPoE involved that's MTU=1412.

  1500 Ethernet payload
   -40 IPv6 header
    -8 UDP header
   -32 Wg header
    -8 PPPoE
===================
  1412 wg tunnel MTU

--Daniel
