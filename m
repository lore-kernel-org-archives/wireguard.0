Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f90874e7
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Mar 2018 18:15:28 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7f57e9ec
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Mar 2018 18:15:28 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id h76so17790445wme.4
 for <wireguard@lists.zx2c4.com>; Thu, 22 Mar 2018 11:26:52 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Received: from debox ([37.26.147.170])
 by smtp.gmail.com with ESMTPSA id g4sm10236662wrd.1.2018.03.22.11.26.50
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Mar 2018 11:26:51 -0700 (PDT)
Message-ID: <1521743208.1840.55.camel@gmail.com>
Subject: link disappears
From: ST <smntov@gmail.com>
To: wireguard@lists.zx2c4.com
Date: Thu, 22 Mar 2018 20:26:48 +0200
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

I'm new to networking in general and VPN in particular but need to setup
infrastructure to be able to SSH easily to several people who are behind
routers (NAT). After reading that WireGuard is super simple - I decided
to give it try.

It indeed turned out to be simple till now. I setup a Debian virtual
server with a public IP and configure it as follows:

Server:

# wg
interface: wg0
  public key: QMwhCacViCKcTrkevg5NxLnTEJDU1bTNgQp43rp7BHM=
  private key: (hidden)
  listening port: 12000

peer: hiUdjmCK+iZf8wGEB+rYxMYYBF8QoOsm3nkF3asllRY=
  endpoint: 37.X.Y.Z:4488
  allowed ips: 10.8.8.9/32
  latest handshake: 17 minutes, 50 seconds ago
  transfer: 30.94 KiB received, 22.03 KiB sent


Node behind NAT:
# wg
interface: wg0
  public key: hiUdjmCK+iZf8wGEB+rYxMYYBF8QoOsm3nkF3asllRY=
  private key: (hidden)
  listening port: 12000

peer: QMwhCacViCKcTrkevg5NxLnTEJDU1bTNgQp43rp7BHM=
  endpoint: 195.A.B.C:12000
  allowed ips: 10.0.0.0/8
  latest handshake: 19 minutes, 11 seconds ago
  transfer: 20.70 KiB received, 35.57 KiB sent
  persistent keepalive: every 25 seconds

Is everything OK here?... At the beginning everything worked as expected
- I could ping/SSH in both directions via the private 10.8.8.8 and
10.8.8.9 addresses. Later I put my desktop into "hibernate mode" and
after turning it on again could no longer use the link...

I tried to "ip link set wg0 down" and then "... up" - handshake time
gets reseted, but I do not get the link back, "ip a" shows:

6: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state
UNKNOWN group default 
    link/none 

How can I revive this link, once the wg0 interface is already
configured?

(I have docker and virtualbox running on the desktop, each have its
network interface... could they interfere with wg0?)

Thank you in advance!
