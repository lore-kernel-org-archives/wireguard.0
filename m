Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26345a9a
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:50:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93513a3c
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:50:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id abbf737c
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 15 Jul 2016 11:50:09 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id l69so29708246lfg.1
 for <wireguard@lists.zx2c4.com>; Fri, 15 Jul 2016 04:51:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANQAqMX0ywXN0vTxmeZXLYL7kuB0By-18yN9Kj4=_sHGRuSooA@mail.gmail.com>
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
 <CAHmME9oo1WJqt=RKxOWwko2nZ3o-BWooL3P9abcCV8hMENLZgQ@mail.gmail.com>
 <CANQAqMX0ywXN0vTxmeZXLYL7kuB0By-18yN9Kj4=_sHGRuSooA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 15 Jul 2016 13:51:17 +0200
Message-ID: <CAHmME9py-ZGquBVCRckCJfy0gQLD1hNGx9fqQ57XGJSHu8Ns5Q@mail.gmail.com>
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

On Thu, Jul 14, 2016 at 11:16 PM, Norman Shulman
<norman.shulman@n-dimension.com> wrote:
> Sorry if this sounds too theoretical. I'm just trying to understand the
> cryptokey routing well enough to determine if it's suitable for our use. The
> main problem I have is understanding how you can base routing on
> non-routable addresses, which are not unique.

I don't think it's productive for either of us for me to continue
answering questions posed in this form. How about instead you write
down an example network layout ("Subnet A is 10.2.3.0/24, Subnet B
is...") and then present a problem you'd like to solve with WireGuard
but are having trouble figuring out how.
