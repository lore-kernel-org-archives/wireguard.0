Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 56895c4a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:28:31 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8100e6a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:28:31 +0000 (UTC)
Date: Mon, 12 Feb 2018 08:35:01 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
Message-ID: <20180212073501.GA5305@tuxmachine.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
 <20180211184312.GD12558@lud.localdomain>
 <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
In-Reply-To: <CAHmME9pePGfg3VNRnerXM2qiCqQbM8YYpotS6k1zKv8rV7Sikg@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On 12-02-18, Jason A. Donenfeld wrote:
> Secondly, I'm wondering if you tend to do, "anything strange". For
> example -- are you setting up and taking down the device often in an
> automated way? Or reconfiguring the interface (via wg(8), for example)
> often in an automated way? Or is the sustained day-in-day-out workload
> that leads to this graph simply forwarding and encrypting/decrypting
> packets as usual? If it's the latter, does this device tend to encrypt
> or decrypt more, or both equally?

It's the latter "day-in-day-out" option: the system has a single wireguard
interface, which is configured once at boot-time, and then used
extensively to forward traffic.  It tends to encrypt more than it
decrypts.

> In either case, I'm not sure too much has changed between those version
> spans you gave, with regards to the general packet encryption/decryption
> path, so I suspect this bug will take some hunting to track down.
>=20
> Thanks again for the report. Let me know about the kernel version situati=
on.

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlqBQ5sACgkQvgHsIqBO
LkYIPxAAnobYkpxi4D+u2/6dB9uOqiF7zph2rAyHDYwDZWiA8wi30k9zLeI4puHb
EzDSMJMNMIHyfd1s8EYpYpA/zgxfWNN46Qq4lVH4orF2OaukKpM8VBbZUL2fTyeS
bvDNRuUzT4Bui/mctiELHcaQn9aALClu5V5LIa+BolBP0BDoWIZGl0GJ0IhrGeST
29T7tSyt8AXf8NiAuhfMCO4EdUvTDhWVntDZ63dDwR5xQmMQylWE3yzOQjtsGnQw
fd8GXrhg2sV1u0GUZyI7SJeajRUIqn7x3ZcRTHuAlFn0exoBm2tBJKpVZ4YI3Prq
zMwFWrj5Gbvlwb7MD5c1S+CE5MX9dqQyX/bFQ5ElEwcIEY3fQrKy9i/UHz/e6u4/
CAmMQ184UB6a5lOWydeWB6t54m1PiNPzC1d9XUPMN35cMXoHA/VlLpj+i7mpUXjC
8kaCCcF3+FSvGc94GDmeh6tuM8AVZVJKe/wMZuqIXzpS5b2Xj/Kx+DxkOJzRtRXA
Q4KI2MwJf+6vtoO2IkpXJ34c/jXvtbxCXuEg4Xl94S7WGb3tOnPA2cvzkj50aHGm
jzM7q0goZG1oO0rxGmaA1avao5Ky2adflqGkKSq1y+cIRciX6OMpQLYSN+Uj2xmM
dsj0fMvdj63HLZbaVvapBhdiZjIej1r3l9BXJMz1I/Fcjm1rGXU=
=R/l3
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
