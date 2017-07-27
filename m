Return-Path: pants@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d3ff33b4
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:00:37 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9557ee7d
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 17:00:37 +0000 (UTC)
Date: Thu, 27 Jul 2017 13:21:10 -0400
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: errors building 0.0.20170706 and later with Linux 3.14.0
Message-ID: <20170727172110.GB28775@lore.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--C+ts3FVlLX8+P6JN
Content-Type: multipart/mixed; boundary="i7F3eY7HS/tUJxUd"
Content-Disposition: inline


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

I cannot install the wireguard module with dkms on one of my machines
for all tagged versions past 0.0.20170628. It runs linux 3.14.0, and
complains that kvmalloc, kvzalloc, and kvfree have been redefined in
wireguard's compat.h. The full logfile for 0.0.20170706 is attached.

Thanks in advance for any help,
Jaron


--i7F3eY7HS/tUJxUd
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="make.log"
Content-Transfer-Encoding: quoted-printable

DKMS make.log for wireguard-0.0.20170706 for kernel 3.14.0-26-ARCH (armv7l)
Mon Jul 17 20:53:41 EDT 2017
make: Entering directory '/usr/lib/modules/3.14.0-26-ARCH/build'
  LD      /var/lib/dkms/wireguard/0.0.20170706/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170706/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170706/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170706/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170706/build/peer.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:329:20: error: s=
tatic declaration of =E2=80=98kvfree=E2=80=99 follows non-static declaration
 static inline void kvfree(const void *addr)
                    ^~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:400:13: note: previous declaration of =E2=80=98kvfree=E2=
=80=99 was here
 extern void kvfree(const void *addr);
             ^~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:329:20: error: s=
tatic declaration of =E2=80=98kvfree=E2=80=99 follows non-static declaration
 static inline void kvfree(const void *addr)
                    ^~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:400:13: note: previous declaration of =E2=80=98kvfree=E2=
=80=99 was here
 extern void kvfree(const void *addr);
             ^~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:329:20: error: s=
tatic declaration of =E2=80=98kvfree=E2=80=99 follows non-static declaration
 static inline void kvfree(const void *addr)
                    ^~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:400:13: note: previous declaration of =E2=80=98kvfree=E2=
=80=99 was here
 extern void kvfree(const void *addr);
             ^~~~~~
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
706/build/main.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
706/build/device.o] Error 1
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
706/build/noise.o] Error 1
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170706/build/compat/compat.h:329:20: error: s=
tatic declaration of =E2=80=98kvfree=E2=80=99 follows non-static declaration
 static inline void kvfree(const void *addr)
                    ^~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170706/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:400:13: note: previous declaration of =E2=80=98kvfree=E2=
=80=99 was here
 extern void kvfree(const void *addr);
             ^~~~~~
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
706/build/peer.o] Error 1
make: *** [Makefile:1298: _module_/var/lib/dkms/wireguard/0.0.20170706/buil=
d] Error 2
make: Leaving directory '/usr/lib/modules/3.14.0-26-ARCH/build'

--i7F3eY7HS/tUJxUd--

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESQHwQKRh1Whpo6HFI20K3+69dxoFAll6IQUACgkQI20K3+69
dxpIGBAAjcoszWyP3hCZ+5vGCAxTgDxA34/kzwxYUwnKuXs36rkH9O9Jdf/lhQ5N
+/qlYlItPc+OcsSlXJRIJPA2o63p21yKBIM5TSs6lQ7NsfM2YAtj0lNk2oN9OtCk
lZ8kVOrmKgUIMU20T002Qg0jdR0N5YIRRNCKp5MrLEAi8GfSF3DQ5IJJz6SRtYRl
X7+O4s3LWOBt5yI+znBceSh1FCBy9GcU52FAD0BV8g2M+0RAuMPjmhPcRjHE5Fpo
cqIt4TLzsTPnVkz0GZXV5H/xM2Nbb3yy8rLqCid8jwsWVq2TlxZvKeosOESRrYAu
ntPyxEg/g465UEq7cOeVlzVruTSF/7phU/80GcIHydGitY6E9h781XvdqaGcC4gz
Zb/Mv+ULUBxVF2Bf5ClaNQWInkTxR6TIZxUyKcsiELWwR2Zq1KXk0zwZE7++fRjY
AuAWRl3hN81LaBABkA/bJ6XQ7lFsS8a+XrFNfrIj0ZHNNde+vWqosVllGAyPZaSv
z+abgSQErZD8T0HMVdwFHKtfNd0X0RVo3MN3MjJEAf57X7fPhx8BNQb2d4h1iFG5
cLcXQ4ohFs9Pzpg5MA7RDc9Yhl02YiLapO9KPwnouq7bn2SlIOwaXfmDhDGPClAd
IFchhMsZ/yLl/BOul2PcMn3sEK1WYk8iJbtTa78fNnHwk1MGRuA=
=67+Y
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
