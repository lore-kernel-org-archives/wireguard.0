Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af94c396
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 14:53:36 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c6e9ed7
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Feb 2017 14:53:36 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wanted: Novice Guides
In-Reply-To: <CAHmME9pjv8xWoShiD4WhijExsBq3Q4ovCwbLfkOo7xOJ85+qRw@mail.gmail.com>
References: <CAHmME9pjv8xWoShiD4WhijExsBq3Q4ovCwbLfkOo7xOJ85+qRw@mail.gmail.com>
Date: Wed, 15 Feb 2017 09:53:36 -0500
Message-ID: <8737ffmrnz.fsf@alice.fifthhorseman.net>
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

Hi all--

On Wed 2017-02-15 09:05:29 -0500, Jason A. Donenfeld wrote:
> As WireGuard gets more and more popular, I have more people contacting
> me about novice guides and blog entries and step by step things. If
> anybody would be up for writing these or assisting with it, it would
> be much appreciated. Probably better to tackle this before horribly
> written guides with bad advice fill the void instead.

Agreed about wanting better-written guides to pre-empt terrible ones :)

A good "novice guide" usually has the following pattern:

 a) Present the specific goal of the guide at a high level (if you think
    want X, this is the guide for you) -- the goal should not be
    "install WireGuard", which is meaningless to a novice, but something
    like one of the following:

  * have two machines establish a secure connection between each other
    across the public Internet
=20=20=20=20=20
  * give my laptop an IP address on my home network no matter where I am

  * allow co-workers to access office resources from the road

  * run a "virtual office" offering secure connections between the
    computers of multiple co-workers who are scattered and have no
    central physical location
=20=20
  * operate a public-facing encrypted Internet proxy service
    (a.k.a. "VPN provider")

 b) Present frequently-confused *non* use cases (if you think you want
    these other things, this is not your guide)

 c) Document assumed platform details (if your examples are only known to
    work on Ubuntu 16.10, say so!)

 d) Document steps to take to achieve the goal (these should be very
    simple.  If it's more than 5 steps, the tools or the platform should
    probably be improved)

 e) Diagnostics, troubleshooting and debugging (again, should be
    relatively minimal, but should include at least how to check that
    things are working, what you might see if they're not working, and
    recovery from common failure modes)

 f) Outbound links to learn more (this should include suggestions about
    where to file bug reports, and how to follow up on this mailing list)


choosing (a) and (c) carefully are kind of critical for even knowing
where to begin if you want to write such a guide for novices.

Those of us who are not novices understand that tools like WireGuard can
be used on a lot of different platforms (c) to perform a lot of
different tasks (a), but how those tasks are carried out might have more
to do with policy details (where do you get the peer's public keys from?
how do you verify that they're the right public keys?  How do peers find
each other if there are no stable public IP addresses?  How do you
allocate IP addresses for the wg interfaces?  Which traffic should each
peer route over which wg interfaces?) than with WireGuard itself.

The fact that the WireGuard-specific instructions for any such guide are
likely to be minimal is one of the strengths of WireGuard, i think.  But
that also means that any novice guide is going to be at least as much
about non-WireGuard details as it is about WireGuard itself.

Jason, what kinds of novice guides are people asking for?  What kinds of
guides are people on this list interested in writing?

    --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlika3AACgkQFJitxsGS
Mjc7/Q//esKVbO8nJ77etXOOlyfj5mGstwD/01DsYeqs4HtsrEClyFzNSYpA2WoX
ia8lfY6xLJKYKQl6PkvA3DA38LEfcHt+M9MOyk7J3qVehyqzTvLGE8ZVrOO6akLS
qx/Fssb0RecfrjuLWyDzJMlX2A/01LTKOnaoIoZbr0NYtuAyuzzah2k1e/+w4uLm
D7ieFDVYXDdRRY7b6TYTQm3bfbKmnI4RNI40iyyCkOG2oYQm1C5sq/UB+rU04MSg
o33qNR+4jPfuLBzuKoR1B8TyyImldnz7egNAlqY9EbGghc76ApycT4IGFBzubSER
HgOsjcJKfD8Mp/WjyR+YnMZ5gLFyXQlmLirXTX/dwXnXLzWnUlSvCcFtg7Q7bt6J
qMFP4cDrBxyrm6aBlL2WjtJ6UIRN6+pl9Zek3CCT5eEAgkTSSyEXsKz76r1OwCls
XaeLQkwOC92XyhYMrJx7pmKq7WZkLhACaodAscf54uqyce159fsLpPF9e4fjLYIn
oGSCXwicKH7UqVOqFkaNXFD83IuEKxztRhv34a4H1XcIdYhl/OIMX+y2uw7tSLN5
b5amjl0QIm2r1H04lLakRNXMSFIUMu/ajqR+WKhKqNkMbep8CFF1Ke3D8/EQQMeo
j3PmP7RHlN9ADyxNCoZ7nPNdBEeSb01mMTugvQ6uqVpRAkmoycs=
=skAM
-----END PGP SIGNATURE-----
--=-=-=--
