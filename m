Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f582b79b
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 18:40:46 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 712f95a9
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 18:40:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 927a7707
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 18:40:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5979a6f8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Nov 2017 18:40:46 +0000 (UTC)
Date: Wed, 22 Nov 2017 19:45:53 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20171122` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <0d6a76d11ee08f7d@frisell.zx2c4.com>
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

A new snapshot, `0.0.20171122`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * chacha20poly1305: fast primitives from Andy Polyakov
  
  Samuel Neves and I have spent considerable time and headaches porting,
  reworking, and partially rewriting Andy's optimized implementations of
  ChaCha20 and Poly1305. We now support the following:
  
  On x86_64:
    - Poly1305: integer unit
    - ChaCha20: SSSE3
    - HChaCha20: SSSE3
    - Poly1305: AVX
    - ChaCha20: AVX2
    - Poly1305: AVX2
    - ChaCha20: AVX512
    - Poly1305: AVX512
  
  On ARM:
    - Poly1305: integer unit
    - ChaCha20: NEON
    - Poly1305: NEON
  
  On ARM64:
    - Poly1305: integer unit
    - ChaCha20: NEON
    - Poly1305: NEON
  
  On MIPS64:
    - Poly1305: integer unit
  
  All others:
    - ChaCha20: generic C
    - Poly1305: generic C
  
  This is a pretty substantial amount of new handrolled assembly. It will
  perhaps MURDER KITTENS, so please tread lightly with this snapshot and adjust
  expectations accordingly. I'm looking forward to quickly fixing any issues
  folks find while testing.
  
  Performance-wise, this should see increases all around. The biggest speedups
  will be on ARM and ARM64, but x86_64 and MIPS64 should also see modest speed
  improvements too, especially on Skylake systems supporting AVX512.
  
  * chacha20poly1305: add more test vectors, some of which are weird
  
  Test vectors are pretty important, so we added more to catch odd edge cases
  using the following butcher's code:
  
    from cryptography.hazmat.primitives.ciphers.aead import ChaCha20Poly1305
    import os
    
    def encode_blob(blob):
        a = ""
        for i in blob:
            a += "\\x" + hex(i)[2:]
        return a
    
    enc = [ ]
    dec = [ ]
    
    def make_vector(plen, adlen):
        key = os.urandom(32)
        nonce = os.urandom(8)
        p = os.urandom(plen)
        ad = os.urandom(adlen)
        c = ChaCha20Poly1305(key).encrypt(nonce=bytes(4) + nonce, data=p, associated_data=ad)
    
        out = "{\n"
        out += "\t.key\t= \"" + encode_blob(key) + "\",\n"
        out += "\t.nonce\t= \"" + encode_blob(nonce) + "\",\n"
        out += "\t.assoc\t= \"" + encode_blob(ad) + "\",\n"
        out += "\t.alen\t= " + str(len(ad)) + ",\n"
        out += "\t.input\t= \"" + encode_blob(p) + "\",\n"
        out += "\t.ilen\t= " + str(len(p)) + ",\n"
        out += "\t.result\t= \"" + encode_blob(c) + "\"\n"
        out += "}"
        enc.append(out)
    
    
        out = "{\n"
        out += "\t.key\t= \"" + encode_blob(key) + "\",\n"
        out += "\t.nonce\t= \"" + encode_blob(nonce) + "\",\n"
        out += "\t.assoc\t= \"" + encode_blob(ad) + "\",\n"
        out += "\t.alen\t= " + str(len(ad)) + ",\n"
        out += "\t.input\t= \"" + encode_blob(c) + "\",\n"
        out += "\t.ilen\t= " + str(len(c)) + ",\n"
        out += "\t.result\t= \"" + encode_blob(p) + "\"\n"
        out += "}"
        dec.append(out)
    
    
    make_vector(0, 0)
    make_vector(0, 8)
    make_vector(1, 8)
    make_vector(1, 0)
    make_vector(129, 7)
    make_vector(256, 0)
    make_vector(512, 0)
    make_vector(513, 9)
    make_vector(1024, 16)
    make_vector(1933, 7)
    make_vector(2011, 63)
    
    print("======== encryption vectors ========")
    print(", ".join(enc))
    
    print("\n\n\n======== decryption vectors ========")
    print(", ".join(dec))
  
  * wg-quick: document localhost exception and v6 rule
  
  Probably a "kill switch" wants this too:
     -m addrtype ! --dst-type LOCAL
  so that basic local services can continue to work.
  
  * selftest: allowedips: randomized test mutex update
  * allowedips: do not write out of bounds
  * device: uninitialize socket first in destruction
  * tools: tighten up strtoul parsing
  
  Small fixups.
  
  * qemu: update kernel
  * qemu: use unprefixed strip when not cross-compiling
  
  Fedora/Redhat doesn't ship with a prefixed strip, and we don't need
  to use it anyway when we're not cross compiling, so don't.
  
  * compat: 3.16.50 got proper rt6_get_cookie
  * compat: stable finally backported fix
  * compat: new kernels have netlink fixes
  * compat: fix compilation with PaX
  
  Usual set of compatibility updates.
  
  * curve25519-neon: compile in thumb mode
  
  In thumb mode, it's not possible to use sp as an operand of and, so
  we have to muck around with r3 as a scratch register.
  
  * socket: only free socket after successful creation of new
  
  When an interface is down, the socket port can change freely. A socket
  will be allocated when the interface comes up, and if a socket can't be
  allocated, the interface doesn't come up.
  
  However, a socket port can change while the interface is up. In this
  case, if a new socket with a new port cannot be allocated, it's
  important to keep the interface in a consistent state. The choices are
  either to bring down the interface or to preserve the old socket. This
  patch implements the latter.
  
  * global: switch from timeval to timespec
  
  This gets us nanoseconds instead of microseconds, which is better, and
  we can do this pretty much without freaking out existing userspace,
  which doesn't actually make use of the nano/microseconds field. The below
  test program shows that this won't break existing sizes:
  
    zx2c4@thinkpad ~ $ cat a.c
    void main()
    {
        puts(sizeof(struct timeval) == sizeof(struct timespec) ?
          "success" : "failure");
    }
    zx2c4@thinkpad ~ $ gcc a.c -m64 && ./a.out
    success
    zx2c4@thinkpad ~ $ gcc a.c -m32 && ./a.out
    success

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20171122.tar.xz
  SHA2-256: c52f0694f4e11129a80b60a0d2fe75729f1ad39e3fe4e3ee569629ff21e3ed89
  BLAKE2b-256: 83e5b4c4c5461fcebac545866eb0494abcf7fc4577cc1dc94b60d5d4ac212dbe

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAloVxcgQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrpwqEACneprvsrS7QWdTRNPmPqtCk9MUbzgBHC2R
ugsMH9OByMO4DMjPw83Sk2OKDOXHbx9UVriOc+aBj4nCvZwTKJyLd5LwGYzG6UNc
oj0pVE70PD9oRh3L/eB5GnsmgC+Zi7+8y3+6OPPchiiS9rhgYP5mmk4Sn6kWnyUY
FadQmgKaAOF797FSLctz/lLsDew5bpyNU8MOqRdh57CyGfGCDr+dpouIBQ3Lj3w+
X4W86iGErn+ESMurswHcHyMyL7tFzS9ZMWF74ymfakn2iRBpUDPQn73woBtITPM0
eWXDI+DKh7Yn1QSfl+ZXovZjppCKZ4FEGlJTMnc9ZZkRcai55knWuBOzvpg+yW8v
m0gBjvbYXWMYfJj4kindG6xVqWwsbmFa/DZl7jbnCwOUMohIpBWvgLAr4Rqfhzwj
ydoAzOOmf+GUFlyU4k4O0p7K1n0MRAM/bNc44KFSTjBIb71HhKk3cVZFOrVFKeCP
vK+RgAkfLHBPFHilhD4BvKP1iCA3n1XGk8VE4hCoMr2eChv4DO7h4JSbAXd6K7kY
IUliBzKj73QeisW9eT3NB4pDo+KdjxgyWO6ZaeIJYE9QR/R8mol37sg0rLNhU0iS
IUDr/5DZs2n4KFarB/b+9ZPQ/NEkP86F5kQVEz47ULapO9e7R9ZWfkBXaZBcb1j9
v4/or83Dew==
=sAWc
-----END PGP SIGNATURE-----
