Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d133f1e3
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 04:38:49 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e9cb9c29
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jan 2018 04:38:49 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Egbert Verhage <egbert@eggiecode.org>
Subject: Re: decoupling version dependencies from metapackage in debian/ubuntu?
In-Reply-To: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
References: <CAHmME9rU+n6bMB+eYKu74yVn2bNkMJLX=FP-XbfKt+qjsoTVYQ@mail.gmail.com>
Date: Fri, 19 Jan 2018 23:42:21 -0500
Message-ID: <87bmhp3zv6.fsf@fifthhorseman.net>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jason--

On Fri 2018-01-19 14:21:42 +0100, Jason A. Donenfeld wrote:

> Someone in #wireguard is getting weird errors about version
> dependencies between packages. I started looking into it and noticed
> the strong coupling between the metapackage version and the other two
> packages' versions.

I added the tight versioning to the metapackage when i realized that
divergent versions of the wireguard-dkms and wireguard-tools actually
wouldn't be an acceptable combination.

> The users' issue seems mostly like an Ubuntu problem: they build _all,
> _amd64, and _x86 immediately, but delay the other architectures until
> later. So, the user in #wireguard was using an aarch64 board, which
> pulled in the newer _all package, but that package was unable to
> subsequently satisfy its architecture-specific dependencies, since
> they hadn't been built yet. Annoying Launchpad bug; news at 11.

as explained earlier, this isn't a launchpad bug, it's a function of
running with a rolling distribution (debian unstable and ubuntu PPAs
both have this characteristic), where there is no coordinated
cross-platform release schedule.

This means that for some architectures, there will be some times when a
package isn't fully-installable if there are cross-arch dependencies.
the usual answer is "wait a day for the builder you care about to catch
up".  Some repos will also keep around two versions of the same package
in an archive if they know that the situation exists, but i'm not sure
what configuration is need of the archive (or of the inter-package
dependencies) to make that happen.

While the above situation is a little annoying, it does only affect
new installations; automatic upgrades will simply hold off until all the
necessary package version/arch combinations are alignted.  that said =E2=80=
=A6

> But regardless of Launchpad particularities, I was wondering what the
> motivation is for coupling versions together.

i started with the tight versioning because it seemed simpler as an
implementation and wouldn't require me to coordinate with any particular
upstream interface changes, but i readily concede that this isn't a
strong motivation.

> Since the Netlink changes, there should be compatibility between the
> tools and the module. Does that mean it's not useful for the
> metapackage to do strong coupling?

If the netlink interface is actually stable, then at least as simple as
the current arrangement (and probably more robust) to instead set up the
dependency versioning to be at least the first version of both packages
which agree to the stable netlink interface contract.

I know that we moved from ioctl to netlink in 0.0.20171001 -- was the
interface fully stable already by that snapshot?  if so, then i'd just
change those metapackage dependencies to (>=3D 0.0.20171001) and assume
that mixing and matching anything beyond that point is an acceptable
choice for the package resolver.

if i do that, i'd ask you to be really clear and explicit in each new
snapshot if you think it introduces a backward-incompatible interface on
either side of the netlink boundary.  if that happens, it's not the end
of the world, i just want to be aware of it so that i can explicitly
bump the dependency threshhold in the metapackage.

what do you think?

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlpiyK0ACgkQyu+ogyFn
UzN+yhAAsLWQnuS7Eq4HpZ0Zw3RWRHPIxXu8N0VGnBIeK2Tn0ND6T/kOLn217wed
IKtIRvdvFkY8uuzuBo6rrU8Sj0M9eX/BPz8XDrSosRwrnEIn/3AzUyhBgnOoIk76
y34aRBXFXQGg8ecLPZVp5evaHiBUUSuZSzbDykA8i0XbSUiLIj5e0uQYGHDHqDAu
nyrAty7VjwihpaBOJYntS/3OlRrcVccerpwc7g0Ht8bYTGp9N4tdwY3d/f92j/m4
d04sloT7lX1a7cHa7jc/QG8vvF++8aX1LdW8HqkdaloxhMJtsVChveOfvCS72HqM
jlH9HEYjrbxx09BPUV/3w9w/P6Yo9Z2F/+GldVWtfKQpurhUemI5+GO1KCBN1wnl
12UNAd1Qal8KJL5onsWvsBqqJHK7v9wMZaTMNMxfsR29DvLN67SEbETYUZ4/sDwL
Yenv7oGITkkdVog4qBGgaPgGI42tjh7B65IoNu+9ZthVlM0YfV0SbRSTAwJEeGAC
W5Ln4CW+4uleSqsy5+F5hxjIpMBYP+CB1CKgTEoIePmgDQAQg21RZ+/F0R4CM5bn
kSl+X/OsHFYI/mzkpPQRehNTHd4StfmGcALTckd5ZR9FFc2SnAKwofjEl5MFLGWT
o5oPf9GptTP4mmONJPAoRaUvsoLFgXaQARg2xWSCJzc7YCZbVlE=
=itt7
-----END PGP SIGNATURE-----
--=-=-=--
