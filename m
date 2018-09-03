Return-Path: olemd@glemt.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdd902f8
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:29:01 +0000 (UTC)
Received: from gjen.glemt.net (2001:ba8:1f1:f2fe::2
 [IPv6:2001:ba8:1f1:f2fe::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90a6a183
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:29:01 +0000 (UTC)
Received: from [2a00:14d8:4098:dead:e2d5:5eff:fe29:d33b]
 by gjen.glemt.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.91) (envelope-from <olemd@glemt.net>) id 1fwmKL-0001bo-KP
 for wireguard@lists.zx2c4.com; Mon, 03 Sep 2018 12:43:25 +0200
Subject: Re: Wireguard behind NAT
To: wireguard@lists.zx2c4.com
References: <CA+Hw3eb7rEuDyuzq9dCj71KAYK3hRni0EDiz5j1ZpKjVwBo-Xg@mail.gmail.com>
From: Ole-Morten Duesund <olemd@glemt.net>
Message-ID: <429987c9-26e4-edb7-4d31-c8e611615670@glemt.net>
Date: Mon, 3 Sep 2018 12:43:19 +0200
MIME-Version: 1.0
In-Reply-To: <CA+Hw3eb7rEuDyuzq9dCj71KAYK3hRni0EDiz5j1ZpKjVwBo-Xg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 9/3/18 12:28 PM, Adrián Mihálko wrote:
> Is there any way to connect to Wireguard behind a Carrier-grade NAT?
> 
> On SIDE_A I have a backup LTE connection, without proper public ip, only 
> dynamic ip and I server with Wireguard.
> 
> SIDE_A = mobile LTE connection, without public IP, behind carrier grade NAT
> SIDE_A_SERVER = WIREGUARD (connecting to sideb.dyndns.org 
> <http://sideb.dyndns.org/>)
> 
> SIDE_B = VDSL with public ip + ddns (sideb.dyndns.org 
> <http://sideb.dyndns.org/>)
> SIDE_B_SERVER = WIREGUARD (cannot connect to SIDE_A, because no public 
> ip on SIDE_A)
> 
> I heard of Wireguard-P2P, but it's not running on headless server, 
> because one of their component requires x11.

This is pretty much the same as I have - and while SIDE_B_SERVER won't 
be able to establish connection to SIDE_A_SERVER, SIDE_A_SERVER should 
have no problems establishing a connection to SIDE_B_SERVER.

Adding a "PersistentKeepalive = 5" to your config on SIDE_A_SERVER 
should keep the connection up.

- OM
