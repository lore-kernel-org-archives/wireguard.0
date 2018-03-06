Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dfb2dea
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:44:27 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee89fba8
 for <wireguard@lists.zx2c4.com>; Tue, 6 Mar 2018 21:44:27 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: wireguard@lists.zx2c4.com
Subject: Roaming between IPv4 and IPv6?
Date: Tue, 06 Mar 2018 22:53:47 +0100
Message-ID: <871sgwna50.fsf@toke.dk>
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

Hi

Is wireguard supposed to be able to handle roaming between IPv4 and
IPv6? If I setup a tunnel to a dual-stack machine and establish the
tunnel using IPv6, then switch to a different interface (from WiFi to
cellular in this case) that doesn't have IPv6, the tunnel stops having
connectivity. Whereas if I go in the other direction (first establish
the tunnel over IPv4), I can seamlessly roam between different
connections.

Is this expected behaviour, or should v4/v6 roaming work?

-Toke
