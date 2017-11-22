Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e2ba369
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 10:48:34 +0000 (UTC)
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84ec1d36
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 10:48:34 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id l188so7616318wma.1
 for <wireguard@lists.zx2c4.com>; Wed, 22 Nov 2017 02:53:40 -0800 (PST)
MIME-Version: 1.0
From: d tbsky <tbskyd@gmail.com>
Date: Wed, 22 Nov 2017 18:53:39 +0800
Message-ID: <CAC6SzHKVvOEZYXiuK-O6jMN=OOPjfogq2bbeHnYA1xoLew-OcQ@mail.gmail.com>
Subject: roaming and ddns dynamic ip
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi:
    I tried some setup for wireguard and found it may cause problem.
assume server has dynamic ip and has a static dns name
"ddns-server.example.com".

client.conf like below:
[Interface]
PrivateKey = ****
ListenPort = 51820
[Peer]
PublicKey = ****
Endpoint =  ddns-server.example.com:51820
AllowedIPs = 0.0.0.0/0

if I use "wg setconf wg0 client.conf", then use "wg showconf wg0", result below:
[Interface]
ListenPort = 51820
PrivateKey = ****
[Peer]
PublicKey = ****
AllowedIPs = 0.0.0.0/0
Endpoint = 1.1.1.1:51820

the "ddns-server.example.com" has translate to ip "1.1.1.1".

if later "ddns-server.example.com" change ip to "2.2.2.2", I wonder if
wireguard will try to resolve "ddns-server.example.com" again?  will
wireguard try to resolve  "ddns-server.example.com" again  when
connection is broken?

thanks a lot for help!!

Regards,
tbskyd
