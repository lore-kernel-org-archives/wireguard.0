Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b6cb3bb
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jul 2018 19:28:55 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c81626e
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jul 2018 19:28:55 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dd85027b
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jul 2018 19:27:41 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a0b669bb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Jul 2018 19:27:41 +0000 (UTC)
Date: Wed, 18 Jul 2018 21:37:19 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180718` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <15322749e6338f9b@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180718`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * tools: only error on wg show if all interfaces fail
  
  wg(8) now has a more reasonable error code semantic.
  
  * receive: account for zero or negative budget
  
  A correctness fix that no other drivers implement but that we really should
  be doing anyway.
  
  * recieve: disable NAPI busy polling
  
  This avoids adding one reference per peer to the napi_hash hashtable, as
  normally done by netif_napi_add(). Since we potentially could have up to
  2^20 peers this would make busy polling very slow globally. This approach is
  preferable to having only a single napi struct because we get one gro_list
  per peer, which means packets can be combined nicely even if we have a large
  number of peers. This is also done by gro_cells_init() in net/core/gro_cells.c.
  
  * receive: use gro call instead of plain call
  
  This enables incredible performance improvements in some cases. Benchmark and
  see for yourself. It should affect large TCP flows.
  
  * wg-quick: allow link local default gateway
  
  IPv6 endpoints will now work better on BSD and Darwin.
  
  * device: destroy workqueue before freeing queue
  
  Another small correctness fix.

This snapshot contains commits from: Jason A. Donenfeld and Thomas 
Gschwantner.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in compressed tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180718.tar.xz
  SHA2-256: 083c093a6948c8d38f92e7ea5533f9ff926019f24dc2612ea974851ed3e24705
  BLAKE2b-256: a716e4de536e7fa572ad84d038fb70063c32c93317f3cf053ef879d0ae4ebf06

A PGP signature of that file decompressed is available here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180718.tar.asc
  Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAltPluUQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DrgMDEACKwEuW5ch4h8ukkLfgmfPZL7/he1CWJhyZ
kz5FnqTzBYGWZTX7dmMWZna3HmHZNwROQ8M2oNpvU9aS7A/zSHS/Lv1k5mrGyLhu
rGM9VvKkkgKm/JXEfGe3YfLbfjbq6GtJPr83yZyH/u3sSXBRqp9AOTh1iXLpfE0I
t3y6ekU6JAV+tLoIipt57TjcqD83jqCaWQbBNVWiyJhvGD4lBkfoVeMXyz/ffyl/
5nkT5DieX126akEEqmXpvqYPc1P25gK9C8t1kpTCGqKm8sXWKDZpZyrRcBZPOOEO
sZ0/M61vB612k95J2D/fayPpFtSLDHhSp/gNaJEVycvK9a01yhhfDNS+SD5cMSah
ZITaClx5D4HIyA7tAIgROhj7oiZvE0Zuxos4MW8+uGEyF751+MDOIICoGb0GSwZW
gjSE6rJLrLVfMeqGHuKMvDByHyDOxPgklVG89oLyqtEXzWWcNUmmgwGIy4rhEkvV
ps5nrBOvSXrfZvvE1T6ZDnStwFYkAxz6G5sqpacIeKY1KkYqMP170ixsziNLBmYg
Gwa+1JH2ILbvFZDJmD4ijzHCpPX4d9HfdtEuEegfliv5a4QqMAsHbORN3GjPe2wn
ZktRH+Jv9FQXHoIb7Hp4O2awxWpnf0bGdarZK+50krbrn439eteUnRjvS+iSln01
R1iBH+7RZw==
=RQvN
-----END PGP SIGNATURE-----
