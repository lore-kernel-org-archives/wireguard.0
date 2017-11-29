Return-Path: mytril42@posteo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 36233e83
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:00:33 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b60d4e1e
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 13:00:33 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130])
 by mout01.posteo.de (Postfix) with ESMTPS id 13ED62103E
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:06:32 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 3yn1542s63z9rxD
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 14:06:32 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: Mytril <mytril42@posteo.de>
Subject: Dynamic Adresses
Message-ID: <94652845-83e3-1d58-fdb8-30171254c7e3@posteo.de>
Date: Wed, 29 Nov 2017 14:05:55 +0100
MIME-Version: 1.0
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

i have tried wireguard for several days. But if a client get a new ip
adress, the other client don't lookup this address by the given domain.
Only a reset with "ifdown wg0 && ifup wg0" changes the ip address to the
new one.
So is it a bug, or is it so inteded that i need to use a conjob to
actalisate the ip?
