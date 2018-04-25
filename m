Return-Path: smntov@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8d0c3ee0
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 08:59:49 +0000 (UTC)
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b20c2b3
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Apr 2018 08:59:49 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id o78so5420817wmg.0
 for <wireguard@lists.zx2c4.com>; Wed, 25 Apr 2018 02:00:39 -0700 (PDT)
Return-Path: <smntov@gmail.com>
Message-ID: <1524646833.21032.97.camel@gmail.com>
Subject: Remote Debian installation assistance for newbies using WireGuard VPN
From: ST <smntov@gmail.com>
To: debian-boot@lists.debian.org, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Wed, 25 Apr 2018 12:00:33 +0300
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

Hello Debian Install System Team,

there used to be Linux install parties - a very cool event in itself and
a way to bring new users into community. However it is not so easy to
organize and it is somewhat limiting in time and space.

Several weeks ago I learned about the kernel-space VPN - WireGuard [1]
and was so positively shocked by the ease of it's configuration/use [2]
so that I don't stop to think how it can be effectively utilized.

Today I was thinking whether it would be possible to use this technology
to enable an experienced Linux user to help a fellow newbie to install
Debian on his Windows box?...

The idea is to add an "Remote assistance mode" into win32-loader. Once
toggled - it will preseed and run Debian Installer (after reboot)
without any interaction until it:
1. creates a WG interface,
2. obtains an IP from a (not yet extent) Debian WireGuard VPN server [3]
(the assisting Linux profi also should be part of this VPN so he can SSH
to the newbie through NAT).
3. runs SSH server listening on that IP.
4. generates a short random password for the root user and displays it
together with its IP from step #2 on the monitor of the newbie. This
information (IP and root's password) are communicated by newbie to his
Linux profi friend by phone/sms/etc..

>From this point on the Linux profi can SSH to the box and continue the
installation process in text mode.

Is something like this possible?

Thank you!

[1]: https://www.wireguard.com/
[2]:
https://linode.com/docs/networking/vpn/set-up-wireguard-vpn-on-ubuntu/
[3]: here is a short demo of how it could be done:
https://git.zx2c4.com/WireGuard/tree/contrib/examples/ncat-client-server
