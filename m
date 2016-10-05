Return-Path: chromatix99@gmail.com
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
 [209.85.215.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 130eb85d
 for <wireguard@lists.zx2c4.com>; Wed, 5 Oct 2016 14:10:41 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id b75so81050827lfg.3
 for <wireguard@lists.zx2c4.com>; Wed, 05 Oct 2016 07:22:01 -0700 (PDT)
Return-Path: <chromatix99@gmail.com>
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jonathan Morton <chromatix99@gmail.com>
In-Reply-To: <87oa2y6gma.fsf@toke.dk>
Date: Wed, 5 Oct 2016 17:21:54 +0300
Message-Id: <C02B0F30-D367-42D7-9E22-C32468AED629@gmail.com>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 <87intc9dx2.fsf@toke.dk>
 <CAHmME9oykzhvUB0-9dZ+nLif=4bFDyKz8NL5R9jXGT1oUqy=Bw@mail.gmail.com>
 <87intbfxit.fsf@toke.dk>
 <CAHmME9opprH_0xrXKzrOmh3iQCxXLDrMFU+tT5r1_jxGwf1o8g@mail.gmail.com>
 <87eg3zf0my.fsf@toke.dk>
 <CAHmME9oUctBYA1xxquJqH2-2=2nVpOmgwqWhL6yojSyxaoPGEw@mail.gmail.com>
 <87oa2y6gma.fsf@toke.dk>
To: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: cake@lists.bufferbloat.net, make-wifi-fast@lists.bufferbloat.net,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] [Cake] WireGuard Queuing, Bufferbloat, Performance,
	Latency, and related issues
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


> On 5 Oct, 2016, at 16:59, Toke H=C3=B8iland-J=C3=B8rgensen =
<toke@toke.dk> wrote:
>=20
> UDP floods are a concern, of
> course, but CoDel doesn't deal well with those at all, so you'd =
probably
> want a different mechanism for that.

Cake happens to have addressed the UDP flood problem by combining Codel =
with BLUE.    I call the combination COBALT.  BLUE acts on a =
percentage-drop basis, which makes it much better at handling unbounded =
flood traffic compared to Codel=E2=80=99s drops-per-second basis.

The way BLUE works means that it doesn=E2=80=99t kick in until Codel has =
demonstrated complete inability to control the flow, which usually means =
it=E2=80=99s an =E2=80=9Cunresponsive=E2=80=9D flow (ie. it doesn=E2=80=99=
t respect normal congestion control signals).  The two therefore work =
together very naturally.

It would also be reasonable to have the packet drops associated with =
BLUE at enqueue time (ie. at the tail of the queue), so that they do not =
occupy encryption bandwidth needlessly.  Codel could still act at the =
queue head, which is the best position to send congestion signals from.  =
Cake doesn=E2=80=99t split the actions like that, but it doesn=E2=80=99t =
have a particular need to.

I think it=E2=80=99s definitely a good idea to have separate Codel (and =
BLUE) state per flow, which means they *do* need to be disambiguated at =
the place the drops occur.  Putting the queue ID in the cb along with =
the enqueue time seems like a sensible way to do it.  This would mean =
that sparse flows both don=E2=80=99t get signalled to unnecessarily, and =
don=E2=80=99t disrupt the sojourn-time pattern of bulk flows.

 - Jonathan Morton
