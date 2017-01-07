Return-Path: em12345@web.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1af1593
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 14:33:52 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.14])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12a497c7
 for <wireguard@lists.zx2c4.com>; Sat, 7 Jan 2017 14:33:52 +0000 (UTC)
Received: from [192.168.244.69] ([91.63.246.64]) by smtp.web.de (mrweb003
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MBkKF-1cIxVw3vkt-00AmHX for
 <wireguard@lists.zx2c4.com>; Sat, 07 Jan 2017 15:43:11 +0100
To: wireguard@lists.zx2c4.com
From: em12345 <em12345@web.de>
Subject: Multiple Endpoints
Message-ID: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
Date: Sat, 7 Jan 2017 15:43:10 +0100
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

Hi,

I'm wondering how to setup a WG client when having multiple DynDNS names
for a single WG server using dynamic IP. Using multiple DynDNS services
for the same host is a common pattern to work around unreliable DynDNS
services.
As far as I see, only a single endpoint can be given in the configuration.

If there are no plans to support multiple endpoints, I guess this has to
be done via a cron job, since I don't see any explicit hook which could
be used instead.

In order to implement such a script I would have the following
additional questions:

1.) Is "wg setconf" returning/succeeding before the client-server
connection could be established? If so, would it be possible to add an
additional timeout option which waits up to the timeout for establishing
the connection and exits non zero if it failed to do so?
2.) Is "ip link up wg0" already returning/succeeding before the
client-server connection could be established?
3.) What is the best way to determine if a WG client-server connection
is currently alive/working/established? E.g.: wg show wg0
latest-handshakes? I assume that "ip link show wg0" will not show such info.
4.) Is it possible to use "wg set" and/or "wg setconf" while the link is
already up?
5.) Is it possible, using "wg set wg0 endpoint" to only change the
endpoint of an existing peer? Or is it necessary to use "wg setconf"
which replaces every setting for the link?


Similar problems have to be resolved when having Road Warrior PCs, which
may by sometimes directly connected inside the LAN, in which case the
tunnel should not be used. So:
1.) block server endpoint (e.g. via firewall) for crypted traffic
originating from a LAN client
2.) drop (or don't add in the first place) routes into tunnel when no
connection could be established


Thanks

Emmanuel
