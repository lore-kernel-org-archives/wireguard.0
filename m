Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7658c46b
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 14:07:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b62249ab
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 14:07:39 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4e50e45a
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 14:07:39 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id f6so135551484lfg.0
 for <wireguard@lists.zx2c4.com>; Tue, 05 Jul 2016 07:11:05 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 5 Jul 2016 16:11:02 +0200
Message-ID: <CAHmME9rOkXFBv1PErJ6MTWTTn2M=Tq3t0VLq925SZXK9voBFiQ@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Subject: [WireGuard] contrib examples
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi guys,

I've started compiling various example scripts of `wg(8)` usage in
contrib/examples [1]. The ncat-client-server [2] one is the insecure
script folks are currently using for testing their install with demo
dot wireguard dot io. The systemd one [3] is the hairy
wgserver.service test unit file. And now I've just added one for
synergy over wireguard [4], the keyboard/mouse sharing utility that's
too scary of a project not to isolate to a wireguard tunnel.

If anyone else comes up with various examples and easy use cases, I'd
be happy to add a script or twenty to contrib/examples. Each of the
current scripts has a descriptive README.

Jason

[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples
[2] https://git.zx2c4.com/WireGuard/tree/contrib/examples/ncat-client-server
[3] https://git.zx2c4.com/WireGuard/tree/contrib/examples/systemd
[4] https://git.zx2c4.com/WireGuard/tree/contrib/examples/synergy
