Return-Path: ds@fastmail.fm
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d38f6fc6
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 10:00:29 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14da8a55
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Nov 2017 10:00:29 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5A9A020A8B
 for <wireguard@lists.zx2c4.com>; Thu, 16 Nov 2017 05:04:49 -0500 (EST)
Message-Id: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
From: ds@fastmail.fm
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Date: Thu, 16 Nov 2017 11:04:49 +0100
Subject: disabling ipv6 with wg-quick
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

Is there a way to disable ipv6 when using wg-quick?

If I have the following line on my conf file:

Address = xx.xx.x.39/32,xxxx:xxxx:xxx:bb01::327/128

wg-quick will fail with the following error:

 ~ 2   wg-quick up mullvad-se2    
[#] ip link add mullvad-se2 type wireguard
[#] wg setconf mullvad-se2 /dev/fd/63
[#] ip address add  xx.xx.x.39/3 dev mullvad-se2
[#] ip address add xxxx:xxxx:xxx:bb01::327/128 dev mullvad-se2
RTNETLINK answers: Permission denied

I have ip6 disabled in my system.

Removing xxxx:xxxx:xxx:bb01::327/128 works, but wg-quick still sets ups
some ipv6 routes `ip -6 ..` etc.

Is there a way to use ipv4 only with wg-quick?

Thanks.
 
