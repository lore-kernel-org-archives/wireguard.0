Return-Path: asbjorn@asbjorn.st
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b7373a7
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 21:18:28 +0000 (UTC)
Received: from mail.asbjorn.biz (mail.asbjorn.biz [185.38.24.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4106fe80
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Feb 2018 21:18:28 +0000 (UTC)
To: wireguard@lists.zx2c4.com
References: <1518420236.1268661.1267596392.738A262C@webmail.messagingengine.com>
Subject: Re: Starcraft over Wireguard ... :sideeye:
From: =?UTF-8?Q?Asbj=c3=b8rn_Sloth_T=c3=b8nnesen?= <wireguard@asbjorn.st>
Message-ID: <6c70a794-6d9e-f9af-3c0d-ad4e16607a51@asbjorn.st>
Date: Wed, 14 Feb 2018 21:24:51 +0000
MIME-Version: 1.0
In-Reply-To: <1518420236.1268661.1267596392.738A262C@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Eric,

If the game requires the computers to be on the same LAN,
complete with broadcast, multicast etc., you can run a layer
2 network through WG, running a L2TPv3 tunnel on top of WG's
layer 3 network.

See ip-l2tp(8) for usage examples.

It doesn't say in the man page, but if you set the L2TP MTU
high like 1500 (to simulate standard LAN MTU), then the
packets will be fragmented at the IP layer, so at the cost
the fragmentation overhead you can even emulate a higher MTU.

-- 
Best regards
Asbjørn Sloth Tønnesen
