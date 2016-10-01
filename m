Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26789f2b
 for <wireguard@lists.zx2c4.com>; Sat, 1 Oct 2016 17:17:52 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Dave Taht <dave.taht@gmail.com>
References: <CAHmME9oevqa0+pPhSVjNqGFOSZkwctUB2U=19xvebRrxscJFaQ@mail.gmail.com>
 <87twcw9tih.fsf@toke.dk>
 <CAA93jw4MCXRn2zfqw3yuckD5YSsRCRUmLqC9VP88q9ODTLv5ng@mail.gmail.com>
 <87ponk9if1.fsf@toke.dk>
 <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
Date: Sat, 01 Oct 2016 19:28:41 +0200
In-Reply-To: <CAA93jw4srSUh+qd8hufuPHmiQHNc4hU0At0r=+SvoB3ccCU4sw@mail.gmail.com>
 (Dave Taht's message of "Sat, 1 Oct 2016 10:19:00 -0700")
Message-ID: <87intc9dx2.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Dave Taht <dave.taht@gmail.com> writes:

> On Sat, Oct 1, 2016 at 8:51 AM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> Dave Taht <dave.taht@gmail.com> writes:
>>
>>> My thought - given that at least on some platforms - encrypting 1000
>>> packets at a time is a bad idea - would be something regulating the
>>> amount of data being crypted at a time, an equivalent to byte queue
>>> limits - BQL - BCL? byte crypto limits - to keep no more than, say,
>>> 1ms of data in that part of the subsystem.
>>
>> Well, the dynamic queue limit stuff is reusable (in
>> include/linux/dynamic_queue_limits.h). The netdev BQL stuff just uses
>> these functions with the packet byte sizes; so adapting it to use in
>> wireguard should be fairly straight forward :)
>
> Having one global queue for all of wireguard makes a lot of sense, one
> that gets divvied up as per the amount of traffic for each
> destination,

You'd get that with the FQ structure I described earlier. Then apply the
dql stuff to limit (globally) the number of packets (or bytes) currently
being encrypted, and you should have something fairly reasonable.

-Toke
