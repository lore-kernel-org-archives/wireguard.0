Return-Path: danny.korpan@mailbox.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2dbc5da
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 07:29:19 +0000 (UTC)
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 123f5a1c
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 07:29:18 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 0524D495E3
 for <wireguard@lists.zx2c4.com>; Wed, 29 Aug 2018 09:43:03 +0200 (CEST)
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter03.heinlein-hosting.de (spamfilter03.heinlein-hosting.de
 [80.241.56.117]) (amavisd-new, port 10030)
 with ESMTP id wJRpqPi45DD4 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Aug 2018 09:43:03 +0200 (CEST)
From: <danny.korpan@mailbox.org>
To: <wireguard@lists.zx2c4.com>
Subject: Routing only to latest peer in the config list seems to work
Date: Wed, 29 Aug 2018 09:43:03 +0200
Message-ID: <006501d43f6b$eb516e60$c1f44b20$@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I have the problem with my wireguard server, that only the latest user
"peer" from the server config can route/ping to the internal wireguard
server IP or the clients in the network behind the wireguard server upon
successful connection. All peers can connect to the server, but only the
latest in the list last can ping other servers.
I can't locate the error in the configs... does anybody have an idea?

My wireguard server and client version is using 0.0.20180809-wg1~xenial with
Ubuntu 18.04.1

wg0.conf
[Interface]
Address = 192.168.50.1/24
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A
POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D
POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 51820
PrivateKey = XXX

[Peer]
#User 1
PublicKey = XXX
PresharedKey = XXX
AllowedIPs = 192.168.50.0/24

[Peer]
#User 2
PublicKey = XXX
PresharedKey = XXX
#AllowedIPs = 192.168.50.0/24

[Peer]
#User 3
PublicKey = XXX
PresharedKey = XXX
AllowedIPs = 192.168.50.0/24

[Peer]
#User 4
PublicKey = XXX
PresharedKey = XXX
AllowedIPs = 192.168.50.0/24



client.config
[Interface]
PrivateKey = XXX
DNS = 192.168.178.1
Address = 192.168.50.2/24

[Peer]
PublicKey = XXX
PresharedKey = XXX
AllowedIPs = 192.168.50.0/24, 190.168.178.0/24
Endpoint = my.remote.server:51820
PersistentKeepalive = 25

My sysctl.conf includes
net.ipv4.conf.all.proxy_arp = 1
net.ipv4.ip_forward = 1

Does anybody have an idea?


Kind Regards,
Danny
