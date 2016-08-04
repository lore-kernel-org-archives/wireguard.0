Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eab72d3d
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 14:49:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85125f8a
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 14:49:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8e811fd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 14:49:35 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id l69so183673870lfg.1
 for <wireguard@lists.zx2c4.com>; Thu, 04 Aug 2016 07:53:15 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 4 Aug 2016 16:53:13 +0200
Message-ID: <CAHmME9qm6U4hWXe=+tkRrDi7+=L=yGkCoWGm_mhfKnDsWPna2w@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] Continuous Integration Server
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi guys,

Alex Xu and I have been working on polishing the testing
infrastructure. You can now type `make test-qemu` to have a minimal
kernel built, an initramfs forged, and qemu booted with the
ever-growing test suite. On my 4 year-old laptop, it takes roughly two
minutes to compile the kernel, the initramfs, boot qemu, and run the
tests. You can watch it in action here:
https://data.zx2c4.com/wireguard-qemu-test.mp4

I've now put this test suite on a server, running it for every commit,
on 7 different kernels, 4.1-4.7:

    http://build-status.wireguard.io/

It's pretty bare-bones, at the minute. It simply runs this crufty
shell script from a cronjob: http://build-status.wireguard.io/ci.sh

However, on the continuous integration server, it takes closer to an
hour, because it's running on totally ancient hardware that's shared
by several other VMs. This is quite unfortunate, but I don't have
other hardware laying around for it.

If you feel like downloading that `ci.sh` script above, putting it in
a `* * * * *` cronjob, and pointing a webserver to the `builds/`
directory, I'd be happy to point the "builds-status" sub-domain to
your faster hardware. Alternatively, if you don't want to use `ci.sh`,
but would rather put together something even nicer with Jenkins or
Buildbot, I'd be quite happy about that too and would re-point the
sub-domain.

Thanks,
Jason
