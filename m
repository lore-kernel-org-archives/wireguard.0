Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a6cc9bc
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 14:20:10 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 463a5ac0
 for <wireguard@lists.zx2c4.com>; Thu, 8 Mar 2018 14:20:09 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: wireguard@lists.zx2c4.com
Subject: Another roaming problem
Date: Thu, 08 Mar 2018 15:29:45 +0100
Message-ID: <87efku1vza.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

So I ran into another roaming problem, which I thought I'd open a
separate thread for.

Basically, the problem is this: I run wireguard on my gateway router,
which I then connect to from road warriors (laptop, phone) and tunnel
all my traffic through it.

This works well, except that when the client is connected to the local
network (behind the gateway router), it'll start talking to the internal
interface of the gateway device, and so the client will change its idea
of the endpoint address to the internal (private) address. And so, when
I leave the local network, it can no longer reach the server, and I have
to restart the wireguard interface on the client to get connectivity.

So is there a way to either tell the client not to change its idea of
the endpoint, or to tell the server to always use a certain source
address for outgoing packets?

-Toke
