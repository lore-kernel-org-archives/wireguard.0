Return-Path: augustus_meyer@yahoo.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b21a7c6a
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 04:59:31 +0000 (UTC)
Received: from sonic301-20.consmr.mail.ir2.yahoo.com
 (sonic301-20.consmr.mail.ir2.yahoo.com [77.238.176.97])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d30cfcd6
 for <wireguard@lists.zx2c4.com>;
 Sat, 12 May 2018 04:59:31 +0000 (UTC)
Date: Sat, 12 May 2018 05:02:23 +0000 (UTC)
From: reiner otto <augustus_meyer@yahoo.de>
To: <wireguard@lists.zx2c4.com>
Message-ID: <59058359.636643.1526101343138@mail.yahoo.com>
Subject: AW: WG: Need for HW-clock independent timestamps
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
References: <59058359.636643.1526101343138.ref@mail.yahoo.com>
Reply-To: reiner otto <augustus_meyer@yahoo.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I ran into this problem, too, and fixed it by re-adjusting the time before WG is activated. This needs some fiddling around with standard NTP startup in openwrt, though, so it is some type of hack which I do not really like. Unfortunately, not so many openwrt-devices around having RTC.  WG to use some type of sequence-no. would be appreciated.

Reiner
