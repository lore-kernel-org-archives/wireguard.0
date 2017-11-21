Return-Path: germano.massullo@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc35423e
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:05:01 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ae2d909
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:05:01 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z75so8354424wrc.5
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 16:09:56 -0800 (PST)
Return-Path: <germano.massullo@gmail.com>
Received: from [192.168.1.100]
 (host179-8-dynamic.56-79-r.retail.telecomitalia.it. [79.56.8.179])
 by smtp.googlemail.com with ESMTPSA id 186sm11325481wmm.47.2017.11.20.16.09.54
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Nov 2017 16:09:55 -0800 (PST)
From: Germano Massullo <germano.massullo@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Gateway for Wireguard VPN
Message-ID: <b68e7d6a-baba-630c-49f5-193899f05d38@gmail.com>
Date: Tue, 21 Nov 2017 01:09:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I am experiencing some troubles in configuring Wireguard to communicate t=
o an host that is behind a NAT. Here my use case:

Host A: my computer under ISP NAT
Host B server with public static IP address, that is also a gatway for a =
"natted" LAN,
Host C: machine running on such LAN

I do want to allow host A to communicate with C, but I cannot manage to d=
o that. It can only ping host B
I attach some config files, if you have an idea, please let me know.
Thank you for your time

=3D=3D=3D Host A (Fedora 26) =3D=3D=3D
# cat /etc/wireguard/wg0.conf=20
[Interface]
Address =3D 10.1.0.21/24
PrivateKey =3D *censored*

[Peer]
PublicKey =3D *censored*
Endpoint =3D vpn.foo.xx:51820  # vpn.foo.xx is Host B
AllowedIPs =3D 10.1.0.2/32

[Peer]
PublicKey =3D *censored*   # host C
Endpoint =3D vpn.foo.xx:51820
AllowedIPs =3D 10.1.0.22/32


=3D=3D=3D Host B (vpn.foo.xx) (CentOS 7) =3D=3D=3D
ip forwarding active: net.ipv4.ip_forward =3D 1
# cat wg0.conf=20
[Interface]
Address =3D 10.1.0.2/24
ListenPort =3D 51820
PrivateKey =3D *censored*

[Peer]
PublicKey =3D *censored*
AllowedIPs =3D 10.1.0.21/32

[Peer]
PublicKey =3D *censored*
AllowedIPs =3D 10.1.0.22/32


=3D=3D=3D Host C (CentOS 7) =3D=3D=3D

# cat wg0.conf=20
[Interface]
Address =3D 10.1.0.22/24
ListenPort =3D 51820
PrivateKey =3D *censored*

[Peer]
PublicKey =3D *censored*
Endpoint =3D 192.168.1.1:51820
AllowedIPs =3D 10.1.0.2/32

[Peer]
PublicKey =3D *censored*
AllowedIPs =3D 10.1.0.21/32
