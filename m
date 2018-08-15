Return-Path: finkandreas@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce31014b
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Aug 2018 07:05:09 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed4d579f
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Aug 2018 07:05:09 +0000 (UTC)
Received: from localhost ([148.187.136.124]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MOAmi-1fmWf80zXY-005bcV for
 <wireguard@lists.zx2c4.com>; Wed, 15 Aug 2018 09:17:06 +0200
Date: Wed, 15 Aug 2018 09:17:00 +0200
From: Andreas Fink <finkandreas@web.de>
To: wireguard@lists.zx2c4.com
Subject: Connection between two clients
Message-ID: <20180815091700.0d1d5923@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,
I have a problem establishing a direct connection between two clients,
my setup is the following:

Client1 <--> Server <--> Client2

i.e. I have a publicly reachable server, and two clients that are
connected to the server. My configurations are:

Server.conf
[Interface]
PrivateKey = ServerPrivateKey
ListenPort = 51820
Address = 192.168.12.1/24
[Peer]
PublicKey = Client1PublicKey
AllowedIPs = 192.168.12.3/32
[Peer]
PublicKey = Client1PublicKey
AllowedIPs = 192.168.12.2/32

Client1.conf
[Interface]
PrivateKey = Client1PrivateKey
ListenPort = 21003
Address = 192.168.12.3/24
[Peer]
PublicKey = ServerPublicKey
Endpoint = myserver.com:51820
AllowedIPs = 192.168.12.1/24
PersistentKeepalive = 25

Client2.conf
[Interface]
PrivateKey = Client2PrivateKey
ListenPort = 21002
Address = 192.168.12.2/24
[Peer]
PublicKey = ServerPublicKey
Endpoint = myserver.com:51820
AllowedIPs = 192.168.12.1/24
PersistentKeepalive = 25



I am able to ping between client1 to server and client2 to server.
However trying to ping client2 from client1 directly fails...
Looking at the server with tcpdump I can see, that there is an incoming
ping from 192.168.12.3 > 192.168.12.2, however there is nothing
reaching at 192.168.12.2. The ping is not forwarded to 192.168.12.2.
Do I need to setup iptables rules? What's the easiest way to get a
direct connection between two clients?

Cheers
Andreas
