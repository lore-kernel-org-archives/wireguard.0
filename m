Return-Path: luis.dominguez@mtz.desoft.cu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f7d8936e
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 20:03:43 +0000 (UTC)
Received: from mx.desoft.cu (mx.desoft.cu [200.55.138.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1184600e
 for <wireguard@lists.zx2c4.com>; Mon, 9 Apr 2018 20:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mx.desoft.cu (Postfix) with ESMTP id 23AC3E14EF
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 16:10:48 -0400 (CDT)
Received: from mx.desoft.cu ([127.0.0.1])
 by localhost (ns.desoft.cu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQs0YmfDZwsO for <wireguard@lists.zx2c4.com>;
 Mon,  9 Apr 2018 16:10:45 -0400 (CDT)
Received: from correo.mtz.desoft.cu (unknown [192.168.44.19])
 by mx.desoft.cu (Postfix) with ESMTPS id 26769E14BF
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 16:10:45 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by correo.mtz.desoft.cu (Postfix) with ESMTP id E81E98C14B
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 16:17:10 -0400 (CDT)
Received: from correo.mtz.desoft.cu ([127.0.0.1])
 by localhost (correo.mtz.desoft.cu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id T_T8_AFVyw-5 for <wireguard@lists.zx2c4.com>;
 Mon,  9 Apr 2018 16:17:01 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by correo.mtz.desoft.cu (Postfix) with ESMTP id 5BEF38C14E
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 16:17:01 -0400 (CDT)
Received: from correo.mtz.desoft.cu (correo.mtz.desoft.cu [10.11.0.8])
 by correo.mtz.desoft.cu (Postfix) with ESMTP id 26A9C8C14C
 for <wireguard@lists.zx2c4.com>; Mon,  9 Apr 2018 16:17:00 -0400 (CDT)
Date: Mon, 9 Apr 2018 16:17:00 -0400 (CDT)
From: =?utf-8?Q?Ing=2E_Luis_Felipe_Dom=C3=ADnguez?= Vega
 <luis.dominguez@mtz.desoft.cu>
To: wireguard@lists.zx2c4.com
Message-ID: <1183404859.513012.1523305020741.JavaMail.zimbra@mtz.desoft.cu>
Subject: Working only one way
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello people, i currently installed wireguard (So easy !!!!!!), but i have a problem i have ping from server -> client, but not client -> server, when in server I execute tcpdump -i empresa only i see ICMP request and not response: 

Config server: 
************************************
[Interface] 
Address = 10.11.2.0/24 
SaveConfig = true 
ListenPort = 51820 
PrivateKey = -------- 

[Peer] 
PublicKey = hgwZKihI4axZZwoWPsucpX+rZMo6dEhnJgb7ulZmzDE= 
AllowedIPs = 10.11.2.2/32 
Endpoint = 192.168.0.215:59160


Config client: 
************************************
[Interface]
PrivateKey = -------- 
Address = 10.11.2.2/32

[Peer]
PublicKey = v+5UJACf6odzR4ct0vPheVaaKpIdEMjqa9SECloq5CE=
Endpoint = 192.168.0.251:51820
AllowedIPs = 10.11.2.0/24




Routing in server:
------------------
default via 192.168.0.254 dev enp1s0 onlink 
10.11.2.0/24 dev empresa proto kernel scope link src 10.11.2.0 
192.168.0.0/24 dev enp1s0 proto kernel scope link src 192.168.0.251

Routing in client:
------------------
default via 192.168.0.254 dev enp3s0 proto static metric 100 
10.8.0.0/24 via 10.11.0.57 dev enp5s0 proto static metric 100 
10.9.0.0/24 via 10.11.0.57 dev enp5s0 proto static metric 100 
10.11.0.0/24 dev enp5s0 proto kernel scope link src 10.11.0.61 metric 100 
10.11.2.0/24 dev empresa-vpn scope link 
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 
192.168.0.0/24 dev enp3s0 proto kernel scope link src 192.168.0.215 metric 100 
192.168.44.0/24 via 10.11.0.254 dev enp5s0 proto static metric 100




-- 
Luis Felipe Dominguez Vega 
System Administration in Desoft Matanzas | Mob: [ tel:+5353694785 | +5353694785 ] | [ http://www.desoft.cu/ | www.desoft.cu ] 
[ https://www.facebook.com/lfdominguez0104 |    ] [ https://www.linkedin.com/in/luis-felipe-dom%C3%ADnguez-vega-47725794/ |    ] [ https://twitter.com/LuisFelipeDV1 |    ]
XVII CONVENCIÓN Y FERIA INTERNACIONAL: INFORMÁTICA 2018. En La Habana, Cuba, del 19 al 23 de marzo
