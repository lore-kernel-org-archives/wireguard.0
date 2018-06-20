Return-Path: tth@rfa.cz
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 81ecee7b
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:14:05 +0000 (UTC)
Received: from vodka.rfa.cz (vodka.rfa.cz [88.86.120.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b742e7a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 17:14:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vodka.rfa.cz (Postfix) with ESMTP id B320D90CC9
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 19:18:51 +0200 (CEST)
Received: from vodka.rfa.cz ([127.0.0.1])
 by localhost (vodka.rfa.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0xq-opf2jGK for <wireguard@lists.zx2c4.com>;
 Wed, 20 Jun 2018 19:18:50 +0200 (CEST)
Received: from [192.168.0.129] (ip-89-177-116-30.net.upcbroadband.cz
 [89.177.116.30]) by vodka.rfa.cz (Postfix) with ESMTPSA id 9908290A68
 for <wireguard@lists.zx2c4.com>; Wed, 20 Jun 2018 19:18:50 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: Tomas Herceg <tth@rfa.cz>
Subject: listen on specific IP only
Message-ID: <8d3124af-de51-3253-8b89-02233566c4f9@rfa.cz>
Date: Wed, 20 Jun 2018 19:18:48 +0200
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

Helo,
is there a way to listen on specific IP/interface? i need it to use same 
port for multiple applications - 53 for DNS and wireguard because of 
firewall rules i can't controll. I have multiple IPs on the server each 
for specific use. DNS recursor is listening only on private interfaces 
and i want wireguard will be on public IP.

if i try

ListenPort=53

it fails with:
Jun 20 19:12:52 athos wg-quick[19091]: RTNETLINK answers: Address 
already in use

but all my public IPs are not used with this port:

netstat -tulpn |grep 53
tcp        0      0 172.16.16.6:53          0.0.0.0:* 
LISTEN      3372/pdns_recursor
tcp        0      0 192.168.11.1:53         0.0.0.0:* 
LISTEN      3372/pdns_recursor
tcp        0      0 127.0.0.1:53            0.0.0.0:* 
LISTEN      3372/pdns_recursor
udp        0      0 172.16.16.6:53          0.0.0.0:* 
        3372/pdns_recursor
udp    30720      0 192.168.11.1:53         0.0.0.0:* 
        3372/pdns_recursor
udp        0      0 127.0.0.1:53            0.0.0.0:* 
        3372/pdns_recursor

is there any workaround for that for now? will some type of DNAT works?

Thanks Tomas
