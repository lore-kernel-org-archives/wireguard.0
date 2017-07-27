Return-Path: pants@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1e839fe5
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:58:51 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65046308
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 16:58:51 +0000 (UTC)
Date: Thu, 27 Jul 2017 13:19:23 -0400
From: Jaron Kent-Dobias <jaron@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: errors building 0.0.20170706 and later with Linux 3.14.0
Message-ID: <20170727171923.GA28775@lore.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qcHopEYAB45HaUaB"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--qcHopEYAB45HaUaB
Content-Type: multipart/mixed; boundary="VbJkn9YxBvnuCH5J"
Content-Disposition: inline


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Hello,

I cannot install the wireguard module with dkms on one of my machines
for all tagged versions past 0.0.20170628. It runs linux 3.14.0, and
complains that kvmalloc, kvzalloc, and kvfree have been redefined in
wireguard's compat.h. The full logfile for 0.0.20170706 is attached.

Thanks in advance for any help,
Jaron


--VbJkn9YxBvnuCH5J
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

--VbJkn9YxBvnuCH5J--

--qcHopEYAB45HaUaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESQHwQKRh1Whpo6HFI20K3+69dxoFAll6IJsACgkQI20K3+69
dxregw/+Lr0Om43n0ylly7KmvzaHhAh56/HYmPDshnHbIWn7b6Med8gjUpkkkpRj
Y9zRT+A0OZ8K9vpLDZz1RbSjlZ25GUIJDgo5icHRryrNC5oRdhnCYR8TV5WvPNa5
yMXngWSnocoU946ozZEo8XeFaLp88BIcMkK3jJHBrWGQAx0Qr8/ozMLH3rnojxed
s4CWLfQOPR+aJ19iSyOQbnq/1qPNFICavpIvbDujn3pjVvojlk2aEkJDwv9IfOq4
2SqtL1C2tJfHRwNNqTFa0g6YIjNLsjR4pL4WQgPHtnBqmIYt93UdEq5xYtE2jTd9
e8rNI3Js5mHvvbdtNWmqN3Y/El3QF292212qID9Bq58mRU6Uk8Jyr8ahJi6CSQRp
G05P2pQ4z90c8k3/32WQwd5h3ACnx6mXnQxC3/Mo2BM7DWStItb8/+u2+FSq009m
e1CC1qj2yFywJhe3ilUvCNUh+qhWrRxibrvzoy84y7f+yZbz0agNnITO636b7ZRY
+VOQLG3ww/7iNdyVFlFTQUSkWVlaR7jLy9mkm1mDJBOz06C6mYDEAV82Uq6IliMA
lD2VJVAuf02RwromYRB3n1jIibA0jNwXVJ0JJ0yH9OWLJnvNlFDcsipxvYccMdKC
QrQQZ0Hv55du0Fm0jy2Qkmi6OAG3sdx0reHPraEqs8BkNqbLqE0=
=P1ox
-----END PGP SIGNATURE-----

--qcHopEYAB45HaUaB--
