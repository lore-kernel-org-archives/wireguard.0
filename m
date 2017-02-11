Return-Path: dave.taht@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ce97efd
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 15:54:45 +0000 (UTC)
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
 [209.85.220.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3875c25
 for <wireguard@lists.zx2c4.com>;
 Sat, 11 Feb 2017 15:54:45 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id s186so65283655qkb.1
 for <wireguard@lists.zx2c4.com>; Sat, 11 Feb 2017 08:08:36 -0800 (PST)
MIME-Version: 1.0
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 11 Feb 2017 08:08:35 -0800
Message-ID: <CAA93jw5eSCUvTzF1Xk15b1ZG=CnsoM3TEXeSeE=9gW-TowfQjw@mail.gmail.com>
Subject: udp auth/encryption in userspace
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

I am curious if any pre-existing code exists for using wireguard like
methods over udp in userspace? Most of the examples for libsodium, etc
are all tcp based. A daemon I'm trying to spec need to run at early
boot (where the clock is wrong and might be slewed forward at any
time), and can't hang. Bonus points if the libs required are small...

(It would be kind of neat if there was a way to push all the needed
crypto into kernelspace and just hand the daemon the decoded packet)

--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
