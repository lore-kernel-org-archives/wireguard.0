Return-Path: rm@romanrm.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a87fdbe
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:24:00 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [91.121.86.59])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db74251b
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 14:23:59 +0000 (UTC)
Date: Sat, 14 Apr 2018 19:38:15 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Mixed MTU hosts on a network
Message-ID: <20180414193815.0d0cd039@natsu>
In-Reply-To: <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
References: <20180316142547.2ecb70de@natsu>
 <CAHmME9rVba9Zzv65guftwxZcRGWBY0uaP=_GhHVnBz=8+L6Y3A@mail.gmail.com>
 <20180414024017.GA14470@zx2c4.com>
 <CAHmME9ru0iQeYMv_Y5dBZ1GoJvT_=UK8V74wWYNz2jtZWRFhfw@mail.gmail.com>
 <20180414184018.0166bc48@natsu>
 <CAHmME9rHTu1dQi+xyyRnkKxVkC9bx91V06-qF513SsVt8e7FKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 14 Apr 2018 16:15:07 +0200
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Roman,
> 
> I answered this in my first email to you, which perhaps got lost in
> the mix of emails, so I'll quote the relevant part:
> 
> > 2) When we pad the packet payload. In this case, we pad it to the
> > nearest multiple of 16, but we don't let it exceed the device MTU.
> > This is skb_padding in send.c. This behavior seems like the bug in
> > your particular case, since what matters here is the route's MTU, not
> > the device MTU. For full 1412 size packets, the payload is presumably
> > being padded to 1424, since that's still less than the device MTU. In
> > order to test this theory, try setting your route MTU, as you've
> > described in your first email, to 1408 (which is a multiple of 16). If
> > this works, let me know, as it will be good motivation for fixing
> > skb_padding. If not, then it means there's a problem elsewhere to
> > investigate too.
> 
> In short, because 1408 is a multiple of 16 so it didn't get rounded
> up, whereas 1412 got rounded up to 1424.

I got that, but that still seemed to be talking about the problem with route
MTUs.

But what about if I don't touch any route MTUs at all, but set the WG device
MTU to 1412. In my further experiments that didn't work well either, causing
weird one-directional issues, and only 1408 worked.

So, is it possible to fix the padding so 1412 can be used as WG device MTU on
underlying MTU of 1492? Otherwise, shouldn't there be a warning somewhere in
the docs to not just choose the largest fitting MTU according to [1], but also
round down what you got, to a nearest multiple of 16.

[1] https://www.mail-archive.com/wireguard@lists.zx2c4.com/msg01856.html

-- 
With respect,
Roman
