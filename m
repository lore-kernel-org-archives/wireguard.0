Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdd1b692
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 12:23:26 +0000 (UTC)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com
 [74.125.82.176])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 722f91f1
 for <wireguard@lists.zx2c4.com>;
 Tue, 13 Jun 2017 12:23:26 +0000 (UTC)
Received: by mail-ot0-f176.google.com with SMTP id t31so86740017ota.1
 for <wireguard@lists.zx2c4.com>; Tue, 13 Jun 2017 05:38:11 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Tue, 13 Jun 2017 14:38:09 +0200
Message-ID: <CADdae-jBtz7zfMRPkS3c2n_zG+LCuN_0iUZHCSM=H8dWdDBUUw@mail.gmail.com>
Subject: multiple wireguard interface and kworker ressources
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hello,
for i in `seq 1 1000` ; do ip link add dev wg${i} type wireguard ; done
=> kernel thread kworker  is 50% cpu time   , with 5000 interface ,
100% cpu time

for i in `seq 1 1000` ; do ip link add dev ifb${i} type ifb ; done
          ( ifb or dummy .. )
=> kernel thread kworker is < 1%

Is it normal behavior ?
 Version : WireGuard 0.0.20170409
  kernel : 4.9.23

Regards,
Nicolas Prochazka
