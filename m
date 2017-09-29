Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afc5a874
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 04:06:45 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ca353f9
 for <wireguard@lists.zx2c4.com>;
 Fri, 29 Sep 2017 04:06:45 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Chet Gurevitch <chetgurevitch@gmail.com>, wireguard@lists.zx2c4.com
Subject: Re: [PATCH] Makefile: add uapi level to dkms-install target
In-Reply-To: <20170929042331.18247-1-chetgurevitch@protonmail.com>
References: <20170929042331.18247-1-chetgurevitch@protonmail.com>
Date: Fri, 29 Sep 2017 00:34:58 -0400
Message-ID: <87y3oyp1fx.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2017-09-28 21:23:31 -0700, Chet Gurevitch wrote:
> add uapi level to dkms-install target

care to comment on the rationale for this?  dkms is the kernel module,
and aiui the ioctl interface is likely going away.  we don't want people
to be building tools that are bound to that interface unless they're
also bound to the same version of wireguard, right?

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlnNzXIACgkQFJitxsGS
MjdLsg//arXQTSpkgwUF5M7AxYR7DzfuniRxsynlX7YXcCfsPaa1jyjCF6o/81KW
heHolevyrvsqf1ZdeDontmXTP/7K6HzvxxpmAA1T46cJRi8dvIyOTE5UHVaVczt/
jycRPsjlX7aMas+93UeIV5ViEbRYXTOxVZuGGXceh8SSfA/KHWB0e0pHQXf3r5dt
dC2WG6jxl7XN3hZkwZNcq/4x8K5onKrLAjYNNEoJ8CBSEei+3hWErI4n6Fs2GvHk
0G+pdk8OV/x4zP1WnyhXPD9b+nwNTX0zgHISrlQC8ckaXNHJS3rlhBECd0zQYBkQ
gfA0ln9g+ZuyjaM0dR7qprjR2jn3mtPEv0d5YFEsp5Ck+6G1Bvl+MhbCUb0Kk8qY
R54M+0Ecz2/FZvYYDK3g0dJ5sGT2ZnCaKFP9OK32vo1n0JdbVg15RPJ0W1RWkkBm
EqSqjZSpdvyf/wzqN9iqDEUHcC/xg3B+37VN5mlqtvBZrSsnjn9iPRvIvy1amkrz
eKFzKjvxhpIRlrTRNu5l+vdDzbIul2ESywPkfGpcTH0sY8Yb1vzeARyArwr+GXgc
zeJQe87B03hiDM/hfo0LJn1fYdnMzDIyz3It0xfSpP2eiFPyGO6Rlzh1wEfUfMYe
DdkQZZ98rF/75+LOY4qjheR/WRY02ZzxqC1m+OtyM9NhETJTzk8=
=vqZZ
-----END PGP SIGNATURE-----
--=-=-=--
