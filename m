Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2BC1C2D0C9
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:56:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5715B214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5715B214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=schauer.tech
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4c9452f;
	Thu, 12 Dec 2019 09:56:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 262df4cb
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 20:02:35 +0000 (UTC)
Received: from schauer.tech (schauer.tech [IPv6:2a03:4000:24:7af::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de21552a
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 20:02:35 +0000 (UTC)
Received: from ks-pc (tunnel559461-pt.tunnel.tserv6.fra1.ipv6.he.net
 [IPv6:2001:470:1f0a:4d8::2])
 by schauer.tech (Postfix) with ESMTPSA id 1E1544002F
 for <wireguard@lists.zx2c4.com>; Mon,  9 Dec 2019 21:02:34 +0100 (CET)
From: Kilian Schauer <kilian@schauer.tech>
To: wireguard@lists.zx2c4.com
Subject: WireGuard-Windows sets wrong gateway IP address in routes
Date: Mon, 09 Dec 2019 21:02:32 +0100
Message-ID: <5051349.o0j8OtQRaE@ki-pc-ku>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 12 Dec 2019 10:55:59 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey all,

it appears I found a bug in the Windows implementation of the WireGuard client.
I'm not sure, because it seems to be a rather trivial one, but I guess you will tell me if it's not the case.

So: When you activate a configured tunnel, WG sets the very first IP address of a network as gateway, instead of the first usable address.

That means, if you have a VPN (sub)net like 10.0.10.0/24, where your server has 10.0.10.1 and the Windows machine 10.0.10.4,
the client tries to use 10.0.10.0 as gateway. This obviously doesn't work, because this address is reserved / not usable, and the gateway has a different IP.
The first usable address for hosts is 10.0.10.1, which the WireGuard client should set as gateway.

Same applies for IPv6.

The relevant code should be here: https://git.zx2c4.com/wireguard-windows/tree/tunnel/addressconfig.go#n74
The interface IP is masked with the subnet mask, which returns the very first address,
the network address (xxx.xxx.xxx.0 for a IPv4 /24) instead of the first usable address (xxx.xxx.xxx.1): https://golang.org/src/net/ip.go?s=946:960#L244

For reference, looking at TunSafe's implementation they _do_ increment the address by one:
https://github.com/TunSafe/TunSafe/blob/85a871c1d226956df7c1308a1e5527556fe35fe1/network_win32.cpp#L1147-L1152


Without knowing too much about what's going on behind the scenes, I think incrementing the returned address by one like TunSafe does it might be enough to fix this.
I didn't try it out yet though, don't have a WireGuard dev env set up. If you want me to, I can take a look and maybe send a patch if I get it to work.


I've attached my configuration + the output of 'route PRINT' before and after activating the tunnel (WG + TunSafe).



Thank you very much
Kilian



Example configuration:
Windows Client:

[Interface]
PrivateKey = [Redacted]
Address = 10.0.10.4/24, 2000:db8:bbbb:0:1000::4/80

[Peer]
PublicKey = [Redacted]
AllowedIPs = ::/0
Endpoint = vpn.example.com:51820
PersistentKeepalive = 25


Server:

[Interface]
PrivateKey = [Redacted]
Address = 10.0.10.1/24 2000:db8:bbbb:0:1000::1/80
ListenPort = 51820
[...]

[Peer]
# Windows Client
PublicKey = [Redacted]
AllowedIPs = 10.0.10.4/32, 2000:db8:bbbb:0:1000::4/128


And the routing table on the Windows client **before** activating the tunnel (rough translation. View with monospace font for proper alignment):

IPv4-Routingtable
===========================================================================
Active Routes:
   Target Network             Mask          Gateway        Interface Metric
          0.0.0.0          0.0.0.0      192.168.0.1    192.168.1.150     25
        127.0.0.0        255.0.0.0          On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255          On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255          On-link         127.0.0.1    331
      192.168.0.0    255.255.254.0          On-link     192.168.1.150    281
    192.168.1.150  255.255.255.255          On-link     192.168.1.150    281
    192.168.1.255  255.255.255.255          On-link     192.168.1.150    281
        224.0.0.0        240.0.0.0          On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0          On-link     192.168.1.150    281
  255.255.255.255  255.255.255.255          On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255          On-link     192.168.1.150    281
===========================================================================
Static Routes:
  None

IPv6-Routingtable
===========================================================================
Active Routes:
 If Metric Target Network                   Gateway
  4    281 ::/0                             fe80::4244:b528:6295:8428
  1    331 ::1/128                          On-link
  4    281 2000:db8:abcd::/64               On-link
  4    281 2000:db8:abcd::150/128           On-link
  4    281 fe80::/64                        On-link
  4    281 fe80::fc41:14c7:8c5b:e566/128    On-link
  1    331 ff00::/8                         On-link
  4    281 ff00::/8                         On-link
===========================================================================
Static Routes:
  None


The routing table **after** activating the tunnel:

IPv4-Routingtable
===========================================================================
Active Routes:
   Target Network             Mask          Gateway        Interface Metric
          0.0.0.0          0.0.0.0      192.168.0.1    192.168.1.150     25
          0.0.0.0        128.0.0.0        10.0.10.0        10.0.10.4      5 <-----
        128.0.0.0        128.0.0.0        10.0.10.0        10.0.10.4      5 <-----
        10.0.10.0    255.255.255.0        10.0.10.0        10.0.10.4      5 <-----
        10.0.10.4  255.255.255.255          On-link         10.0.10.4    261
        127.0.0.0        255.0.0.0          On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255          On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255          On-link         127.0.0.1    331
      192.168.0.0    255.255.254.0          On-link     192.168.1.150    281
    192.168.1.150  255.255.255.255          On-link     192.168.1.150    281
    192.168.1.255  255.255.255.255          On-link     192.168.1.150    281
        224.0.0.0        240.0.0.0          On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0          On-link     192.168.1.150    281
  255.255.255.255  255.255.255.255          On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255          On-link     192.168.1.150    281
===========================================================================
Static Routes:
  None

IPv6-Routingtable
===========================================================================
Active Routes:
 If Metric Target Network                   Gateway
  4    281 ::/0                             fe80::4244:b528:6295:8428
 63      0 ::/0                             2000:db8:bbbb:0:1000::     <-----
 63      0 2000:db8:bbbb:0:1000::/80        2000:db8:bbbb:0:1000::     <-----
  1    331 ::1/128                          On-link
  4    281 2000:db8:abcd::/64               On-link
  4    281 2000:db8:abcd::150/128           On-link
 63    256 2000:db8:bbbb:0:1000::4/128      On-link
  4    281 fe80::/64                        On-link
  4    281 fe80::fc41:14c7:8c5b:e566/128    On-link
  1    331 ff00::/8                         On-link
  4    281 ff00::/8                         On-link
===========================================================================
Static Routes:
  None


The routing table after activating the tunnel with the same config but using TunSafe as implementation:

IPv4-Routingtable
===========================================================================
Active Routes:
   Target Network             Mask          Gateway        Interface Metric
          0.0.0.0          0.0.0.0      192.168.0.1    192.168.1.150     25
          0.0.0.0        128.0.0.0        10.0.10.1        10.0.10.4    102 <-----
        128.0.0.0        128.0.0.0        10.0.10.1        10.0.10.4    102 <-----
[vpn.example.com]  255.255.255.255      192.168.0.1    192.168.1.150    125
        10.0.10.0    255.255.255.0          On-link        10.0.10.4    258
        10.0.10.4  255.255.255.255          On-link         10.0.10.4    261
        127.0.0.0        255.0.0.0          On-link         127.0.0.1    331
        127.0.0.1  255.255.255.255          On-link         127.0.0.1    331
  127.255.255.255  255.255.255.255          On-link         127.0.0.1    331
      192.168.0.0    255.255.254.0          On-link     192.168.1.150    281
    192.168.1.150  255.255.255.255          On-link     192.168.1.150    281
    192.168.1.255  255.255.255.255          On-link     192.168.1.150    281
        224.0.0.0        240.0.0.0          On-link         127.0.0.1    331
        224.0.0.0        240.0.0.0          On-link     192.168.1.150    281
  255.255.255.255  255.255.255.255          On-link         127.0.0.1    331
  255.255.255.255  255.255.255.255          On-link     192.168.1.150    281
===========================================================================
Static Routes:
  None

IPv6-Routingtable
===========================================================================
Active Routes:
 If Metric Target Network                   Gateway
  4    281 ::/0                             fe80::4244:b528:6295:8428
 63      0 ::/0                             2000:db8:bbbb:0:1000::1    <-----
 63      0 2000:db8:bbbb:0:1000::/80        On-link
  1    331 ::1/128                          On-link
  4    281 2000:db8:abcd::/64               On-link
  4    281 2000:db8:abcd::150/128           On-link
 63    256 2000:db8:bbbb:0:1000::4/128      On-link
  4    281 fe80::/64                        On-link
  4    281 fe80::fc41:14c7:8c5b:e566/128    On-link
  1    331 ff00::/8                         On-link
  4    281 ff00::/8                         On-link
===========================================================================
Static Routes:
  None



_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
