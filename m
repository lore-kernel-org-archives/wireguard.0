Return-Path: kumarkarthikn@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a9f32a4
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 02:48:09 +0000 (UTC)
Received: from mail-qt0-x236.google.com (mail-qt0-x236.google.com
 [IPv6:2607:f8b0:400d:c0d::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d04351d5
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Jun 2018 02:48:09 +0000 (UTC)
Received: by mail-qt0-x236.google.com with SMTP id e11-v6so10199995qtp.5
 for <wireguard@lists.zx2c4.com>; Sun, 24 Jun 2018 19:53:30 -0700 (PDT)
MIME-Version: 1.0
From: karthik kumar <kumarkarthikn@gmail.com>
Date: Mon, 25 Jun 2018 08:23:18 +0530
Message-ID: <CAK+ZqRryNNWq1yhAQKbzOxTKrzRmO_gfM47F18YCGOiYcdumdg@mail.gmail.com>
Subject: src/crypto/curve25519-x86_64.h:1319: Error: no such instruction while
 compiling in centos 6
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="00000000000085ece6056f6e7ce0"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000085ece6056f6e7ce0
Content-Type: text/plain; charset="UTF-8"

Hi,
   I get the following "no such instruction" error while compiling Wireguard

*# make*
*  CC [M]  /root/WireGuard-0.0.20180620/src/main.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/noise.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/device.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/peer.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/timers.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/queueing.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/send.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/receive.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/socket.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/hashtables.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/allowedips.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/ratelimiter.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/cookie.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/netlink.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/crypto/chacha20.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/crypto/poly1305.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/crypto/chacha20poly1305.o*
*  CC [M]  /root/WireGuard-0.0.20180620/src/crypto/curve25519.o*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h: Assembler
messages:*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no
such instruction: `mulx (%r15),%r8,%r12'*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no
such instruction: `mulx 8(%r15),%r10,%rax'*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no
such instruction: `adox %r10,%r12'*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no
such instruction: `mulx 16(%r15),%r8,%rbx'*
*/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no
such instruction: `adox %r8,%rax'*
*.... <lots of such no such instruction errors>*

I am on centos 6, and my kernel version is 4.9.34.I just compiled and
installed *gcc version 8.1.0 (GCC) *to build wireguard but my kernel was
originally built with gcc-4.4.7. Will that be a problem ?
Is there a way to exclude Elliptic Curve 25519 or any of the Elliptic Curve
while making ? Any other suggestions please ?


Thanks

--00000000000085ece6056f6e7ce0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>=C2=A0 =C2=A0I get the following &quot;no su=
ch instruction&quot; error while compiling Wireguard</div><div><br></div><d=
iv><div><i># make</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.=
20180620/src/main.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.=
0.20180620/src/noise.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard=
-0.0.20180620/src/device.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireG=
uard-0.0.20180620/src/peer.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/Wir=
eGuard-0.0.20180620/src/timers.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root=
/WireGuard-0.0.20180620/src/queueing.o</i></div><div><i>=C2=A0 CC [M]=C2=A0=
 /root/WireGuard-0.0.20180620/src/send.o</i></div><div><i>=C2=A0 CC [M]=C2=
=A0 /root/WireGuard-0.0.20180620/src/receive.o</i></div><div><i>=C2=A0 CC [=
M]=C2=A0 /root/WireGuard-0.0.20180620/src/socket.o</i></div><div><i>=C2=A0 =
CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/hashtables.o</i></div><div><i=
>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/allowedips.o</i></div=
><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/ratelimiter.o=
</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/cook=
ie.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/=
netlink.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620=
/src/crypto/chacha20.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /root/WireGuard=
-0.0.20180620/src/crypto/poly1305.o</i></div><div><i>=C2=A0 CC [M]=C2=A0 /r=
oot/WireGuard-0.0.20180620/src/crypto/chacha20poly1305.o</i></div><div><i>=
=C2=A0 CC [M]=C2=A0 /root/WireGuard-0.0.20180620/src/crypto/curve25519.o</i=
></div><div><i>/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:=
 Assembler messages:</i></div><div><i>/root/WireGuard-0.0.20180620/src/cryp=
to/curve25519-x86_64.h:350: Error: no such instruction: `mulx (%r15),%r8,%r=
12&#39;</i></div><div><i>/root/WireGuard-0.0.20180620/src/crypto/curve25519=
-x86_64.h:350: Error: no such instruction: `mulx 8(%r15),%r10,%rax&#39;</i>=
</div><div><i>/root/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:3=
50: Error: no such instruction: `adox %r10,%r12&#39;</i></div><div><i>/root=
/WireGuard-0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no such =
instruction: `mulx 16(%r15),%r8,%rbx&#39;</i></div><div><i>/root/WireGuard-=
0.0.20180620/src/crypto/curve25519-x86_64.h:350: Error: no such instruction=
: `adox %r8,%rax&#39;</i></div></div><div><i>.... &lt;lots of such no such =
instruction errors&gt;</i></div><div><i><br></i></div><div>I am on centos 6=
, and my kernel version is 4.9.34.I just compiled and installed=C2=A0<i>gcc=
 version 8.1.0 (GCC) </i>to build wireguard<i>=C2=A0</i>but my kernel was o=
riginally built with gcc-4.4.7. Will that be a problem ?=C2=A0=C2=A0</div><=
div>Is there a way to exclude=C2=A0<span style=3D"background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial">Ellip=
tic Curve 25519 or any of the=C2=A0Elliptic Curve while making ? Any other =
suggestions please ?</span></div><div><span style=3D"background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial"><b=
r></span></div><div><span style=3D"background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial"><br></span></div><di=
v><span style=3D"background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial">Thanks</span></div><div><i><br></i></d=
iv><div><br></div></div>

--00000000000085ece6056f6e7ce0--
