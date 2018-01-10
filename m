Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5b623cd
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 07:40:45 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fd9f2de8
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Jan 2018 07:40:45 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: WireGuard in systemd-networkd
In-Reply-To: <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
Date: Wed, 10 Jan 2018 02:09:35 -0500
Message-ID: <87efmy42c0.fsf@fifthhorseman.net>
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

On Tue 2018-01-09 18:38:59 +0100, Jason A. Donenfeld wrote:
> On Tue, Jan 9, 2018 at 4:20 PM, Daniel Kahn Gillmor
> <dkg@fifthhorseman.net> wrote:
>> very cool!  systemd-networkd end up invoking wg(8)?  or does it interact
>> with the kernel directly?
>
> We taught systemd to talk the generic netlink protocol --useful for
> all sorts of new things cropping up in the kernel -- and then after
> that we taught it to talk wireguard, which builds on top of generic
> netlink. And, it doesn't introduce any build-time dependencies into
> systemd-networkd. So it's there for people who want it and not there
> for those who don't. I think this is the right approach for
> Linux-centric approaches like systemd.

cool.  this sounds very much like you've decided that the netlink
interface is now stable, which is good to hear :)  It becomes much
trickier to update the interface when you've got external tools (whose
release cycle you don't control) talking to them!

>> if doesn't need wg(8), then once the new release of systemd is made, we
>> may want to change the dependency recommendations for the wireguard
>> kernel module packages.
>
> Maybe? I'm not quite sure what the Debian semantics for
> recommendations are. If additional recommendations crowd out existing
> recommendations, or introduce some kind of automatic selection logic
> where only one has to be satisfied in an install-recommendations mode,
> then I'd be hesitant. The reason is that wg(8) allows users to see
> what's going on with the wireguard interface, whereas networkd only
> enables setting up the interface but after doesn't give much
> visibility into what's going on. So all users who run wireguard
> probably want wg(8), and only some users who run wireguard
> additionally will want systemd-networkd. But as I said, I don't know
> what the Debian recommendations are supposed to be precisely, so you
> can decide this better than me.

thanks for the explanation.  debian's semantics are:

   https://www.debian.org/doc/debian-policy/#binary-dependencies-depends-recommends-suggests-enhances-pre-depends

Basically, Recommends: isn't the same as a hard Depends: -- it's
possible to ignore a Recommends: on systems you want to consciously keep
minimal.

The disjunction (A | B) means "if one of A or B is installed, don't bother
trying to satisfy the other; but if neither is installed, install A".


systemd-networkd is shipped (but by default disabled) in the systemd
package itself.

At the moment, wireguard-dkms (the kernel module package) Recommends:
wireguard-tools (which supplies wg(8)), which i'd write as:

  0)  Recommends: wireguard-tools

So i think we have several other choices:

  1)  Recommends: systemd | wireguard-tools

  2)  Recommends: wireguard-tools | systemd

  3)  Recommends: wireguard-tools, systemd

  4)  Recommends: wireguard-tools
      Suggests: systemd


Of the above, i think i'll probably either stick with 0 or move to 4.
given what you said above, i don't really like the idea of using the
disjunction; people already running systemd will have systemd-networkd
available; and i don't want the wireguard-dkms package to encourage
people to install systemd if they've already made a decision to avoid
the default and not use it.

oh, also, any reference to systemd here would probably be versioned to
be at least the first version that supports it.

let me know if you have any other preferences or suggestions.

   --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlpVvC8ACgkQyu+ogyFn
UzNtrA/9H9N2XqKi5dCcO/CAPEqyktw78UlzaZIgsQTfEOYGGHgHl9FzU6h9Xsot
ujbSzIpbkqzS8k1/o/Ij8cJ//KwQyuVohxLRVnh+15Q1hf3kJUO2ycf5qEeOljMl
8MTrXPskzMe4wWfkYsQf6aumWiqkbQRdq+LF4YOoiF1APCNdEQaEUJkfEEmyNgW4
gpl4I2PiXPvf0y7QGu8tujQ9bkWYxWuFxru5hcT2l2bfHqmzpEy/nWBaD7tSj03/
xkvVex6z3bHykERLvAdly96+NvdelN3NhmzhcXjaXr6GbWj8H5SSoqjAkNvLDSSN
tWaeUXAzhZoiDu26/+0hk+LOXPTGwO0tcotE3zpbxOZYCD3/apBH+F+mnhEd1ZqQ
H/H1T5rq152vvWqT/PqUwCKIwE06rsoIaMAOMQ55l37/kTPbFU0iKT9b4dJeuNJV
Z1c4nOZJjz58cbxk55AEItHkp7e6MwglqENmEtL/Ib7LtT5n/Ip2JgPaPNf8wK5L
gcvp8C2EHqb6SM9XvSMf3iII5yVOpak7kgG2sd6dOtDoPRi4swSxGS/pJ+NzqltC
Umzh1tyz7QdWUJZhyss4iYckj9frbTNIQAZdcluL4wjwmn65hyKRzoXqgmxnVQD6
NMc/5dvFinUozFc9hishlW59AVYoZP/FSNO2ewobAJB3B7dlZyQ=
=wEnu
-----END PGP SIGNATURE-----
--=-=-=--
