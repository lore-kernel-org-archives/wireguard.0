Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3dd6e36f
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 05:58:30 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6043d494
 for <wireguard@lists.zx2c4.com>;
 Fri, 16 Jun 2017 05:58:29 +0000 (UTC)
Date: Fri, 16 Jun 2017 08:13:31 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: Jason@zx2c4.com
Subject: Re: Rebasing Wireguard's master branch
Message-ID: <20170616061331.GA25282@tuxmachine.polynome.dn42>
References: <20170513071040.GC22218@tuxmachine.polynome.dn42>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
In-Reply-To: <20170513071040.GC22218@tuxmachine.polynome.dn42>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 13, 2017 at 09:10:40AM +0200, Baptiste Jonglez wrote:
> Hi Jason,
>=20
> Could you please stop rebasing the master branch of the git repository?
> It's really annoying (and possibly confusing) to obtain merge conflicts
> while simply pulling the latest changes.

There you go again: lots of git conflicts when just pulling from the
master branch :(  Could you stop rebasing master like this?  Just use a
separate branch that you can rebase at will, and then merge in master only
when you put out a new release.

The branch on the right is the old master of my local repository, and the
branch on the left is the new master:

* cf757b7 - (origin/master, origin/HEAD) haskell: re-add updated haskell ex=
ample (2 days ago) <Jason A. Donenfeld>
* 1aaa817 - (tag: 0.0.20170613) version: bump snapshot (3 days ago) <Jason =
A. Donenfeld>
=2E..
* d58b525 - (tag: 0.0.20170517) version: bump snapshot (4 weeks ago) <Jason=
 A. Donenfeld>
* c51728e - tools: opt-in globally to GNU-isms to keep the BSDs happy (4 we=
eks ago) <Jason A. Donenfeld>
* 2823e01 - tools: support text-based ipc (4 weeks ago) <Jason A. Donenfeld>
* 5c6d7d9 - tools: check for proto error on set too (4 weeks ago) <Jason A.=
 Donenfeld>
* 2352dd4 - Kbuild: optimize debug builds too (4 weeks ago) <Jason A. Donen=
feld>
* 523f15c - tests: check for stats counter increases (4 weeks ago) <Jason A=
=2E Donenfeld>
* 5d1e99e - qemu: new location for test kernels (4 weeks ago) <Jason A. Don=
enfeld>
* d6c2d79 - tools: stricter key file reading (4 weeks ago) <Jason A. Donenf=
eld>
* 80d8433 - jerry-rig: symlinks are better for tree patching (4 weeks ago) =
<Jason A. Donenfeld>
* dc34c6f - noise: redesign preshared key mode (4 weeks ago) <Jason A. Done=
nfeld>
* 2a3b0d2 - chacha20poly1305: implement vectorized hchacha20 (4 weeks ago) =
<Jason A. Donenfeld>
* f92f8a4 - qemu: new packages and better debugging (4 weeks ago) <Jason A.=
 Donenfeld>
* 64c45d3 - tools: wg-quick: auto MTU discovery (4 weeks ago) <Jason A. Don=
enfeld>
* 1885707 - tools: retry name resolution on temporary failure (4 weeks ago)=
 <Jason A. Donenfeld>
* 3867408 - compat: remember to call iptunnel_xmit_stats (4 weeks ago) <Jas=
on A. Donenfeld>
* 42bc9b3 - compat: use real crypto_memneq (4 weeks ago) <Jason A. Donenfel=
d>
* 63ec3df - compat: work around ubnt offloading (4 weeks ago) <Jason A. Don=
enfeld>
| * 4858758 - (HEAD -> master) tests: check for stats counter increases (5 =
weeks ago) <Jason A. Donenfeld>
| * 4c294b7 - compat: remember to call iptunnel_xmit_stats (5 weeks ago) <J=
ason A. Donenfeld>
| * 778c7da - qemu: new location for test kernels (5 weeks ago) <Jason A. D=
onenfeld>
| * c9dd87b - tools: stricter key file reading (5 weeks ago) <Jason A. Done=
nfeld>
| * 1f9f7a3 - jerry-rig: symlinks are better for tree patching (5 weeks ago=
) <Jason A. Donenfeld>
| * 51df472 - noise: redesign preshared key mode (5 weeks ago) <Jason A. Do=
nenfeld>
| * eccb09e - chacha20poly1305: implement vectorized hchacha20 (5 weeks ago=
) <Jason A. Donenfeld>
| * fe78c4a - qemu: new packages and better debugging (5 weeks ago) <Jason =
A. Donenfeld>
| * 3c7eca7 - tools: wg-quick: auto MTU discovery (5 weeks ago) <Jason A. D=
onenfeld>
| * f5bce1d - tools: retry name resolution on temporary failure (5 weeks ag=
o) <Jason A. Donenfeld>
| * a5b3628 - compat: work around ubnt offloading (5 weeks ago) <Jason A. D=
onenfeld>
| * a043a75 - compat: use real crypto_memneq (5 weeks ago) <Jason A. Donenf=
eld>
|/
* 03406a9 - compat: ssse3 support (6 weeks ago) <Jason A. Donenfeld>
* 1370d96 - compat: use existing iptunnel_xmit function for stats (8 weeks =
ago) <Jason A. Donenfeld>
* 61e51e6 - (tag: 0.0.20170421) version: bump snapshot (8 weeks ago) <Jason=
 A. Donenfeld>

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAllDdwUACgkQvgHsIqBO
LkbrWw/9HbTtn2rtx7Ayl/u/OFDsaf+rQM8UhdsTqWEPKc/lulx2OR65Q4DG4gz4
8FnP8E2HKgWgl+g/5GWnbcdCxg4bH9m4C/9BMlJVtwBPvf+CfuPyLkgcJrgiE5GI
Gypy1JLXVFxJLQIin0HSm1Ibafn7LcvivXMqlUwG7JRKjGbopnTlcQWopwHnOJkX
iD2n283t+TiyQSlqRm9vwzn03W5v+b/TYbNizlP+zZcOHhoPvM4yNadJ1czCOicx
I25eXubMVgSzZegWvvXdZZMRUIHJMud7aQ/ziejsyJnahOJf/fOXs22l2zGQJqqC
qbQpzMrvLWblSZFrRyYPVIibTuY4LNg/LKkgGf1BPb6nIa71hcO8WjDqeMbMcvCh
2JXc6mAOc+nDxIw2ZbEZSnsStyVzvsy7yOyFJ9wBxkur/X0JEas/r3WZhv20tr3d
UaoV7AMs1koiPnMk7y2hPTuTaWIpn8XeK9jWtcrcQybIhtxKgguLnNZj8gPfOpEG
pfK22c887BhdX47KOSW0GBMEiT9a910REG+H3h1n7UPc0lFzmU0lTqs2MUfoB7Dy
1AMqTg3BpkE2QWs++n97FZGDOLjek0Whj0a7hDOiIjPuTKVmxoLevmh5jSTs/Ugl
JaD9sqNq4vfSezQMTk/0BjVeEaPRoVi8PNR+JCzAcxIQlKUAxyw=
=APpX
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
