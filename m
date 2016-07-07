Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3617d66c
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:18:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 181a7b7f
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:18:07 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f689538c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 7 Jul 2016 16:18:06 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id h129so14751525lfh.1
 for <wireguard@lists.zx2c4.com>; Thu, 07 Jul 2016 09:18:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANQAqMW6=tBgOL67UHkjt79xUUcRzx51weE3Lj+8RpX6MkEK+g@mail.gmail.com>
References: <CAHmME9rXYm3yV0j5pW3yH59j-C9S=6X8-6OY+b=dkuRq7Vpzvw@mail.gmail.com>
 <CANQAqMX8Bf9taS+VgRYnGwuOoJcG3PL8PNmyOK66O3pHjP6VBw@mail.gmail.com>
 <CAHmME9rRHgEtsJ8F-4UrzZMwOs43T24Jq+mUHO91-oimQXXjwg@mail.gmail.com>
 <CANQAqMV=QeCG9BPvPpaCAu56a+mNi_7sNvhDL=_i4N7WFY1=Ng@mail.gmail.com>
 <CAHmME9qr2H=4Qdzx9Kz4=op-O-yzum0+hJWvazHZ_K7ex05ncQ@mail.gmail.com>
 <CANQAqMVT1UkM3uNQbHUKKysHv-tix-Ds9+KaRw62HVHUK5XC+Q@mail.gmail.com>
 <CAHmME9rh8wCLV3jaqyDBm8ZDuVUC__XZOuzbX1haonO2C_ZCEQ@mail.gmail.com>
 <CANQAqMWY=8WRbz9+bw11oUO2OAi-SFnHv=f+z5jQ0F1MYf5Ruw@mail.gmail.com>
 <CAHmME9pFhJoW+kFmJE7-acmb2q4=EqN+U+dJQ8GDEvBzN_=dRg@mail.gmail.com>
 <CANQAqMX-1MrYW+Yfn6g7BGPwn2qCDWOCoMWkLyM5W9KZgm52tQ@mail.gmail.com>
 <20160706154834.GH2040@lud.polynome.dn42>
 <CANQAqMW6=tBgOL67UHkjt79xUUcRzx51weE3Lj+8RpX6MkEK+g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 7 Jul 2016 18:18:17 +0200
Message-ID: <CAHmME9oo1WJqt=RKxOWwko2nZ3o-BWooL3P9abcCV8hMENLZgQ@mail.gmail.com>
To: Norman Shulman <norman.shulman@n-dimension.com>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] WireGuard cryptokey routing
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Thu, Jul 7, 2016 at 6:15 PM, Norman Shulman
<norman.shulman@n-dimension.com> wrote:
> Look at it from the server side. There are millions of clients on millions
> of 192.168.1.0/24 networks, yet a server can communicate with no more than
> 254 of them.

Voila, this is where you are most certainly mistaken.

While a client might have 192.168.1.8 as their IP address for eth0,
their IP address for wg0 can be something completely different. Want a
million clients? Use a /20 as your wireguard device inner IP.

Anyway, why don't you tell us all what you actually want to do, rather
than these meandering theoretical questions? Then maybe we can help
you effectively.
