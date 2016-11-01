Return-Path: mail@danrl.com
Received: from mx.sealand.io (mx.sealand.io [193.160.39.68])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a5cb0a83
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2016 21:06:09 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: =?utf-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>
In-Reply-To: <CAHmME9pQT_3crtMRU6ziLXNRk4JEL4H3mj0bg1PACpvexfCwbA@mail.gmail.com>
Date: Tue, 1 Nov 2016 22:09:09 +0100
Message-Id: <575E2C0C-6038-4A8E-B471-55C8794097C0@danrl.com>
References: <25C77A0A-9EAB-4B87-AF85-D590F972F332@danrl.com>
 <CAHmME9p8bYDF9StPW8EHNXGEguK=Fomb9CE6yd9h0gZwWo=5pg@mail.gmail.com>
 <8D9A34EE-331B-4704-8558-DF83F0DCE7EE@danrl.com>
 <CAHmME9pQT_3crtMRU6ziLXNRk4JEL4H3mj0bg1PACpvexfCwbA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Wireguard on OpenWRT/LEDE (here: Luci)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Done!

> - if ! ip link show dev "${iface}" >/dev/null 2>&1; then
> -  ip link add dev "${iface}" type wireguard
> - else
> -  ip address flush dev "${iface}"
> -  ip route flush dev "${iface}"
> - fi
> + ip link del dev "${iface}" 2>/dev/null
> + ip link add dev "${iface}" type wireguard
