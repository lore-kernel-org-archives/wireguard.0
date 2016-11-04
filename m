Return-Path: toke@toke.dk
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3863fb5
 for <wireguard@lists.zx2c4.com>; Fri, 4 Nov 2016 11:52:01 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <CAHmME9qQiho_9vsuCxyV32Oy3hvkf1FL+Lpqq+yMtHPpN=_sNQ@mail.gmail.com>
Date: Fri, 04 Nov 2016 12:53:19 +0100
In-Reply-To: <CAHmME9qQiho_9vsuCxyV32Oy3hvkf1FL+Lpqq+yMtHPpN=_sNQ@mail.gmail.com>
 (Jason A. Donenfeld's message of "Thu, 3 Nov 2016 16:13:07 +0100")
Message-ID: <87shr7cvgw.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Requeuing Race Condition [Was: Re: [Cake] WireGuard
	Queuing, Bufferbloat, Performance, Latency, and related issues]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> Hey Toke,
>
> On Wed, Oct 5, 2016 at 3:59 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>>> On Sun, Oct 2, 2016 at 1:31 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@=
toke.dk> wrote:
>>>> You don't need a timer. You already have a signal for when more queue
>>>> space is available in the encryption step: When a packet finishes
>>>> encryption. All you need to do is try to enqueue another one at this
>>>> point.
>>>
>>> Oh, silly me. Yes of course. Voila:
>>> https://git.zx2c4.com/WireGuard/commit/?id=3Da0ad61c1a0e25a376e145f07ca=
27c605d3852bc4
>>
>> Yup, that seems like the way to go about it :)
>
> There's a small problem with this approach:
>
> Thread 1                            |  Thread 2
> ----------------------------------  |  ----------------------------------=
--
> Queue it up? Nope, queue is full.   |
>                                     |  I just finished encrypting my last
>                                     |  packet. My queue is now empty. Has
>                                     |  thread 1 set need_resend_queue? No=
pe,
>                                     |  so I'll go to sleep.
> Set need_resend_queue =3D true and    |
> wait for thread 2 to requeue it.    |
>                                     |
> Nothing happens.                    |
>                                     | Nothing happens.
> Nothing happens.                    |
>                                     | Nothing happens.
> Nothing happens.                    |
>                                     | Nothing happens.
>
> One way of fixing this would be to add a spin lock that synchronizes the
> submission of jobs in thread 1 and the completion of jobs in thread 2. Th=
at
> looks like this:
>
> https://git.zx2c4.com/WireGuard/commit/?h=3Djd/ugly-sync
>
> I have no intention of actually merging this approach, as it's really too
> awful. But perhaps you have a better race-free and lock-free approach.

Ah yes, an unprotected flag will be problematic. Do you really need the
flag, though? Can't you just inspect the queue length? Presumably you're
already doing that in a way that is multithreading-safe?

-Toke
