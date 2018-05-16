Return-Path: stefan.tatschner@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1759edda
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:10:22 +0000 (UTC)
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8c4707a
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 07:10:22 +0000 (UTC)
Received: by mail-wr0-x242.google.com with SMTP id a12-v6so2553792wrn.13
 for <wireguard@lists.zx2c4.com>; Wed, 16 May 2018 00:10:40 -0700 (PDT)
Return-Path: <stefan.tatschner@gmail.com>
Message-ID: <6f210e328bdca2d1a1ed1e3714b507ce571abc3f.camel@gmail.com>
Subject: Re: [ANNOUNCE] Alpha Snapshots of WireGuard for Android and macOS
From: Stefan Tatschner <stefan.tatschner@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, wireguard@lists.zx2c4.com
Date: Wed, 16 May 2018 09:10:38 +0200
In-Reply-To: <20180515225433.GA26432@zx2c4.com>
References: <20180515225433.GA26432@zx2c4.com>
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

Hi Jason,

thanks for your hard work!

On Wed, 2018-05-16 at 00:54 +0200, Jason A. Donenfeld wrote:
> [NEW] WireGuard for Android
> ---------------------------
> You can download the app from the Play Store or from F-Droid. It supports
> adding wg-quick(8)-style .conf files or .zips of them. The app uses the kernel
> module if available, which gives the best performance, stability, and battery
> life, and falls back to the userspace code if it's not available. Download at:
> https://play.google.com/store/apps/details?id=com.wireguard.android

there seems to be sth. weird with the routing rules/tables. The wireguard routes
are not set up properly on my phone.

My wireguard network is 10.80.100.0/24, the wireguard server is 10.80.100.1, the
phone is 10.80.100.27.

On the phone:

lux:/ # ip route
10.80.100.0/24 dev tun0  proto kernel  scope link  src 10.80.100.27 
10.160.151.136/29 dev rmnet_data0  proto kernel  scope link  src 10.160.151.139

lux:/ # ip route get 10.80.100.1
10.80.100.1 via 10.160.151.140 dev rmnet_data0  src 10.160.151.139  uid 0 
    cache

  -> wrong. this routes via the mobile radio device.

lux:/ # ip route flush cache

lux:/ # ip route get 10.80.100.1      
10.80.100.1 via 10.160.151.140 dev rmnet_data0  src 10.160.151.139  uid 0 
    cache

How can I debug this further?


I have an openvpn server on the same box, in another subnet. This works fine on
the phone:

lux:/ # ip route
10.100.40.0/24 dev tun0  proto kernel  scope link  src 10.100.40.2 
10.160.151.136/29 dev rmnet_data0  proto kernel  scope link  src 10.160.151.139 

lux:/ # ip route get 10.80.100.1
10.80.100.1 dev tun0  src 10.100.40.2  uid 0 
    cache 

  -> works, the wireguard subnet is routed via tun0.

Stefan
