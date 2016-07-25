Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd5c6561
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 11:36:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb52638a
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 11:36:43 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6767f2d1
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jul 2016 11:36:43 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id f93so126565087lfi.2
 for <wireguard@lists.zx2c4.com>; Mon, 25 Jul 2016 04:39:07 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 25 Jul 2016 13:39:04 +0200
Message-ID: <CAHmME9p-ON8gXQhB4gwN79qfCW8yBendDGaXTzM7K5-PBm8Dmg@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] Jenkins?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Does anybody have a Jenkins instance that they'd like to run with
WireGuard? The general idea would be, for each commit made, these
tests are run:

$ src/tests/qemu.sh 4.1.28
$ src/tests/qemu.sh 4.2.8
$ src/tests/qemu.sh 4.3.6
$ src/tests/qemu.sh 4.4.15
$ src/tests/qemu.sh 4.5.7
$ src/tests/qemu.sh 4.6.4
$ src/tests/qemu.sh 4.7

And then adjusting these as new kernels are released. It's a bit
processor intensive, so the machine shouldn't be too weak.

If nobody volunteers, I'll wind up doing this myself anyway. But I
figured maybe there's somebody out there zealous about running
Jenkins.

Regards,
Jason
