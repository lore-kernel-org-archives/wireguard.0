Return-Path: glitsj16@riseup.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1a32ebe
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 02:25:54 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f4786433
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 May 2017 02:25:54 +0000 (UTC)
Received: from cotinga.riseup.net (unknown [10.0.1.164])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 378BA1A0995
 for <wireguard@lists.zx2c4.com>; Mon, 22 May 2017 02:37:51 +0000 (UTC)
Date: Mon, 22 May 2017 04:37:47 -0000
From: Helle Vaanzinn <glitsj16@riseup.net>
To: wglist <wireguard@lists.zx2c4.com>
Subject: bypass wireguard VPN (wgphys sample script help needed)
Message-ID: <20170522043747.09f2ddf0.glitsj16@riseup.net>
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

Hi, I've been testing wireguard as a replacement for openvpn for a while now
and it's doing very well indeed. In no way a skilled networking/routing person,
as a 'regular' user I was looking for a simple scripted way to start/stop a VPN
tunnel and occasionally bypassing that when needed. Wireguard's
`wg-quick` very much does its magic for people like me. I use it in a
basic setup in which all traffic gets routed via the wireguard
interface. Works great. The only piece missing in this simple puzzle is
a way to selectively bypass the tunnel.

While digesting https://www.wireguard.io/netns/ I came across the `wgphys`
sample script and realized that was exactly what I'm looking for. So I pasted the wgphys code into a bash script and exchanged eth0/wlan0 with enp4s0/wlp2s0
(which are used on my Arch Linux box). All set or so I thought :) Running it via
sudo the `wgphys`script complains about unrecognized config settings. Address, PostUp, PostDown, SaveConfig lines from /etc/wirgeuard/wgvpn0.conf spit out config parser errors. I can comment those out but it still doesn't work as expected.

Alas, my current skill-set is way too limited to solve this reliably on my own.
I do realize wireguard is still in full development and the `wgphys`
code probably got outdated along the way. So here's my question: how
would a 'bypass wireguard vpn script for dummies' look like when using
the latest wg-quick from snapshot 0.0.20170517?

Regards, Helle

= = =
server box:
- - - - - - - - - - -
$ sudo cat /etc/wireguard/wg0-server.conf
[Interface]
Address = 10.192.122.1/24
ListenPort = 51820
PrivateKey = <redacted>
SaveConfig = true

[Peer]
AllowedIPs = 10.192.122.2/32
Endpoint = <redacted>
PresharedKey = <redacted>
PublicKey = <redacted>

client box:
- - - - - - - - - - -
$ sudo cat /etc/wireguard/wgvpn0.conf
[Interface]
Address = 10.192.122.2/32
ListenPort = 21841
PrivateKey = <redacted>
SaveConfig = false

[Peer]
AllowedIPs = 0.0.0.0/0
Endpoint = <redacted>
PersistentKeepalive = 25
PresharedKey = <redacted>
PublicKey = <redacted>
