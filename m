Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 867a4051
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 15:18:23 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5a857492
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 15:18:22 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx102
 [212.227.17.174]) with ESMTPSA (Nemesis) id 0MCOdh-1dEc7n1IOH-0097zj for
 <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 17:27:54 +0200
Date: Tue, 2 May 2017 17:27:52 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: wg-quick can't down my vpn I/F and DNS problem
Message-ID: <20170502172752.4e234cd8@msi.defcon1>
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

Debian jessie + backports - arch amd64
wireguard-dkms  0.0.20170421-wg1~zesty
wireguard-tools 0.0.20170421-wg1~zesty
======================================

Hi list,


I've a very simple setup:
LAN: 192.168.1.0/24
VPN: 10.11.12.0/24

if wg-quick raises the VPN smoothly and although it's working perfectly
and damned fast, if fails when trying to take it down with the
following error:
wg-quick: `vpnserver' is not a WireGuard interface

the only way I found to stop it is to use 2 lines:
ip link del vpnserver
rmmod wireguard

why is that?


The 2 machines I test on are also DNS, but once the vpn's connected, I
lose all possibility of name resolution - It might be tied to
resolvconf, but I'm not tough enough to know what to do.
(NB: I *want* these because bind is passing through dnscrypt-proxy,
leaving no traces of DNS external requests)

How can I fix that?

Jean-Yves
