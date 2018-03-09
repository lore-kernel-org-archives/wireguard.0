Return-Path: toke@toke.dk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 18119d99
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:36:51 +0000 (UTC)
Received: from mail.toke.dk (mail.toke.dk [52.28.52.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4bd60be7
 for <wireguard@lists.zx2c4.com>; Fri, 9 Mar 2018 14:36:50 +0000 (UTC)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Another roaming problem
In-Reply-To: <CAHmME9qsdSg4JBGrBNLA+2Mmkh7Te+YKb5ixSOSwrMJpbn=XXw@mail.gmail.com>
References: <87efku1vza.fsf@toke.dk>
 <CAHmME9qg=YXoKxEnikkJe1Li5Pq+yASPUhqN5PmGk6Fx=Y3-1Q@mail.gmail.com>
 <85FE1433-439D-439C-A61E-B17754707077@toke.dk>
 <CAHmME9p0aW2i-EcErua_Hkz-hZc12m47oLR9wvngu5ejVX=Q8A@mail.gmail.com>
 <87h8pqlbw4.fsf@toke.dk>
 <CAHmME9pgOGghWRv9bMtTvbxrQfNycK9EHEnBu=UQxOz6AQJ2qA@mail.gmail.com>
 <7088098E-63F5-4ECB-A298-24444987482E@toke.dk>
 <CAHmME9ojxMOoB5z4VJQbecTD+Y7VLK=K8=oTSDciofWLC6Q0fg@mail.gmail.com>
 <87efktzhmj.fsf@toke.dk> <87tvtpjp57.fsf@toke.dk> <87o9jxjotf.fsf@toke.dk>
 <CAHmME9qsdSg4JBGrBNLA+2Mmkh7Te+YKb5ixSOSwrMJpbn=XXw@mail.gmail.com>
Date: Fri, 09 Mar 2018 15:46:35 +0100
Message-ID: <87efktjohg.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

"Jason A. Donenfeld" <Jason@zx2c4.com> writes:

> On Fri, Mar 9, 2018 at 3:39 PM, Toke H=C3=B8iland-J=C3=B8rgensen <toke@to=
ke.dk> wrote:
>> And leaving it running a bit more, there is also a call from
>> expired_retransmit_handshake:
>
> Yep! These are the two calls in timers.c.

Right, cool. Kprobes are awesome, BTW (this was my first time trying this):

https://github.com/iovisor/bcc/blob/master/examples/tracing/stacksnoop.py

./stacksnoop.py socket_clear_peer_endpoint_src

and presto; nice stack traces every time they are called :D

-Toke
