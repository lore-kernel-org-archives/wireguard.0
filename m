Return-Path: j.neuschaefer@gmx.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fcfa83a1
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 20:08:54 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77d82130
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Aug 2018 20:08:54 +0000 (UTC)
Received: from longitude ([109.91.33.86]) by mail.gmx.com (mrgmx003
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0MYg42-1fKymA2Fww-00VSB5 for
 <wireguard@lists.zx2c4.com>; Mon, 13 Aug 2018 22:20:40 +0200
Date: Mon, 13 Aug 2018 22:20:39 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: wireguard@lists.zx2c4.com
Subject: My GSoC contributions to WireGuard
Message-ID: <20180813202039.GA29306@latitude>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

over the past few months, I was a GSoC[1] student in the WireGuard project
(nominally the Linux Foundation). Together with Thomas Gschwantner and Gauv=
ain
Roussel-Tarbouriech (who were also GSoC students), and of course Jason
Donenfeld, I tried to implement some of the performance optimizations from =
the
TODO list[2].

TL;DR: Here are the commits that I contributed during that time, which were
also merged (not all of them were):
- https://git.zx2c4.com/WireGuard/commit/?h=3Db289d122d8fe935de7138f77a8495=
dca76555b0e
- https://git.zx2c4.com/WireGuard/commit/?h=3D590c41089fd77bf43efda375c0e6b=
d3913cb9350
- https://git.zx2c4.com/WireGuard/commit/?h=3D0f8718b4fcbb89abc8b8b25c09510=
e1f7fac9625
- https://git.zx2c4.com/WireGuard/commit/?h=3D18822b84f88422f11611c598a0c23=
c56652693d9
- https://git.zx2c4.com/WireGuard/commit/?h=3D6008eacbf2c7a5f31b0c9d5d0a629=
cbdfbb8f222

Our first task was to change the trie (prefix tree) used in allowedips.c[3]
to look up peers based on their IP(v6) address, to use native endianness
(little endian on the x86 systems prevalent today) instead of big endian,
which is how the bytes in a IP(v6) address are stored in a packet. This
saves a few byte swaps per lookup in situations with many peers, because the
number is reduced from one byte swap per edge of trie that was walked to one
byte swap per complete traversal through the trie.
We implemented and discussed a few versions of this optimization, and
finally Jason committed his[4], and a selftest to help ensure that the new
implementation is correct[5]. I noticed that the debugging code that can
print the allowedips trie in Graphviz[6] format was now wrong, and fixed[7]
it.

The next goal was to replace the spinlock-based ring buffer implementation[=
8]
used in WireGuard to implement the receive/transmit and encrypt/decrypt
queues with a lock-free version. For this, we looked at ConcurrencyKit[9],
and reimplemented their algorithms. However, after facing no clear
performance improvement, and in some cases, serious performance degradation,
we gave up on this goal. The code, along with a selftest[10] can be found on
the jn/mpmc-wip branch[11].

Next, I made use[12] of the NAPI[13] infrastructure of the Linux networking
subsystem, to improve the performance of the receive path, with some
success[14], but also a performance regression on some systems[15], which
Jason appears to have solved by using GRO[16] before passing packets up
through the network stack[17].
Since my integration of NAPI relied one NAPI context per WireGuard peer, and
NAPI contexts are stored in a fixed-size hashtable in the kernel[18], Thomas
disabled NAPI busy polling, thus disabling the use of this hashtable[19].
This avoids overloading the hashtable when there are many WireGuard peers.

My last task was to change WireGuard's hashtables[20] from a fixed-size
hashtable to the resizable hashtable implementation (called "rhashtable")
that's already in the upstream kernel[21]. This will save some memory when
few items are stored, and avoid overloading, and thus slowing down, the
hashtables when many items are stored. The main difficulty here stems from
the fact that WireGuard's pubkey_hashtable uses the SipHash function to be
better protected against hash collision, or "hashtable poisoning"
attacks[22], in which the hashed data is chosen in such a way that many
items are stored in the same hash bucket, slowing down lookups. SipHash uses
a 128-bit random seed to make the hashes less predictable, while the
existing rhashtable API only allows 32 bits. Thus, to properly integrate
SipHash into rhashtable, I need to extend the rhashtable API to use a longer
random seed. A work-in-progress version of this change can be found in the
linux-dev repo on git.zx2c4.com[22].


Conclusion:

I have not reached all the goals that I initially set out to reach. In
particular, here are some of the items that were part of my GSoC project
proposal:

- Reducing bufferbloat with CoDel/DQL. Since WireGuard temporarily stores
  packets in queues, and queues can add latency when they're full, it would=
 be
  interesting to try to limit the added latency with CoDel[23] or Linux's
  dynamic queue limits library (DQL)[24].
- CPU auto-scaling and NUMA awareness. Currently, WireGuard splits the
  encryption/decryption workload among all CPUs[25] currently online. For l=
ow
  packet rates it might be a good idea to stick to one CPU, to avoid pollut=
ing
  the other CPUs' caches, and possibly to avoid the other CPUs from sleep
  states. In larger systems with two or more set of CPUs, each with their o=
wn
  L3 cache and DDR memory controller, i.e. in NUMA[26] systems, it might al=
so
  be a good idea to confine WireGuard to one NUMA node, to save bus traffic.
- Performance profiling and benchmarking. I included performance profiling =
and
  benchmarking in my project proposal, because serious performance optimiza=
tion
  has to rely on benchmarks to find out which approach is *really* the fast=
est,
  and on profiling to figure out where the bottlenecks are. I did, however,=
 do
  very little in this direction, beyond running iperf3.

Even though I did not do everything I intended to do, it was nice to bring
WireGuard a bit further and learn something about optimization and the Linux
networking stack. Thanks to Jason Donenfeld, the Linux Foundation, and Goog=
le
for providing this opportunity.


Jonathan Neusch=C3=A4fer


[1]: https://summerofcode.withgoogle.com/
[2]: https://www.wireguard.com/todo/
[3]: https://git.zx2c4.com/WireGuard/tree/src/allowedips.c?h=3D0.0.20180420
[4]: https://git.zx2c4.com/WireGuard/commit/?h=3D5e3532eb1895ccdd0a53d14b47=
d7fc85234f7866
[5]: https://git.zx2c4.com/WireGuard/commit/?h=3D856f10593d2fc8b87992d9c5c5=
56ddf108d313e8
[6]: http://graphviz.org/
[7]: https://git.zx2c4.com/WireGuard/commit/?h=3Db289d122d8fe935de7138f77a8=
495dca76555b0e
[8]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/include/linux/ptr_ring.h?h=3Dv4.18-rc8
[9]: https://github.com/concurrencykit/ck/blob/0.6.0/include/ck_ring.h
[10]: https://git.zx2c4.com/WireGuard/tree/src/selftest/mpmc_ring.h?h=3Djn/=
mpmc-wip
[11]: https://git.zx2c4.com/WireGuard/log/?h=3Djn/mpmc-wip
[12]: https://git.zx2c4.com/WireGuard/commit/?h=3D6008eacbf2c7a5f31b0c9d5d0=
a629cbdfbb8f222
[13]: https://en.wikipedia.org/wiki/New_API
[14]: https://lists.zx2c4.com/pipermail/wireguard/2018-July/003115.html
[15]: https://lists.zx2c4.com/pipermail/wireguard/2018-July/003124.html
[16]: https://lwn.net/Articles/358910/
[17]: https://git.zx2c4.com/WireGuard/commit/?h=3D95951af7249912a4356b9a03c=
f3addc7e3f8f724
[18]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/net/core/dev.c?h=3Dv4.18-rc8#n193
[19]: https://git.zx2c4.com/WireGuard/commit/?h=3Dfe5f0f661797b41648eac64b4=
0e5038b25175047
[20]: https://git.zx2c4.com/WireGuard/tree/src/hashtables.h?h=3D0.0.20180802
[21]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/linux/rhashtable.h?h=3Dv4.18-rc8
[22]: https://git.zx2c4.com/linux-dev/log/?h=3Djn/rhashtable-next&id=3D6f45=
0b7f8f722dec835fe96ff5b99be98cd5622e
[23]: https://en.wikipedia.org/wiki/CoDel
[24]: https://lwn.net/Articles/454390/
[25]: https://git.zx2c4.com/WireGuard/tree/src/queueing.h?h=3D0.0.20180802#=
n119
[26]: https://en.wikipedia.org/wiki/Non-uniform_memory_access

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAltx6A8ACgkQCDBEmo7z
X9tBIBAAvgr8Rw9ivSDBW+FwB7zkfCspOrQGOEe7Jg3Tk1r5sYHj3T/mvBvQaZr0
IsQ6ECVwIFmXUHey/RNi/o4gWfyNnyqhe67pn+IwcMOTtfeCV4JYTpRzfmlZQVdR
XC0X8C/SpVeTLPkYT51XKWpoEsAA86D7a6LDVpLH++0bEGYCQXRny+ZUhrkhGTW/
xvhxLtkOYo9ihCqvmTZxTHKFRfZdBWUkilUQVo1G7++7hpeMl9Ic01ASN23vD6Xj
OTN2vI0FxKMjKqm+zAhed9KE5NBZhOqETvM/YnOc3baNwf+JkuSd2JwUnutr9FUP
WsaOrgKxbZXaipNEmnrqPNbMu+fEd96GKKiyK5Wcbazudj7aWohmj6yfWPXnV//F
jxF2tw3PJREW/I1i2FxuMeMKo2gq6IWbYTRGDDuZ8/Lmc5hpuCoO6Eims7Y4EE0T
APdA8CAKlPNkgJLV0g3Q5+k3gxeraYDm/3zA4g2ssw/QpjPMtgtn0UkMeAQFqc6V
JYY0VtGwnXKO6ixRK7KEnqBqxw9drr2jKQZz4YRHW3A6LfcULA5xHKsOdSNVSBLi
pQRmAkujhrrKXh+1zV/RVqAiPe4ID46sIMQhUvlft6cSdvnjRQ6mjp0B9ufIW2k9
Z3G64+lawpvT2MYVhFH3iNsqOQyueqieXTlqWClkqOiwpeg7dNk=
=LPji
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
