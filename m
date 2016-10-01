Return-Path: dave.taht@gmail.com
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
 [209.85.220.194])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94092300
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 17:08:09 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n189so5801107qke.1
 for <wireguard@lists.zx2c4.com>; Sat, 01 Oct 2016 10:19:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87ponk9if1.fsf@toke.dk>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
From: Dave Taht <dave.taht@gmail.com>
Date: Sat, 1 Oct 2016 10:19:00 -0700
Message-ID: <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
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

On Sat, Oct 1, 2016 at 8:51 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
> Dave Taht <dave.taht@gmail.com> writes:
>
>> My thought - given that at least on some platforms - encrypting 1000
>> packets at a time is a bad idea - would be something regulating the
>> amount of data being crypted at a time, an equivalent to byte queue
>> limits - BQL - BCL? byte crypto limits - to keep no more than, say,
>> 1ms of data in that part of the subsystem.
>
> Well, the dynamic queue limit stuff is reusable (in
> include/linux/dynamic_queue_limits.h). The netdev BQL stuff just uses
> these functions with the packet byte sizes; so adapting it to use in
> wireguard should be fairly straight forward :)

Having one global queue for all of wireguard makes a lot of sense,
one that gets divvied up as per the amount of traffic for each destination,
and regulated "fairly".

The present model - of one fixed size one per endpoint can run you out
of memory right quick.

>> ... also pulling stuff out of order from an already encrypted thing
>> leads to the same IV problems we had in mac80211.
>
> Yeah, but who needs IVs, really? ;)


Well, in wireguard's case, it does not  (yay!) have
a-must-deliver-packet-in-IV-order mechanism like 802.11 requires. It
will merely throw away things that are outside the replay window (2k
packets). So you could *encrypt* first, deliver later, if you wanted.

Still, what I'd wanted to do was push back (or pace?) from the
interface itself, as well as from the crypto subsystem, and throw away
packets before being crypted when things are starting to get out of
hand - as well as do better fq-ish mixing of what's going out.

Consider a path like this:

testbox, flooding -> 1Gbit in -> router-encrypting -> 20Mbit out to
the internet.

If you flood the thing - you get a big queue in two places - one at
the interface qdisc where we struggle to throw already encrypted
things away (eventually), and another
inside the vpn code where we are encrypting as fast as we can get stuff in.


...

As a side note, another crazy daydream of mine is to use up an entire
/64 for the vpn endpoint identifier, and pre-negotiate a "spread
spectrum" style of sending packets there. This would eliminate needing
to bundle the IV in the packet, it would be obvious (to each side)
which IV matched what IP address, we'd save 8 bytes on every packet.

and completely break every fq+congestion control qdisc we know of, as
well as most stateful firewalls, and so on. :)

> -Toke



--=20
Dave T=C3=A4ht
Let's go make home routers and wifi faster! With better software!
http://blog.cerowrt.org
