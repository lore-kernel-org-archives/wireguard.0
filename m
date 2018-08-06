Return-Path: grinapo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c78f0231
 for <wireguard@lists.zx2c4.com>; Mon, 6 Aug 2018 15:27:54 +0000 (UTC)
Received: from mail-it0-x233.google.com (mail-it0-x233.google.com
 [IPv6:2607:f8b0:4001:c0b::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01c00e30
 for <wireguard@lists.zx2c4.com>; Mon, 6 Aug 2018 15:27:54 +0000 (UTC)
Received: by mail-it0-x233.google.com with SMTP id s7-v6so17994741itb.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Aug 2018 08:38:46 -0700 (PDT)
MIME-Version: 1.0
Sender: grinapo@gmail.com
From: Peter Gervai <grin@grin.hu>
Date: Mon, 6 Aug 2018 17:38:24 +0200
Message-ID: <CAAWNVq8Cpsqyd66fObKNDYsK9sDE8b1YhEYaz-ZFTujvYeqOcw@mail.gmail.com>
Subject: android: handling ipv6 literals
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

Hello,

Andoid client mess up ipv6 literals: input accept the - correct -
[1234:5678::1]:12345 format, but on the next edit the field gets
transformed to 1234:5678::1:12345 which obviously won't quite work.

A sidenote: pinging from the client could be useful (I have network
tools installed, but without it it's hard to tell what's going on).


Peter
