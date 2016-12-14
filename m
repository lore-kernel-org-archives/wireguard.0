Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 50a38ef3
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:01:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2e09d53
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:01:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 389c7356
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:01:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ae20f9b7
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 14 Dec 2016 21:01:07 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id t79so14518033wmt.0
 for <wireguard@lists.zx2c4.com>; Wed, 14 Dec 2016 13:07:26 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <B993D7DB-7B6A-40B1-8B53-4F27942A4BA0@danrl.com>
References: <584e92066303c9.06462330@wp.pl>
 <CAHmME9oKrtYQJ0i4arFg33+027L4e3ctQS=OdW_Vu0NCShThgQ@mail.gmail.com>
 <B993D7DB-7B6A-40B1-8B53-4F27942A4BA0@danrl.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 14 Dec 2016 22:07:24 +0100
Message-ID: <CAHmME9pJq2WR-YhFOEwCCkoKgOafkKoiAn_U_Abks-x8aAO1Kw@mail.gmail.com>
Subject: Re: [WireGuard] Wireguard in OpenWRT/LEDE: FYI: Pull Request
To: =?UTF-8?Q?Dan_L=C3=BCdtke?= <mail@danrl.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>
Content-Type: text/plain; charset=UTF-8
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

On Wed, Dec 14, 2016 at 8:48 PM, Dan L=C3=BCdtke <mail@danrl.com> wrote:
>
>> Not sure why the dependency is
>> hard coded like this; it shouldn't be.
>
> Even if it wasn't hardcoded, it would be introduced by +kmod-udptunnel6 a=
nyway.
>
> Remove both manually if you really need to throw away IP and want to comp=
ile legacyIP only. It should work with both, @IP6 and kmod-udptunnel6 remov=
ed.

kmod-udptunnel6 is only required if IPv6 is turned on.

At least in menuconfig, it's easy to describe conditional dependencies
like this one. Can the OpenWRT makefile thinger do it too? Baptiste?
