Return-Path: toke@toke.dk
Received: from mail2.tohojo.dk (mail2.tohojo.dk [77.235.48.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e29c9bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Oct 2016 16:06:45 +0000 (UTC)
From: =?utf-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
References: <87mvi0jxsb.fsf@toke.dk> <87a8e0jucl.fsf@toke.dk>
Date: Wed, 19 Oct 2016 18:07:37 +0200
In-Reply-To: <87a8e0jucl.fsf@toke.dk> ("Toke =?utf-8?Q?H=C3=B8iland-J?=
 =?utf-8?Q?=C3=B8rgensen=22's?= message of
 "Wed, 19 Oct 2016 16:18:02 +0200")
Message-ID: <87zim0wcdy.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Subject: Re: [WireGuard] Error building against grsec-enabled kernel
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:

> Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk> writes:
>
>> I'm getting build errors when building WireGuard against a grsec-enabled
>> kernel (on Arch linux):
>>
>> DKMS make.log for wireguard-0.0.20161014 for kernel 4.7.8.201610161720-1=
-grsec (x86_64)
>> Wed 19 Oct 14:59:25 CEST 2016
>> make: Entering directory '/usr/lib/modules/4.7.8.201610161720-1-grsec/bu=
ild'
>>   LD      /var/lib/dkms/wireguard/0.0.20161014/build/built-in.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/main.o
>> /var/lib/dkms/wireguard/0.0.20161014/build/main.o: warning: objtool: mod=
_exit(): can't find starting instruction
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/noise.o
>>   CC [M]  /var/lib/dkms/wireguard/0.0.20161014/build/device.o
>> /var/lib/dkms/wireguard/0.0.20161014/build/device.c:330:29: error: const=
ified variable =E2=80=98link_ops=E2=80=99 placed into writable section ".da=
ta..read_mostly"
>>  static struct rtnl_link_ops link_ops __read_mostly =3D {
>>                              ^~~~~~~~
>> make[1]: *** [scripts/Makefile.build:290: /var/lib/dkms/wireguard/0.0.20=
161014/build/device.o] Error 1
>> make: *** [Makefile:1465: _module_/var/lib/dkms/wireguard/0.0.20161014/b=
uild] Error 2
>> make: Leaving directory '/usr/lib/modules/4.7.8.201610161720-1-grsec/bui=
ld'
>>
>> Any idea how to fix this?
>
> OK, so turns out just getting rid of the __read_mostly fixes things.
> This could conceivably be conditioned on CONSTIFY_PLUGIN in the upstream
> source? :)

... but though I managed to get it to build, there's an overflow
somewhere in the RX path with causes PAX to kill the interrupt handler
(and thus crash the kernel). Don't have a backtrace, sorry :(

-Toke
