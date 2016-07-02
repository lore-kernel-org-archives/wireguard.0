Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b866377
 for <wireguard@lists.zx2c4.com>; Sat, 2 Jul 2016 12:36:47 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <zx2c4@gentoo.org>, zorun@bitsofnetworks.org,
 Christian Hesse <mail@eworm.de>, Christophe Fergeau <cfergeau@gmail.com>,
 zx2c4@gentoo.org
In-Reply-To: <CAHmME9o5kcR5wStmB-Ku+2eDrrtbdvNLwG0AvaDdeuKuRtdaAA@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
 <CAHmME9o5kcR5wStmB-Ku+2eDrrtbdvNLwG0AvaDdeuKuRtdaAA@mail.gmail.com>
Date: Sat, 02 Jul 2016 08:39:44 -0400
Message-ID: <87eg7cz01b.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
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

On Fri 2016-07-01 17:28:28 -0400, Jason A. Donenfeld wrote:
> Are these instructions correct?
 [...]
> Debian [experimental]:
>      apt-get install wireguard-dkms wireguard-tools

I'd just use:

      apt install wireguard-dkms wireguard-tools

thanks,

      --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXd7YRXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKy40P/iujIRpPTGBVvh+x6tGn3bot
a8VTsEKbyTePhkkFYWUFdClQKQshtxF9lyEtH/i/lqMNJ42Q/8BD7b+2E8E4xTqr
kx6G/N1gjwo/3dl031zWW5buJjSlYC2sBCacLQBFdWevEmBNFgl2V21sT8YEybHc
lGzLigaGfUIBgEHmKxWKDgl1J8ZbMNok6dCLlrtshBzQhM2fN4aIvteZLUVd+/v0
6XZQXhPMSEW8VpPy6xEOLKySdrvgmxZ4KVt0OUjtHSr/B+Z7Zj395tFRBdUcMlmn
3fxNzDQYxPezcZDX+bp4eiIcVI8LuVgQFONaoZIfdCzRAzc/X2NzkaqPOcQ91IAN
AYipDQ+LRwCb4/0x/KBkBDqZ1U7ccv6ic0VaJz6tutHkYdBA0i0Ea3eSFxI36mVR
YdQZAumwYzTnK+BMOtIT8Qo0ZJH7hn0+F1nf7WdqDNdqcE2gwhP/f3hPyeIAxZgX
R6cdErRq7xhiDCNN3RQyD6qZze3guq3v4IULk2x8sr+9BuSHiqpR1RdQD8oWATYC
jmOlaFN8TQykI1ruQXvCB/074di5zprLqxrBeHYM3M3c5u/PTQuvfwnXGOjL8Dpx
PKccu7Ln14AJGCIp3jZMTA0N26auwdJW+8YxmEK3GBbGh2F2yPzAQwiKRQTF1k2Q
JPGBpIfCRN52ineCUbVN
=JA5v
-----END PGP SIGNATURE-----
--=-=-=--
