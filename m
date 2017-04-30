Return-Path: manuel.schoelling@gmx.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2dcb9b39
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 10:32:33 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 703c51bd
 for <wireguard@lists.zx2c4.com>;
 Sun, 30 Apr 2017 10:32:33 +0000 (UTC)
Received: from xps ([88.152.8.7]) by mail.gmx.com (mrgmx102 [212.227.17.168])
 with ESMTPSA (Nemesis) id 0MbJTE-1dLLD61cVo-00In2p for
 <wireguard@lists.zx2c4.com>; Sun, 30 Apr 2017 12:41:48 +0200
Message-ID: <1493548907.5730.1.camel@gmx.de>
Subject: WireGuard-p2p: A tool for NAT traversal
From: Manuel =?ISO-8859-1?Q?Sch=F6lling?= <manuel.schoelling@gmx.de>
To: wireguard@lists.zx2c4.com
Date: Sun, 30 Apr 2017 12:41:47 +0200
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

I wrote a python tool for scenarios where both WireGuard peers are
behind a NAT.

It supports public key exchange, NAT traversal using STUN, and IP
address exchange. The exchange of this information is done using a DHT.

You can find it here:

https://github.com/manuels/wireguard-p2p

Any feedback would be appreciated.

Bye,

Manuel
