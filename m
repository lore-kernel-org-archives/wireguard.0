Return-Path: alx@dd19.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1670930c
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 01:13:38 +0000 (UTC)
Received: from mail.dd19.de (mail.dd19.de [217.197.86.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e14489ca
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 01:13:38 +0000 (UTC)
From: Alexander Morlang <alx@dd19.de>
Content-Type: text/plain; charset=us-ascii
Date: Sun, 19 Feb 2017 02:14:06 +0100
Subject: wg binary in armhf deb from ppa missing
To: wireguard@lists.zx2c4.com
Message-Id: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
used the launchpad ppa in xenial on armhf (Banana Pro).=20
The wireguard-tools packet installed only /usr/share/doc

Is this a known problem?

I downloaded the
=
https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wireguar=
d-tools_0.0.20170214-wg1~xenial_armhf.deb
and hat a look with dpkg -c <file>, getting the same result of no binary =
in the packet.

regards, Alex=
