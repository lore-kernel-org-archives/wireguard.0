Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3c0265a
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Aug 2016 11:56:24 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 902419ad
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Aug 2016 11:56:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id df9e659c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Aug 2016 11:56:23 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id b199so99219594lfe.0
 for <wireguard@lists.zx2c4.com>; Tue, 23 Aug 2016 05:02:24 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 23 Aug 2016 14:02:22 +0200
Message-ID: <CAHmME9oj_YLqFV=2O5iVRL5=HtGQMPs+aaO5+4aXM27eCUtWSA@mail.gmail.com>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Cc: Eric Sagnes <eric.sagnes@gmail.com>
Subject: [WireGuard] NixOS WireGuard Integration
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey folks,

Eric, CC'd, is working on getting WireGuard integrated into the NixOS
declarative configuration. He's making a configuration module, which
is currently a work in progress here [1]. I did an initial read
through and left several comments within the source.

One important issue that's come up is -- what's the best way to use
systemd for this? I know there are some folks on this list who have
lots of ideas in this department, so I'd encourage you to chime in on
[1] if you're interested in steering the direction of the NixOS
integration.

Regards,
Jason



[1] https://github.com/NixOS/nixpkgs/pull/17933
