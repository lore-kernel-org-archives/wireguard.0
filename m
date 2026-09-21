Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE31C982ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2026 22:29:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6eb8ccd4;
	Mon, 21 Sep 2026 22:29:45 +0000 (UTC)
Received: from cross.elm.relay.mailchannels.net
 (cross.elm.relay.mailchannels.net [23.83.212.46])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 3ae1d754
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2026 22:29:38 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 26EE540147A;
 Mon, 21 Sep 2026 22:29:35 +0000 (UTC)
Received: from cpanel-007-fra.hostingww.com
 (100-100-245-87.trex-nlb.outbound.svc.cluster.local [100.100.245.87])
 (Authenticated sender: instrampxe0y3a)
 by relay.mailchannels.net (Postfix) with ESMTPA id 642564020F7
 for <wireguard@lists.zx2c4.com>; Mon, 21 Sep 2026 22:29:30 +0000 (UTC)
X-Sender-Id: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: instrampxe0y3a|x-authuser|calestyo@scientia.org
X-MailChannels-Auth-Id: instrampxe0y3a
X-Share-Whispering: 4e3b339f5e35da49_1790029774934_158542460
X-MC-Loop-Signature: 1790029774934:3726599572
X-MC-Ingress-Time: 1790029774934
Received: from cpanel-007-fra.hostingww.com (cpanel-007-fra.hostingww.com
 [3.69.87.180]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.100.245.87 (trex/8.0.2); Mon, 21 Sep 2026 22:29:34 +0000
Received: from p5090fc37.dip0.t-ipconnect.de ([80.144.252.55]:61011
 helo=heisenberg.fritz.box)
 by cpanel-007-fra.hostingww.com with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.100)
 (envelope-from <calestyo@scientia.org>) id 1x8mVt-00000006Fpk-0R2u
 for wireguard@lists.zx2c4.com; Mon, 21 Sep 2026 22:29:28 +0000
Message-ID: <a3bedeb141086893ad0b4d4cc418e9ca2585cbfb.camel@scientia.org>
Subject: bug: wg-quick fails to set up working connection
From: Christoph Anton Mitterer <calestyo@scientia.org>
To: wireguard@lists.zx2c4.com
Date: Tue, 22 Sep 2026 00:29:27 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
X-AuthUser: calestyo@scientia.org
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey.


When taking a config provided for example via eduVPN:
[Interface]
PrivateKey =3D ***
MTU =3D 1320
Address =3D 10.153.38.15/24,2001:4ca0:4fff:2:3::f/96
DNS =3D
10.156.33.53,129.187.5.1,2001:4ca0::53:1,2001:4ca0::53:2,lmu.de,uni-
muenchen.de,mwn.de

[Peer]
PublicKey =3D ***
PresharedKey =3D ***
AllowedIPs =3D
10.0.0.0/8,85.208.24.0/22,129.187.0.0/16,131.159.0.0/16,132.199.106.6/3
1,138.244.0.0/15,138.246.0.0/16,141.39.128.0/18,141.39.240.0/20,141.40.
0.0/16,141.84.0.0/16,172.16.0.0/12,192.54.42.0/24,192.55.197.0/24,192.6
8.211.0/24,192.68.212.0/24,192.168.0.0/16,193.174.96.0/23,194.94.155.22
4/28,2001:4ca0::/29,2a09:80c0::/29
Endpoint =3D eduvpn-n13.srv.lrz.de:51820



starting it via:
# wg-quick up ./wg.conf
[#] ip link add dev wg type wireguard
[#] wg addconf wg /dev/fd/63
[#] ip -4 address add 10.153.38.15/24 dev wg
[#] ip -6 address add 2001:4ca0:4fff:2:3::f/96 dev wg
[#] ip link set mtu 1320 up dev wg
[#] resolvconf -a tun.wg -m 0 -x
[#] ip -4 route add 132.199.106.6/31 dev wg
[#] ip -6 route add 2a09:80c0::/29 dev wg
[#] ip -6 route add 2001:4ca0::/29 dev wg
[#] ip -4 route add 194.94.155.224/28 dev wg
[#] ip -4 route add 192.68.212.0/24 dev wg
[#] ip -4 route add 192.68.211.0/24 dev wg
[#] ip -4 route add 192.55.197.0/24 dev wg
[#] ip -4 route add 192.54.42.0/24 dev wg
[#] ip -4 route add 193.174.96.0/23 dev wg
[#] ip -4 route add 85.208.24.0/22 dev wg
[#] ip -4 route add 141.39.240.0/20 dev wg
[#] ip -4 route add 141.39.128.0/18 dev wg
[#] ip -4 route add 192.168.0.0/16 dev wg
[#] ip -4 route add 141.84.0.0/16 dev wg
[#] ip -4 route add 141.40.0.0/16 dev wg
[#] ip -4 route add 138.246.0.0/16 dev wg
[#] ip -4 route add 131.159.0.0/16 dev wg
[#] ip -4 route add 129.187.0.0/16 dev wg
[#] ip -4 route add 138.244.0.0/15 dev wg
[#] ip -4 route add 172.16.0.0/12 dev wg
[#] ip -4 route add 10.0.0.0/8 dev wg

leads to a dead connection.

The reason apparently being often the endpoint named in provided WG
configs is part of the AllowedIPs and thus nothing actually goes
through.

eduvpn-n13.srv.lrz.de.	273	IN	A	129.187.7.162
eduvpn-n13.srv.lrz.de.	273	IN	AAAA	2001:4ca0:0:123::81bb:7a2

If I  manually subtract the two endpoint IPs from the AllowedIPs, the
very same config gives a working connection.


Given that the Endpoints are allowed to use hostnames and thus things
like round robin DNS, it doesn't feel as if the configs should be
provided already excluding the (current) endpoint IP, but rather that
it should be wg-quick who does this somehow.


Cheers,
Chris.
