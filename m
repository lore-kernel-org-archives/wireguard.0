Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad43457
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Feb 2018 18:36:46 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcb17487
 for <wireguard@lists.zx2c4.com>;
 Sun, 11 Feb 2018 18:36:46 +0000 (UTC)
Date: Sun, 11 Feb 2018 19:43:12 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
Subject: Re: Memleak with 0.0.20171221-5 on Debian stretch
Message-ID: <20180211184312.GD12558@lud.localdomain>
References: <20180211134837.GC12558@lud.localdomain>
 <87r2prs80x.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
In-Reply-To: <87r2prs80x.fsf@fifthhorseman.net>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11-02-18, Daniel Kahn Gillmor wrote:
> Hi Baptiste--
>=20
> On Sun 2018-02-11 14:48:37 +0100, Baptiste Jonglez wrote:
>=20
> > On a x86_64 VM with quite a lot of Wireguard traffic (~300 GB per day),=
 I
> > am seeing a memory leak with wireguard 0.0.20171221-5.  System is Debian
> > stretch, kernel 4.9.65-3+deb9u2, wireguard package from unstable.
>=20
> oof, thanks for this report, and for the really useful graph
> visualization.
>=20
> it's troubling that the changes correlated with the memleak are both a
> kernel upgrade *and* a wireguard upgrade, since that kind of conflation
> might be difficult to tease apart.

Yes, I *think* it's related to wireguard and not the kernel upgrade (since
far more people use the kernel than wireguard), but I'm not 100% sure.

And indeed, we could imagine it to be an issue in wireguard related to the
newer kernel...

> i'm curious from the graph -- do you know what happened at the start of
> week 6 where there's a sawtooth?

Actually, the amount of "slab_cache" didn't change at that point, it's
just the amount of application memory that dropped a bit.  I looked at the
logs, some userspace processes were being killed by the OOM-killer.

> If you still see a leak with the latest wireguard, i'd appreciate if you
> could test the current kernel with 0.0.20171011-1 to see whether you can
> isolate the problem to the kernel.  i'm not recommending running
> 0.0.20171011-1 for the long term, but it should still be wire-format
> compatible with other implementations and will help with debugging to
> have the comparison.

Excellent suggestion!

It does look like 0.0.20180202-1 still has the memleak.  I will leave it
running a few more days to be certain, and then switch to 0.0.20171011-1.

Baptiste

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlqAjrsACgkQvgHsIqBO
LkYjXhAAur729smgcbYQuUcss0Hx93cnHYu7iZjxdfzLN/el7OAkcekfkuMHvV0x
F25/+3PQbJ4Qje/BOkZ2HJAtIA5xqweXkyAyR5qFw3JLIo5RCbr/AP4F+WxpoTY9
BlvD0uk0VPOT1KCz+jZ3Fj/fD2lLMN/r3tCvuqoxKrGM8hbATlL5tzpfxsXlWF1l
kGhrxjUCtqpcF7eQf9p+zbA3aWkkIvxdHPAlPTB/gX63Te0Vt9nWk4ULG7ZzFcEi
Q2/AYexk7l4hJBcQIRjQqO6BpU/A/THDee1Ero68Ffnih3d2M6ey+aR7cHsPoflW
cF2vWIXKFB3Yz54wNd0Y6wqrURwFfUOBy5BSqXFzx4pB/hxn5mgMalHJN5i9gIEx
C7woUeBcd6zMs8QM8HMKAyuPopQmMPM4yu+j2710JojXQsGiHaTJeFBQHRPr6HoO
fPuxSd3iqWS+vyjSG+vIa4PcZFILXpYjN+yP0kzHSTFwG3R2qjPx0EtkBNcbrd5I
dp96yxPp5U8nAEF1d1fi9y7rnqEXURW+YLDQLmlzN1b3pQOmtER+DFO8srtk/QTH
XK9d69Mba1TYWBDZjWahYCKPpuhC5Q2EMWXt75t7f/UtxI2yXw1xUkky03MLenh3
byI2UHGtrs+PIY9Em2kHByu6EsjBJQhzvoPeXHv4TJgAQAus0TE=
=LdUS
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
