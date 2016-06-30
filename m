Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 38ca04dd
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Jun 2016 15:00:32 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, zorun@bitsofnetworks.org,
 Christian Hesse <mail@eworm.de>, Christophe Fergeau <cfergeau@gmail.com>,
 zx2c4@gentoo.org
In-Reply-To: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
References: <CAHmME9oiTG6Hfps0ZqJFJ13UxappXk3TyoLWWu0AZ_G_A65bxQ@mail.gmail.com>
Date: Thu, 30 Jun 2016 11:03:12 -0400
Message-ID: <87furu3ej3.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: wireguard@lists.zx2c4.com
Subject: Re: [WireGuard] The Distro Package Maintainers Thread
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2016-06-30 08:52:04 -0400, Jason A. Donenfeld wrote:
> So it looks like we're the distro people downstream of WireGuard:

hi all!

> Option a) monolithic:
>     Package name: wireguard
>
> Option b) split:
>     Tools package name: wireguard-tools
>     Module package name: wireguard _or_ wireguard-${SUFFIX},
>        where SUFFIX is modules, or dkms, or whatever the convention in
> your OS is

I prefer option (b)

> Zero dot zero. But it'd be nice to further specify that these are
> pre-release or experimental:
>
>     0.0.20160701_pre
>     0.0.20160701_experimental
>     0.0.20160701_killskittens
>
> Any preference on pre vs experimental vs killskittens vs something
> else? I'm open to anything here.
>
> The _suffix notation works well with how Gentoo does package versions.
> What about the rest of you? For example, I think this might pose
> problems:
>
>     0.0.20160701.pre
>     0.0.20160701.experimental
>     0.0.20160701.killskittens
>
> Or, if anyone has another idea for injecting a label like this into
> the snapshot revision, speak up.
>
> Overall, at the moment I'm leaning toward  0.0.20160701_experimental.
> But I'll wait for responses before deciding anything.

debian can't include an underscore (_) in the version number:

 https://www.debian.org/doc/debian-policy/ch-controlfields.html#s-f-Version

and while debian policy suggests that in some circumstances hyphen (-)
and colon (:) are OK, they really shouldn't be used either, so i'd
prefer the dot (.) or plus (+) as a delimiter.

For release candidates: on debian, we can use the ~ character to mean
"just before" -- so if you want a pre-release version (say "release
candidate 1 for 0.1") i'd normally declare the upstream version as
0.1~rc1, which will sort as "earlier" than 0.1 itself.

anyway, i won't lose much sleep over it -- i can translate whatever you
decide makes sense as an upstream version to whatever fits in debian,
with as minimal a change as possible.

One question though: how will the release version relate to
PACKAGE_VERSION in src/dkms.conf?  do we expect those to track each
other or are they separable?

> Regarding the topic of building infrastructure, it seems like with the
> exception of OpenWRT and Gentoo, everyone else is converging on DKMS?
> Is this right? If so, it appears that Christian's dkms.conf file is a
> good start for this, and I'll consider putting it directly in the repo
> at some point. Is anybody here well versed with DKMS? Does it have a
> way of expressing and warning about dependencies?

DKMS works fine for me; i'm sorting out some minimalist debian
packaging, and will start with Christian's dkms.conf, though i'm curious
how other folks would approach the module versioning, as i mentioned
above.

> === 5. Current Status ===
>
> In public repositories there are currently these:
>   https://aur.archlinux.org/cgit/aur.git/tree/?h=wireguard-git
>   https://gitweb.gentoo.org/repo/gentoo.git/tree/net-misc/wireguard/

I'm going to be publishing debian packaging at:

  https://anonscm.debian.org/git/collab-maint/wireguard.git

I don't have anything to show there yet, but hopefully later today i'll
have something.

     --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQJ8BAEBCgBmBQJXdTSwXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRFREIyRTc0RjU2RkNGMkI2NzI5N0I3MzUy
NEVDRkY1QUZGNjgzNzBBAAoJECTs/1r/aDcKkKwQAI3PfAyen1aAB2NsB9ZsgQQB
/hu0xNHJmlPNU2IopZ0LJ7ucZbwtoJOhfjqkGgsYoaxtYFeWgBmO+45HX5PQsO6s
nlAydwWaJyiWqGToxj4J8bAcbDkcYnENtCxEKXPK5PC3oSQuTthNpqQw5MI3U8yD
HkzHdBzBWbP7G2yQpT9wCGp/jZb1qB7JXE7mzRX5S+dDWM7gAnblLWV6pEoZHP5h
qQzGx7JTqIbl1agbl7NzPy2e2t7JbJjUnQgbl4jwk32KGECRPdBwyRyLDWNoXTCz
pU4+trEx8aF85vU/hMzBzbT6i9E2GXiMk9qkh5yE55RUvNtB8ltbw5K+94l2zMkA
+n4iA03ROHTf1H3X8fyF8de3BzTFiiB4ydkzOQlFaQQBA3dZ9VDT7hSD6DaxLAV9
x27rkroeqMtKYQszZDPTTERnS2u9V6yuGXLPLmjO+L8BT+LSWzGjv+PQIaCJDtl1
bKsYLWwzdiRE3/QYZqX1MsuLr8ASzC3O11YANoTPAXhCPqkZglbITuhIlwbn2pOi
/IXqEDmip8doKFeuDUj1TuwsfokGJw8NbqKOyOA/og3Nn6HJAS0YfQ6aT31y6cOX
1IyprOyBA+oYp/Ig584TkBay9pjhWDUCRC3q38Pl4Du43c00SGt7KpyOEj9bBHXk
XZTlt3yzThecGe93CI5A
=Zemn
-----END PGP SIGNATURE-----
--=-=-=--
