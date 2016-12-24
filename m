Return-Path: jens@viisauksena.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9076326f
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Dec 2016 00:16:50 +0000 (UTC)
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75c7a95a
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Dec 2016 00:16:50 +0000 (UTC)
Received: from [10.60.43.60] (unknown [185.66.194.30])
 by v32412.1blu.de (Postfix) with ESMTPSA id B6F9C20669
 for <wireguard@lists.zx2c4.com>; Sat, 24 Dec 2016 01:24:19 +0100 (CET)
To: wireguard@lists.zx2c4.com
From: jens <jens@viisauksena.de>
Subject: [fyi] test in the wild (wg + gretap + batman-adv) on tplink842
Message-ID: <b9daea6b-caa1-6778-7236-02efb2288b99@viisauksena.de>
Date: Sat, 24 Dec 2016 01:24:09 +0100
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

i have done some testing with nodes configured like the one in the wild
with a 842v3
(similar to Tplink-841 but with 8Mb Flash, i have difficulties to build
lede on the 841 - it is posible but extreme tricky, so for now i needed
a PoC of wireguard with gretap to use batman-adv routing protocol)

results are, with nearby all the packages we use in the wild for our 350
Node Meshnetwork.
link only      - 32 Mbit
on top wg0 - 26,7 Mbit
on top gretap and batman-adv (v14) - 14,8 Mbit.

lede - gluon with Wireguard 0.0.161223 kernel 4.4.36

i described it a bit more in detail here (sorry only in german)
https://forum.freifunk.net/t/erste-ernuechternde-lede-wireguard-gretap-er=
gebnisse-unter-livebedingungen/14057

so, just to let you know. thx and have some nice days
Jens

--=20
make the world nicer, please use PGP encryption
