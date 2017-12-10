Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78a3c9b3
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Dec 2017 12:36:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5cc00e1
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Dec 2017 12:36:30 +0000 (UTC)
Received: from xps ([37.201.240.122]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MHH6Z-1eJsN804sF-00E7Lw for
 <wireguard@lists.zx2c4.com>; Sun, 10 Dec 2017 13:43:53 +0100
Message-ID: <1512909832.1336.19.camel@gmx.de>
Subject: Reading configuration from stdin
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: wireguard@lists.zx2c4.com
Date: Sun, 10 Dec 2017 13:43:52 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I am currently working on a NetworkManager plugin for WireGuard in Rust
[1/2].
The plugin has to pass the configuration to the wg tool and I am
wondering if this could be done using interprocess communication.

Would it make sense (aka be secure) if we make it possible to call 'wg
setconf wg0 -' so the wg tool does not read the configuration from a
file but from stdin? Same for 'wg set wg0 private-key -' and 'wg set
wg0 psk -'?

Btw, this NetworkManager plugin should not only work for the regular
WireGuard but also for my wireguard peer-to-peer tool [3] whose
development is currently stalled by a rust bug [4].

This wireguard peer-to-peer tool allows you to use wireguard in
situations where you do not have a static IP and/or you are behind a
NAT.

Anyway, what do you think about reading the configuration from stdin?

Bye,

Manuel


[1] https://github.com/manuels/wg-p2p-nm-plugin
[2] https://github.com/manuels/wg-p2p-nm-plugin/blob/master/Screenshot.
png
[3] https://github.com/manuels/wireguard-p2p
[4] https://github.com/rust-lang/rust/issues/45259
