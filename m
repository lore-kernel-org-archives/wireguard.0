Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e7b73c9b
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 23:21:06 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbeae519
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 23:21:05 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Lucian Cristian <luci@createc.ro>
Subject: Qualcomm Shortcut Forwarding Engine
Message-ID: <f899416f-8d9c-d5f2-f7d0-e393fe989320@createc.ro>
Date: Thu, 30 Nov 2017 01:27:10 +0200
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

Hi

Not sure if you can do something about this, I started to test this 
option for accelerated speed on NAT module (fast path) and I don't 
understand why is bothering the wireguard VPN, it should be active only 
on NAT connections.

The problem is strange, the iperf3 speed test will do about ~300 mb/s on 
WRT3200ACM router in bot direction (I think is my ISP limit for the two 
peers) but if I want to make an SCCP/SIP phone call it will not always 
connect or there will be some delay in doing it, also remote desktop 
will disconnect and reconnect every ~5 seconds.

There is no NAT in the VPN, everything is routed by zebra deamon.

this is the forum discussion: 
https://forum.lede-project.org/t/qualcomm-fast-path-for-lede/4582

this is the PR for LEDE : https://github.com/lede-project/source/pull/1269

Regards
