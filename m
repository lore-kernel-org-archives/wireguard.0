Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6dbcf8b4
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 22:47:42 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c34d6bf
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Feb 2017 22:47:42 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: David Anderson <dave@natulte.net>, wireguard@lists.zx2c4.com
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
In-Reply-To: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
Date: Sun, 12 Feb 2017 18:01:34 -0500
Message-ID: <874lzzqai9.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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
Content-Transfer-Encoding: quoted-printable

On Fri 2017-02-10 19:23:50 -0500, David Anderson wrote:
> In case it's of use to anyone, I've built wireguard packages for Debian
> testing. I wanted to play with wireguard on my Debian Stretch systems, but
> wireguard is currently locked to Sid only until 1.0 brings API stability
> guarantees.
>
> So, I set up a cronjob that rebuilds the Sid source package on a Stretch
> system, and the result is wireguard packages that track the latest releas=
e,
> but don't pull in unstable versions of libc and whatnot when you try to
> install them, as would happen if you tried to install via package pinning.
>
> Naturally, you have only my word that the packages are unmodified rebuilds
> of Debian's original package, and you're trusting packagecloud to not
> tamper with the packages (it's their signing keys, not mine) so caveat
> emptor. It works for me, it might work for you as well.
>
> With the warnings and disclaimers out of the way, here's the repo:
> https://packagecloud.io/danderson/wireguard?filter=3Ddebs

I appreciate your interest in getting wider distribution for wireguard,
David, but i'm not convinced this approach makes much sense.

It seems like a lot of extra work compared to just putting wireguard
into stretch-backports once stretch is released.

Until stretch releases, people running testing should be able to just
add the unstable repository and pin it to be lower priority than testing
(see apt_preferences(5)).

Using this standard approach, users won't need to:

 a) add a new key to their apt configuration, which increases the attack
    surface for all installed packages (btw, the proposed shell pipe
    into "apt-key add -" is deprecated, see for example commentary at
    https://bugs.debian.org/853858)
=20
 b) be dependent on some alternate suite of build daemons -- if debian
    supports your build environment, the buildds will have the wireguard
    packages.

So I don't see much to recommend the proposed approach by comparison,
and i don't think that it should be documented as a recommended approach
upstream, unless there are clearer benefits that i'm missing here.  In
that case, i'd like to know what those benefits are :)

         --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlig6U4ACgkQFJitxsGS
Mje8fg/8CVd9/De6zlkid57Xo4Mk0gVhfxj/EZIssWyxH0C+MPNzyHTJtVwdUnXG
MKeBplbcynW2h+V4LLNfASY/bDR4/KsqvCScFtBNvFXwBE9TlcvXIr5PC3VJEPp7
J4vglI2cB7i/TBvJlkBIeOAHMDnWgWdIACM/qQ+irMmXG3udu1fFIiIioMXoS5yd
PwKATPR6V5mZqL5nu6yXoN7g80MDOJcF6tGcz74QT6bAKQZ7DwtO9FzCGM7pcmxe
CN5cuVr/8M4ddD7CRcgGlwAo+9dUTn5IIIYZ7epor3+YIhHaBxQz2jOeyRpLh2TS
0hKD0+vulDP3e7/ImXH1+5FOX7ccYf6eMQ8t75+Apn/o6nsY5dN+FBlVEd4hhE9r
1mKD5S2cyrsbnOt5hQMRsZCiJytr9DVYVD5QdBAdyxlBosnoxR9lRjr5W0dEktoD
DqvwmHF/lKCMiiCrm6GZ2CwuZCjBQV4NqV/MLc12YAO3g/km59ExMLwzUYu5T99n
MsJuRWpkRoMulAOrDt69MzxAfY0yL5Wej6/B5MlKJ1z/rnoycKJklAumWaewSdus
8A2s96h1W8ka29BmTMqFuObSL3K788eIPUS59nEXlwoePTKoa5cvsB5bFUQ3g8OE
NOGeiDJBB+HXwabjnrRfetwOxKBzCRo9ocIzkmnuhXCBQ6nG5GM=
=Wahu
-----END PGP SIGNATURE-----
--=-=-=--
