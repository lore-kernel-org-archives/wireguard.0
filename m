Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9759e17a
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:49:34 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e66d38e
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:49:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad5f72e
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:40:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 61546971
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Jan 2018 15:40:43 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id y141so6236587oia.0
 for <wireguard@lists.zx2c4.com>; Mon, 22 Jan 2018 07:53:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9rEFgWHewhf8mC=7ec=NRdhqAJQtuG1ggby-Bzfd8zaaw@mail.gmail.com>
References: <1516632145.2241.49.camel@inventati.org>
 <CAHmME9rEFgWHewhf8mC=7ec=NRdhqAJQtuG1ggby-Bzfd8zaaw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 22 Jan 2018 16:53:32 +0100
Message-ID: <CAHmME9qY1rVUxsdkD+M91pZJNcncG+PrG-9ypK0YPvfb4k4_JA@mail.gmail.com>
Subject: Re: Trouble building WireGuard since December releases
To: Kevin <anaknaga@inventati.org>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Worked exactly as intended for me.

1. I downloaded the latest ISO from the solus website.
2. I installed it using the GUI installer.
3. I booted into the new installation.
4. I updated all packages using the GUI updater.
5. I ran these commands in the built-in terminal:
$ sudo eopkg install git
$ sudo eopkg install -c kernel.devel
$ sudo eopkg install -c system.devel
$ sudo eopkg install libmnl-devel
$ git clone https://git.zx2c4.com/WireGuard
$ cd WireGuard/src && make debug -j$(nproc) && sudo make install
$ sudo modprobe wireguard && dmesg | grep wireguard
[   31.554056] wireguard: loading out-of-tree module taints kernel.
[   31.555061] wireguard: allowedips self-tests: pass
[   31.555463] wireguard: nonce counter self-tests: pass
[   31.555761] wireguard: curve25519 self-tests: pass
[   31.555798] wireguard: chacha20poly1305 self-tests: pass
[   31.555808] wireguard: poly1305 self-tests: pass
[   31.556129] wireguard: blake2s self-tests: pass
[   31.755518] wireguard: ratelimiter self-tests: pass
[   31.755531] wireguard: WireGuard 0.0.20180118-2-gc80cbfa loaded.
See www.wireguard.com for information.
[   31.755532] wireguard: Copyright (C) 2015-2018 Jason A. Donenfeld
<Jason@zx2c4.com>. All Rights Reserved.
