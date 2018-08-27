Return-Path: tharre3@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a720b25e
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 21:16:46 +0000 (UTC)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d30cc214
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Aug 2018 21:16:46 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id s12-v6so383427ljj.0
 for <wireguard@lists.zx2c4.com>; Mon, 27 Aug 2018 14:30:21 -0700 (PDT)
Return-Path: <tharre3@gmail.com>
Received: from localhost (h082218211111.host.wavenet.at. [82.218.211.111])
 by smtp.gmail.com with ESMTPSA id b80-v6sm49575lfe.83.2018.08.27.14.30.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 27 Aug 2018 14:30:18 -0700 (PDT)
Date: Mon, 27 Aug 2018 23:30:17 +0200
From: Thomas Gschwantner <tharre3@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: WireGuard GSoC 2018 Report
Message-ID: <20180827212929.GA3633@xultrabook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi there, my name is Thomas Gschwantner and this is my report for the work =
I've
done on WireGuard, for the GSoC 2018.

Before GSoC even started proper, Jason asked us to work on a small fix rega=
rding
the endianness of the trie used to store IPs in `allowedips.c`.  Previously,
they'd be stored in network byte order (big endian), meaning on little endi=
an
system there would be unnecessary conversions.  The main point of this was
probably to get everyone up and running in terms of setting up and working =
with
the WireGuard codebase.

The next task was developing and testing a replacement for the ring buffer
implementation in the kernel ([ptr_ring.h]) that is lock-free.  For that we
consulted a userspace implementation called [Concurrency Kit].  Since the t=
ask
was rather hard but would result in relatively little code, Jason suggested
Jonathan Neusch=E4fer and I work on it separately at the start, merging the=
 code
later, which we did.  My own version, before any merging happened, can be f=
ound
[here][mpmc_premerge].

The task proved challenging, because the concurrency kit implementation made
heavy use of macros and uses different semantics for atomic operations and
memory barriers than the linux kernel.  Another problem we ran into was ker=
nel
deadlocks, that only happened in specific situations while testing. We ulti=
mately
determined that the cause for them was unfortunate scheduling of the kthrea=
ds by
the kernel, that caused concurrent producers to be stuck waiting for each o=
ther
for a long time.  This was ultimately solved by disabling [preemption].

While the performance of the final implementation was better when directly
compared to the other one in regards to raw produce/consume performance, wh=
en
benchmarking WireGuard as a hole it performed the same or slightly worse.  =
The
reason for this is likely the way WireGuard processes packets, which consum=
es
items from the queue one-by-one. As a result, the [final version] has not b=
een
merged yet.  This may change in the future however, if the consumers can be=
 made
to run multithreaded.

Next we worked on making WireGuard take advantage of [NAPI], a kernel inter=
nal API
designed to reduce the overhead of receiving packets.  I worked on this for=
 some
time, but Jonathan ended up being faster than me with his
[solution][jonathan_napi].  My (naturally unfinished) version can be found
[here][tharre_napi].  This tasks involved **a lot** of reading kernel
code to figure out how NAPI works since all available documentation is eith=
er
outdated or simply nonexistent.  I also ended up doing a lot of benchmarkin=
g,
since many solutions we came up with had unfavourable performance
characteristics.

While working on this we also bumped into an interesting problem with the N=
API,
that involved [napi_hash], a hashtable used by [busy polling].  Because we =
used
one napi_struct per WireGuard peer, there was concern that this hashtable w=
ould
blow up in larger deployments.  I ended up solving this problem, after much
research, in a [deceivingly simple commit][napi_busy_fix].

Lastly, I worked on implementing a new socket option, `SO_ZERO_ON_FREE`, th=
at
would cause all sk_buffs to be securely zeroed out when freed.  While I got=
 a
simple version of this working very quickly, I could only make it work on
`AF_UNIX` and `AF_INET`, but not on `AF_ALG` and other netlink sockets, whi=
ch I
assumed would be the primary usage for this option.  The reason for that wa=
s, as
I found out after much debugging and digging in crypto/, that the correspon=
ding
kernel code wasn't even using sk_buffs.  Instead, the code would lock the s=
ocket
directly, and then use [memcpy_to_msg] to copy the data to userspace.

The code for this can be found [here][skb_memzero], however it is not quite
finished yet as I haven't been able to find a more general way of setting t=
he
`zero_on_free` bit on sk_buffs for all socket types yet.

# Conclusion

Working on WireGuard definitely was a ton of fun and I also learned **a lot=
**
about kernel development.  Thanks a lot to Jason A. Donenfeld for providing
mentorship, and his work on WireGuard in general, that made all of this
possible.

Also check out the reports of my fellow GSoC students, Gauvain
[Roussel-Tarbouriech] and [Jonathan Neusch=E4fer].

[ptr_ring.h]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/tree/include/linux/ptr_ring.h
[Concurrency Kit]: http://concurrencykit.org/
[mpmc_premerge]: https://git.zx2c4.com/WireGuard/log/?h=3Dtg/mpmc_ring
[preemption]: https://git.zx2c4.com/WireGuard/commit/?h=3Dtg/mpmc-benchmark=
&id=3D9ced23773059b0e96daba64dd12ac60327d0d14e
[final version]: https://git.zx2c4.com/WireGuard/log/?h=3Dtg/mpmc-benchmark
[napi]: https://wiki.linuxfoundation.org/networking/napi
[jonathan_napi]: https://git.zx2c4.com/WireGuard/commit/?id=3D6008eacbf2c7a=
5f31b0c9d5d0a629cbdfbb8f222
[tharre_napi]: https://gist.githubusercontent.com/Tharre/11e11afb99ddb6095d=
4de8269fe8ea72/raw/0da04f14634cfb3e7f7520307363d0a5dc6f2bfe/wireguard_gsoc_=
napi.diff
[napi_hash]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit/tree/net/core/dev.c?id=3D7effaf06c3cdef6855e127886c7405b9ab62f90d#n1=
97
[busy polling]: https://netdevconf.org/2.1/slides/apr6/dumazet-BUSY-POLLING=
-Netdev-2.1.pdf
[napi_busy_fix]: https://git.zx2c4.com/WireGuard/commit/?id=3Dfe5f0f661797b=
41648eac64b40e5038b25175047
[memcpy_to_msg]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/tree/crypto/algif_hash.c#n226
[skb_memzero]: https://git.zx2c4.com/linux-dev/commit/?h=3Dtg/skb_memzero
[Roussel-Tarbouriech]: https://govanify.com/post/gsoc-wireguard/
[Jonathan Neusch=E4fer]: https://gist.github.com/neuschaefer/e752af1bbdd057=
704e02e282e3e082c5

--=20
PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEsuhqARgBY035sVClY1a5mXdUZMYFAluEbWcACgkQY1a5mXdU
ZMYpMwf/bbqx1D8m7U0EN0IKcxI+k8JUlOViMUhrwiBDLysXZ6ung3g6Eu6BTnZk
jrUVd5XSnC4PcdOqBhr7X6ELr9DDhZONYjn3DUFRLpIskrwiF5iXOUiprjtCVt05
7tQp9WFoca3gpoyCShLNx0YOyy4CcT+F/yi49aygp3JCmAOU42t72YE9XZHxFLSd
SnlpxnYHtlUFid0JFvzEUk0hkL+EVVodrp3nN4TUmFCXCdStrBLX+jbmcQOK2YW2
r0eeKsEIw7ve1+E2xIlByeR90wCsq4wv8yGIjWUX5uXXAoIdejhK5dTx/1nKtEzR
RS5E/xHLbE83X0ph2c5AwcL8sGIiMA==
=3rpC
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
