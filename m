Return-Path: sendmailtogoran@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3f41ace
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 11:26:57 +0000 (UTC)
Received: from mail-it0-x231.google.com (mail-it0-x231.google.com
 [IPv6:2607:f8b0:4001:c0b::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82d91f29
 for <wireguard@lists.zx2c4.com>; Sun, 6 May 2018 11:26:57 +0000 (UTC)
Received: by mail-it0-x231.google.com with SMTP id n64-v6so2557103itb.3
 for <wireguard@lists.zx2c4.com>; Sun, 06 May 2018 04:29:10 -0700 (PDT)
MIME-Version: 1.0
From: Goran <sendmailtogoran@gmail.com>
Date: Sun, 6 May 2018 13:29:09 +0200
Message-ID: <CABS5c+FbHoZ+W_=vHm_kgQU0zZHZQPjWVJpPzehMYMcdzY36DQ@mail.gmail.com>
Subject: vxlan on top of wireguard
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

I have configured a distributed swith (vxlan) on top of a wireguard
tunnel. I learned it from https://insom.github.io/journal/2017/04/02/
but did not tried the workaround described there. The workaround
states that wireguard has some sort of bug and the
hardware-accelerated checksums must be disabled: ethtool -K $i tx off
. As the article is from last year, I tried it first without this
workaround. With that I could send icmp packets but no tcp.

Sometimes I could send a tcp packet with crazy MTU like 64 or so. Does
someone knows why this strange behaviour exists?

With workaround all works fine.
