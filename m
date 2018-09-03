Return-Path: olemd@glemt.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71d3fed5
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:44:45 +0000 (UTC)
Received: from gjen.glemt.net (2001:ba8:1f1:f2fe::2
 [IPv6:2001:ba8:1f1:f2fe::2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50213e2c
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 10:44:45 +0000 (UTC)
Received: from [2a00:14d8:4098:dead:e2d5:5eff:fe29:d33b]
 by gjen.glemt.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.91) (envelope-from <olemd@glemt.net>) id 1fwmZZ-0001e9-Hz
 for wireguard@lists.zx2c4.com; Mon, 03 Sep 2018 12:59:09 +0200
Subject: Re: Wireguard behind NAT
Cc: wireguard@lists.zx2c4.com
References: <CA+Hw3eb7rEuDyuzq9dCj71KAYK3hRni0EDiz5j1ZpKjVwBo-Xg@mail.gmail.com>
 <429987c9-26e4-edb7-4d31-c8e611615670@glemt.net>
 <20180903155549.0677bf87@natsu>
From: Ole-Morten Duesund <olemd@glemt.net>
Message-ID: <6a239fff-ef31-b528-4633-098c0a8a8e8b@glemt.net>
Date: Mon, 3 Sep 2018 12:59:03 +0200
MIME-Version: 1.0
In-Reply-To: <20180903155549.0677bf87@natsu>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 9/3/18 12:55 PM, Roman Mamedov wrote:
> On Mon, 3 Sep 2018 12:43:19 +0200
> Ole-Morten Duesund <olemd@glemt.net> wrote:
> 
>> Adding a "PersistentKeepalive = 5" to your config on SIDE_A_SERVER
>> should keep the connection up.
> 
> Do you encounter any difference between 5, 25 and 55, only 5 works for you? If
> not, setting it to such a low interval seems wasteful, especially on
> LTE/mobile with possibly metered bandwidth and battery concerns.

"It works for me?" It's a balance between how long you're willing to 
wait for a possibly idle link if you need to connect from SIDE_B to SIDE_A.

It's tunable and you should probably test what's acceptable to you.

- OM
