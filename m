Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8abd7ada
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 22:18:02 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Egbert Verhage <egbert@eggiecode.org>
In-Reply-To: <CAHmME9q7GX2CzYDxQC-W7nmjAeRkht+1hQxFRr22be5E244J+Q@mail.gmail.com>
References: <CAHmME9r24tV2RmNYQfxvdF_0L_egYFek0xeqNZS5UNuZjN5N4Q@mail.gmail.com>
 <454ad249-3313-9423-c2d4-7602d56849fc@eggiecode.org>
 <CAHmME9p6mTNPuRgwqdzEx=emjtvh-R3R5HdSOB=E68_tQxdP5Q@mail.gmail.com>
 <82c49c47-1779-2c6c-8797-9f02f138fb6e@eggiecode.org>
 <87lgwj9b43.fsf@alice.fifthhorseman.net>
 <c5b6cb19-32b8-7f7c-f3f0-ac542579917a@eggiecode.org>
 <CAHmME9q7GX2CzYDxQC-W7nmjAeRkht+1hQxFRr22be5E244J+Q@mail.gmail.com>
Date: Thu, 17 Nov 2016 07:17:19 +0900
Message-ID: <87bmxf6pe8.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed 2016-11-16 23:24:35 +0900, Jason A. Donenfeld wrote:
> Hey Egbert, Daniel,
>
> On Wed, Nov 16, 2016 at 12:10 PM, Egbert Verhage <egbert@eggiecode.org> wrote:
>> Git repo: https://git.launchpad.net/wireguard?h=master
>
> Is there a good machine readable URL that I can check for getting the
> latest package version?
>
> For Debian I currently use this cludge, which is totally wrong and terrible:
> curl -s https://anonscm.debian.org/git/collab-maint/wireguard.git/refs/
> | sed -n 's/.*debian\/\([^ ]*\)-experimental[0-9]\+.*/\1/p' | head -n
> 1

for debian, you could use:

   rmadison wireguard

if you don't have rmadison installed, you can inspect the content here:

   https://qa.debian.org/madison.php?package=wireguard

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlgs2u9fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEVE
QjJFNzRGNTZGQ0YyQjY3Mjk3QjczNTI0RUNGRjVBRkY2ODM3MEEACgkQJOz/Wv9o
Nwq42hAAl7yLoW9GrYSzjKzhkmmAb3mHQQt6UbVzODv2u1U9ydn1MIbLW85nce3a
FQ6llWiPTbRrwQneuyagT83GRJQ6gpB/F7a7dWcQBEgaqWL88/lE6aFz8+AMZ1S7
LwsPrrChKJYLvnSrHbTjpcMZP/qytoti+24guDkoO8JDWv107nTZhVeyW19uTXik
oJekA6hR4V3e2SfQNbCSt0LM7JuvbkDEA9HpHqmaR1REdxh00BibO0Gdn1I98r0O
iL03KyiffUyBlhC0C3/cWe6bq3cahOayYMXUQJmLl7F/hyzA5DulSqEBvEuwoZrf
BLMtob4pnovZTTMJm9otqPCA/EaY0sRr1uYp9mzIrpIPHKUj42DvAFuzCKediFzd
HY+u76pOQFUMIE/M+KFB2K+LfSQ/XgoUbtsHLcgUkrVH4FdrWITAgciaQUmQCOKu
pRqiaY/ADU8pt/p3E5bFRlWNgW5b06hLWDFp0zpKVTQkSY+mcYkBDsgfplDjzXTE
MXKjbSxL6l0RCQtcsloP0iwIKrYiJyVfA8RmBwV08sBnbtVGbjNt3MOfVaCP0K1n
97MusIfM1lALfjLjzc/xyXD92HaWx2/S4kdtFTZl1sHrhiZFMP/jHo4uazUKEoWi
VpOETxs/190wZJ857KSnVRjij6Z6vvCSMNRzTzZ5B49OXnzrDSE=
=ZzVB
-----END PGP SIGNATURE-----
--=-=-=--
