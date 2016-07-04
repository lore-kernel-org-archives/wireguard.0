Return-Path: artyom.h31@gmail.com
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
 [209.85.215.65])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e252ce4
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jul 2016 22:50:09 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id l102so5905425lfi.1
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jul 2016 15:53:31 -0700 (PDT)
Return-Path: <artyom.h31@gmail.com>
Date: Tue, 05 Jul 2016 01:53:16 +0300
From: "Jason A. Donenfeld" <artyom.h31@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-Id: <1467672796.2967.0@smtp.gmail.com>
In-Reply-To: <1467672361.2339.0@smtp.gmail.com>
References: <1467669091.3196.0@smtp.gmail.com>
 <CAHmME9rBTuQ7d3qmbzx3J47NUF7xNXMP5tO8o3UU5G7AiGM=JQ@mail.gmail.com>
 <1467672361.2339.0@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Can WireGuard be adopted for older kernels?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

P.S. Sorry for the incorrect From address. It was me, not Jason.

=D0=92 =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA, 5 =D0=B8=D1=8E=D0=BB. 20=
16 =D0=B2 1:46 , Jason A. Donenfeld=20
<artyom.h31@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
> I'm trying to run WireGuard on a single board computer (ODROID C1).=20
> It's not a problem to modify a board's kernel code, however the chip=20
> manufacturer (Amlogic) is focused on Android and will very unlikely=20
> release a newer kernel for this board.
>=20
> A userspace version is not an option because of a huge performance=20
> penalty of userspace tunnels. It will certainly be slower than IPsec,=20
> and performance is especially important for embedded devices.
>=20
> A small offtopic: why have you chosen to use Rust for a userspace=20
> version and not C or C++? In the latter case you have an option to=20
> reuse some code from the kernel version.
>=20
> =D0=92 =D0=92=D1=82=D0=BE=D1=80=D0=BD=D0=B8=D0=BA, 5 =D0=B8=D1=8E=D0=BB. =
2016 =D0=B2 1:10 , Jason A. Donenfeld=20
> <Jason@zx2c4.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BB:
>> Hey Artyom,
>>=20
>> I face the same problem as you. I have an Edge Router Lite, and I'd
>> really love to run WireGuard on it, but their proprietary kernel is
>> stuck at 3.10. Major bummer.
>>=20
>> The current plan is to write a userspace version in Rust, that will=20
>> be
>> cross platform and work well on old kernels. No timeline on that
>> though.
>>=20
>> However, I did at one point run wireguard on really old kernels=20
>> during
>> testing. That was before I started using the very nice udp_tunnel_*
>> library inside newer kernels, which then forced the dependency. But
>> when I did do this, it worked. Maybe I'll dust off the ugly old code
>> and hack something horrible together to work on old kernels. On the
>> other hand, this might not really be a great use of time... I don't
>> know.
>>=20
>> What system are you trying to run it on? Maybe if it's the same as=20
>> me,
>> we can both poke Ubnt together to upgrade their kernel...
>>=20
>> Jason
=
