Return-Path: labawi-wg@matrix-dream.net
Received: from matrix-dream.net (matrix2.matrix-dream.net [84.200.73.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 050903da
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Aug 2016 06:38:03 +0000 (UTC)
Received: from ivan by matrix-dream.net with local (Exim 4.87)
 (envelope-from <labawi-wg@matrix-dream.net>) id 1becn0-0003Iv-8b
 for wireguard@lists.zx2c4.com; Tue, 30 Aug 2016 07:44:54 +0100
Date: Tue, 30 Aug 2016 07:44:54 +0100
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: wireguard@lists.zx2c4.com
Message-ID: <20160830064454.GA12680@matrix-dream.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Subject: [WireGuard] wg set - unexpected change of routes
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I have noticed that adding a route (allowedips) to a peer
automatically removes any such route from other peers,
as has been explained in some email.

It seems to me as unexpected behaviour, as I wouldn't expect
the configuration of a peer to be (silently) affected when
changing the configuration of another peer.

I think repeating subnets in different peers is most probably
an error and in such circumstances the most useful action would
be to fail and report it as such.


Result of an attempt at something similar:

linux ~ # ip route add 172.16.0.0/12 via 127.0.0.1
linux ~ # ip route add 172.16.0.0/12 via 127.0.0.2
RTNETLINK answers: File exists

Regards,
Ivan Labáth
