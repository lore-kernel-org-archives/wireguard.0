Return-Path: luci@powerneth.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce74f0eb
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 12:25:49 +0000 (UTC)
Received: from mail.intelterm.ro (174.15.122.86.static.cluj.rdsnet.ro
 [86.122.15.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fec793ad
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Jun 2018 12:25:49 +0000 (UTC)
Received: from [192.168.123.118] (unknown [188.24.107.151])
 by mail.intelterm.ro (Postfix) with ESMTPSA id 29FD92218C78
 for <wireguard@lists.zx2c4.com>; Thu, 28 Jun 2018 15:31:35 +0300 (EEST)
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@powerneth.ro>
Subject: some mips iperf3 tests
Message-ID: <da8f4774-5b00-96c1-9c29-3619ec789551@powerneth.ro>
Date: Thu, 28 Jun 2018 15:31:34 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If someone needs an image about the speed of wireguard on mips 4.14.52 
kernel these are some values made with iperf3 (but the "server" is the 
infamous version 0.0.20180620)


[    0.000000] SoC: Qualcomm Atheros QCA9533 ver 1 rev 1
[    0.000000] CPU clock: 550.000 MHz

Max down 37.4 Mbits/sec
Max up   53.7 Mbits/sec

[    0.000000] SoC: Qualcomm Atheros QCA956X ver 1 rev 0
[    0.000000] CPU clock: 775.000 MHz

Max down  82.8 Mbits/sec
Max up    73.6 Mbits/sec

Regards
