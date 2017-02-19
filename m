Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0790666
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 18:21:30 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0826f950
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 18:21:30 +0000 (UTC)
Subject: Re: wg binary in armhf deb from ppa missing; armbian with Allwinner
 A20 chip modprobe wg not working
To: Alexander Morlang <alx@dd19.de>
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
 <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <ddd1e40b-1b18-3112-c70e-34d2998cab0c@eggiecode.org>
Date: Sun, 19 Feb 2017 19:21:37 +0100
MIME-Version: 1.0
In-Reply-To: <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="6EwggFoDt6HownnEeuR9cj7oJGQtsLvsc"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6EwggFoDt6HownnEeuR9cj7oJGQtsLvsc
Content-Type: multipart/mixed; boundary="Gt3aHCJ4CHK5q2s4miFsp3Hh6En3qWS5B";
 protected-headers="v1"
From: Egbert Verhage <egbert@eggiecode.org>
To: Alexander Morlang <alx@dd19.de>
Cc: wireguard@lists.zx2c4.com
Message-ID: <ddd1e40b-1b18-3112-c70e-34d2998cab0c@eggiecode.org>
Subject: Re: wg binary in armhf deb from ppa missing; armbian with Allwinner
 A20 chip modprobe wg not working
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
 <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>
In-Reply-To: <E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de>

--Gt3aHCJ4CHK5q2s4miFsp3Hh6En3qWS5B
Content-Type: multipart/alternative;
 boundary="------------1CEBD82411D66945009D1132"

This is a multi-part message in MIME format.
--------------1CEBD82411D66945009D1132
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Alex,

The Banana PI boards here an Allwinner chip, which not great with the
Linux Kernel. All the kernels are custom builds (most of the time) to
include support for the chips/boards.
=46rom my experience the builds of armbian have the best images (Mind the=

I have Banana PI M2, with an Allwinner A31S).

I can't help furder with wg on BananaPi board, sorry. Maybe somone else
in the mailing can help.

For the PPA package I need to figure out how the let him include make
install of wg/tools for armhf/arm64.

Greetz,
Egbert


On 2017-02-19 17:29, Alexander Morlang wrote:
> Hi,
> building on armhf reveals some effects i don=E2=80=99t understand:
> On my raspi3 with raspian and kernel
> uname -a
> Linux raspberrypi 4.4.38-v7+ #938 SMP Thu Dec 15 15:22:21 GMT 2016 armv=
7l GNU/Linux
> kernelmodule&wg are building just fine an the module loads. i had no ti=
me for testing it, but it builds.
>
> On Banana Pro with armbian an kernel
> uname -a
> Linux bananapipro 4.9.7-sunxi #1 SMP Thu Feb 2 01:52:06 CET 2017 armv7l=
 armv7l armv7l GNU/Linux
> it=E2=80=99s building, but the module will not load:
>
> sudo modprobe wireguard=20
> modprobe: ERROR: could not insert 'wireguard': Exec format error
>
> modinfo wireguard=20
> filename:       /lib/modules/4.9.7-sunxi/extra/wireguard.ko
> alias:          rtnl-link-wireguard
> author:         Jason A. Donenfeld <Jason@zx2c4.com>
> description:    Fast, secure, and modern VPN tunnel
> license:        GPL v2
> depends:        udp_tunnel,ip6_udp_tunnel,x_tables
> vermagic:       4.9.7-sunxi SMP mod_unload ARMv7 thumb2 p2v8=20
>
> In dmesg, it shows:
> [ 1404.917772] wireguard: loading out-of-tree module taints kernel.
> [ 1404.919392] wireguard: unknown relocation: 102
>
> Next i will try with bananian and 4.4 kernel.
>
> Gru=C3=9F, Alex
>
>> Am 19.02.2017 um 15:51 schrieb Egbert Verhage <egbert@eggiecode.org>:
>>
>> Hey Alex,
>>
>> Ow, I never tested the package on armhf. I will give test it tomorrow =
on
>> my own Banana Pi 2 and Raspberry pi 2.
>>
>> If you are running the image of lemaker on your banana pi, maybe try
>> first to build the package from the git repo.
>>
>> Greetz,
>> Egbert
>>
>>
>> On 2017-02-19 02:14, Alexander Morlang wrote:
>>> Hi,
>>> used the launchpad ppa in xenial on armhf (Banana Pro).=20
>>> The wireguard-tools packet installed only /usr/share/doc
>>>
>>> Is this a known problem?
>>>
>>> I downloaded the
>>> https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wir=
eguard-tools_0.0.20170214-wg1~xenial_armhf.deb
>>> and hat a look with dpkg -c <file>, getting the same result of no bin=
ary in the packet.
>>>
>>> regards, Alex
>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--------------1CEBD82411D66945009D1132
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    <p>Hey Alex,</p>
    <p>The Banana PI boards here an Allwinner chip, <span
        class=3D"gt-baf-word-clickable">which</span> not great with the
      Linux Kernel. All the kernels are custom builds (most of the time)
      to include support for the chips/boards.<br>
      From my experience the builds of armbian have the best images
      (Mind the I have Banana PI M2, with an Allwinner A31S).<br>
    </p>
    <p>I can't help furder with wg on BananaPi board, sorry. Maybe
      somone else in the mailing can help.<br>
    </p>
    <p>For the PPA package I need to figure out how the let him include
      make install of wg/tools for armhf/arm64.</p>
    <p>Greetz,<br>
      Egbert<br>
    </p>
    <br>
    <div class=3D"moz-cite-prefix">On 2017-02-19 17:29, Alexander Morlang=

      wrote:<br>
    </div>
    <blockquote cite=3D"mid:E8A0979F-E0B0-4614-801C-A56F94039F4B@dd19.de"=

      type=3D"cite">
      <pre wrap=3D"">Hi,
building on armhf reveals some effects i don=E2=80=99t understand:
On my raspi3 with raspian and kernel
uname -a
Linux raspberrypi 4.4.38-v7+ #938 SMP Thu Dec 15 15:22:21 GMT 2016 armv7l=
 GNU/Linux
kernelmodule&amp;wg are building just fine an the module loads. i had no =
time for testing it, but it builds.

On Banana Pro with armbian an kernel
uname -a
Linux bananapipro 4.9.7-sunxi #1 SMP Thu Feb 2 01:52:06 CET 2017 armv7l a=
rmv7l armv7l GNU/Linux
it=E2=80=99s building, but the module will not load:

sudo modprobe wireguard=20
modprobe: ERROR: could not insert 'wireguard': Exec format error

modinfo wireguard=20
filename:       /lib/modules/4.9.7-sunxi/extra/wireguard.ko
alias:          rtnl-link-wireguard
author:         Jason A. Donenfeld <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:Jason@zx2c4.com">&lt;Jason@zx2c4.com&gt;</a>
description:    Fast, secure, and modern VPN tunnel
license:        GPL v2
depends:        udp_tunnel,ip6_udp_tunnel,x_tables
vermagic:       4.9.7-sunxi SMP mod_unload ARMv7 thumb2 p2v8=20

In dmesg, it shows:
[ 1404.917772] wireguard: loading out-of-tree module taints kernel.
[ 1404.919392] wireguard: unknown relocation: 102

Next i will try with bananian and 4.4 kernel.

Gru=C3=9F, Alex

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"">Am 19.02.2017 um 15:51 schrieb Egbert Verhage <a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:egbert@eggiecode.org">&lt;e=
gbert@eggiecode.org&gt;</a>:

Hey Alex,

Ow, I never tested the package on armhf. I will give test it tomorrow on
my own Banana Pi 2 and Raspberry pi 2.

If you are running the image of lemaker on your banana pi, maybe try
first to build the package from the git repo.

Greetz,
Egbert


On 2017-02-19 02:14, Alexander Morlang wrote:
</pre>
        <blockquote type=3D"cite">
          <pre wrap=3D"">Hi,
used the launchpad ppa in xenial on armhf (Banana Pro).=20
The wireguard-tools packet installed only /usr/share/doc

Is this a known problem?

I downloaded the
<a class=3D"moz-txt-link-freetext" href=3D"https://launchpad.net/~wiregua=
rd/+archive/ubuntu/wireguard/+files/wireguard-tools_0.0.20170214-wg1~xeni=
al_armhf.deb">https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/=
+files/wireguard-tools_0.0.20170214-wg1~xenial_armhf.deb</a>
and hat a look with dpkg -c &lt;file&gt;, getting the same result of no b=
inary in the packet.

regards, Alex
_______________________________________________
WireGuard mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:WireGuard@lists.zx2c=
4.com">WireGuard@lists.zx2c4.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.zx2c4.com/mailma=
n/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard<=
/a>
</pre>
        </blockquote>
        <pre wrap=3D"">
_______________________________________________
WireGuard mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:WireGuard@lists.zx2c=
4.com">WireGuard@lists.zx2c4.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.zx2c4.com/mailma=
n/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard<=
/a>
</pre>
      </blockquote>
      <pre wrap=3D"">
_______________________________________________
WireGuard mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:WireGuard@lists.zx2c=
4.com">WireGuard@lists.zx2c4.com</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.zx2c4.com/mailma=
n/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard<=
/a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------1CEBD82411D66945009D1132--

--Gt3aHCJ4CHK5q2s4miFsp3Hh6En3qWS5B--

--6EwggFoDt6HownnEeuR9cj7oJGQtsLvsc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEZDcPXJp/elBwhMYKeniW+rQIrvUFAlip4jFfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDY0
MzcwRjVDOUE3RjdBNTA3MDg0QzYwQTdBNzg5NkZBQjQwOEFFRjUACgkQeniW+rQI
rvWTfhAAn0SqB0lA5RZOdwJRQLUz7ZF9nMpW1jTqnD9eZZ9BdAMt4q+Gu4rkXwEI
QiNq0oSC02ba6Awp4n31QHq7KW/U3EHED+YTu1n6ZxtdINnhn78L+z7bsweHCbIH
Mr9quDznykFWBF6Apmw0hSecF3sdrF3QdD15rjZgl3DupqbMz7yZk4kjPcU82xw4
OvDO50ZdRsPZrxg9ivKWJWtEGegcsWwZndZgSrTN7OiE5YlGBUhC/sBZUASVGJ5a
9W1izEfT1rBKwfwUetDkPWPOsSo5vCTIQm2f7ghUSb53NsUa1UamfZnzMIofPZhN
SDPzYy7p/A1C6MhgECFNNwwXThW55fq0Gg/ICV01AUe8PugbYIXLYq4MSJdRb4vm
16yW3duf43qq0xwhw6SRxKp3QyXSoH1RF3MCpQIf3O0EB4U1vQ+y6ZgV+Lz9xUKw
xwY//4KM55Tsinz03NOh7sPHz8LUkjVrGot1c/SUojA4ay8XNejP1+kQchocRhXR
KA9G3TByQ13UP67Pg+WBDGIQDDQwrv13DE2sw5CtaDtJ5xThuCDdClVIcSqgJ0KU
EThTd1KBYIki7JvVENS0fK1Asml8Bg+Aj9xs7da9q9lmpfRmZJ9QGNAau6DWOjEL
29kO6R/Gb4qYi1L0R6RHMsqN79mrxAjX8FWIXBN0LxlBoEk80Gk=
=sLp0
-----END PGP SIGNATURE-----

--6EwggFoDt6HownnEeuR9cj7oJGQtsLvsc--
