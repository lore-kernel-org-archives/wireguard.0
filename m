Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6da8d2b3
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 19:37:49 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 353cdbda
 for <wireguard@lists.zx2c4.com>;
 Mon, 11 Dec 2017 19:37:49 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: curve25519_generate.js [was: Re: [ANNOUNCE] WireGuard Snapshot
 `0.0.20171211` Available]
In-Reply-To: <b95c15baca1d3929@frisell.zx2c4.com>
References: <b95c15baca1d3929@frisell.zx2c4.com>
Date: Mon, 11 Dec 2017 14:26:21 -0500
Message-ID: <874loxxe02.fsf@fifthhorseman.net>
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

Hi Jason, all--

On Mon 2017-12-11 01:32:53 +0100, Jason A. Donenfeld wrote:
> A new snapshot, `0.0.20171211`, has been tagged in the git repository.

thanks for this!

>   * contrib: keygen-html for generating keys in the browser

This includes:

  contrib/examples/keygen-html/curve25519_generate.js

which appears to be a generated file -- looks like it would normally be
built from:

  contrib/examples/keygen-html/src/curve25519_generate.c

based on this comment in the headers of the .c file:

     Build with emcc -O3 --memory-init-file 0 -o curve25519_generate.js curve25519_generate.c

A few questions about this situation, as it doesn't align with the rest
of the source:

 * is there a reason to include a generated file in the revision
   control?  This seems similar to introducing a compiled copy of
   /usr/bin/wg to the source code, which doesn't seem like a great plan.

 * Is there a reason not to use a Makefile in this example directory, as
   a standard way of indicating how to do the build?

 * The conversion to the SPDX header of the .js file seems to be done
   manually.  if the generated .js file will stay in this example, will
   the SPDX header be re-created after any change to the .c source?

 * Do you expect packagers do rebuild this with whatever version of
   emscripten available to them?  Or should that be left up to the party
   who makes use of the key-generator?

   In debian, i can't reasonably ship a binary artifact that i can't
   build from source (this is sensible debian policy, and one of the
   things that keeps debian a free software operating system).  Alas, in
   debian emscripten seems to be having maintenance difficulties:

      https://tracker.debian.org/pkg/emscripten

   so it'll take me longer to package and release this snapshot if want
   to include the keygen-html example with the compiled binary.


I think the simplest thing for now is to drop the .js from the example
source, add a Makefile, and shift the burden of compilation/emscripten
onto the administrator who decides to deploy keygen.html.

I welcome any other suggestions or different perspectiveson the
situation.

  --dkg


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlou290ACgkQFJitxsGS
MjeSjw/7B5KR9l1AqkzwYRjOHGvY42DebM/ncaFatr4fHzLVHHM27pgl8mPp+yqV
4Tg+9wYs/pWZWD3yibmkVo8pyDEswWItS2OtxEOd0KFpDtQvfWYWLDgIU51//Zdx
EBDxPlBx2FrasP5DKk71thYBZad9mXK8WrlWepIb5qwSSBmPCILRTPcBPw3UtpyU
EPuvbjmV+7WCmOWKHB2TiwByTlUoQ4TKGd6JqrtL5tmLvUxoouAgSeEL21EpYiNI
LmQDG3mho/dwEjQFf47r+JutKpmB5/rdaN6hcDGB6u48tBLyIS78EqSR7jeFR5RG
vogwgUvQZNkMFTuYetTyZJ1BPLbQTsCtaN62h8ASj3xV9pEctbLtVUvGutKTu5oQ
Me03to+WdJynVbRT68ub2+hBinkDHT9asMBUcl1ugDhcTlNg6Iv0zf9Gicb2rKEm
PzhbcjfAgt1AMFN8/XZJG4hGAwFIKLWMhx9Pbj1BYwG6tfKZYD+OvlfEQauWXZAm
hi+qSn/h+ZuE76d7MQv5x6Grb/vpYwBYwqs8iZ1hLesBUmKKB/e+eDnmoCm53aQ+
yVEaCNegt6d2u0ec4kQiNDhheRGHROwAyrDhek2RJvD4n2ueH1rknT5sOt5ZfE0O
C6KEOYciDtlWE/NZnARgO+qrbtJB+Yk+3qdr9UznX581iPstVH0=
=50l0
-----END PGP SIGNATURE-----
--=-=-=--
