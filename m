Return-Path: tcondeixa@veniamworks.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id baff66df
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:31:37 +0000 (UTC)
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
 [209.85.128.175])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 391b97c3
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 Jun 2017 17:31:37 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id r103so75358282wrb.0
 for <wireguard@lists.zx2c4.com>; Fri, 23 Jun 2017 10:47:39 -0700 (PDT)
Return-Path: <tcondeixa@veniamworks.com>
References: <EE8741B3-9787-4522-98B9-D484C4BE7A8E@veniamworks.com>
 <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
Mime-Version: 1.0 (1.0)
In-Reply-To: <CAHmME9rwLqT6Ph_LxYMQLaZw-=f-LTxf7ScnqJ6jbDD+BqN87w@mail.gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Message-Id: <48D760AA-BFB5-4A3E-B8C8-81E49A65BC5A@veniamworks.com>
From: Tiago Condeixa <tcondeixa@veniamworks.com>
Subject: Re: Wireguard multihomed roaming performance
Date: Fri, 23 Jun 2017 18:47:34 +0100
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

When the IP address source changes it is really fast, but when it doesn't it=
 takes 20 to 40 seconds.

Regards,
Tiago

> On 23 Jun 2017, at 18:28, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> Hello Tiago,
>=20
> WireGuard should do roaming instantly. There should be no delay at
> all. If you're experiencing delay, this is a bug that needs
> investigating...
>=20
> What kinds of timeouts are you seeing with the source address change?
>=20
> Regards,
> Jason
