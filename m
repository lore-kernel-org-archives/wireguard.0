Return-Path: richterphilipp.pops@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ade1eb4
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 21:00:01 +0000 (UTC)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com
 [IPv6:2607:f8b0:4864:20::92e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d13e410
 for <wireguard@lists.zx2c4.com>; Thu, 6 Sep 2018 21:00:01 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id h1-v6so10240786uao.8
 for <wireguard@lists.zx2c4.com>; Thu, 06 Sep 2018 14:00:17 -0700 (PDT)
MIME-Version: 1.0
From: Philipp Richter <richterphilipp.pops@gmail.com>
Date: Thu, 6 Sep 2018 23:00:05 +0200
Message-ID: <CA+Vb7hrqMcT3Qwr0_ZRQXE645do9iBZnJaL5Qh4GqCKSncejtg@mail.gmail.com>
Subject: Missing <asm/neon.h> with 0.0.20180904 on arm with kernel 3.10.107
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000091dbcc05753a2def"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000091dbcc05753a2def
Content-Type: text/plain; charset="UTF-8"

Hello,

while trying to install the new wireguard snapshot 0.0.20180904, I got an
error about missing <arm/neon.h> on my odroid-c1 running ArchLinux ARM

DKMS make.log for wireguard-0.0.20180904 for kernel 3.10.107-2-ARCH
(armv7l)
Thu Sep  6 22:45:48 CEST 2018
make: Entering directory '/usr/src/linux-3.10.107-2-ARCH'
 LD      /var/lib/dkms/wireguard/0.0.20180904/build/built-in.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/main.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/device.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/noise.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/peer.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/timers.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/queueing.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/send.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/receive.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/socket.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/hashtables.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/allowedips.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/ratelimiter.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/cookie.o
 CC [M]  /var/lib/dkms/wireguard/0.0.20180904/build/netlink.o
 CC [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20/chacha20.o
 AS [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20/chacha20-arm.o

 CC [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/poly1305/poly1305.o
 AS [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/poly1305/poly1305-arm.o

 CC [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20poly1305.o
 CC [M]
 /var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/curve25519/curve25519.o

In file included from <command-line>:
/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20/chacha20-arm-glue.h:8:10:
fatal error: asm/neon.h: No such file or directory
#include <asm/neon.h>
         ^~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.build:308:
/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20/chacha20.o]
Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from <command-line>:
/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/poly1305/poly1305-arm-glue.h:8:10:
fatal error: asm/neon.h: No such file or directory
#include <asm/neon.h>
         ^~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.build:308:
/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/poly1305/poly1305.o]
Error 1
make: *** [Makefile:1233:
_module_/var/lib/dkms/wireguard/0.0.20180904/build] Error 2
make: Leaving directory '/usr/src/linux-3.10.107-2-ARCH'

Unfortunately I'm stuck with 3.10.107 on my odroid-c1 :'-( , sources can be
found here : https://github.com/hardkernel/linux/tree/odroidc-3.10.y

Wireguard has been working great so far, going back to 0.0.20180809 yields
a successful compilation.

Best Regards,
Philipp Richter

*Fingerprint* : *452F 7EBD 2716 B179 5E3E  A2CB AE2B 7FFA CA43 4586*
*PGP Public Key* <https://u.teknik.io/ytoEw.asc>

--00000000000091dbcc05753a2def
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div><div><br></div>while try=
ing to install the new wireguard snapshot 0.0.20180904, I got an error abou=
t missing &lt;arm/neon.h&gt; on my odroid-c1 running ArchLinux ARM<div><br>=
</div><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(0=
,0,0)">DKMS make.log for wireguard-0.0.20180904 for kernel 3.10.107-2-ARCH =
(armv7l)
</span><br>Thu Sep =C2=A06 22:45:48 CEST 2018
<br>make: Entering directory &#39;/usr/src/linux-3.10.107-2-ARCH&#39;
<br> =C2=A0LD =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/var/lib/dkms/wireguard/0.0.201=
80904/build/built-in.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/main.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/device.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/noise.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/peer.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/timers.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/queueing=
.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/send.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/receive.=
o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/socket.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/hashtabl=
es.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/allowedi=
ps.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/ratelimi=
ter.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/cookie.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/netlink.=
o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/chacha20/chacha20.o
<br> =C2=A0AS [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/chacha20/chacha20-arm.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/poly1305/poly1305.o
<br> =C2=A0AS [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/poly1305/poly1305-arm.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/chacha20poly1305.o
<br> =C2=A0CC [M] =C2=A0/var/lib/dkms/wireguard/0.0.20180904/build/crypto/z=
inc/curve25519/curve25519.o
<br>In file included from &lt;command-line&gt;:
<br>/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/chacha20/chacha2=
0-arm-glue.h:8:10: fatal error: asm/neon.h: No such file or directory
<br> #include &lt;asm/neon.h&gt;
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~
<br>compilation terminated.
<br>make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.2=
0180904/build/crypto/zinc/chacha20/chacha20.o] Error 1
<br>make[1]: *** Waiting for unfinished jobs....
<br>In file included from &lt;command-line&gt;:
<br>/var/lib/dkms/wireguard/0.0.20180904/build/crypto/zinc/poly1305/poly130=
5-arm-glue.h:8:10: fatal error: asm/neon.h: No such file or directory
<br> #include &lt;asm/neon.h&gt;
<br> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0^~~~~~~~~~~~
<br>compilation terminated.
<br>make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.2=
0180904/build/crypto/zinc/poly1305/poly1305.o] Error 1
<br>make: *** [Makefile:1233: _module_/var/lib/dkms/wireguard/0.0.20180904/=
build] Error 2
<br>make: Leaving directory &#39;/usr/src/linux-3.10.107-2-ARCH&#39;</span>=
</div><div><span style=3D"font-family:monospace"><br></span></div><div><fon=
t face=3D"arial, helvetica, sans-serif">Unfortunately I&#39;m stuck with 3.=
10.107 on my odroid-c1 :&#39;-( , sources can be found here : <a href=3D"ht=
tps://github.com/hardkernel/linux/tree/odroidc-3.10.y">https://github.com/h=
ardkernel/linux/tree/odroidc-3.10.y</a></font></div><div><font face=3D"aria=
l, helvetica, sans-serif"><br></font></div><div><font face=3D"arial, helvet=
ica, sans-serif">Wireguard has been working great so far, going back to=C2=
=A0</font>0.0.20180809 yields a successful compilation.</div><div><br></div=
><div>Best Regards,</div><div><div><div dir=3D"ltr" class=3D"gmail_signatur=
e"><div dir=3D"ltr"><div><font face=3D"arial narrow, sans-serif">Philipp Ri=
chter</font></div><div><br></div><font face=3D"monospace, monospace" size=
=3D"1"><u>Fingerprint</u> : <b>452F 7EBD 2716 B179 5E3E =C2=A0A2CB AE2B 7FF=
A CA43 4586</b></font><div><font face=3D"monospace, monospace" size=3D"1"><=
a href=3D"https://u.teknik.io/ytoEw.asc" target=3D"_blank"><b>PGP Public Ke=
y</b></a><br></font></div></div></div></div></div></div></div>

--00000000000091dbcc05753a2def--
