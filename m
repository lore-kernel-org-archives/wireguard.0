Return-Path: rcwhelan@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0d82d2d
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 May 2018 14:49:14 +0000 (UTC)
Received: from mail-qt0-x231.google.com (mail-qt0-x231.google.com
 [IPv6:2607:f8b0:400d:c0d::231])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c15d78a0
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 May 2018 14:49:14 +0000 (UTC)
Received: by mail-qt0-x231.google.com with SMTP id m5-v6so6873055qti.1
 for <wireguard@lists.zx2c4.com>; Fri, 25 May 2018 07:50:43 -0700 (PDT)
MIME-Version: 1.0
From: Ryan Whelan <rcwhelan@gmail.com>
Date: Fri, 25 May 2018 10:50:31 -0400
Message-ID: <CAM3m09TdGPdAa6ksXPsYK48agkjbtaHSnSUPTiJ1-S6LDqwtRw@mail.gmail.com>
Subject: Dead peer detection
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I thought this conversation had been had in the past, but I can not find it
so forgive me if I'm rehashing something thats been discussed already.

How do you guys detect dead peers?  Actively via a ping or passively via
the 'latest handshake' (once it gets past a certain age, you assume the
peer is offline).  Are their other options?
