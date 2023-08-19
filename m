Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D4E4EE4993
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 19 Aug 2023 18:17:16 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e47432ec;
	Sat, 19 Aug 2023 18:17:14 +0000 (UTC)
Received: from janet.servers.dxld.at (mail.servers.dxld.at [5.9.225.164])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c91bcbd0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2023 18:17:12 +0000 (UTC)
Received: janet.servers.dxld.at; Sat, 19 Aug 2023 20:17:12 +0200
Date: Sat, 19 Aug 2023 20:17:05 +0200
From: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
To: Bernd Naumann <bernd@kr217.de>
Cc: wireguard@lists.zx2c4.com, bird-users@network.cz,
 babel-users@alioth-lists.debian.net
Subject: Re: [RFC] Replace WireGuard AllowedIPs with IP route attribute
Message-ID: <20230819181705.soor7bivakzyndc7@House.clients.dxld.at>
References: <20230819140218.5algu2nfmfostngh@House.clients.dxld.at>
 <5112ea1f-0f67-4907-a3c5-b6c7b9e591ca@kr217.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5112ea1f-0f67-4907-a3c5-b6c7b9e591ca@kr217.de>
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

Hi Bernd,

On Sat, Aug 19, 2023 at 07:50:38PM +0200, Bernd Naumann wrote:
> Chances are high I do miss something, but I've just set AllowedIPs to
> 0.0.0.0/0 and ::/0 and just used the routing protocol of my choice and
> filters to select which routes got exported and imported... :shrug:

Right, let me expand a bit. You are absolutely right, right now if you want
to use wg with dynamic routing daemons you essentially have to have one wg
tunnel per remote node with AllowedIPs=::/0 and that works just fine at
small scales.

The idea here is that we would like to go back to having just one tunnel
for all nodes involved in this particular network instead, due to general
operations scalability, mine is a mesh network so the number of tunnels
gets rather large quickly :)

Lots of tunnels suck for various reasons, monitoring if they're all up and
configured properly is one example but my understanding from previous
discussions is the performance is probably not ideal either.

--Daniel

