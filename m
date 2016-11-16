Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9be2ec2e
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:52:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 30b501c4
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:52:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bfecc2c4
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 15:52:17 +0000 (UTC)
Date: Wed, 16 Nov 2016 16:55:06 +0100
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffd531ab9f@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161116`
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

A new experimental snapshot, `experimental-0.0.20161116`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * socket: keep track of src address in sending packets
  * socket: ensure that saddr routing can deal with interface removal
  
  This is a rather important change. WireGuard will now reply using the same
  source address on which it received a packet. This improves compatibility with
  multi-homed hosts.
  
  * debug: cleanup skb printing
  * compat: rearrange
  * tests: use private ipv6 addresses
  * tests: trim output
  * various: nits from willy
  * packets: consolidate constants
  * device: better debug message
  
  A whole series of cleanups.
  
  * device: we need NONE for libpcap
  
  In the previous snapshot, we switched to using a VOID device type, so that
  IPv6 autoconfiguration wouldn't assign a useless IP. But this broke libpcap
  and tcpdump. So, we're back to using the NONE type, and getting a useless v6
  address. This requires upstream Linux fixes to solve.
  
  * chacha20poly1305: rely on avx and avx2
  
  This works around braindead VPS providers who disable random opcodes.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161116.tar.xz
  SHA256: 69f2d0e9c15ae6518ecdf6c7b78065be3c87e11913e2054f9b1eae2d5b75904e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQIsBAEBCAAXBQJYLIE7EBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA65ajQ/3
YIV4saHJn1KOyVVrEL4d1tDqpJDmdnE2V4IVKoNRXmipBjkGC7FhgZJIBistGyu+
FyAKd1JEhP1/AbJVbvQeXO/mJvsz+PdNKfrO75JtHO7r+dzGc+FG/mqgRgGFz5Ss
ceFmJ1bSp2kPA7hs9DzJU5hvIRZqMOGxZuyYQn7QgU7pDSg5ephBCWM24V4pKsma
pFxHXByx7bCNZhgz57p5eJ58T8acp5H3RIroLATvI4fHgdPq/UzVTYq/Zx13DUyN
Fhdgnvp07jtZ5ciWUWGyo1EA+pTSdh4mddN8VFXHwEanJ9uxfF+xDvxTI+YgE+Yr
YH5FLpAbFs1Sz7sksEjCA3qqHZAUp3sM9cg5EZezsh7k3ApwvonT+RHK75OZmGRP
zHc8jZyNfJdzMmwbEOXQfR6J8XY6TNw/kcbx3KHy9E5xj0U8uUSko+ln36aqnUfM
ApM0i4Dh5sPWpjqbAL/WgPVRUEAGUyzjg8jnRmWOLzB9Ckg44liLlfZKFhYzrhez
GwjWoJzX0th0Qvoa+pZyk5Gj4NP3cHMITZ6Jk+K4zJ2Xkpb3poA75oZMySKx6FFH
+RLtmxduTuWbE+QANUCcNHRdURm+feiCXA/b6sKlhu8154A6th/leRXyrl+vmNwJ
2LmdZQqzQdmO3sW5fzSJej0KktQqFlxUhdiMDgm2xw==
=lWeJ
-----END PGP SIGNATURE-----
