Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5dc3060b
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 15:28:19 +0000 (UTC)
Date: Thu, 30 Jun 2016 17:30:58 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160630153058.GC4073@lud.polynome.dn42>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sHrvAb52M6C8blB9"
In-Reply-To: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
Cc: Christian Hesse <mail@eworm.de>, zx2c4@gentoo.org,
 wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--sHrvAb52M6C8blB9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 30, 2016 at 02:52:04PM +0200, Jason A. Donenfeld wrote:
> =3D=3D=3D 1. Package Names =3D=3D=3D
> Probably for the purposes of consistency and ease of use, we should
> standardize our package names. So what about restricting naming to
> either of these two naming options:
>=20
> Option a) monolithic:
>     Package name: wireguard
>=20
> Option b) split:
>     Tools package name: wireguard-tools
>     Module package name: wireguard _or_ wireguard-${SUFFIX},
>        where SUFFIX is modules, or dkms, or whatever the convention in
> your OS is

On OpenWRT, the packages are necessarily split, and the kernel package is
called kmod-wireguard.  For now I have named the tools package "wireguard",
but there's no problem changing that to "wireguard-tools".

> =3D=3D=3D 2. Experimental Status =3D=3D=3D
>=20
> WireGuard isn't meant for prime time. It's still under development,
> and there won't be CVEs or responsible announcements made for various
> issues. The purpose of this phase now is to get it out to interested
> testers and experimenters for working out various issues. Debian is
> very well suited for this configuration, with its experimental tree,
> which is where the package will live until we release the first "0.1"
> or "1.0" version that we stand behind. Arch has a similar place. I
> think OpenWRT has a good slot for this too?

All third-party OpenWRT packages go to https://github.com/openwrt/packages.
There is no notion of "experimental" repositories as this is third-party
anyway.  There are also special branches for stable releases, where
package versions are mostly "frozen":

  https://github.com/openwrt/packages/blob/master/CONTRIBUTING.md#release-b=
ranches

> =3D=3D=3D 3. Versioning =3D=3D=3D
>=20
> As mentioned prior, we're not at 1.0 or even 0.1. Many packagers can
> deal with building straight from the git master with a live checkout.
> But other packagers can't, and this isn't very nice for testing users
> anyway, since they don't get version bumps for updating. So, it seems
> wise for us to formalize a snapshot versioning scheme. First, there
> are two ways of doing this:
>=20
> a) I can tag snapshot releases.
> b) You can select snapshot commit IDs.
>=20
> I think between these two options (a) is clearly superior, since then
> I can be sure to tag commits that at least build.

Agreed, you are the most suited person.  It's tedious to have to guess
when upstream changes are either significant or likely to break things.

> With the actual version numbers itself, I think at least it should be
> based on the big endian date stamp:
>=20
>     0.0.20160701
>=20
> Zero dot zero. But it'd be nice to further specify that these are
> pre-release or experimental:
>=20
>     0.0.20160701_pre
>     0.0.20160701_experimental
>     0.0.20160701_killskittens
>=20
> Any preference on pre vs experimental vs killskittens vs something
> else? I'm open to anything here.
>=20
> The _suffix notation works well with how Gentoo does package versions.
> What about the rest of you? For example, I think this might pose
> problems:
>=20
>     0.0.20160701.pre
>     0.0.20160701.experimental
>     0.0.20160701.killskittens
>=20
> Or, if anyone has another idea for injecting a label like this into
> the snapshot revision, speak up.
>=20
> Overall, at the moment I'm leaning toward  0.0.20160701_experimental.
> But I'll wait for responses before deciding anything.

There does not seem to be any restriction for OpenWRT regarding allowed
characters.  Personally, I'd like to keep the label short for readability
("exp", "pre", "alpha"...).

> Have I left anything out? How does that all sound to you guys?

How often do you plan to tag new snapshot releases?  For OpenWRT, I don't
plan to update the package more often than once every few weeks anyway.

Also, do you plan to have an infrastructure producing a tarball every time
you tag a release?

Baptiste

--sHrvAb52M6C8blB9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXdTstAAoJEL4B7CKgTi5GYW0P/iR4uIveGPJrZSE98yZg8P2x
QkFKflHMYXugrD4E9Topq+pnFqryFxFPUGmFdTNIY2BJ6cJwh0H9X6TxmNOeiP/J
CgzXA5UAGOtI1C2ZBWN0zUlCU9oVa3tBn0kWeWrikpS2tsb9tdhgEp3fGRjGD2pr
qDL0foyp5coNHH5CeGipM2aXCE0+pyCi70WAJzr4mlWtS2z+YI6YyOVpeoxVsKOq
r1KwwG+u+7N1A9MzAtQyeKN1qXBO01DTfVgHc4+ZLrW9LTUBlwgR3v7Rit+B1IR6
/8LIA9VvloKuC6Kq0oi2thCtj7PMhQTmOSFi8vqOke+1H3w7c6UwEIk7QE8BRJCO
MHBFs04ODcDLdK6YICwWsSzM1rfKCkkrB2x9yQL2kM5U5b8YyLdohVcBtf/9XVs2
PBYm9Oqw2ySylHAplHs3bIrWjUzhbKzqIa4JyoavW+AQDMr8LhnF+GKYaA16RDqq
WcAJ0BePjH4biEi4R6Dt/uZodSqHzB/uLI/c4CWO7fNclGGyvCDz2cruzlKnIB8g
xXD51rQZ8O+4Q+q1H8MRkcRGpTdZ07CfNji4xBWRKBsXMrEklFw+XqPTOkrwUQtu
ZMJBjhhSTbJ3gjJhai3yah+EiU3O/AhykZzGRxB0FtqpM5KbZFkVfhCdyx+kxsBy
ZQkiYT3yZayMJgQmfQdG
=XxeA
-----END PGP SIGNATURE-----

--sHrvAb52M6C8blB9--
