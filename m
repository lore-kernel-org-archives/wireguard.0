Return-Path: stefan.tatschner@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58805416
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:39:15 +0000 (UTC)
Received: from mail-wr0-x229.google.com (mail-wr0-x229.google.com
 [IPv6:2a00:1450:400c:c0c::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39383b4c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:39:14 +0000 (UTC)
Received: by mail-wr0-x229.google.com with SMTP id o4-v6so2680504wrm.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 May 2018 00:39:33 -0700 (PDT)
Return-Path: <stefan.tatschner@gmail.com>
Received: from p200300CD373720006AF728FFFEB1F349.dip0.t-ipconnect.de
 (p200300CD373720006AF728FFFEB1F349.dip0.t-ipconnect.de.
 [2003:cd:3737:2000:6af7:28ff:feb1:f349])
 by smtp.gmail.com with ESMTPSA id d12-v6sm2081664wrg.2.2018.05.16.00.39.31
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 May 2018 00:39:31 -0700 (PDT)
Message-ID: <84ae760324adc8302c3a98068d2f46304da6aae0.camel@gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
From: Stefan Tatschner <stefan.tatschner@gmail.com>
To: wireguard@lists.zx2c4.com
Date: Wed, 16 May 2018 09:39:30 +0200
In-Reply-To: <955fe6b8-4e40-a3c3-c6a0-0050d3406913@urlichs.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

> > On 16.05.2018 09:10, Stefan Tatschner wrote:
> > How can I debug this further?
> 
> Check the output of "ip rule".

As a user I can't read anything useful out of this, since I don't known how
wireguard android sets its fwmarks, etc. But here it is:

lux:/ # ip rule
0:	from all lookup local 
10000:	from all fwmark 0xc0000/0xd0000 lookup legacy_system 
10500:	from all oif dummy0 uidrange 0-0 lookup dummy0 
10500:	from all oif rmnet_data0 uidrange 0-0 lookup rmnet_data0 
11000:	from all iif tun0 lookup local_network 
12000:	from all fwmark 0x0/0x20000 iif lo uidrange 0-99999 lookup tun0 
12000:	from all fwmark 0xc0065/0xcffff lookup tun0 
13000:	from all fwmark 0x10063/0x1ffff lookup local_network 
13000:	from all fwmark 0x10064/0x1ffff lookup rmnet_data0 
13000:	from all fwmark 0x10065/0x1ffff uidrange 0-99999 lookup tun0 
13000:	from all fwmark 0x10065/0x1ffff uidrange 0-0 lookup tun0 
14000:	from all oif dummy0 lookup dummy0 
14000:	from all oif rmnet_data0 lookup rmnet_data0 
14000:	from all oif tun0 uidrange 0-99999 lookup tun0 
15000:	from all fwmark 0x0/0x10000 lookup legacy_system 
16000:	from all fwmark 0x0/0x10000 lookup legacy_network 
17000:	from all fwmark 0x0/0x10000 lookup local_network 
19000:	from all fwmark 0x64/0x1ffff lookup rmnet_data0 
21000:	from all fwmark 0x65/0x1ffff lookup rmnet_data0 
22000:	from all fwmark 0x0/0xffff lookup rmnet_data0 
23000:	from all fwmark 0x0/0xffff uidrange 0-0 lookup main 
32000:	from all unreachable

Stefan
