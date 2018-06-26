Return-Path: maximilian.pudelko@tum.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fce21413
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:43:57 +0000 (UTC)
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de [129.187.255.137])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d16c2ba
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 07:43:57 +0000 (UTC)
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
 by postout1.mail.lrz.de (Postfix) with ESMTP id 41FJ8l2QhczyVZ
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 09:49:26 +0200 (CEST)
Received: from postout1.mail.lrz.de ([127.0.0.1])
 by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new,
 port 20024)
 with LMTP id NoyKpqUlx-0V for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jun 2018 09:49:26 +0200 (CEST)
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
 [209.85.214.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by postout1.mail.lrz.de (Postfix) with ESMTPSA id 41FJ8j6HdczyTq
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 09:49:25 +0200 (CEST)
Received: by mail-it0-f53.google.com with SMTP id l16-v6so202779ita.0
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jun 2018 00:49:25 -0700 (PDT)
MIME-Version: 1.0
From: Maximilian Pudelko <maximilian.pudelko@tum.de>
Date: Tue, 26 Jun 2018 09:49:03 +0200
Message-ID: <CAJ5iZ8_X4Wk1BeLxdkWYViZRN+biJ--AA2w9CojJcciW_RmrZw@mail.gmail.com>
Subject: Poor performance under high load
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

Hello WireGuard list,

as part of my research I (try to) evaluate the performance of
WireGuard and found a curious pattern under increasing load: Until
~0.55 Mpps WireGuard can keep up with encrypting and forwarding, but
after that the rate decreases while the CPU load keeps increasing
until all cores are 100% utilized and _no_ packets get send.

Is that expected behavior due to the unoptimized implementation that
uses a ring buffer with spinlocks? perf shows that a lot of time is
spend waiting for those locks.

Is there a simple way to get better performance? Multiple connections?

Measurement graph:
https://gist.github.com/pudelkoM/2f216e7eb820fc5dc898eaea119448e5

Test configuration for reference:

- WireGuard 0.0.20180531
- Point-to-point setup with 2 hosts
- Linux 4.4.0-78-generic
- Intel(R) Xeon(R) CPU E5-2620 v3 @ 2.40GHz
- 2x Intel XL710 NICs
- Traffic: 64 byte UDP packets, 1000 parallel flows by src port randomization


Regards
Max
