Return-Path: john@sager.me.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56a54ca5
 for <wireguard@lists.zx2c4.com>; Sun, 2 Sep 2018 09:39:39 +0000 (UTC)
Received: from mail70c50.megamailservers.eu (mail178c50.megamailservers.eu
 [91.136.10.188])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a9b7fea3
 for <wireguard@lists.zx2c4.com>; Sun, 2 Sep 2018 09:39:39 +0000 (UTC)
Received: from mainserver.wc (97.83.2.81.in-addr.arpa [81.2.83.97])
 (authenticated bits=0)
 by mail70c50.megamailservers.eu (8.14.9/8.13.1) with ESMTP id w829rrUZ015136
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 Sep 2018 09:53:55 +0000
Received: from [2001:8b0:cbe3:0:7950:de2:3bad:c7d2]
 by mainserver.wc with esmtp (Exim 4.86_2)
 (envelope-from <john@sager.me.uk>) id 1fwP4r-00026L-Gr
 for wireguard@lists.zx2c4.com; Sun, 02 Sep 2018 10:53:53 +0100
To: Wireguard List <wireguard@lists.zx2c4.com>
From: John Sager <john@sager.me.uk>
Subject: I am adding Wireguard to the Bering-uClibc embedded Linux distro
Message-ID: <214279b6-1aea-5a28-37c1-9c9875080f0f@sager.me.uk>
Date: Sun, 2 Sep 2018 10:53:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Bering-uClibc is an embedded Linux distribution targeted at firewalls &
routers. I have been using this for my border router/firewall for several years:

https://bering-uclibc.zetam.org/wiki/Main_Page

The software releases are at:

https://sourceforge.net/projects/leaf/files/Bering-uClibc/

I needed to build a VPN server to play with Wireguard so basing it on
Bering-uClibc was an obvious choice. Having integrated it into my local
build environment I have offered it to the Bering-uClibc developers and they
are keen to include it. I'm still at the integration stage with them but it
should be in the next release (v6.2) due out before the end of the year.
Currently I am integrating the 0.0.20180809 release of Wireguard.

regards,

John Sager
