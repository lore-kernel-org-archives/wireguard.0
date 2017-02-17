Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e066739e
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 19:49:33 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d6e7f5d3
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 19:49:33 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: David Anderson <dave@natulte.net>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
In-Reply-To: <CAMx+r7X9ZLqqRf8YC8juk0+V1Y3SR6GzPDK7dLqBF0nfEWqg2w@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
 <CAMx+r7X9ZLqqRf8YC8juk0+V1Y3SR6GzPDK7dLqBF0nfEWqg2w@mail.gmail.com>
Date: Fri, 17 Feb 2017 14:49:13 -0500
Message-ID: <87efywha2u.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2017-02-16 22:14:11 -0500, David Anderson wrote:
> The transcript below still shows one additional package being pulled from
> sid/main, the dkms package. I find this strange: wireguard-dkms depends on
> dkms >=2.1.0.0, stretch has dkms 2.3-2, and sid has dkms 2.3-3. Despite the
> negative priority for unstable, apt picks 2.3-3 from sid, even though the
> dependency could be satisfied out of stretch. What am I missing?

That is indeed weird.  what does "apt-cache policy dkms" show you?

what if you "apt install dkms" on its own first, which version do you
get?

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlinU7kACgkQFJitxsGS
Mjd7tRAAwYdbCeqgbTuVmVSRypbSHsoaz2YwqfLDbwRaJC53wgY5X8eOczZp1QGn
15JzquQjIRsEe/D7/2359mTXdD8JHsspSGlFkizmqES5JdrES4gEK9L78YzvB4uB
yrkcy73+aRz7bPEpyGIgdZs8UNgbXxpxEm/mK3zClvPjxYobYHgAM0srwgkq+EAe
drxfYn+AYrOQr1DwgY5cowKlctpPQDFMxD8sF0brn/h9EQFAZwWxL8q19WJQOjRw
AbzSeFkLs/pBZ1f95sorUsH55wRZKZqif8TBNqaw01RsPOtNXOkQcSx8f4q4n2c7
Vq+s+28XzFVVjB+A32W2oAiLhTIJl6geP60jQfNlnto5yujL6UPQeTOpsupES7FY
SOjhLAM2kfKY1eTo6kqjK8HZkw+iFCU70Qr6May56oqHHAiU/+ibjGJ/C8mcitve
EaRF2JOuDhzvT6Ct4jXjl+gAWRsZtuWywcZ5X+hcAMgjFZaAm7GmZ8YeeCFIqpGa
M0LJ9NaFzKuIbCOK/71+hhVnm5uaDfIJtS3ESD2pzIfcsDn3xxpu/oJRPX6+sh6o
G+6ID421xWg3enXHno9Wi/tp1vSIGTbEZScRxVEarp3lbx503A7fKSPfOVYmULda
pLtI2pA4/MoUJ/raxPkpgiowpmHu5xxWEcDEruSmGbt4madHmS4=
=iklP
-----END PGP SIGNATURE-----
--=-=-=--
