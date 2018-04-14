Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b97c029c
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:00:52 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c95b9af5
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:00:52 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c2f35dc
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:52:01 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b8d8640d
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 13:52:00 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h11-v6so1461160oic.3
 for <wireguard@lists.zx2c4.com>; Sat, 14 Apr 2018 07:15:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180414184018.0166bc48@natsu>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
 <20180414184018.0166bc48@natsu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 16:15:07 +0200
Message-ID: <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
Subject: Re: Mixed MTU hosts on a network
To: Roman Mamedov <rm@romanrm.net>
Content-Type: text/plain; charset="UTF-8"
Cc: Luis Ressel <aranea@aixah.de>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Roman Mamedov <rm.wg@romanrm.net>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Roman,

I answered this in my first email to you, which perhaps got lost in
the mix of emails, so I'll quote the relevant part:

> 2) When we pad the packet payload. In this case, we pad it to the
> nearest multiple of 16, but we don't let it exceed the device MTU.
> This is skb_padding in send.c. This behavior seems like the bug in
> your particular case, since what matters here is the route's MTU, not
> the device MTU. For full 1412 size packets, the payload is presumably
> being padded to 1424, since that's still less than the device MTU. In
> order to test this theory, try setting your route MTU, as you've
> described in your first email, to 1408 (which is a multiple of 16). If
> this works, let me know, as it will be good motivation for fixing
> skb_padding. If not, then it means there's a problem elsewhere to
> investigate too.

In short, because 1408 is a multiple of 16 so it didn't get rounded
up, whereas 1412 got rounded up to 1424.

Jason
