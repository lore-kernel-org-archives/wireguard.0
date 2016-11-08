Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e14f4fc
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:10:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a808aa6
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:10:45 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bcb5560f
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Nov 2016 16:10:44 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id c13so143240047lfg.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Nov 2016 08:12:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAHmME9o7F9xUpw6j2ggvyS3+3eiKAj-7KpjDhZsJ-H2dtsFEGw@mail.gmail.com>
References: <CAHmME9o7F9xUpw6j2ggvyS3+3eiKAj-7KpjDhZsJ-H2dtsFEGw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 8 Nov 2016 17:12:34 +0100
Message-ID: <CAHmME9q32NSjEnSq3WN8DeoPB5yF0AHKq7ZrcZOmT=+vVDm_sg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [WireGuard] WireGuard on OpenWRT: Success
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Not really knowing anything about OpenWRT configuration, this is what
I wound up with:

sed -i s/REJECT/DROP/g /etc/config/firewall

Then these sections are new or changed:

/etc/config/firewall:

config zone
        option name             wg
        list network            'demobox'
        option input            DROP
        option output           ACCEPT
        option forward          DROP
        option masq             1
        option mtu_fix          1

config forwarding
        option src              lan
        option dest             wg

/etc/config/network:

config interface 'wan'
        option ifname 'eth1'
        option proto 'dhcp'
        option defaultroute 0
        option customroutes '163.172.161.0/32'

config interface 'demobox'
        option proto 'wireguard'
        option private_key '...'
        option preshared_key '...'
        option addresses '.../32'

config wireguard_demobox
        option public_key '...'
        option allowed_ips '0.0.0.0/0'
        option route_allowed_ips 'enabled'
        option endpoint_host '163.172.161.0'
        option endpoint_port '...'
