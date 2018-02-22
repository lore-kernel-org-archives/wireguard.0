Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b89ee9f
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 07:38:14 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 75b04398
 for <wireguard@lists.zx2c4.com>;
 Thu, 22 Feb 2018 07:38:13 +0000 (UTC)
Date: Thu, 22 Feb 2018 08:45:58 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
Message-ID: <20180222074558.GA11275@tuxmachine.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
 <20180212073501.GA5305@tuxmachine.localdomain>
 <20180212074255.GB5305@tuxmachine.localdomain>
 <CAHmME9pvBg3OHLwun3uqdoCqmQBxxmwh1y2jxWUcdOKyZynNsA@mail.gmail.com>
 <20180213131758.GA5242@lud.localdomain>
 <CAHmME9po373r09jNYXVhJrEO6=LLW51bRztQzwVCO+JX4-=iiA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
In-Reply-To: <CAHmME9po373r09jNYXVhJrEO6=LLW51bRztQzwVCO+JX4-=iiA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 18-02-18, Jason A. Donenfeld wrote:
> > Nice, thanks!  I'm looking forward to testing the next release then.
>=20
> Let me know if the problem goes away with the snapshot I just released.

It does, thanks!  I am now using 0.0.20180218-1 which does not have the
memleak anymore.

Baptiste

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlqOdTEACgkQvgHsIqBO
LkZTAQ//UjScAQP4T/IhgI8IcfKzxe4i34eK+LiOPbNEudRElW9Ypr0z/tPeg8FK
OMt/Ml4QBd939yLwjOpxYZFWWqsDOq9XsbxC2qEz+T0Pz1cY1mAA7qTmy41YuZMo
o3GFa/dBIYTivwpDBp8GcAEo8N1vKHdaSagFVcwVaGELO9q/nkbsBq75Ov30hy8d
rGc9vpb/PnSlIt1QygVmCk1pnVqOdg6wUOHpvP7IP4d67lG8uVVGMZOYpBO1zshY
iOKKeaIvnxOFbcpgwT4E/bmVZHuZ8/JxVpULywONV5I0vEEdoMEuaH2GqzaTsmZw
eMJaa75rWaiXOQtJOzI2oHvaqR55izBCOSqNI886Mnd57IVuxYB0g6Eyr3r5jtbv
AmjUAKSV9Yx83H8s/e9kNGACVJwnUYJIndW/nZxBrJ6lJkGYNmWY9MSqvR4sYrb6
k+usJSaxykoJZlm6ffq7zaTKKzcvN7RlgEmaMnkAFdg2m6h0uePCo9kwFRUry1w1
UKuqH8ChNJcmOF5E5yadkL3jw8oKnJwO0vPq5aNnsfEU5C//Q/gsz/ST8yDuvqKW
eFN84hr5/HCn/5mO7tkjyYjP0iWiNiEdxw9dJbNF9dTsXhoWSRDHuZoAJ0xUcgXF
FU64HC5kZC/LleQqeRRwqviAn9PMcxfl+nWd4YBEqM4G0cko9RY=
=8zQY
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
