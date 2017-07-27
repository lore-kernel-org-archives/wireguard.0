Return-Path: pants@kent-dobias.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cd5115b
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 19:37:01 +0000 (UTC)
Received: from mail.kent-dobias.com (mail.kent-dobias.com [5.2.75.74])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 417e8ace
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Jul 2017 19:37:01 +0000 (UTC)
Date: Thu, 27 Jul 2017 15:57:34 -0400
From: Jaron Kent-Dobias <jaron-wg@kent-dobias.com>
To: wireguard@lists.zx2c4.com
Subject: Re: errors building 0.0.20170706 and later with Linux 3.14.0
Message-ID: <20170727195734.GC28775@lore.localdomain>
References: <20170727171923.GA28775@lore.localdomain>
 <CAHmME9oQe1iRQk8rdetXWioMKwUA27W1vNUdq7KTmgzjg5KE4g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0qt3EE9wi45a2ZFX"
In-Reply-To: <CAHmME9oQe1iRQk8rdetXWioMKwUA27W1vNUdq7KTmgzjg5KE4g@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--0qt3EE9wi45a2ZFX
Content-Type: multipart/mixed; boundary="0hHDr/TIsw4o3iPK"
Content-Disposition: inline


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Sorry, I was subscribed but with an different email address!

On Thu, Jul 27, 2017 at 08:08:47PM +0200, Jason A. Donenfeld wrote:
> The latest snapshot of WireGuard is 0.0.20170726. Can you tell me if
> that fixes the issue for you? Likely not, but I'd be interested in the
> newer build log.

The newer build log is attached.

> Additionally, could you tell me why you're running 3.14, and what
> package you're using to get that in Arch? Or, even better, a link to
> the kernel sources of that package.

I'm using an ARM machine, running the latest kernel built for the
Archlinux ARM project for my specific chromebook.

The kernel package: https://archlinuxarm.org/packages/armv7h/linux-veyron

Jaron


--0hHDr/TIsw4o3iPK
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="make.log"
Content-Transfer-Encoding: quoted-printable

DKMS make.log for wireguard-0.0.20170726 for kernel 3.14.0-26-ARCH (armv7l)
Wed Jul 26 08:59:37 EDT 2017
make: Entering directory '/usr/lib/modules/3.14.0-26-ARCH/build'
  LD      /var/lib/dkms/wireguard/0.0.20170726/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170726/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170726/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170726/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20170726/build/peer.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:144:0: warning: =
"netdev_alloc_pcpu_stats" redefined
 #define netdev_alloc_pcpu_stats(type)     \
=20
In file included from include/net/ip_tunnels.h:5:0,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/netdevice.h:1795:0: note: this is the location of the previou=
s definition
 #define netdev_alloc_pcpu_stats(type)    \
=20
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:307:21: error: r=
edefinition of =E2=80=98kvmalloc=E2=80=99
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:379:21: note: previous definition of =E2=80=98kvmalloc=
=E2=80=99 was here
 static inline void *kvmalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20170726/build/compat/compat.h:321:21: error: r=
edefinition of =E2=80=98kvzalloc=E2=80=99
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
In file included from include/linux/scatterlist.h:6:0,
                 from include/linux/dmaengine.h:28,
                 from include/linux/skbuff.h:31,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /var/lib/dkms/wireguard/0.0.20170726/build/compat/com=
pat.h:71,
                 from <command-line>:0:
include/linux/mm.h:387:21: note: previous definition of =E2=80=98kvzalloc=
=E2=80=99 was here
 static inline void *kvzalloc(size_t size, gfp_t flags)
                     ^~~~~~~~
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
726/build/main.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
726/build/peer.o] Error 1
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
726/build/device.o] Error 1
make[1]: *** [scripts/Makefile.build:308: /var/lib/dkms/wireguard/0.0.20170=
726/build/noise.o] Error 1
make: *** [Makefile:1298: _module_/var/lib/dkms/wireguard/0.0.20170726/buil=
d] Error 2
make: Leaving directory '/usr/lib/modules/3.14.0-26-ARCH/build'

--0hHDr/TIsw4o3iPK--

--0qt3EE9wi45a2ZFX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEESQHwQKRh1Whpo6HFI20K3+69dxoFAll6Ra4ACgkQI20K3+69
dxoZtw//TV3D95WKF0PU+ID0/gnhREdzf6JfwApxIDnjykloiIWiEPh0e1sbdvc/
BOLcUn6/UiikqVSXnli+jH6/E3migOAMqu4Rkm/cy2yuAxDnYA+a6tRofJj/hZup
bABXBq5fAJ0zvpyTuLFyvcMuXSozb3Bthl2FVMWawRmQM+ZmGABgPx7Eq2BY9K4N
EjEPqu7W3SlLnnFKJopzNPdTmuuH+CDx24EmGBnGtQPkYRM75FCSTjtUOtUlBKiz
PhcLAWwH10kajgARR+bcEaooB3gFJP8W/Epyyx/q01Ha/wX07kb0Ylcp5CNwMTpj
Sw7G608ehHRzWDk5AMvX5bzFGABuI7PqWh7DdTA7WQw9MB8EReVSvh2K2g/irZWl
DSAJWdoBkCvak1UjB00lZRnsJj7xT9VybPJi1LSlp3vh389f8jusltO3kOXFzIF7
YbBWi5mfmPJ/XuE0O+XimTihHbU15Su67Sp0uzRLoCXO1+hJE2ncOZd9PGq0OmF0
N+NKTzPy6Lw8aSy3hOT0xBaoev9yTcKRDyHwLUpFFkjIXso/4vQdhwRlXFQjwH8S
6lUHqlyl+mcVTN55go3gLfQvtt2UP0QsmUMuQhVztAMPLQOF0gnU+QjMURkOz8eV
vzCexrwQxUXcvelYFrNSC/ToW28d4jqlYs7e1APikPPYXLB/NkQ=
=GsLI
-----END PGP SIGNATURE-----

--0qt3EE9wi45a2ZFX--
