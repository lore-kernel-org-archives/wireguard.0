Return-Path: irish@insaneirish.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 495851ed
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:34:58 +0000 (UTC)
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
 [209.85.192.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4402ec4
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Apr 2018 18:34:58 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id a2so9499811pff.8
 for <wireguard@lists.zx2c4.com>; Sun, 15 Apr 2018 11:49:24 -0700 (PDT)
MIME-Version: 1.0
From: "Patrick O'Sullivan" <irish@insaneirish.com>
Date: Sun, 15 Apr 2018 14:49:23 -0400
Message-ID: <CA+bb15uz7jkD2GZhSQANkH9JPi5Sq2g20wrm0avTRFiOMJ55iA@mail.gmail.com>
Subject: Why does 'allowed-ips' affect route selection behavior?
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Folks,

Getting my feet wet with wireguard and enjoying the simplicity and
performance thus far. Nonetheless, I have a question about how the
normal route selection process is being affected by what's configured
for 'allowed-ips'.

I set up a peer and configured 'allowed-ips' for 0.0.0.0/0, as I was
going to be sending multiple routes over the peer link via BGP and
didn't want to keep modifying it. However, even though my default
route was over a different interface, this seemed to result in Linux
trying to route default traffic over wg0 despite there not being a
default route pointing to wg0.

Specifically:

$ sudo ip route show
default via 10.199.199.1 dev wlan0
10.111.111.0/24 dev wg0 proto kernel scope link src 10.111.111.100
10.199.199.0/24 dev wlan0 proto kernel scope link src 10.199.199.131

By this route table, traffic to e.g. 4.2.2.1 should use 10.199.199.1.
Packet captures were showing traffic trying to instead use wg0. Then I
found this:

$ sudo ip route get 4.2.2.1
4.2.2.1 dev wg0 table 51820 src 10.111.111.100
    cache

Can someone please explain this behavior?

Obligatory... $ uname -rvm
4.14.30-v7+ #1102 SMP Mon Mar 26 16:45:49 BST 2018 armv7l

And... $ dpkg -l | grep wireguard
ii  wireguard                       0.0.20180413-1               all
       fast, modern, secure kernel VPN tunnel (metapackage)
ii  wireguard-dkms                  0.0.20180413-1               all
       fast, modern, secure kernel VPN tunnel (DKMS version)
ii  wireguard-tools                 0.0.20180413-1               armhf
       fast, modern, secure kernel VPN tunnel (userland utilities)
