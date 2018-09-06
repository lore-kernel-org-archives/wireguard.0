Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 496fb24d
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:41:27 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 211a0717
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 19:41:27 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 0C70C20407
 for <wireguard@lists.zx2c4.com>; Thu,  6 Sep 2018 19:41:41 +0000 (UTC)
Date: Fri, 7 Sep 2018 00:41:41 +0500
From: Roman Mamedov <rm@romanrm.net>
To: wireguard@lists.zx2c4.com
Subject: Error building for ARM
Message-ID: <20180907004141.277c9af7@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

  AS [M]  net/wireguard/crypto/zinc/curve25519/curve25519-arm.o
net/wireguard/crypto/zinc/curve25519/curve25519-arm.S: Assembler messages:
net/wireguard/crypto/zinc/curve25519/curve25519-arm.S:21: Error: r13 not allowed here -- `and sp,sp,#0xfffffff0'
scripts/Makefile.build:429: recipe for target 'net/wireguard/crypto/zinc/curve25519/curve25519-arm.o' failed
make[3]: *** [net/wireguard/crypto/zinc/curve25519/curve25519-arm.o] Error 1
scripts/Makefile.build:587: recipe for target 'net/wireguard' failed
make[2]: *** [net/wireguard] Error 2


I guess this could matter?

$ arm-linux-gnueabihf-as --version
GNU assembler (GNU Binutils for Debian) 2.31.1
Copyright (C) 2018 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License version 3 or later.
This program has absolutely no warranty.
This assembler was configured for a target of `arm-linux-gnueabihf'.

-- 
With respect,
Roman
