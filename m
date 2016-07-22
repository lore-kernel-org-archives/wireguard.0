Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9cd9ef1e
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 19:17:37 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af4c0f0a
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 19:17:36 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cf8e5f3
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jul 2016 19:17:36 +0000 (UTC)
Date: Fri, 22 Jul 2016 21:19:39 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffff98b5bdef@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20160722`
	Available
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello,

A new experimental snapshot, `experimental-0.0.20160722`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  Sorry about the second release in two days. I don't like to release at this
  velocity, but the changes in the cross-platform interface were important to
  get out there, so that folks working on userspace implementations have
  something to work with.
  
  * tools: abstract sockets are dangerous
  * tools: Use seqpacket instead of dgram
  * tools: use stream instead of seqpacket* tools: propagate set errno
  
  This is annoying. First we realized that abstract sockets aren't a good idea
  for bidirectional communication. Then this lead to greater reflections that in
  fact we need something connection oriented but still packet based: seqpacket.
  While this was supported in FreeBSD and Linux, it wasn't in OS X. So we moved
  to an ordinary Unix stream, and now this is what we're using for the
  cross-platform interface. It has the added advantage of mapping well to
  Windows named pipes, when we add Windows support.
  
  * tools: add default cflag
  * tools: add -MP to makefile
  
  Some build system enhancements.
  
  * socket: simpler debug message
  * socket: reset IPv4 socket to NULL after free
  * socket: fix compat for 4.1 v6 sockets
  
  Though we already work around the immature UDP tunnel API in 4.1 and 4.2
  kernels, it turns out that 4.1 had really broken behavior with regards to
  namespace sysctl nobs. So, we work around this borked behavior. Fortunately
  this cruft will be removed when WireGuard is merged upstream. But for now it's
  important so that folks still on 4.1 can use WireGuard.
  
  * cookie: do not expose csprng directly
  * index hashtable: run random indices through siphash
  
  These patches ensure that we never put information from /dev/urandom directly
  on the wire, in the case of a NOBUS backdoor. It's a bit overkill and
  paranoid, but still nice to do.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20160722.tar.xz
  SHA256: 0dcda97b6bb4e962f731a863df9b4291c1c453b01f4faba78be4aaa13a594242

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQItBAEBCAAXBQJXknGwEBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA67SWQ//
VSjgM1/loGmN3ZcABFB6bcJWiDgrcF31HLdBgmBsk97Qweqwovuo8iPjMEdsmOR5
NF9iT9X3I2W3dSUreYwjvTKsUBWGJA0BqT/L3bsMnbrCz8cbPPIUKg3bHR6mOmKs
r4u/lyglb1j8L3ooqoXNNW3T4EKNOZRU55Wq5PWklXbK2S3+/CaE2r2mT+hZuIbc
abVZQQujwqXFOI/wkF/m/qP5HboynN5w427bGYcRdJb7T6w8UY+k61cJvbfQwL/w
D5DkmUGYa3Waz8P19fcpwTqbqQ0sncVwFRB9hFmgqY8yQ1ZkUxforgw6sjI9TjKw
2r0+h0m7Mf/TK2+ILmn7Ibqr95NnpEM4T2YoKi+sS5mAgdr2cctKUOPGHZWpd3Os
cifgfHQu1L+CASC0Cx7hwImi3vHoq+3Ds4nrDgBY02qFDqMe0PdbDZbmGD2Td0iQ
/wg5kyNV0zaXBQ9IAJ2jNxP7XRhkaxmB9ajFDNur7g4mLp0RfLc+DuwZUITPyh3Q
y7TMcANnYY72AUseiwWOFvQq6oXdzY6ykw5wmnqTa3aozu4xaEqbsdbpUgTTokWG
NzdolAKu+xv2eG4WLjzLItllsLHmQ/bB99XkH/SMbHqEUkIcGAvjNevJ6iUfIbEX
JqetcHgCyYLwKsOhdEfzF2t5Sg4nICYGIKI9JrXBbeI=
=Mq3+
-----END PGP SIGNATURE-----
