Return-Path: mail@danrl.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad7ba81e
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 19:38:38 +0000 (UTC)
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a447b82
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 19:38:37 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9oKrtYQJ0i4arFg33+027L4e3ctQS=OdW_Vu0NCShThgQ@mail.gmail.com>
Date: Wed, 14 Dec 2016 20:48:22 +0100
Message-Id: <B993D7DB-7B6A-40B1-8B53-4F27942A4BA0@danrl.com>
References: <584e92066303c9.06462330@wp.pl>
 <CAHmME9oKrtYQJ0i4arFg33+027L4e3ctQS=OdW_Vu0NCShThgQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Michal Kowalski <kofec@wp.pl>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> Not sure why the dependency is
> hard coded like this; it shouldn't be.

Even if it wasn't hardcoded, it would be introduced by +kmod-udptunnel6 =
anyway.

Remove both manually if you really need to throw away IP and want to =
compile legacyIP only. It should work with both, @IP6 and =
kmod-udptunnel6 removed.=20=
