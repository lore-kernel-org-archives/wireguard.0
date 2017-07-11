Return-Path: sg5414@g.rit.edu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7e37ef96
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 00:05:06 +0000 (UTC)
Received: from mx03b-out01ag.rit.edu (mx03b-out01ag.rit.edu [129.21.3.135])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 95e9b113
 for <wireguard@lists.zx2c4.com>;
 Tue, 11 Jul 2017 00:05:06 +0000 (UTC)
From: Sahil Gupta <sg5414@rit.edu>
Received: by mail-pg0-f70.google.com with SMTP id 125so133061669pgi.2
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jul 2017 17:23:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA8CD9u+Xdsu_wx2RVqCLSPwAKEGJxrj_ZL-gFUwLtYc6e9PeQ@mail.gmail.com>
References: <CAA8CD9u+Xdsu_wx2RVqCLSPwAKEGJxrj_ZL-gFUwLtYc6e9PeQ@mail.gmail.com>
Date: Mon, 10 Jul 2017 20:23:16 -0400
Message-ID: <CAA8CD9skCcHmPJTXRWbNUBajRuWhYG4Tg9fVFotwsvi987og1w@mail.gmail.com>
Subject: Re: Build fail error.
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary="f403045d1ad6adeba80553ffb488"
Reply-To: sg5414@rit.edu
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--f403045d1ad6adeba80553ffb488
Content-Type: text/plain; charset="UTF-8"

I am using NetBeans IDE for wireguard project.

Here's error I am getting in output.
cd '/home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src'
/usr/bin/make -f Makefile
/usr/bin/make -C /lib/modules/4.4.0-83-generic/build M=/home/sahilgupta221/
Downloads/WireGuard-0.0.20170706/src modules
make[1]: Entering directory '/usr/src/linux-headers-4.4.0-83-generic'
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/main.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/noise.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/device.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/peer.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/timers.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/data.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/send.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/receive.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/socket.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/config.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/hashtables.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/routingtable.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/ratelimiter.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/cookie.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/crypto/
curve25519.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/crypto/
chacha20poly1305.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/blake2s.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/chacha20-ssse3-x86_64.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/poly1305-sse2-x86_64.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/blake2s-avx-x86_64.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.20170706/src/crypto/
curve25519-avx-x86_64.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/chacha20-avx2-x86_64.o
  AS [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/crypto/poly1305-avx2-x86_64.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/compat/siphash/siphash.o
  CC [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/compat/dst_cache/dst_cache.o
  LD [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/wireguard.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/wireguard.mod.o
  LD [M]  /home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/wireguard.ko
make[1]: Leaving directory '/usr/src/linux-headers-4.4.0-83-generic'
/usr/bin/make -C tools
make[1]: Entering directory '/home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/tools'
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o wg.o wg.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o show.o show.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o config.o config.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o terminal.o terminal.c
cc -O3 -std=gnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP
-DRUNSTATEDIR="\"/var/run\""    -c -o ipc.o ipc.c
ipc.c:4:27: fatal error: libmnl/libmnl.h: No such file or directory
compilation terminated.
<builtin>: recipe for target 'ipc.o' failed
make[1]: *** [ipc.o] Error 1
make[1]: Leaving directory '/home/sahilgupta221/Downloads/WireGuard-0.0.
20170706/src/tools'
Makefile:57: recipe for target 'tools' failed
make: *** [tools] Error 2

BUILD FAILED (exit value 2, total time: 22s)

Any help?

Regards
Sahil Gupta

--f403045d1ad6adeba80553ffb488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:12.8px">I am using NetBeans IDE f=
or wireguard project.</span><br style=3D"font-size:12.8px"><br style=3D"fon=
t-size:12.8px"><span style=3D"font-size:12.8px">Here&#39;s error I am getti=
ng in output.</span><br style=3D"font-size:12.8px"><div style=3D"font-size:=
12.8px">cd &#39;/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170=
706/src&#39;</div><div style=3D"font-size:12.8px">/usr/bin/make -f Makefile=
</div><div style=3D"font-size:12.8px">/usr/bin/make -C /lib/modules/4.4.0-8=
3-generic/<wbr>build M=3D/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<=
wbr>20170706/src modules</div><div style=3D"font-size:12.8px">make[1]: Ente=
ring directory &#39;/usr/src/linux-headers-4.4.0-<wbr>83-generic&#39;</div>=
<div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wb=
r>Downloads/WireGuard-0.0.<wbr>20170706/src/main.o</div><div style=3D"font-=
size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGua=
rd-0.0.<wbr>20170706/src/noise.o</div><div style=3D"font-size:12.8px">=C2=
=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>2017=
0706/src/device.o</div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0=
/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/peer.o</=
div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221=
/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/timers.o</div><div style=3D=
"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/W=
ireGuard-0.0.<wbr>20170706/src/data.o</div><div style=3D"font-size:12.8px">=
=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>2=
0170706/src/send.o</div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=
=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/recei=
ve.o</div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgu=
pta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/socket.o</div><div st=
yle=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downl=
oads/WireGuard-0.0.<wbr>20170706/src/config.o</div><div style=3D"font-size:=
12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.=
0.<wbr>20170706/src/hashtables.o</div><div style=3D"font-size:12.8px">=C2=
=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>2017=
0706/src/routingtable.o</div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =
=C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/ra=
telimiter.o</div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/=
sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/cookie.o</div>=
<div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wb=
r>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/<wbr>curve25519.o</div><=
div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr=
>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/<wbr>chacha20poly1305.o</=
div><div style=3D"font-size:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221=
/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/blake2s.o</div><div =
style=3D"font-size:12.8px">=C2=A0 AS [M] =C2=A0/home/sahilgupta221/<wbr>Dow=
nloads/WireGuard-0.0.<wbr>20170706/src/crypto/chacha20-<wbr>ssse3-x86_64.o<=
/div><div style=3D"font-size:12.8px">=C2=A0 AS [M] =C2=A0/home/sahilgupta22=
1/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/poly1305-<wbr>sse2-=
x86_64.o</div><div style=3D"font-size:12.8px">=C2=A0 AS [M] =C2=A0/home/sah=
ilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/blake2s-<w=
br>avx-x86_64.o</div><div style=3D"font-size:12.8px">=C2=A0 AS [M] =C2=A0/h=
ome/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/crypto/<wb=
r>curve25519-avx-x86_64.o</div><div style=3D"font-size:12.8px">=C2=A0 AS [M=
] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/=
crypto/chacha20-<wbr>avx2-x86_64.o</div><div style=3D"font-size:12.8px">=C2=
=A0 AS [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>2017=
0706/src/crypto/poly1305-<wbr>avx2-x86_64.o</div><div style=3D"font-size:12=
.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.=
<wbr>20170706/src/compat/siphash/<wbr>siphash.o</div><div style=3D"font-siz=
e:12.8px">=C2=A0 CC [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-=
0.0.<wbr>20170706/src/compat/dst_cache/<wbr>dst_cache.o</div><div style=3D"=
font-size:12.8px">=C2=A0 LD [M] =C2=A0/home/sahilgupta221/<wbr>Downloads/Wi=
reGuard-0.0.<wbr>20170706/src/wireguard.o</div><div style=3D"font-size:12.8=
px">=C2=A0 Building modules, stage 2.</div><div style=3D"font-size:12.8px">=
=C2=A0 MODPOST 1 modules</div><div style=3D"font-size:12.8px">=C2=A0 CC =C2=
=A0 =C2=A0 =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>2017=
0706/src/wireguard.mod.o</div><div style=3D"font-size:12.8px">=C2=A0 LD [M]=
 =C2=A0/home/sahilgupta221/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/w=
ireguard.ko</div><div style=3D"font-size:12.8px">make[1]: Leaving directory=
 &#39;/usr/src/linux-headers-4.4.0-<wbr>83-generic&#39;</div><div style=3D"=
font-size:12.8px">/usr/bin/make -C tools</div><div style=3D"font-size:12.8p=
x">make[1]: Entering directory &#39;/home/sahilgupta221/<wbr>Downloads/Wire=
Guard-0.0.<wbr>20170706/src/tools&#39;</div><div style=3D"font-size:12.8px"=
>cc -O3 -std=3Dgnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP -DRUNSTATEDIR=3D&=
quot;\&quot;/var/run\&quot;&quot; =C2=A0 =C2=A0-c -o wg.o wg.c</div><div st=
yle=3D"font-size:12.8px">cc -O3 -std=3Dgnu11 -D_GNU_SOURCE -Wall -Wextra -M=
MD -MP -DRUNSTATEDIR=3D&quot;\&quot;/var/run\&quot;&quot; =C2=A0 =C2=A0-c -=
o show.o show.c</div><div style=3D"font-size:12.8px">cc -O3 -std=3Dgnu11 -D=
_GNU_SOURCE -Wall -Wextra -MMD -MP -DRUNSTATEDIR=3D&quot;\&quot;/var/run\&q=
uot;&quot; =C2=A0 =C2=A0-c -o config.o config.c</div><div style=3D"font-siz=
e:12.8px">cc -O3 -std=3Dgnu11 -D_GNU_SOURCE -Wall -Wextra -MMD -MP -DRUNSTA=
TEDIR=3D&quot;\&quot;/var/run\&quot;&quot; =C2=A0 =C2=A0-c -o terminal.o te=
rminal.c</div><div style=3D"font-size:12.8px">cc -O3 -std=3Dgnu11 -D_GNU_SO=
URCE -Wall -Wextra -MMD -MP -DRUNSTATEDIR=3D&quot;\&quot;/var/run\&quot;&qu=
ot; =C2=A0 =C2=A0-c -o ipc.o ipc.c</div><div style=3D"font-size:12.8px">ipc=
.c:4:27: fatal error: libmnl/libmnl.h: No such file or directory</div><div =
style=3D"font-size:12.8px">compilation terminated.</div><div style=3D"font-=
size:12.8px">&lt;builtin&gt;: recipe for target &#39;ipc.o&#39; failed</div=
><div style=3D"font-size:12.8px">make[1]: *** [ipc.o] Error 1</div><div sty=
le=3D"font-size:12.8px">make[1]: Leaving directory &#39;/home/sahilgupta221=
/<wbr>Downloads/WireGuard-0.0.<wbr>20170706/src/tools&#39;</div><div style=
=3D"font-size:12.8px">Makefile:57: recipe for target &#39;tools&#39; failed=
</div><div style=3D"font-size:12.8px">make: *** [tools] Error 2</div><div s=
tyle=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">BUILD F=
AILED (exit value 2, total time: 22s)</div><div style=3D"font-size:12.8px">=
<br></div><div style=3D"font-size:12.8px">Any help?<br><br>Regards</div><di=
v style=3D"font-size:12.8px">Sahil Gupta</div></div>

--f403045d1ad6adeba80553ffb488--
