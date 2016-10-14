Return-Path: Jason@zx2c4.com
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 78600cf5
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Oct 2016 16:06:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bdffc61b
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Oct 2016 16:06:17 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4fa0322f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Oct 2016 16:06:17 +0000 (UTC)
Date: Fri, 14 Oct 2016 18:06:31 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <ffffffffd626322a@frisell.zx2c4.com>
Subject: [WireGuard] [ANNOUNCE] Snapshot `experimental-0.0.20161014`
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

A new experimental snapshot, `experimental-0.0.20161014`, has been tagged in
the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. However, if you'd like to test this snapshot
out, there are a few relevent changes.

== Changes ==

  * send: only avoid parallel path when there aren't inflight jobs
  * send: requeue jobs for later if padata is full
  * send: ensure that rekey retries are staggered
  * device: show debug message when no peer has allowed-ips for packet
  * compat: more functions moved upstream into 4.9

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.io/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-experimental-0.0.20161014.tar.xz
  SHA256: 687abcd64141cb9d12cc1e65396aeeab45c193e1a9d3acd306d0f2fbad33b4a1

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQItBAEBCAAXBQJYAQJ3EBxqYXNvbkB6eDJjNC5jb20ACgkQSfxwEqXeA66dsQ/+
NtqN/lZ83hgqnTbcA4gV3809e0PSXWem/agHL3yWpNQkX9p6PqQ1nDhjuFvpBZTJ
e7KBmsPzduPlGZmLBm8Dwc+45hS5bKEEj0w2Ed16QBfucUFlV6CeW/79945sRNEL
jBASkLrHKYAgfmCSlG6TDn43GdpLJvtzVNLw4EpY1cdN6CNbA1vuOMuIF0YLV7uY
wkZDpm2YgDASMcZw6CfwVfimEmkCvNV0PGppoec6yqq2YOtvhTSU431ye1SEa3Bt
dCT6nJIe5ZjdAFHn4KBxyrccj2TzVDbkruMfYVVekCrxftc3Fj8vQ5yc29DRG4mk
Bf6IXQLkSKR26Iju8VoFK+Uz7bAukGhXw3Dy8OdCWHmB5/Efp02xq7cXg+quosjY
KTZ+tzYmg8Oqi86MIw3WXSHOLd/IjOs+VkXb27EdKyAdgZ5J7Up3W14Y33m01vWs
iCuCE09Cc+Z/K56XruSbPrXxnvl1Xs7ZUFCIgbaWptsgAl0ftAd4NVg3r629pdMm
Dqt1LEwauGxO+bhkk3GT8RiZ/Ek0PrgD9uvRI4v6KOTWZBNr8rfGNk6AigY7c91K
uq40gzij9HY22I3PEzPYiZRsjavNaQdbE0AST63W4defQ98cAMts4a8hpJtwRU5L
6Tz9BMvHhzbRg8LkuCgcy8aC7NqeWUDPqzzeR+xjmPI=
=vgVt
-----END PGP SIGNATURE-----
