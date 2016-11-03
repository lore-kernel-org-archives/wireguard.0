Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71f5848b
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 15:11:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9c07a630
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 15:11:56 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d8bac507
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 3 Nov 2016 15:11:56 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id t196so41497708lff.3
 for <wireguard@lists.zx2c4.com>; Thu, 03 Nov 2016 08:13:11 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 3 Nov 2016 16:13:07 +0100
Message-ID: <CAHmME9qQiho_9vsuCxyV32Oy3hvkf1FL+Lpqq+yMtHPpN=_sNQ@mail.gmail.com>
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: [WireGuard] Requeuing Race Condition [Was: Re: [Cake] WireGuard
 Queuing, Bufferbloat, Performance, Latency, and related issues]
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Toke,

On Wed, Oct 5, 2016 at 3:59 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke=
.dk> wrote:
>> On Sun, Oct 2, 2016 at 1:31 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@t=
oke.dk> wrote:
>>> You don't need a timer. You already have a signal for when more queue
>>> space is available in the encryption step: When a packet finishes
>>> encryption. All you need to do is try to enqueue another one at this
>>> point.
>>
>> Oh, silly me. Yes of course. Voila:
>> https://git.zx2c4.com/WireGuard/commit/?id=3Da0ad61c1a0e25a376e145f07ca2=
7c605d3852bc4
>
> Yup, that seems like the way to go about it :)

There's a small problem with this approach:

Thread 1                            |  Thread 2
----------------------------------  |  ------------------------------------
Queue it up? Nope, queue is full.   |
                                    |  I just finished encrypting my last
                                    |  packet. My queue is now empty. Has
                                    |  thread 1 set need_resend_queue? Nope=
,
                                    |  so I'll go to sleep.
Set need_resend_queue =3D true and    |
wait for thread 2 to requeue it.    |
                                    |
Nothing happens.                    |
                                    | Nothing happens.
Nothing happens.                    |
                                    | Nothing happens.
Nothing happens.                    |
                                    | Nothing happens.

One way of fixing this would be to add a spin lock that synchronizes the
submission of jobs in thread 1 and the completion of jobs in thread 2. That
looks like this:

https://git.zx2c4.com/WireGuard/commit/?h=3Djd/ugly-sync

I have no intention of actually merging this approach, as it's really too
awful. But perhaps you have a better race-free and lock-free approach.


Jason
