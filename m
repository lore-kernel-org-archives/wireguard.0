Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9792C3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:13 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28852080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:51:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Gtp1Ee97"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F28852080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04d801b1;
	Sun, 25 Aug 2019 15:42:40 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41650481
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jul 2019 15:48:31 +0000 (UTC)
Received: from mail-40135.protonmail.ch (mail-40135.protonmail.ch
 [185.70.40.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93b375d8
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Jul 2019 15:48:30 +0000 (UTC)
Date: Wed, 24 Jul 2019 15:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1563983309;
 bh=+VewfvvWvGtdml/T+xw/xMBXPUGAGg3lcKBz+0+XpUk=;
 h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
 b=Gtp1Ee97dT2IHAUt9Zxq2fzfkyxHI1TlhZQ8cTPcoRz5/5GPnEHCRj4lcCc//NDIs
 56f13GOdiurZEcgKwOInRAvNQJ3D6aSG7Cnk4RVE0TcQj1+BoCSGGLJr34tB3jwMVL
 Shbtlf7kLxaIRTTyzheKS+YlGi7gESR/w6xSGu40=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: randomusername42 <randomusername42@protonmail.com>
Subject: Possible routing issue on CentOS 7
Message-ID: <5xWfbnuaK6LpcwdbMam1r-GRRcbYyhgLXZpBsiwHUPQH5BK1Y0-5fagahW9vHTKBWf5rNPqv7r-qH3VbIFW8d9CwN14IGT4xkEFvVvMtyj0=@protonmail.com>
Feedback-ID: 5uL404zcKvywoRUwjwE-MJbOa4zh_P2t_D7KfkX-WmBZmazXeOKDSAeDpOr7xnYSHQ70OmAHwC-JSxVvFusHIg==:Ext:ProtonMail
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:42:38 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: randomusername42 <randomusername42@protonmail.com>
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

Hello,

I am trying to setup a server/client configuration wherein the client
sends ALL network traffic to and through the Wireguard server. I have
a setup a CentOS 7 server, a CentOS 7 client, and a Debian 9 client. The
CentOS systems are using wireguard 1:0.0.20190702-1.fc30 from copr. The
Debian system is using wiregard 0.0.20190227-1 from 'sid (unstable)'.

The CentOS server is operational and has the following config:
----------
[Interface]
Address = 10.0.0.1/24
PostUp = iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
ListenPort = 51820
PrivateKey = XX

[Peer]
PublicKey = XX
AllowedIPs = 10.0.0.2/32

[Peer]
PublicKey = XX
AllowedIPs = 10.0.0.3/32

----------

The Debian client is operational and has the following config:
----------
[Interface]
PrivateKey = XX
Address = 10.0.0.2/24
DNS = 1.1.1.1
PostUp = ip route flush cache
PostDown = ip route flush cache

[Peer]
PublicKey = XX
Endpoint = XX:51820
AllowedIPs = 0.0.0.0/0
-----------

Debian client routes (with WG interface active):
-----------
Kernel IP routing table
Destination     Gateway         Genmask       Flags Metric Ref Use Iface
default         192.168.X.1     0.0.0.0         UG   1024   0   0 eth0
10.0.0.0        0.0.0.0         255.255.255.0   U    0      0   0 client
192.168.X.0     0.0.0.0         255.255.255.0   U    0      0   0 eth0
----------

CentOS client IS NOT routing traffic over the tunnel. Config:
-----------
[Interface]
PrivateKey = XX
Address = 10.0.0.3/24
DNS = 1.1.1.1
PostUp = ip route flush cache
PostDown = ip route flush cache

[Peer]
PublicKey = XX
Endpoint = XX:51820
AllowedIPs = 0.0.0.0/0
------------

CentOS client routes (with WG interface active):
------------
Kernel IP routing table
Destination     Gateway         Genmask       Flags Metric Ref Use Iface
0.0.0.0         192.168.X.1     0.0.0.0        UG   0      0   0 eth0
10.0.0.0        0.0.0.0         255.255.255.0   U    0      0   0 client
192.168.X.0     0.0.0.0         255.255.255.0   U    0      0   0 eth0
-------

In this setup, the Debian client sends all traffic over the tunnel.
I can verify this via watching TCPDUMP, and checking the public IP with
'curl -s checkip.dyndns.com', which returns the ENDPOINT (CentOS 7)
Wireguard server Public IP address.

The CentOS 7 CLIENT, does NOT send all the traffic over this established
tunnel. The WG interface comes up and shows data transferred. I can ping
the endpoint wireguard server via the 10.0.0.1. I can ping the 10.0.0.3
client, from the server. When I run 'curl -s checkip.dyndns.com' on the
CentOS 7 client, I am returned my local Public IP, not the VPN endpoint
Public IP.

I do use the wg-quick utility on all systems to manage the interface.
The CentOS 7 version has a few differences, but nothing that should
cause this anomaly to occur.

Why does the CentOS 7 client NOT route traffic over the tunnel as
expected? How is the same configuration working as expected to tunnel
traffic on the Debian system? Where can I find more information to
explain and fix this issue?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
