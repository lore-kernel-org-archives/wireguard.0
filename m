Return-Path: tuxmealux@protonmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6cba3dea
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 16:57:44 +0000 (UTC)
Received: from mail4.protonmail.ch (mail4.protonmail.ch [185.70.40.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b11d2ffb
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Mar 2018 16:57:44 +0000 (UTC)
Date: Tue, 13 Mar 2018 13:07:44 -0400
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Gianluca Gabrielli <tuxmealux@protonmail.com>
Subject: Multiple peers
Message-ID: <sw07RFheJeAt1YhiYncjYl7au2RKQqmg4fMvgZBN91qBmUxoSGX24JamLXZrSqMC0yvRvz3koe24Li8ini3tEP1h_3j5VF5IFrYwcOMXI0A=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Reply-To: Gianluca Gabrielli <tuxmealux@protonmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi everybody,

I have five peers, and I want that each peer can talk with all the other pe=
ers. Moreover let's say that one of these peer will acts as a server and as=
 a gateway, while the other four will be only clients.=20
I wonder if I need to copy/paste all peers' public key on all the other pee=
rs' configuration, or I can just configure each peer to connect to the serv=
er and then allow peers talking with other peers passing through this serve=
r?
(Something similar to client-to-client option on OpenVPN)

I don't care about firewall rules to configure the server to NAT clients' c=
onnections, my question is just about wireguard configuration.

Cheers,
Gianluca
