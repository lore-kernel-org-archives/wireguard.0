Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b9601ace
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 17:09:32 +0000 (UTC)
Received: from mail-wr0-f181.google.com (mail-wr0-f181.google.com
 [209.85.128.181])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ba57493
 for <wireguard@lists.zx2c4.com>;
 Thu, 19 Apr 2018 17:09:32 +0000 (UTC)
Received: by mail-wr0-f181.google.com with SMTP id h3-v6so15997706wrh.5
 for <wireguard@lists.zx2c4.com>; Thu, 19 Apr 2018 10:09:38 -0700 (PDT)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host109-187-dynamic.3-87-r.retail.telecomitalia.it. [87.3.187.109])
 by smtp.googlemail.com with ESMTPSA id w62sm4116409wmb.6.2018.04.19.10.09.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 19 Apr 2018 10:09:37 -0700 (PDT)
Subject: Re: On redhat 7.4 wireguard not working
To: wireguard@lists.zx2c4.com
References: <CAPGejTdkr5ERbLPR=94do2_w6GddCK4fOP62ofZ=VYuvSNJ40w@mail.gmail.com>
 <CAHmME9pHbB8JS9anHpMHXqzbF=Ei_9cw3iXBg8aTSZT59vwBPg@mail.gmail.com>
 <CAPGejTecZFFQ=+fH-1iT4iNQP07Giajcfce+ETe98UzE+k4nJg@mail.gmail.com>
 <CAPGejTe3b26qZA0vAXRJeqkuh8fwcnp1seKGhdfZ4yjH3r3jGw@mail.gmail.com>
 <93ffb22e-1c55-087d-1363-b6f56b643f47@createc.ro>
 <589e5d51-3feb-b514-8c26-ff18e7f7d11e@createc.ro>
From: Germano Massullo <germano.massullo@gmail.com>
Message-ID: <1bcdb881-1567-ddb9-0489-031b1703b21e@gmail.com>
Date: Thu, 19 Apr 2018 19:09:36 +0200
MIME-Version: 1.0
In-Reply-To: <589e5d51-3feb-b514-8c26-ff18e7f7d11e@createc.ro>
Content-Type: text/plain; charset=utf-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I am using Wireguard on CentOS 7.4 by many months
iproute-3.10.0-87.el7.x86_64
wireguard-dkms-0.0.20180413-1.el7.centos.noarch
wireguard-tools-0.0.20180413-1.el7.centos.x86_64

$ dkms status
wireguard, 0.0.20180413, 3.10.0-693.21.1.el7.x86_64, x86_64: installed

In my system, Wireguard network interface is handled as a systemd service

# systemctl status wg-quick@wg0.service
● wg-quick@wg0.service - WireGuard via wg-quick(8) for wg0
   Loaded: loaded (/usr/lib/systemd/system/wg-quick@.service; enabled;
vendor preset: disabled)
   Active: active (exited) since gio 2018-04-19 18:07:01 CEST; 1h 1min ago
     Docs: man:wg-quick(8)
           man:wg(8)
           https://www.wireguard.com/
           https://www.wireguard.com/quickstart/
           https://git.zx2c4.com/WireGuard/about/src/tools/wg-quick.8
           https://git.zx2c4.com/WireGuard/about/src/tools/wg.8
  Process: 1059 ExecStart=/usr/bin/wg-quick up %i (code=exited,
status=0/SUCCESS)
 Main PID: 1059 (code=exited, status=0/SUCCESS)

apr 19 18:07:00 vpn systemd[1]: Starting WireGuard via wg-quick(8) for
wg0...
apr 19 18:07:00 vpn wg-quick[1059]: [#] ip link add wg0 type wireguard
apr 19 18:07:01 vpn wg-quick[1059]: [#] wg setconf wg0 /dev/fd/63
apr 19 18:07:01 vpn wg-quick[1059]: [#] ip address add **removed by me**
dev wg0
apr 19 18:07:01 vpn wg-quick[1059]: [#] ip link set mtu 1420 dev wg0
apr 19 18:07:01 vpn wg-quick[1059]: [#] ip link set wg0 up
apr 19 18:07:01 vpn systemd[1]: Started WireGuard via wg-quick(8) for wg0.
