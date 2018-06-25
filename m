Return-Path: adrian.sev@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 67b760cb
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:46:29 +0000 (UTC)
Received: from mail-wm0-x229.google.com (mail-wm0-x229.google.com
 [IPv6:2a00:1450:400c:c09::229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b1aff08
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 19:46:29 +0000 (UTC)
Received: by mail-wm0-x229.google.com with SMTP id z137-v6so5567574wmc.0
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jun 2018 12:51:56 -0700 (PDT)
Return-Path: <adrian.sev@gmail.com>
Received: from hal.home ([79.115.160.101])
 by smtp.gmail.com with ESMTPSA id x16-v6sm4297812wro.13.2018.06.25.12.51.52
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Jun 2018 12:51:52 -0700 (PDT)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: wg addconf :: AllowedIPs gets deleted with the additions of peers
Message-ID: <a989a217-9e18-5e5f-2a97-fa3ac81ccb87@gmail.com>
Date: Mon, 25 Jun 2018 22:51:51 +0300
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

Hi! It seems that AllowedIPs declaration gets erased when peers are 
added with addconf
So, we have the interface :
wg showconf wg0
[Interface]
ListenPort = 43333
PrivateKey = <XXX>

and we add a peer
wg addconf wg0 hal.conf.p1
[Monday 25.06.18 22:48] root@sev : /etc/wireguard/peers_server $
wg showconf wg0
[Interface]
ListenPort = 43333
PrivateKey = KLLZ9i4ffUeCv+e6cs7V7+jKM3KJtgaRkEbt52UCcEU=

[Peer]
PublicKey = /azluhJf0RYaIxu6rHRHx6+fKfivwOnKVp9Naefgsk0=
AllowedIPs = 0.0.0.0/0

then we add a second peer :
wg addconf wg0 x360.conf.p2
[Monday 25.06.18 22:49] root@sev : /etc/wireguard/peers_server $
wg showconf wg0
[Interface]
ListenPort = 43333
PrivateKey = KLLZ9i4ffUeCv+e6cs7V7+jKM3KJtgaRkEbt52UCcEU=

[Peer]
PublicKey = /azluhJf0RYaIxu6rHRHx6+fKfivwOnKVp9Naefgsk0=
Endpoint = 79.115.160.101:43333

[Peer]
PublicKey = 0bC+LP/8fsjjn9RSdq+Bz1qdgPRV3CYE/4fEiOqjrC4=
AllowedIPs = 0.0.0.0/0

the AllowedIPs declaration was erased from first peer..

the file contents :
[Monday 25.06.18 22:49] root@sev : /etc/wireguard/peers_server $
cat hal.conf.p1
[Peer]
PublicKey = /azluhJf0RYaIxu6rHRHx6+fKfivwOnKVp9Naefgsk0=
AllowedIPs = 0.0.0.0/0

[Monday 25.06.18 22:50] root@sev : /etc/wireguard/peers_server $
cat x360.conf.p2
[Peer]
PublicKey = 0bC+LP/8fsjjn9RSdq+Bz1qdgPRV3CYE/4fEiOqjrC4=
AllowedIPs = 0.0.0.0/0

Thank you!
Adrian
