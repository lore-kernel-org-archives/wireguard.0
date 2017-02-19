Return-Path: alx@dd19.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0bc2e13b
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 16:29:27 +0000 (UTC)
Received: from mail.dd19.de (mail.dd19.de [217.197.86.197])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e661a1e
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 16:29:26 +0000 (UTC)
Subject: Re: wg binary in armhf deb from ppa missing
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: text/plain; charset=utf-8
From: Alexander Morlang <alx@dd19.de>
In-Reply-To: <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
Date: Sun, 19 Feb 2017 17:29:59 +0100
Message-Id: <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
To: Egbert Verhage <egbert@eggiecode.org>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi,
building on armhf reveals some effects i don=E2=80=99t understand:
On my raspi3 with raspian and kernel
uname -a
Linux raspberrypi 4.4.38-v7+ #938 SMP Thu Dec 15 15:22:21 GMT 2016 =
armv7l GNU/Linux
kernelmodule&wg are building just fine an the module loads. i had no =
time for testing it, but it builds.

On Banana Pro with armbian an kernel
uname -a
Linux bananapipro 4.9.7-sunxi #1 SMP Thu Feb 2 01:52:06 CET 2017 armv7l =
armv7l armv7l GNU/Linux
it=E2=80=99s building, but the module will not load:

sudo modprobe wireguard=20
modprobe: ERROR: could not insert 'wireguard': Exec format error

modinfo wireguard=20
filename:       /lib/modules/4.9.7-sunxi/extra/wireguard.ko
alias:          rtnl-link-wireguard
author:         Jason A. Donenfeld <Jason@zx2c4.com>
description:    Fast, secure, and modern VPN tunnel
license:        GPL v2
depends:        udp_tunnel,ip6_udp_tunnel,x_tables
vermagic:       4.9.7-sunxi SMP mod_unload ARMv7 thumb2 p2v8=20

In dmesg, it shows:
[ 1404.917772] wireguard: loading out-of-tree module taints kernel.
[ 1404.919392] wireguard: unknown relocation: 102

Next i will try with bananian and 4.4 kernel.

Gru=C3=9F, Alex

> Am 19.02.2017 um 15:51 schrieb Egbert Verhage <egbert@eggiecode.org>:
>=20
> Hey Alex,
>=20
> Ow, I never tested the package on armhf. I will give test it tomorrow =
on
> my own Banana Pi 2 and Raspberry pi 2.
>=20
> If you are running the image of lemaker on your banana pi, maybe try
> first to build the package from the git repo.
>=20
> Greetz,
> Egbert
>=20
>=20
> On 2017-02-19 02:14, Alexander Morlang wrote:
>> Hi,
>> used the launchpad ppa in xenial on armhf (Banana Pro).=20
>> The wireguard-tools packet installed only /usr/share/doc
>>=20
>> Is this a known problem?
>>=20
>> I downloaded the
>> =
https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wireguar=
d-tools_0.0.20170214-wg1~xenial_armhf.deb
>> and hat a look with dpkg -c <file>, getting the same result of no =
binary in the packet.
>>=20
>> regards, Alex
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
