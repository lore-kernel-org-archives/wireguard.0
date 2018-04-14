Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 707f133c
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:51:59 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ef259c1
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:51:59 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b584ede
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:43:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c6d1eb7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 01:43:07 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id m22-v6so11849231otf.8
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 19:06:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+Hw3eZewB594vvxXOgYLKgZRGT-CNPHJvtgfgXQhH_Bj-ussg@mail.gmail.com>
References: <CA+Hw3eZewB594vvxXOgYLKgZRGT-CNPHJvtgfgXQhH_Bj-ussg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 04:06:11 +0200
Message-ID: <CAHmME9pYzb8M8379twgRNVU2gsZOWuwvBuBe2G1rorvekVzX_w@mail.gmail.com>
Subject: Re: Wireguard behind NAT
To: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

If you can have SIDE_A connect to SIDE_B and enable
persistent-keepalive, that should take care of things mostly. If you
can't do that for whatever reason, there are hole punching tricks like
[1] and [2].

[1] https://git.zx2c4.com/WireGuard/tree/contrib/examples/nat-hole-punching
[2] https://github.com/manuels/wireguard-p2p
