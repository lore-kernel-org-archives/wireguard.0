Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bd7f825
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 12:57:09 +0000 (UTC)
Received: from sonic311-57.consmr.mail.ir2.yahoo.com
 (sonic311-57.consmr.mail.ir2.yahoo.com [77.238.176.189])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id edc870b2
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 12:57:09 +0000 (UTC)
Date: Wed, 16 May 2018 12:53:27 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>
Message-ID: <392763090.3358208.1526475207903@mail.yahoo.com>
Subject: Cipher the private key in peers wg0.conf ?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <392763090.3358208.1526475207903.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Actually, in wg0.conf the private key is defined in clear text. Which allows dump of physical disk to grab it
and to fake this client.
Wouldn't it be safer, to cipher the private key somehow ?
