Return-Path: lazyvirus@gmx.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5fb3b09
 for <wireguard@lists.zx2c4.com>; Tue, 9 May 2017 22:22:30 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 230df191
 for <wireguard@lists.zx2c4.com>; Tue, 9 May 2017 22:22:29 +0000 (UTC)
Received: from msi.defcon1 ([93.15.31.113]) by mail.gmx.com (mrgmx001
 [212.227.17.184]) with ESMTPSA (Nemesis) id 0LqhmM-1dccU93I5i-00eKhw for
 <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 00:32:55 +0200
Date: Wed, 10 May 2017 00:32:54 +0200
From: Bzzzz <lazyvirus@gmx.com>
To: wireguard@lists.zx2c4.com
Subject: SSH stuck
Message-ID: <20170510003254.2f810c1d@msi.defcon1>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Debian jessie + backports - arch amd64
Kernel 4.9.18-1~bpo8+1
wireguard-dkms  0.0.20170421-wg1~zesty
wireguard-tools 0.0.20170421-wg1~zesty
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Hi list,

Setup:
LAN: 192.168.1.0/24
VPN: 10.11.12.0/24 (SRV: =E2=80=A61, CLI: =E2=80=A62)
(Client: AllowedIPs=3D0.0.0.0/0)

1- I solved the LAN being unreachable apart the endpoint and the internet
   being completely unreachable with an iptables rule:
   iptables -t nat -I POSTROUTING -s 10.11.12.0/24 -o eth0 -j MASQUERADE
   is this right? (if not, why?)

2- When I want to ssh any LAN machine, wireshark only sees 4 packets:
	client announce
	server ACK
	client key negociation
	server key negociation
   and that's all.
   Is it a limitation (non-TCP packets) or is there another reason for
   ssh not working as expected? (connecting to any machine http srv works
   perfectly)

Jean-Yves
