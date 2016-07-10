Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c5448770
 for <wireguard@lists.zx2c4.com>;
 Sun, 10 Jul 2016 17:55:53 +0000 (UTC)
Date: Sun, 10 Jul 2016 19:56:25 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160710175625.GE5844@lud.polynome.dn42>
References: <20160629112423.GC31514@lud.polynome.dn42>
 <20160704074837.GA24805@lud.polynome.dn42>
 <20160705220336.GA18854@lud.polynome.dn42>
 <CAHmME9rOUu4CBAgaSg684F45VT2Od9QHExNT=ftqn46EdpTxeQ@mail.gmail.com>
 <CAHmME9paKdCr_-W5_PJ1nxnNqCLdbuJ04T+PUp2NaMZZV+K2Tg@mail.gmail.com>
 <CAHmME9of2XeH-7mJF-Avq_n1SPQwesH-zkk-0Nx8ff1ef3f5jA@mail.gmail.com>
 <20160710172105.GD5844@lud.polynome.dn42>
 <CAHmME9o1H==cE9ykCifLuLNZN5bprdQjGND3+T_PzPWsz6pQQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0QFb0wBpEddLcDHQ"
In-Reply-To: <CAHmME9o1H==cE9ykCifLuLNZN5bprdQjGND3+T_PzPWsz6pQQA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] OpenWRT package for wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--0QFb0wBpEddLcDHQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 10, 2016 at 07:52:51PM +0200, Jason A. Donenfeld wrote:
> Ahh, position independence, right. Okay, I'll look into getting LTO
> working, which will certainly have good results.

Note that at this point, reducing the size is not really necessary, it
would just be nice.  But if LTO reduces the code size *and* improves
performance, that's the way to go!

--0QFb0wBpEddLcDHQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXgoxFAAoJEL4B7CKgTi5G9PwP+wVU4THsD2h+4kq4V9XK8tZ2
PEp3nJIxMqfxiFzil0OGPRslc1NuOU+ZmSTQDmC9pDjEYdjv7Snuu6JjssWEIWLV
q/S8orOsdes4V4oqM62GD4F5bWoD98unbrAp+T2PfWiku8YCSiSgmwWeaQikGY/k
77wZN1G8Bgj51jCjm4q5gMcOEIt90xWlZ3JcKTNLfE6s99bWtYZLncit0T3v/I8w
n5VqXOq/sYd//JyBDbPzsBh59o0ETpgfoDYAGnAs0NnUHcLwx0EicMuvoSk7OPBt
yZsoYekjVE8s4csIJwa2PdK2a0sCRNrbXW4mm6yh7MkZ7+GyDyAdR+i6TlNJlwi0
xd6at7jkCWCn/+5LdxSWno4TebBuS46+P6R0c8NgM6+kZ5uqg5Mx3XnvpbZWQ7kv
2LpT0SWBVrxsq/auj8P7zUzrjaHPShJbfbJjDAFFBw7umFGXFClmajdJTWjyvZXU
xC1kugBZVf0+anw1EJGAvF+rf27dhBpqoPosSzlQ717v/jL/IZRiLrs+xcOiw7OR
mrAjkF1JBcDpBxCBfTYvZX2HeBFk34w4vjShvh41o4l+EuAlMMIcgcwVQGKsvTDQ
OyzvGAMprpnRVoFjWg8UKbShwEIsVOIuZAAY8btpzTb4chHxGIOFf1Qv/Y/od7bV
CqguFJghTAcH3hSbQjba
=43ua
-----END PGP SIGNATURE-----

--0QFb0wBpEddLcDHQ--
