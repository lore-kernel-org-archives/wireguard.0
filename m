Return-Path: a@unstable.cc
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85ecfef2
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:09:43 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d243767
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 May 2018 14:09:43 +0000 (UTC)
Subject: Re: Cipher the private key in peers wg0.conf ?
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
References: <392763090.3358208.1526475207903.ref@mail.yahoo.com>
 <392763090.3358208.1526475207903@mail.yahoo.com>
 <6e06ad4b-24f2-4d25-b52c-780f0f341d2e@urlichs.de>
From: Antonio Quartulli <a@unstable.cc>
Message-ID: <11a67eb5-fd12-a86b-5b00-b6d14ddc30a7@unstable.cc>
Date: Wed, 16 May 2018 22:09:54 +0800
MIME-Version: 1.0
In-Reply-To: <6e06ad4b-24f2-4d25-b52c-780f0f341d2e@urlichs.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8jJn2D2DkWnd0fkE1LplCELnoQbibEaFI"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8jJn2D2DkWnd0fkE1LplCELnoQbibEaFI
Content-Type: multipart/mixed; boundary="XjuKmVKNUOFxtbADBx3HCc1zVuRKu87Al";
 protected-headers="v1"
From: Antonio Quartulli <a@unstable.cc>
To: Matthias Urlichs <matthias@urlichs.de>, wireguard@lists.zx2c4.com
Message-ID: <11a67eb5-fd12-a86b-5b00-b6d14ddc30a7@unstable.cc>
Subject: Re: Cipher the private key in peers wg0.conf ?
References: <392763090.3358208.1526475207903.ref@mail.yahoo.com>
 <392763090.3358208.1526475207903@mail.yahoo.com>
 <6e06ad4b-24f2-4d25-b52c-780f0f341d2e@urlichs.de>
In-Reply-To: <6e06ad4b-24f2-4d25-b52c-780f0f341d2e@urlichs.de>

--XjuKmVKNUOFxtbADBx3HCc1zVuRKu87Al
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 16/05/18 22:06, Matthias Urlichs wrote:
> On 16.05.2018 14:53, reiner otto wrote:
>> Actually, in wg0.conf the private key is defined in clear text. Which =
allows dump of physical disk to grab it
>> and to fake this client.
> So? If you have physical access to the peer's (unencrypted) disk you ca=
n
> do anything. Security is over.
>> Wouldn't it be safer, to cipher the private key somehow ?
> Where would you store the key for that?
>=20
> If you need that kind of safety, encrypt the whole disk. Securing the
> private key doesn't help if you can simply subvert the binary that
> decrypts it.

I think this can be compared to classic encrypted private keys, where
you need to decrypt them (normally with a passphrase) before they can be
loaded by the SSL library.

Maybe this could just be a feature in the wg tool, which could decrypt
the key before pushing it down to the kernel.

Cheers,

--=20
Antonio Quartulli


--XjuKmVKNUOFxtbADBx3HCc1zVuRKu87Al--

--8jJn2D2DkWnd0fkE1LplCELnoQbibEaFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEERdCuyFSHc3WdqS4EB6U8WA7yzXQFAlr8O7YACgkQB6U8WA7y
zXTbWQ//R45wfDL4NK8q7z1rRpcakgdYJXdCNBzOYFyjXHd6DnayFT8yghQqRedp
nAwTZygt2t4XFFhiPN820F6qAkILvhR7j3GWaaLsUS1/3IZuArnASrT1NrVEsVa3
Sq4Qq/6PURfQfR1SyY1ZR/SHkfC/2vN/4oYsiNnQE+D8YLuKX51lB3nSN4lA8iup
juHJUHpzOH2AHIYRODcyBxUI6YvEM+vnhT0GFQtoMv/mvNoXGu5Mnld4yqP/8t8p
Q8Zp41FUeBfitnNUO0ruc2XNatiIHFXNiDdeTQSk7aNJAn0cOJY3BmkddR8yyEvz
/mwR2/BxotQvFCNQl/gWR6N3XHZ3ZLlhTjWjMjcqE9fc5pqCCEyZtj+xOHSSgLMg
gl9UYOmqrfX6qCXK4OlEGzF56IniKmsxr+PDCibAY2wq7c9xSsRQvo61+msERT/V
GyV1b4f0OCStLsyqQQ4+Lv7cz12Wfhb1P1NZb/3N2JzJdqg/lr7m1gaJM36SoMIk
E3yLAzoDKDHmrM0jpZf7kUThHNc97a6M42ug4IENPW1fe2/03fCu4hTgfcHyNbZC
2VHjqlq7O5r3ql51JhfO5FfGpj1fRhcYQeoomwiVZ411t/RDpuv4Bbt0BgmF7xb4
xQmp4S5E7pK9aWg3ZdJwLr2DyycjtmUeADIN1cp0KYfi5x+bzJY=
=OyOm
-----END PGP SIGNATURE-----

--8jJn2D2DkWnd0fkE1LplCELnoQbibEaFI--
