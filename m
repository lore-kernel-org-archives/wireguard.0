Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 331fcd5c
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:36:11 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23b2d021
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:36:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ff2b8ccd
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:36:11 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 80af5192
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Nov 2017 00:36:10 +0000 (UTC)
Received: by mail-ot0-f173.google.com with SMTP id u10so9157073otc.12
 for <wireguard@lists.zx2c4.com>; Mon, 20 Nov 2017 16:41:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <b68e7d6a-baba-630c-49f5-193899f05d38@gmail.com>
References: <b68e7d6a-baba-630c-49f5-193899f05d38@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 21 Nov 2017 01:41:04 +0100
Message-ID: <CAHmME9rA=kN7ZaTnco4XXAgDRa0bmE6uwM2MSO0qq1Dw=t3czw@mail.gmail.com>
Subject: Re: Gateway for Wireguard VPN
To: Germano Massullo <germano.massullo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If you want A and C to communicate through B as a trusted intermediary
for A and C's IPs, then your configs actually need to be:

=== Host A (Fedora 26) ===
# cat /etc/wireguard/wg0.conf
[Interface]
Address = 10.1.0.21/24
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
Endpoint = vpn.foo.xx:51820  # vpn.foo.xx is Host B
AllowedIPs = 10.1.0.2/32, 10.1.0.22/32


=== Host B (vpn.foo.xx) (CentOS 7) ===
ip forwarding active: net.ipv4.ip_forward = 1
# cat wg0.conf
[Interface]
Address = 10.1.0.2/24
ListenPort = 51820
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
AllowedIPs = 10.1.0.21/32

[Peer]
PublicKey = *censored*
AllowedIPs = 10.1.0.22/32


=== Host C (CentOS 7) ===

# cat wg0.conf
[Interface]
Address = 10.1.0.22/24
ListenPort = 51820
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
Endpoint = 192.168.1.1:51820
AllowedIPs = 10.1.0.2/32, 10.1.0.21/32


Alternatively, since you're likely going to be doing this for many
peers, you might be best off with this config instead:

=== Host A (Fedora 26) ===
# cat /etc/wireguard/wg0.conf
[Interface]
Address = 10.1.0.21/24
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
Endpoint = vpn.foo.xx:51820  # vpn.foo.xx is Host B
AllowedIPs = 10.1.0.0/24


=== Host B (vpn.foo.xx) (CentOS 7) ===
ip forwarding active: net.ipv4.ip_forward = 1
# cat wg0.conf
[Interface]
Address = 10.1.0.2/24
ListenPort = 51820
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
AllowedIPs = 10.1.0.21/32

[Peer]
PublicKey = *censored*
AllowedIPs = 10.1.0.22/32


=== Host C (CentOS 7) ===

# cat wg0.conf
[Interface]
Address = 10.1.0.22/24
ListenPort = 51820
PrivateKey = *censored*

[Peer]
PublicKey = *censored*
Endpoint = 192.168.1.1:51820
AllowedIPs = 10.1.0.0/24
