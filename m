Return-Path: stefan@agner.ch
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd8b918e
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:05:18 +0000 (UTC)
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f76fcd4
 for <wireguard@lists.zx2c4.com>; Wed, 4 Jul 2018 21:05:18 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id B0FAD5C015F
 for <wireguard@lists.zx2c4.com>; Wed,  4 Jul 2018 23:11:52 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 04 Jul 2018 23:11:50 +0200
From: Stefan Agner <stefan@agner.ch>
To: wireguard@lists.zx2c4.com
Subject: Android: TCP connection drop when disabling WiFi
Message-ID: <fada85c8aea2e15480602784fba3eeeb@agner.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,

I am using WireGuard for Android v0.0.20180625 with the Go userspace
backend. I am using a WiFi router with OpenWrt as Wireguard endpoint
(WAN/internet address). Wireguard tunnels all traffic through the tunnel
(Allowed IPs 0.0.0.0/0, ::/0). This works as expected: I can connect to
the Internet through the tunnel no matter whether I am locally on the
WiFi or connecting through 4G. Wireguard reconnects seamlessly.

Now what I hope is that my TCP connection stay alive when roaming from
WiFi to 4G. Since Wireguard reconnects automatically and my public IP
through the tunnel stays the same, I would expect that I can have a SSH
connection open while roaming from WiFi to 4G and back. I am using the
SSH client ConnectBot to connect to an (IPv6) server. When changing from
4G to WiFi, the connection stays alive. However, when switching off WiFi
(and hence change back to 4G) ConnectBot immediately reports "Host has
disconnected.".

It seems as if Android somehow drops all TCP connection when WiFi
connection gets lost... Is this a known behavior? Anybody else observes
the same behavior? It seems somewhat unfortunate as I would have hoped
that Wireguard lets me keep sessions open...

Also tried with a second SSH client, so it seems a common behavior. I am
using a Nexus 6P with Stock Android 8.1.0.

--
Stefan
