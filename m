Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39259340
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 00:59:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf90770c
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 00:59:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55c4fbbe
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 00:58:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7c87ac54
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 May 2018 00:58:33 +0000 (UTC)
Date: Thu, 24 May 2018 03:01:02 +0200
To: "WireGuard mailing list" <wireguard@lists.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [ANNOUNCE] WireGuard Snapshot `0.0.20180524` Available
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Message-Id: <b997e7df41623c27@frisell.zx2c4.com>
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

A new snapshot, `0.0.20180524`, has been tagged in the git repository.

Please note that this snapshot is, like the rest of the project at this point
in time, experimental, and does not consitute a real release that would be
considered secure and bug-free. WireGuard is generally thought to be fairly
stable, and most likely will not crash your computer (though it may).
However, as this is a pre-release snapshot, it comes with no guarantees, and
its security is not yet to be depended on; it is not applicable for CVEs.

With all that said, if you'd like to test this snapshot out, there are a
few relevent changes.

== Changes ==

  * allowedips: set pointer to null before freeing
  * ncat-client-server: do not always call sudo and use env bash
  * qemu: bump default kernel for gcc 8.1
  * compat: work around qcom 4.9 backports
  
  The usual fixes.
  
  * tools: fix OpenBSD build
  * tools: always pass -v as first argument to install
  
  Portability changes.
  
  * wg-quick: darwin: rename namefile environment variable
  * wg-quick: darwin: do not remove routes when no real interface
  * wg-quick: freebsd: add new implementation
  * wg-quick: openbsd: add new implementation
  * wg-quick: support FreeBSD/Darwin search path
  * wg-quick: better bash completion for non-renaming OSes
  * wg-quick: allow enumeration of socket files
  
  We now support OpenBSD and FreeBSD, in addition to macOS.

This snapshot contains commits from: Jason A. Donenfeld and Filippo Valsorda.

As always, the source is available at https://git.zx2c4.com/WireGuard/ and
information about the project is available at https://www.wireguard.com/ .

This snapshot is available in tarball form here:
  https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180524.tar.xz
  SHA2-256: 57614239c1f1a99a367f2c816153acda5bffada66a3b8e3b8215f1625784abc9
  BLAKE2b-256: e41004df8d5a4ee867463e586822ee891fe3ff70eeb0b833d9ba2375f62cad3e

If you're a snapshot package maintainer, please bump your package version. If
you're a user, the WireGuard team welcomes any and all feedback on this latest
snapshot.

Finally, WireGuard development thrives on donations. By popular demand, we
have a webpage for this: https://www.wireguard.com/donations/

Thank you,
Jason Donenfeld


-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAlsGDlQQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4DruxiD/9oRkEyDCUlB11eFVmrtijMWPJOyolgfNm/
6WIaAsM7A8+xQhphbnyHACLLS25pT8bXpDBC0FtvPeu9R1Y69VjG32d8L266QKqt
vqt8rsRitonOL+zcvDuiB1JL0dgOGfPe9ghICKQCZiuiMoOASpREO7HDWslz+1Pq
Hb14fx8TrQ8amE4iF3isjaHerFPnL92qresJ+2zVrf4u7jUCXJKAALVKWPOQYFfi
8wsGBCORiytp5Fi63YJtBYdy92LCrqb3QjoUr4x2lS0LQkS/HlMkuQ4f4w30giIs
jfqsRH3AKdzGAw0Ml3InFac+6yCnug8juTqQhHfsfpLlmDNNWr33RVnYi84yf+kv
NCH19+pmqxrMmEVG6R0D79MO11TiL0mi2aKL23xGAuGq+TwFq0wpF2GW+fs+J47Z
cSSkuPPZyweI1bFR5WvyykQhU0mq/KxriFDFZIeMQJzww0CrVFbY160SdNU9N1nC
f/DDDuUOq6MxLRRQSLv5xBShbvEagsXZr6yR5AZd8a8L9cqWfnFKc9RXWTV2ePR5
HufHY+RPXT6ARgCpUrKJXYI/PEWEop+qk5++d2SEC7UC1787D879F8ZnRcbarUN7
Clb3nm2CxWwmFI+YSdIB6VIlE+B/MVskmGl70zKQTpEVJGBqbdKHWNs7U1VvlBgI
Hq9p5R7ijA==
=FvnJ
-----END PGP SIGNATURE-----
