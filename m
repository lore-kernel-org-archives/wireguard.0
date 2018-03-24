Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 888d920a
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Mar 2018 19:21:12 +0000 (UTC)
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
 [209.85.128.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27e399a5
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Mar 2018 19:21:12 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o8so15155635wra.1
 for <wireguard@lists.zx2c4.com>; Sat, 24 Mar 2018 12:32:51 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.218])
 by smtp.gmail.com with ESMTPSA id i66sm16731899wmd.0.2018.03.24.12.32.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Mar 2018 12:32:50 -0700 (PDT)
Message-ID: <1521919967.1921.32.camel@gmail.com>
Subject: add/remove a peer
From: ST <smntov@gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat, 24 Mar 2018 22:32:47 +0300
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,

I'm learning WireGuard and have a question regarding adding/removing a
peer.

Is there something like:

1) wg add peer ABCDEF... allowed-ips 192.168.88.0/24 endpoint
209.202.254.14:8172

and by default, if some(/all) values are not provided - WG will generate
them on its own. E.g. if IP is not provided - it will scan all known IPs
and choose a new one (with /32) from the range that was mentioned with
`ip address add dev wg0` command. This way system administrator doesn't
have to choose IPs manually for new clients (doing so manually is
boring, time consuming and error prone). The same for the keys: the
server will generate the pair of keys - the public (together with the
new IP) keep for itself to set a new peer/client. And the private key
together with 0.0.0.0/0 (or the range mentioned with `ip address add dev
wg0` command) print as output to be used for setting up a new client.

So adding a new client on server could look like this:

wg add peer persistent-keepalive 25  endpoint vpn0.example.org:22000 >
wg0.conf

Where wg0.conf will look like:

[Interface]
PrivateKey = ui4AN....AbhwcvHWo=
ListenPort = 22000

[Peer]
PublicKey = ViCKc...gQp43rp7BHM=
AllowedIPs = 10.0.0.0/8
Endpoint = vpn0.example.org:22000
PersistentKeepalive = 25

wg0.conf can now be encrypted, let's say with PGP and sent to the new
client to be placed under /etc/wireguard/wg0.conf. Super easy even for
not so tech-savvy folks...

2) similar for removing clients:

wg rm peer ABCDEF...
or
wg rm peer allowed-ips 192.168.88.4/32

Is this implemented already or should I file it as a feature request
somewhere? (if so - where?)

Thank you!
