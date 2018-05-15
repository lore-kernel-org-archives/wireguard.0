Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b485c9d6
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 18:39:56 +0000 (UTC)
Received: from sonic304-49.consmr.mail.ir2.yahoo.com
 (sonic304-49.consmr.mail.ir2.yahoo.com [77.238.179.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1de19632
 for <wireguard@lists.zx2c4.com>;
 Tue, 15 May 2018 18:39:55 +0000 (UTC)
Date: Tue, 15 May 2018 18:36:09 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>
Message-ID: <267632710.2840000.1526409369057@mail.yahoo.com>
Subject: Multiple (client-)peers with same keys possible ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <267632710.2840000.1526409369057.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Is it possible somehow, to define multiple (client-)peers to share the same keys ?
(Trading some loss of security for simpler distribution)

I.e. on server:
[Interface]
ListenPort = 5000
PrivateKey = ABCD ...XYZ
Address=172.16.0.1

[Peer]
PublicKey = 1234...7890
AllowedIPs = 172.16.0.0/16


client1:
[Interface]
PrivateKey = top...secret
ListenPort = 5000
Address = 172.16.0.2
[Peer]
PublicKey = everybodyknows
AllowedIPs = 0.0.0.0/0
Endpoint = 1.2.3.4

client2:
[Interface]
PrivateKey = top...secret
ListenPort = 5000
Address = 172.16.0.3
[Peer]
PublicKey = everybodyknows
AllowedIPs = 0.0.0.0/0
Endpoint = 1.2.3.4
....
....
....
