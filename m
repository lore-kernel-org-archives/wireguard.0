Return-Path: mikael@m7n.se
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ace1f478
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:44:06 +0000 (UTC)
Received: from bond.m7n.se (bond.m7n.se [46.246.28.121])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be3a8579
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:44:06 +0000 (UTC)
Received: from reyes.m7n.se (unknown
 [IPv6:2001:470:dfae:1000:45d7:9c65:d2bd:56b8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by bond.m7n.se (Postfix) with ESMTPSA id 9BD8C6000772
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 18:58:31 +0000 (UTC)
Subject: Re: Why does 'allowed-ips' affect route selection behavior?
To: wireguard@lists.zx2c4.com
References: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
From: mikma.wg@m7n.se
Message-ID: <44db3062-cee6-4cde-74b5-d812a8d49899@m7n.se>
Date: Sun, 15 Apr 2018 20:58:31 +0200
MIME-Version: 1.0
In-Reply-To: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On 04/15/2018 08:49 PM, Patrick O'Sullivan wrote:

> $ sudo ip route show
> default via 10.199.199.1 dev wlan0
> 10.111.111.0/24 dev wg0 proto kernel scope link src 10.111.111.100
> 10.199.199.0/24 dev wlan0 proto kernel scope link src 10.199.199.131
> 
> By this route table, traffic to e.g. 4.2.2.1 should use 10.199.199.1.
> Packet captures were showing traffic trying to instead use wg0. Then I
> found this:
> 
> $ sudo ip route get 4.2.2.1
> 4.2.2.1 dev wg0 table 51820 src 10.111.111.100
>      cache
> 
> Can someone please explain this behavior?

Table 51820 is the default table used by wg-quick.

 From wg-quick's man page:

> It infers all routes from the list of peers' allowed IPs, and automatically  adds them to the system routing table. If one of those routes is the default route (0.0.0.0/0 or ::/0), then it uses ip-rule(8) to  handle overriding of the default gateway.

/Mikma
