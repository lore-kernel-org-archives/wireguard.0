Return-Path: henry.snow@nielsen.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f3445888
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 13:48:11 +0000 (UTC)
Received: from mail-pl0-x236.google.com (mail-pl0-x236.google.com
 [IPv6:2607:f8b0:400e:c01::236])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2bc00f7f
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 May 2018 13:48:11 +0000 (UTC)
Received: by mail-pl0-x236.google.com with SMTP id t12-v6so1350821plo.7
 for <wireguard@lists.zx2c4.com>; Thu, 10 May 2018 06:50:55 -0700 (PDT)
MIME-Version: 1.0
From: Henry Snow <henry.snow@nielsen.com>
Date: Thu, 10 May 2018 13:50:42 +0000
Message-ID: <CAFuSFDEeeDhDxoCLOnLmKSiPy4=6J51mf-cpg=tHS4bLRwNVmg@mail.gmail.com>
Subject: wireguard-dkms and CentOS 7.5
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000d0e5d5056bda4e43"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000d0e5d5056bda4e43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wireguard Users,

It looks like CentOS 7.5 was released recently, bringing with it new kernel
and tools versions. When installing the wireguard-dkms package from the
RHEL/CentOS7 repo, I'm seeing the following error:

make -j40 KERNELRELEASE=3D3.10.0-862.el7.x86_64 -C
/lib/modules/3.10.0-862.el7.x86_64/build
M=3D/var/lib/dkms/wireguard/0.0.20180420/build...(bad exit status: 2)
Error! Bad return status for module build on kernel: 3.10.0-862.el7.x86_64
(x86_64)
Consult /var/lib/dkms/wireguard/0.0.20180420/build/make.log for more
information.

The make.log is pasted below. Any new requirements needed to build, or is a
code change required?

DKMS make.log for wireguard-0.0.20180420 for kernel 3.10.0-862.el7.x86_64
(x86_64)
Thu May 10 09:37:05 EDT 2018
make: Entering directory `/usr/src/kernels/3.10.0-862.el7.x86_64'
  LD      /var/lib/dkms/wireguard/0.0.20180420/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/send.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/hashtables.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/allowedips.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/ratelimiter.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/cookie.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/netlink.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/crypto/curve25519.o
  CC [M]
/var/lib/dkms/wireguard/0.0.20180420/build/crypto/chacha20poly1305.o
  AS [M]
/var/lib/dkms/wireguard/0.0.20180420/build/crypto/chacha20-x86_64.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20180420/build/crypto/blake2s.o
  AS [M]
/var/lib/dkms/wireguard/0.0.20180420/build/crypto/poly1305-x86_64.o
  AS [M]  /var/lib/dkms/wireguard/0.0.20180420/build/crypto/blake2s-x86_64.=
o
  CC [M]
/var/lib/dkms/wireguard/0.0.20180420/build/compat/siphash/siphash.o
/var/lib/dkms/wireguard/0.0.20180420/build/crypto/chacha20-x86_64.o:
warning: objtool: chacha20_avx512vl()+0x3f: can't find jump dest
instruction at .text+0x2669
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error:
redefinition of =E2=80=98skb_reset_tc=E2=80=99
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from include/linux/filter.h:11:0,
                 from include/net/sock.h:67,
                 from include/linux/tcp.h:23,
                 from include/linux/ipv6.h:70,
                 from include/net/dsfield.h:11,
                 from include/net/ip_tunnels.h:12,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/net/sch_generic.h:454:20: note: previous definition of
=E2=80=98skb_reset_tc=E2=80=99 was here
 static inline void skb_reset_tc(struct sk_buff *skb)
                    ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/main.o] Error 1
make[1]: *** Waiting for unfinished jobs....
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,
                 from <command-line>:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial=
_compat.h:192:19:
error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows n=
on-static
declaration
 static inline int skb_checksum_setup(struct sk_buff *skb, bool recalculate=
)
                   ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
In file included from include/linux/ip.h:20:0,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,
                 from <command-line>:0:
include/linux/skbuff.h:3855:5: note: previous declaration of
=E2=80=98skb_checksum_setup=E2=80=99 was here
 int skb_checksum_setup(struct sk_buff *skb, bool recalculate);
     ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/peer.o] Error 1
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:
static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-sta=
tic declaration
 static inline struct nlattr **genl_family_attrbuf(const struct genl_family
*family)
                               ^
In file included from
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,
                 from <command-line>:0:
include/net/genetlink.h:77:17: note: previous declaration of
=E2=80=98genl_family_attrbuf=E2=80=99 was here
 struct nlattr **genl_family_attrbuf(const struct genl_family *family);
                 ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/noise.o] Error 1
/var/lib/dkms/wireguard/0.0.20180420/build/netlink.c: In function
=E2=80=98genetlink_init=E2=80=99:
/var/lib/dkms/wireguard/0.0.20180420/build/netlink.c:511:2: error: implicit
declaration of function =E2=80=98genl_register_family_with_ops=E2=80=99
[-Werror=3Dimplicit-function-declaration]
  return genl_register_family(&genl_family);
  ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/queueing.o] Error =
1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/device.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/hashtables.o]
Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/ratelimiter.o]
Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/allowedips.o]
Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/socket.o] Error 1
cc1: some warnings being treated as errors
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/receive.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/send.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/netlink.o] Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/timers.o] Error 1
make[1]: ***
[/var/lib/dkms/wireguard/0.0.20180420/build/crypto/curve25519.o] Error 1
make[1]: ***
[/var/lib/dkms/wireguard/0.0.20180420/build/compat/siphash/siphash.o] Error
1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/crypto/blake2s.o]
Error 1
make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/cookie.o] Error 1
make[1]: ***
[/var/lib/dkms/wireguard/0.0.20180420/build/crypto/chacha20poly1305.o]
Error 1
make: *** [_module_/var/lib/dkms/wireguard/0.0.20180420/build] Error 2
make: Leaving directory `/usr/src/kernels/3.10.0-862.el7.x86_64'
--=20
Henry Snow | Director, Site Reliability Engineering
eXelate, a Nielsen company <http://exelate.com/>
E: henry.snow@nielsen.com | M: 347.366.2700
675 6th Ave, 3rd Floor, New York, NY 10010

--000000000000d0e5d5056bda4e43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Wireguard Users,</div><div><br></div><div>It looks=
 like CentOS 7.5 was released recently, bringing with it new kernel and too=
ls versions. When installing the wireguard-dkms package from the RHEL/CentO=
S7 repo, I&#39;m seeing the following error:</div><div><br></div><div><div>=
make -j40 KERNELRELEASE=3D3.10.0-862.el7.x86_64 -C /lib/modules/3.10.0-862.=
el7.x86_64/build M=3D/var/lib/dkms/wireguard/0.0.20180420/build...(bad exit=
 status: 2)</div><div>Error! Bad return status for module build on kernel: =
3.10.0-862.el7.x86_64 (x86_64)</div><div>Consult /var/lib/dkms/wireguard/0.=
0.20180420/build/make.log for more information.</div></div><div><br></div><=
div>The make.log is pasted below. Any new requirements needed to build, or =
is a code change required?=C2=A0</div><div><br></div><div><div>DKMS make.lo=
g for wireguard-0.0.20180420 for kernel 3.10.0-862.el7.x86_64 (x86_64)</div=
><div>Thu May 10 09:37:05 EDT 2018</div><div>make: Entering directory `/usr=
/src/kernels/3.10.0-862.el7.x86_64&#39;</div><div>=C2=A0 LD=C2=A0 =C2=A0 =
=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/built-in.o</div><div>=C2=
=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/main.o</div><di=
v>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/noise.o</d=
iv><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/devi=
ce.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/bui=
ld/peer.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.2018042=
0/build/timers.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.=
20180420/build/queueing.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireg=
uard/0.0.20180420/build/send.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/=
wireguard/0.0.20180420/build/receive.o</div><div>=C2=A0 CC [M]=C2=A0 /var/l=
ib/dkms/wireguard/0.0.20180420/build/socket.o</div><div>=C2=A0 CC [M]=C2=A0=
 /var/lib/dkms/wireguard/0.0.20180420/build/hashtables.o</div><div>=C2=A0 C=
C [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/allowedips.o</div><d=
iv>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/ratelimit=
er.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/bui=
ld/cookie.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180=
420/build/netlink.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0=
.0.20180420/build/crypto/curve25519.o</div><div>=C2=A0 CC [M]=C2=A0 /var/li=
b/dkms/wireguard/0.0.20180420/build/crypto/chacha20poly1305.o</div><div>=C2=
=A0 AS [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/crypto/chacha20=
-x86_64.o</div><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.2018042=
0/build/crypto/blake2s.o</div><div>=C2=A0 AS [M]=C2=A0 /var/lib/dkms/wiregu=
ard/0.0.20180420/build/crypto/poly1305-x86_64.o</div><div>=C2=A0 AS [M]=C2=
=A0 /var/lib/dkms/wireguard/0.0.20180420/build/crypto/blake2s-x86_64.o</div=
><div>=C2=A0 CC [M]=C2=A0 /var/lib/dkms/wireguard/0.0.20180420/build/compat=
/siphash/siphash.o</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/cry=
pto/chacha20-x86_64.o: warning: objtool: chacha20_avx512vl()+0x3f: can&#39;=
t find jump dest instruction at .text+0x2669</div><div>In file included fro=
m &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/=
build/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from /var/lib/dkms/wireguard/0.0.20=
180420/build/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/v=
ar/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial_c=
ompat.h:192:19: error: static declaration of =E2=80=98skb_checksum_setup=E2=
=80=99 follows non-static declaration</div><div>=C2=A0static inline int skb=
_checksum_setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In f=
ile included from include/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:=
11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from include/net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420=
/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/=
sch_generic.h:454:20: note: previous definition of =E2=80=98skb_reset_tc=E2=
=80=99 was here</div><div>=C2=A0static inline void skb_reset_tc(struct sk_b=
uff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^</div><div>In file included from include/linux/ip.h:20:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaration of =
=E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_check=
sum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =
=C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.2018042=
0/build/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib=
/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial_compat.=
h:192:19: error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99=
 follows non-static declaration</div><div>=C2=A0static inline int skb_check=
sum_setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file =
included from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:17=
7:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180=
420/build/compat/checksum/checksum_partial_compat.h:192:19: error: static d=
eclaration of =E2=80=98skb_checksum_setup=E2=80=99 follows non-static decla=
ration</div><div>=C2=A0static inline int skb_checksum_setup(struct sk_buff =
*skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from include/linux=
/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;comm=
and-line&gt;:0:</div><div>include/linux/skbuff.h:3855:5: note: previous dec=
laration of =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0i=
nt skb_checksum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0=
:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:=
31: error: static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 foll=
ows non-static declaration</div><div>=C2=A0static inline struct nlattr **ge=
nl_family_attrbuf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wir=
eguard/0.0.20180420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0=
:</div><div>include/net/genetlink.h:77:17: note: previous declaration of =
=E2=80=98genl_family_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlatt=
r **genl_family_attrbuf(const struct genl_family *family);</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file=
 included from include/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/com=
pat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/linux/skbuff.h=
:3855:5: note: previous declaration of =E2=80=98skb_checksum_setup=E2=80=99=
 was here</div><div>=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool =
recalculate);</div><div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file included fr=
om /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;=
command-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/co=
mpat/checksum/checksum_partial_compat.h:192:19: error: static declaration o=
f =E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</div>=
<div>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bool r=
ecalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20:0,=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib=
/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&g=
t;:0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaration o=
f =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_che=
cksum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0=
 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div><di=
v>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:=
 static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-st=
atic declaration</div><div>=C2=A0static inline struct nlattr **genl_family_=
attrbuf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/=
0.0.20180420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div>=
<div>include/net/genetlink.h:77:17: note: previous declaration of =E2=80=98=
genl_family_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_=
family_attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.2018=
0420/build/compat/compat.h:445:31: error: static declaration of =E2=80=98ge=
nl_family_attrbuf=E2=80=99 follows non-static declaration</div><div>=C2=A0s=
tatic inline struct nlattr **genl_family_attrbuf(const struct genl_family *=
family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file =
included from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:43=
9:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from &lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: no=
te: previous declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here<=
/div><div>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_famil=
y *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div>=
<div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: err=
or: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0static i=
nline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file inclu=
ded from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20=
180420/build/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_re=
set_tc=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_b=
uff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ^</div><div>In file included from &lt;command-line&gt;:0:0:<=
/div><div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20=
: error: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0sta=
tic inline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file=
 included from include/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from incl=
ude/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om include/net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/bu=
ild/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/sch=
_generic.h:454:20: note: previous definition of =E2=80=98skb_reset_tc=E2=80=
=99 was here</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff=
 *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0=
,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6=
.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/=
lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-lin=
e&gt;:0:</div><div>include/net/sch_generic.h:454:20: note: previous definit=
ion of =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inlin=
e void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included =
from include/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/=
tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/=
net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/=
compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/sch_generic.h:=
454:20: note: previous definition of =E2=80=98skb_reset_tc=E2=80=99 was her=
e</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ^</div><div>In file included from &lt;command-line&gt;:0:0:</div><div>/var=
/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: stati=
c declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static d=
eclaration</div><div>=C2=A0static inline struct nlattr **genl_family_attrbu=
f(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.201=
80420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>in=
clude/net/genetlink.h:77:17: note: previous declaration of =E2=80=98genl_fa=
mily_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_family_=
attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from =
&lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/bu=
ild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=E2=
=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from inc=
lude/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:70,<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fro=
m include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;co=
mmand-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/comp=
at/checksum/checksum_partial_compat.h:192:19: error: static declaration of =
=E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</div><d=
iv>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bool rec=
alculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0=
.20180420/build/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><di=
v>/var/lib/dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_parti=
al_compat.h:192:19: error: static declaration of =E2=80=98skb_checksum_setu=
p=E2=80=99 follows non-static declaration</div><div>=C2=A0static inline int=
 skb_checksum_setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>=
In file included from /var/lib/dkms/wireguard/0.0.20180420/build/compat/com=
pat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.=
0.20180420/build/compat/checksum/checksum_partial_compat.h:192:19: error: s=
tatic declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows non-stati=
c declaration</div><div>=C2=A0static inline int skb_checksum_setup(struct s=
k_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from includ=
e/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels=
.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &l=
t;command-line&gt;:0:</div><div>include/linux/skbuff.h:3855:5: note: previo=
us declaration of =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=
=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool recalculate);</div><=
div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file included from &lt;command-line&=
gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat=
.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=
=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div=
>In file included from include/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h=
:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from include/net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420=
/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/linu=
x/skbuff.h:3855:5: note: previous declaration of =E2=80=98skb_checksum_setu=
p=E2=80=99 was here</div><div>=C2=A0int skb_checksum_setup(struct sk_buff *=
skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file i=
ncluded from include/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from incl=
ude/net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat=
/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/linux/skbuff.h:=
3855:5: note: previous declaration of =E2=80=98skb_checksum_setup=E2=80=99 =
was here</div><div>=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool r=
ecalculate);</div><div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file included fro=
m include/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/t=
cp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/=
net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/=
compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/sch_generic.h:=
454:20: note: previous definition of =E2=80=98skb_reset_tc=E2=80=99 was her=
e</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ^</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/bui=
ld/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkm=
s/wireguard/0.0.20180420/build/compat/checksum/checksum_partial_compat.h:19=
2:19: error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 fol=
lows non-static declaration</div><div>=C2=A0static inline int skb_checksum_=
setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file includ=
ed from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 &lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/bui=
ld/compat/checksum/checksum_partial_compat.h:192:19: error: static declarat=
ion of =E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration<=
/div><div>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, b=
ool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:2=
0:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/l=
ib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-lin=
e&gt;:0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaratio=
n of =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_=
checksum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20:0,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from incl=
ude/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/w=
ireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</=
div><div>include/linux/skbuff.h:3855:5: note: previous declaration of =E2=
=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_checksum=
_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div><div>/v=
ar/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: sta=
tic declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static=
 declaration</div><div>=C2=A0static inline struct nlattr **genl_family_attr=
buf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div>=
<div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: err=
or: static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non=
-static declaration</div><div>=C2=A0static inline struct nlattr **genl_fami=
ly_attrbuf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/=
0.0.20180420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div>=
<div>include/net/genetlink.h:77:17: note: previous declaration of =E2=80=98=
genl_family_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_=
family_attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
&lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: prev=
ious declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><di=
v>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_family *famil=
y);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div><div>/v=
ar/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: sta=
tic declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static=
 declaration</div><div>=C2=A0static inline struct nlattr **genl_family_attr=
buf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div>=
<div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: err=
or: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0static i=
nline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file inclu=
ded from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fro=
m &lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: pr=
evious declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><=
div>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_family *fam=
ily);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from include/linux/filter.h:11:0,</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include=
/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:70,</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from in=
clude/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wire=
guard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div=
><div>include/net/sch_generic.h:454:20: note: previous definition of =E2=80=
=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void skb_re=
set_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from /var/l=
ib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command=
-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/ch=
ecksum/checksum_partial_compat.h:192:19: error: static declaration of =E2=
=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</div><div>=
=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bool recalc=
ulate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</d=
iv><div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: =
error: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0stati=
c inline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file in=
cluded from include/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include=
/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from i=
nclude/net/ip_tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/=
compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/sch_gen=
eric.h:454:20: note: previous definition of =E2=80=98skb_reset_tc=E2=80=99 =
was here</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *sk=
b)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 ^</div><div>In file included from &lt;command-line&gt;:0:0:</div><d=
iv>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error=
: redefinition of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0static inl=
ine void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file includ=
ed from include/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/=
net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/com=
pat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from &lt;command-line&gt;:0:</div><div>include/linux/skbuff.h:3855:5=
: note: previous declaration of =E2=80=98skb_checksum_setup=E2=80=99 was he=
re</div><div>=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool recalcu=
late);</div><div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file included from incl=
ude/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:2=
3,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_=
tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.=
h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from &lt;command-line&gt;:0:</div><div>include/net/sch_generic.h:454:20:=
 note: previous definition of =E2=80=98skb_reset_tc=E2=80=99 was here</div>=
<div>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</di=
v><div>In file included from &lt;command-line&gt;:0:0:</div><div>/var/lib/d=
kms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: static decl=
aration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static declara=
tion</div><div>=C2=A0static inline struct nlattr **genl_family_attrbuf(cons=
t struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/n=
et/genetlink.h:77:17: note: previous declaration of =E2=80=98genl_family_at=
trbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_family_attrbuf=
(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from &lt;com=
mand-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/com=
pat/compat.h:445:31: error: static declaration of =E2=80=98genl_family_attr=
buf=E2=80=99 follows non-static declaration</div><div>=C2=A0static inline s=
truct nlattr **genl_family_attrbuf(const struct genl_family *family)</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from =
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;com=
mand-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: previous de=
claration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><div>=C2=
=A0struct nlattr **genl_family_attrbuf(const struct genl_family *family);</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</d=
iv><div>In file included from &lt;command-line&gt;:0:0:</div><div>/var/lib/=
dkms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error: redefiniti=
on of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0static inline void skb=
_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from inclu=
de/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23=
,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_=
tunnels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.=
h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from &lt;command-line&gt;:0:</div><div>include/net/sch_generic.h:454:20:=
 note: previous definition of =E2=80=98skb_reset_tc=E2=80=99 was here</div>=
<div>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</di=
v><div>In file included from &lt;command-line&gt;:0:0:</div><div>/var/lib/d=
kms/wireguard/0.0.20180420/build/compat/compat.h:115:20: error: redefinitio=
n of =E2=80=98skb_reset_tc=E2=80=99</div><div>=C2=A0static inline void skb_=
reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from includ=
e/linux/filter.h:11:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/linux/ipv6.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tun=
nels.h:12,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:8=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from &lt;command-line&gt;:0:</div><div>include/net/sch_generic.h:454:20: no=
te: previous definition of =E2=80=98skb_reset_tc=E2=80=99 was here</div><di=
v>=C2=A0static inline void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><=
div>In file included from /var/lib/dkms/wireguard/0.0.20180420/build/compat=
/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireguar=
d/0.0.20180420/build/compat/checksum/checksum_partial_compat.h:192:19: erro=
r: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows non-s=
tatic declaration</div><div>=C2=A0static inline int skb_checksum_setup(stru=
ct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from =
&lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/bu=
ild/compat/compat.h:445:31: error: static declaration of =E2=80=98genl_fami=
ly_attrbuf=E2=80=99 follows non-static declaration</div><div>=C2=A0static i=
nline struct nlattr **genl_family_attrbuf(const struct genl_family *family)=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
&lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: prev=
ious declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><di=
v>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_family *famil=
y);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from include/linux/ip.h:20:0,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/lin=
ux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguar=
d/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><di=
v>include/linux/skbuff.h:3855:5: note: previous declaration of =E2=80=98skb=
_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_checksum_setup(st=
ruct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =C2=A0^</div>=
<div>In file included from /var/lib/dkms/wireguard/0.0.20180420/build/compa=
t/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireg=
uard/0.0.20180420/build/compat/checksum/checksum_partial_compat.h:192:19: e=
rror: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follows no=
n-static declaration</div><div>=C2=A0static inline int skb_checksum_setup(s=
truct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from=
 &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_tc=
=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff *s=
kb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;co=
mmand-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/comp=
at/checksum/checksum_partial_compat.h:192:19: error: static declaration of =
=E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</div><d=
iv>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bool rec=
alculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20:0,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaration of =
=E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_check=
sum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =
=C2=A0^</div><div>In file included from include/linux/ip.h:20:0,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/=
linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/wire=
guard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div=
><div>include/linux/skbuff.h:3855:5: note: previous declaration of =E2=80=
=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_checksum_se=
tup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =C2=A0^=
</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/build=
/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkms/w=
ireguard/0.0.20180420/build/compat/checksum/checksum_partial_compat.h:192:1=
9: error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 follow=
s non-static declaration</div><div>=C2=A0static inline int skb_checksum_set=
up(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
&lt;command-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/buil=
d/compat/checksum/checksum_partial_compat.h:192:19: error: static declarati=
on of =E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</=
div><div>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bo=
ol recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20=
:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/l=
ib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-lin=
e&gt;:0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaratio=
n of =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_=
checksum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20:0,</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from incl=
ude/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dkms/w=
ireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</=
div><div>include/linux/skbuff.h:3855:5: note: previous declaration of =E2=
=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_checksum=
_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div><div>/v=
ar/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: sta=
tic declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static=
 declaration</div><div>=C2=A0static inline struct nlattr **genl_family_attr=
buf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.201=
80420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>in=
clude/net/genetlink.h:77:17: note: previous declaration of =E2=80=98genl_fa=
mily_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_family_=
attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from =
&lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/bu=
ild/compat/compat.h:445:31: error: static declaration of =E2=80=98genl_fami=
ly_attrbuf=E2=80=99 follows non-static declaration</div><div>=C2=A0static i=
nline struct nlattr **genl_family_attrbuf(const struct genl_family *family)=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from =
&lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: prev=
ious declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><di=
v>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_family *famil=
y);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/=
dkms/wireguard/0.0.20180420/build/compat/checksum/checksum_partial_compat.h=
:192:19: error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 =
follows non-static declaration</div><div>=C2=A0static inline int skb_checks=
um_setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file inc=
luded from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.=
20180420/build/compat/compat.h:445:31: error: static declaration of =E2=80=
=98genl_family_attrbuf=E2=80=99 follows non-static declaration</div><div>=
=C2=A0static inline struct nlattr **genl_family_attrbuf(const struct genl_f=
amily *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>I=
n file included from /var/lib/dkms/wireguard/0.0.20180420/build/compat/comp=
at.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77=
:17: note: previous declaration of =E2=80=98genl_family_attrbuf=E2=80=99 wa=
s here</div><div>=C2=A0struct nlattr **genl_family_attrbuf(const struct gen=
l_family *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from include/linux/ip.h:20:0,=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr=
om include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:4,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib=
/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&g=
t;:0:</div><div>include/linux/skbuff.h:3855:5: note: previous declaration o=
f =E2=80=98skb_checksum_setup=E2=80=99 was here</div><div>=C2=A0int skb_che=
cksum_setup(struct sk_buff *skb, bool recalculate);</div><div>=C2=A0 =C2=A0=
 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div><di=
v>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error:=
 static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-st=
atic declaration</div><div>=C2=A0static inline struct nlattr **genl_family_=
attrbuf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/=
0.0.20180420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div>=
<div>include/net/genetlink.h:77:17: note: previous declaration of =E2=80=98=
genl_family_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_=
family_attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.2018=
0420/build/compat/compat.h:445:31: error: static declaration of =E2=80=98ge=
nl_family_attrbuf=E2=80=99 follows non-static declaration</div><div>=C2=A0s=
tatic inline struct nlattr **genl_family_attrbuf(const struct genl_family *=
family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file =
included from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:43=
9:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0from &lt;command-line&gt;:0:</div><div>include/net/genetlink.h:77:17: no=
te: previous declaration of =E2=80=98genl_family_attrbuf=E2=80=99 was here<=
/div><div>=C2=A0struct nlattr **genl_family_attrbuf(const struct genl_famil=
y *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^</div><div>In file included from &lt;command-line&gt;:0:0:</div>=
<div>/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: err=
or: static declaration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non=
-static declaration</div><div>=C2=A0static inline struct nlattr **genl_fami=
ly_attrbuf(const struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^</div><div>In file included from /var/lib/dkms/wireguard/=
0.0.20180420/build/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div>=
<div>include/net/genetlink.h:77:17: note: previous declaration of =E2=80=98=
genl_family_attrbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_=
family_attrbuf(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file include=
d from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.2018=
0420/build/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_rese=
t_tc=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buf=
f *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0=
,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
rom include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6=
.h:70,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/=
lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-lin=
e&gt;:0:</div><div>include/net/sch_generic.h:454:20: note: previous definit=
ion of =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inlin=
e void skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included =
from &lt;command-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.201804=
20/build/compat/compat.h:115:20: error: redefinition of =E2=80=98skb_reset_=
tc=E2=80=99</div><div>=C2=A0static inline void skb_reset_tc(struct sk_buff =
*skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 ^</div><div>In file included from include/linux/filter.h:11:0,</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from=
 include/net/sock.h:67,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0from include/linux/tcp.h:23,</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/ipv6.h:7=
0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
from include/net/dsfield.h:11,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tunnels.h:12,</div><div>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /var/lib/dk=
ms/wireguard/0.0.20180420/build/compat/compat.h:80,</div><div>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:=
0:</div><div>include/net/sch_generic.h:454:20: note: previous definition of=
 =E2=80=98skb_reset_tc=E2=80=99 was here</div><div>=C2=A0static inline void=
 skb_reset_tc(struct sk_buff *skb)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>In file included from=
 /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:177:0,</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;co=
mmand-line&gt;:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/comp=
at/checksum/checksum_partial_compat.h:192:19: error: static declaration of =
=E2=80=98skb_checksum_setup=E2=80=99 follows non-static declaration</div><d=
iv>=C2=A0static inline int skb_checksum_setup(struct sk_buff *skb, bool rec=
alculate)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0^</div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.2018042=
0/build/main.o] Error 1</div><div>make[1]: *** Waiting for unfinished jobs.=
...</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/bu=
ild/compat/compat.h:177:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>/var/lib/dkm=
s/wireguard/0.0.20180420/build/compat/checksum/checksum_partial_compat.h:19=
2:19: error: static declaration of =E2=80=98skb_checksum_setup=E2=80=99 fol=
lows non-static declaration</div><div>=C2=A0static inline int skb_checksum_=
setup(struct sk_buff *skb, bool recalculate)</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file includ=
ed from include/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/=
net/ip_tunnels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/com=
pat.h:80,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from &lt;command-line&gt;:0:</div><div>include/linux/skbuff.h:3855:5=
: note: previous declaration of =E2=80=98skb_checksum_setup=E2=80=99 was he=
re</div><div>=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool recalcu=
late);</div><div>=C2=A0 =C2=A0 =C2=A0^</div><div>In file included from incl=
ude/linux/ip.h:20:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0from include/linux/if_tunnel.h:4,</div><div>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from include/net/ip_tun=
nels.h:4,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0from /var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:80,<=
/div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fro=
m &lt;command-line&gt;:0:</div><div>include/linux/skbuff.h:3855:5: note: pr=
evious declaration of =E2=80=98skb_checksum_setup=E2=80=99 was here</div><d=
iv>=C2=A0int skb_checksum_setup(struct sk_buff *skb, bool recalculate);</di=
v><div>=C2=A0 =C2=A0 =C2=A0^</div><div>make[1]: *** [/var/lib/dkms/wireguar=
d/0.0.20180420/build/peer.o] Error 1</div><div>In file included from &lt;co=
mmand-line&gt;:0:0:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/co=
mpat/compat.h:445:31: error: static declaration of =E2=80=98genl_family_att=
rbuf=E2=80=99 follows non-static declaration</div><div>=C2=A0static inline =
struct nlattr **genl_family_attrbuf(const struct genl_family *family)</div>=
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>In file included from =
/var/lib/dkms/wireguard/0.0.20180420/build/compat/compat.h:439:0,</div><div=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;com=
mand-line&gt;:0:</div><div>include/net/genetlink.h:77:17: note: previous de=
claration of =E2=80=98genl_family_attrbuf=E2=80=99 was here</div><div>=C2=
=A0struct nlattr **genl_family_attrbuf(const struct genl_family *family);</=
div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</d=
iv><div>In file included from &lt;command-line&gt;:0:0:</div><div>/var/lib/=
dkms/wireguard/0.0.20180420/build/compat/compat.h:445:31: error: static dec=
laration of =E2=80=98genl_family_attrbuf=E2=80=99 follows non-static declar=
ation</div><div>=C2=A0static inline struct nlattr **genl_family_attrbuf(con=
st struct genl_family *family)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^</div><div>In file included from /var/lib/dkms/wireguard/0.0.20180420/b=
uild/compat/compat.h:439:0,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0from &lt;command-line&gt;:0:</div><div>include/n=
et/genetlink.h:77:17: note: previous declaration of =E2=80=98genl_family_at=
trbuf=E2=80=99 was here</div><div>=C2=A0struct nlattr **genl_family_attrbuf=
(const struct genl_family *family);</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>make[1]: *** [/var/lib/dkms/w=
ireguard/0.0.20180420/build/noise.o] Error 1</div><div>/var/lib/dkms/wiregu=
ard/0.0.20180420/build/netlink.c: In function =E2=80=98genetlink_init=E2=80=
=99:</div><div>/var/lib/dkms/wireguard/0.0.20180420/build/netlink.c:511:2: =
error: implicit declaration of function =E2=80=98genl_register_family_with_=
ops=E2=80=99 [-Werror=3Dimplicit-function-declaration]</div><div>=C2=A0 ret=
urn genl_register_family(&amp;genl_family);</div><div>=C2=A0 ^</div><div>ma=
ke[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/queueing.o] Error 1<=
/div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/device.o=
] Error 1</div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/buil=
d/hashtables.o] Error 1</div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0=
.20180420/build/ratelimiter.o] Error 1</div><div>make[1]: *** [/var/lib/dkm=
s/wireguard/0.0.20180420/build/allowedips.o] Error 1</div><div>make[1]: ***=
 [/var/lib/dkms/wireguard/0.0.20180420/build/socket.o] Error 1</div><div>cc=
1: some warnings being treated as errors</div><div>make[1]: *** [/var/lib/d=
kms/wireguard/0.0.20180420/build/receive.o] Error 1</div><div>make[1]: *** =
[/var/lib/dkms/wireguard/0.0.20180420/build/send.o] Error 1</div><div>make[=
1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/netlink.o] Error 1</div=
><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/timers.o] Er=
ror 1</div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/cr=
ypto/curve25519.o] Error 1</div><div>make[1]: *** [/var/lib/dkms/wireguard/=
0.0.20180420/build/compat/siphash/siphash.o] Error 1</div><div>make[1]: ***=
 [/var/lib/dkms/wireguard/0.0.20180420/build/crypto/blake2s.o] Error 1</div=
><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/cookie.o] Er=
ror 1</div><div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20180420/build/cr=
ypto/chacha20poly1305.o] Error 1</div><div>make: *** [_module_/var/lib/dkms=
/wireguard/0.0.20180420/build] Error 2</div><div>make: Leaving directory `/=
usr/src/kernels/3.10.0-862.el7.x86_64&#39;</div></div></div>-- <br><div dir=
=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div =
dir=3D"ltr"><font color=3D"#808080" style=3D"line-height:normal;font-family=
:cantarell">Henry Snow | Director, Site Reliability Engineering</font><div>=
<font color=3D"#808080" style=3D"line-height:normal;font-family:cantarell">=
<a href=3D"http://exelate.com/">eXelate, a Nielsen company</a></font><br st=
yle=3D"line-height:normal;color:rgb(0,0,0);font-family:cantarell"><font col=
or=3D"#808080" style=3D"line-height:normal;font-family:cantarell">E:=C2=A0<=
a href=3D"mailto:henry.snow@nielsen.com">henry.snow@nielsen.com</a>=C2=A0|=
=C2=A0</font><span style=3D"color:rgb(128,128,128);font-family:cantarell;li=
ne-height:normal">M: 347.366.2700</span><br style=3D"line-height:normal;col=
or:rgb(0,0,0);font-family:cantarell"><font color=3D"#808080" style=3D"line-=
height:normal;font-family:cantarell">675 6th Ave, 3rd Floor, New York, NY 1=
0010=C2=A0</font><br></div></div></div>

--000000000000d0e5d5056bda4e43--
