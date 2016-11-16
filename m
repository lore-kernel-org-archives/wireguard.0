Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98dfbfea
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 07:29:04 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Egbert Verhage <egbert@eggiecode.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
In-Reply-To: <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
Date: Wed, 16 Nov 2016 15:45:16 +0900
Message-ID: <87lgwj9b43.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Subject: Re: [WireGuard] Seeking Ubuntu PPA Maintainer
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

Hi Egbert--

On Wed 2016-11-16 09:34:12 +0900, Egbert Verhage wrote:
> I just copyed the debian folder of the experimental package of the
> debian repo.

I'm the package maintainer in debian.  Glad to hear that my packaging
work has been useful for you.

If you're tracking the debian packaging, you might also be interested in
the revision control history of it:

    git clone https://anonscm.debian.org/git/collab-maint/wireguard.git

If you find that there are specific changes to the debian packaging that
you find useful when packaging for ubuntu, i'd be happy to hear about
them.  Also, if you run into packaging difficulties and want someone to
brainstorm with, feel free to reach out.

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlgsAHxfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEVE
QjJFNzRGNTZGQ0YyQjY3Mjk3QjczNTI0RUNGRjVBRkY2ODM3MEEACgkQJOz/Wv9o
NwrSjQ//SEqfcZFFMlg9EaI4CH/mJbPUrkOOr118BM26sZr9dROK47RHpxRpkO4g
6sRwBQFpANzOoBjNWigK7bsFz8KOGg0tDaNbqjAn9OcC6bbhcp8hF1vs6nR1Jb53
QwL00FrQRVLh2fTOh+DU5LHW5nhbfY8NnDW5Xx+rEynDcAEGG4xusvczJU140wam
zCVkqPVYr+WVsBFeeuq1gyP4WMd1a5ahOg1G6loifrCr9uYp45bPwz3Qqf2UPjLY
VO+cHah2zEvvnq0rZvGlOFaw5RepWFx17n5RFMPXWT7Vc3yypX+cetNE+j18iZsO
J29tqAX8cRJGL8+884ZH/BKvr+6P2m9PdRGuXK1Ob6OdoYFi5XV31RCpWnsa6xwb
IgPFF1ED9xf6QwoHotk4X2VQtvbTFADTLj9rwWiSfkHd6gAvxXVZTkBH5CiRf0MD
QixMmrpEMO1vPN2s6BwifNqBHCYFiyURqCGAubpMiSISr3epZMYqbTS9ABmvbe/n
RU+NontiHE2hjvoWVnJwAq1tSV/d59LYKmhqnGLXPiu1S3W5yg6f/ef7f+MPK1qj
ehYUFStsfYSXuxG+DDGd53qO20lsfW7Sq+dTrMlJAlLN2NRbpWg+HhqjJldITVrH
YvjlhTBeu5nHkF512ln483s9w9wAA6FO4AQnSQZUUI+I816M3dM=
=4D+A
-----END PGP SIGNATURE-----
--=-=-=--
