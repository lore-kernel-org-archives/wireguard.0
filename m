Return-Path: lists@lonnie.abelbeck.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 147ed13d
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:53:39 +0000 (UTC)
Received: from ibughas.pair.com (ibughas.pair.com [209.68.5.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 621cdf95
 for <wireguard@lists.zx2c4.com>; Fri, 8 Dec 2017 18:53:39 +0000 (UTC)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
Subject: Re: [patch] add support for peer names using a file in userspace
From: Lonnie Abelbeck <lists@lonnie.abelbeck.com>
In-Reply-To: <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
Date: Fri, 8 Dec 2017 13:00:47 -0600
Message-Id: <BC9DA88D-CB32-434E-AF02-74A862405A5D@lonnie.abelbeck.com>
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
 <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


On Dec 8, 2017, at 12:45 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

>=20
>> 3) Make "wg show" display either "peer: orQ..." or =
"peer-some_custom_name: orQ..."
>>=20
>> 4) Any spaces in the "some_custom_name" text are ignored and =
truncated to 64 characters.
>=20
> Yikes. I'm inclined to make Description or the like follow whatever
> other plaintext rules the netfilter comment stuff has, not something
> restrictive like "no spaces".

I suggested "no spaces"  since currently all spaces are stripped in =
config_read_line()

https://git.zx2c4.com/WireGuard/tree/src/tools/config.c#n434

Lonnie
