Return-Path: john@mib-infotech.co.nz
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6750f155
 for <wireguard@lists.zx2c4.com>;
 Mon, 14 Nov 2016 02:25:44 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id f188so47797775pgc.3
 for <wireguard@lists.zx2c4.com>; Sun, 13 Nov 2016 18:28:16 -0800 (PST)
Return-Path: <john@mib-infotech.co.nz>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <27cccef1-06d9-74b3-5b8a-912850119a76@cumulusnetworks.com>
 <20161113232813.28926-1-Jason@zx2c4.com>
 <bcc61a59-1fbf-adb6-aa82-2e53821f215d@mib-infotech.co.nz>
 <CAHmME9o8zt+5uq=yuw1jsZZhMRcwLasPjpk=O5tpjcp_+55HNQ@mail.gmail.com>
From: John Huttley <john@mib-infotech.co.nz>
Message-ID: <215ed362-725f-a236-d236-bc31bf508005@mib-infotech.co.nz>
Date: Mon, 14 Nov 2016 15:28:10 +1300
MIME-Version: 1.0
In-Reply-To: <CAHmME9o8zt+5uq=yuw1jsZZhMRcwLasPjpk=O5tpjcp_+55HNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Debugging AllowedIps
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Thanks Jason,


I'm using gentoo x64. debug USE is enabled

==============

emerge -p -v wireguard

These are the packages that would be merged, in order:

Calculating dependencies... done!
[ebuild   R   *] net-misc/wireguard-9999::gentoo  USE="debug -kmod-src" 
0 KiB

==============


there is nothing much in /var/log/messages

2016-11-14T15:04:26+13:00 Listen normally on 14 wg0 192.168.94.254:123

Which is when I set up wg.


================

Nothing but the module startup in /var/log/dmesg

wireguard: routing table self-tests: pass
[    7.628264] wireguard: nonce counter self-tests: pass
[    7.629233] wireguard: curve25519 self-tests: pass
[    7.629241] wireguard: chacha20poly1305 self-tests: pass
[    7.629761] wireguard: blake2s self-tests: pass
[    7.629766] wireguard: siphash24 self-tests: pass
[    7.629778] wireguard: WireGuard loaded. See www.wireguard.io for 
information.
[    7.629778] wireguard: (C) Copyright 2015-2016 Jason A. Donenfeld 
<Jason@zx2c4.com>. All Rights Reserved

===================

I start the server like this


#/bin/bash

ip link add dev wg0 type wireguard

ip address add    dev wg0 192.168.94.254/24

wg setconf wg0 /root/wg.conf
ip link set up dev wg0


========

wg.conf is


[Interface]
     PrivateKey = XXXX
     Listenport = 6678

[Peer]
     Publickey=8+7eyTWCQZ7Eqw8tDv6KMTiwaK+WXhRVhal6sANJnmc=
     AllowedIps = 0.0.0.0/0

#[Peer]
#    Publickey=vaw7Z2fZnKLlYwyPUUqvCZbdJN7S78C57nYpQfqZRg8=
#    AllowedIps=  0.0.0.0/0

The commented out peer has its wg0 set to 192.168.94.12/24 and other ips 
on other interfaces in the 10.128.0.0/16 network.


However   AllowedIps = 192.168.94.0/24, 10.128.0.0/16     doesn't work, 
(confirmed with "wg showconf wg0" that it loaded)

0.0.0.0/0 does work

I would have thought to see some debug messages, but there is nothing.

The server has been rebooted after updating wireguard.


RFE: when the module loads and prints its test at startup, please print 
its version and compile flags as well.

Regards,


John
