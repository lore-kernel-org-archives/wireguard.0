Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8d78e28
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jul 2017 00:31:16 +0000 (UTC)
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
 [209.85.217.169])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26b21158
 for <wireguard@lists.zx2c4.com>;
 Fri, 28 Jul 2017 00:31:16 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id 80so152881221uas.0
 for <wireguard@lists.zx2c4.com>; Thu, 27 Jul 2017 17:51:38 -0700 (PDT)
MIME-Version: 1.0
From: Wang Jian <larkwang@gmail.com>
Date: Fri, 28 Jul 2017 08:51:35 +0800
Message-ID: <CAF75rJBdfeD-7MpDGfFBV=bLbm0-H--mFin30QL9jDmpd4z1jw@mail.gmail.com>
Subject: Multihomed server issue
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I have met multihome server issue with an unusual network setup.

The server is multihomed, all public addresses are configured on
dummyN interfaces,
and routes are established by bird routing daemon, via address pairs
(172.16.xx.xx/30) on public network interface.

And, the default route is via private gateway on private interface
(10.x.x.x), which actually will be NATed by dedicated NAT gateway.

(The server has two network interface, one for private network, one
for public network)

The configuration is the simplest form:  server has [Interface]
ListenPort, while client has [Peer] Endpoint but no [Interface]
ListenPort.

The problem is

1. when wg0 on both side is brought up at the same time,  ping server
from client doesn't get response; but then ping client from server
will make tunnel alive. The tunnel will keep alive any longer.

>From 'wg' command output on client, it's clear that peer Endpoint is
NAT gateway pool address, not the one specified in config file

2. After 1, down and up client wg0, the tunnel stops work; even ping
client from server doesn't help

3. After some time, ping client from server will make tunnel alive again.

====

IMHO, the reason behind that is

1. when client contacts server, the server remembers the client's
endpoint, but handshake will fail because server responses using
10.x.x.x (which then NATed). But when ping client from server, server
will use remembered client endpoint, and client can finish handshake.

Beware that I can do nothing to help server choosing the correct
public address. Server will use best route to deduce UDP source
address, in my case, 10.x.x.x or 172.16.xx.xx/30, which doesn't help
the situation.

2. when client wg0 down and up again, the server will not do handshake

3. after some time, server will do handshake, and things work again

====

The solution can be one of:

1. server can RTS (response to source), or can bind to arbitary
address for outgoing
2. improve handshake
