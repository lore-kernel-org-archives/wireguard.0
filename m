Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ba9f9aeb
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 16:56:27 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2936b09
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 16:56:27 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51a57dd4
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 16:56:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b0ec0920
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 30 Dec 2016 16:56:26 +0000 (UTC)
Date: Fri, 30 Dec 2016 18:04:46 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] Snapshot `0.0.20161230` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <79ce15ab213f33c1@frisell.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new snapshot, `0.0.20161230`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  This is a fairly small release, and if you're a lazy package maintainer, you
  can skip it if you don't have the time. The primary improvement and motivation
  for making this snapshot is Android support.
  
  * tools: rename 'bandwidth' to 'transfer' in output
  
  Nice catch from Tomasz Torcz.
  
  * external-tests: update to latest
  
  The Go/Rust/Haskell examples have been updated.
  
  * cookie: optimize
  * blake2s: cleanup
  
  Some nice optimizations and cleanups to increase code quality.
  
  * wg-config: use ip rules instead of tungate
  
  Rather than launching a routing daemon, we just use ip-rule(8). This should be
  more straight-forward, and work on more systems, such as Android.
  
  * tools: syscall.h should actually be sys/syscall.h
  * compat: support 3.18, 3.19, 4.0
  
  These are big! We now support Android! That is to say, WireGuard runs on 3.18,
  which is the kernel Qualcomm picked for their Android chips. In case you
  missed it, here are some videos of it in action:
  
  https://data.zx2c4.com/android-real-phone-wireguard.mp4
  https://data.zx2c4.com/android-wg-first-starts.gif
  
  Of course that's just the kernel module, and we don't yet have fancy GUIs. But
  at some point these will come.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20161230.tar.xz
  SHA2-256: 69c9770daf9c8ff6632d614afc117b60774760f1224c9322c84f8da92b9ae396
  BLAKE2b-256: 0e2d1000515e1e1ee657ce5bdd388975197ad41c0b24cba0d60afd3fefdb0f4e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlhmk4cQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Drt6YEADPFNwvERmCz7SOSMy8bTZSL5kJVSgtmeBE
tsEZC99kes4n5J1wA2t9zvbDg8gvIChNb7U+dpjUNDHMI2JjP0kFmBviaNRw2sa/
4TCBUj0pBs4fk57TEjlN28odeb3r3YG0L8Gjg3l0xTKOP77ijlYqvpr50MBRcwUP
7meuvb+wdjGsNvbouAUyGWOHHIfTrRuaSRMrjpTBGfONQe3O+aI0Isw6cj1Sqmbs
FLIHH/MDKdSk2+n3NHZaIJgdX9j0/FrQaP0yijgefvUVJmiK+V7ouXsqy5k4H9Oy
RYJ0yrXNCWYjM40wmxXhYfbojH+69O5qi/uX5yHUMF/vuuG/U73ztbdLYM9GLg0z
R8NbPzIOM4SY7Cs7AiXYZ101EOR9vBq6jj9MEY1TMGNISu//yucK/fETXNU0BI1j
P1bYnsOzvVX5XZ1opdzKLZbFCi5zxl8BW3VIXzMm4Cadje3XAUVDZWlTpxXipVqD
lfM7W3CgGT3RItZAMRrn4GX61ThoV5je9OYsMjZ1gjpqpx9aew7PiZp5oATYDB4g
dVinv9DlYX59NyrpZ+5bUfsvh8OjKXamLJzC/VestffUgwZpoH4wlgabbxtJxbgO
PVaT4d3NQMr84QTahDqbcYrizDnu6JqlctEr05sEOrr/a3wu4LhKMuCoz6iJZheA
+P/0LwFeZA==
=gZjr
-----END PGP SIGNATURE-----
