Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17d313c0
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 19:18:12 +0000 (UTC)
Received: from fifthhorseman.net (unknown [38.109.115.130])
 by che.mayfirst.org (Postfix) with ESMTPSA id C0C18F997
 for <wireguard@lists.zx2c4.com>; Thu, 30 Jun 2016 15:21:03 -0400 (EDT)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: wireguard@lists.zx2c4.com
Date: Thu, 30 Jun 2016 15:21:00 -0400
Message-ID: <87mvm21o0z.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Subject: [WireGuard] README.md refers to doc/protocol.md
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

hi Jason and other wireguard folks--

README.md refers to doc/protocol.md, but there is no doc/ directory that
i can see.  This is presumably because the git repo has been curated and
the doc directory got moved to some other repo.  Should README.md get
cleaned-up to remove the reference, or to point to some public URL like
https://www.wireguard.io/protocol/ ?

In general, i'd be happy to see documentation like the stuff at
https://www.wireguard.io/protocol/ stored directly in the code repo,
because then technical documentation and code can be cleanly
synchronized (an old version of the code might be different than
whatever's on the website at the moment someone reads it).

I do recognize that you wouldn't want to put the entire website in the
source repository, though, and i'm not sure what the best way would be
to keep the website and the latest tip of the source repo in sync.

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXdXEcXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcK924P/1MIJhFouDYiq8jdmWKGpZ3v
QMrBEqv2wt1bQJGNCz/V5mUqrgXILa5WOfJD72R8U2USm1Fj40XIsqpe5VIFPIAx
u6J1JoGviJ6o0dH+hPXB4VwGiwll2i1MuljT6gxp/q2UpmcROFbzQxxjW1/q9rQ9
c1CKp0Ukz6xmMyjm2OPJLy+p9cGgBlxJ2v8xyLfVjM6GMyCPFUT97px6ovOljwhT
uW1ZkvJFWppvJyvNulk+qs2blquEN45nR3dh4UoC6/gPYzGJeZWQBhdCE+Jc3C6R
TGAa4JKFHgiGSelJaMQmc/GguRGGak+hR3cFTal6BNlgQz52trwG9VaVFdhAj4Cr
8rH1OYKgZiIuiNxnZktdWAxLJ00S/rh4Y4EVTQ/lbOoydoIeMoTUo92fEFAwjW95
zeFIfJq/X2VeU3DTIe3oba7TlCMutyhkjrZK0xhIzR3IJcGBABn+e30AZRu2AZ9z
pGYpOODB6YEA8Ba2jhBd+y48Sbkhe5ltlrn1Ej3+vwHlJXHrohQafcoGp8Wk9add
q6rEUUN7uLz+ZM/l9bAEJEnBIu8US+bJ4eJmd6f0P6ErNPb1hBHIKvgdQ+zHKcqq
3xr66yuLpAyK0PH9wUUWuhFA/rP25D0XZFKrzWnPmPJZWKaI8zOCeglFya+DjeGP
UJoUlAF/knyF+DF3gXHx
=kpyk
-----END PGP SIGNATURE-----
--=-=-=--
