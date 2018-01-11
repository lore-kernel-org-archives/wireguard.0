Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6747d18d
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 23:36:07 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 628d6dc3
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jan 2018 23:36:07 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Egbert Verhage <egbert@eggiecode.org>
Subject: Re: WireGuard in systemd-networkd
In-Reply-To: <CAHmME9q8_4Ln=OB7_NDTzE3JpTdf8Ae4isJ+qiAVCJJS1qCDcQ@mail.gmail.com>
References: <CAHmME9pJHQOTkOm4Cn6rt-ER14L8Pb54L2r3=T=4DphA0wNBTA@mail.gmail.com>
 <871siz6ouv.fsf@fifthhorseman.net>
 <CAHmME9qrfy4Lf78NkChdv6tPnSFTcGArwgsizAaapL9k=Tc31w@mail.gmail.com>
 <87efmy42c0.fsf@fifthhorseman.net>
 <81bb0726-8f67-0163-875f-0d3403f8df29@urlichs.de>
 <87wp0p1h5j.fsf@fifthhorseman.net>
 <CAB=oiXauSSzhqEgF32spvWmkd3ZaGZfFmy5NEpQmvqxeuDASqw@mail.gmail.com>
 <87k1wo1pfu.fsf@fifthhorseman.net>
 <CAHmME9q8_4Ln=OB7_NDTzE3JpTdf8Ae4isJ+qiAVCJJS1qCDcQ@mail.gmail.com>
Date: Thu, 11 Jan 2018 18:38:39 -0500
Message-ID: <8760880xvk.fsf@fifthhorseman.net>
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

On Thu 2018-01-11 16:02:30 +0100, Jason A. Donenfeld wrote:
> On Thu, Jan 11, 2018 at 2:43 PM, Daniel Kahn Gillmor
> <dkg@fifthhorseman.net> wrote:
>> Matthias was suggesting a simply-named meta-package: just "wireguard",
>> which would ensure that both wireguard-dkms and wireguard-tools are
>> installed.  The advantage there is that you can tell people to do:
>>
>>    apt install wireguard
>>
>> and apt make sure the system has the common setup by default :)
>
> This is a great idea. Let me know if you wind up making this. I've
> added Egbert to the CC so that he can make an identical change in the
> Ubuntu PPA.

I've just uploaded this arrangement to debian, but it needs to clear the
NEW queue, which can take a little while.

You should be able to follow the NEW queue here:

   https://ftp-master.debian.org/new.html

Egbert (or any other packager for a debian derivative) can see my
packaging here, if they're interested:

   https://salsa.debian.org/debian/wireguard

in particular:

   https://salsa.debian.org/debian/wireguard/commit/cc3cab4b799a64e9c74985da627fc85ba0ee2cc8

as always, I welcome feedback and suggestions for other improvements.

Regards,

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEzicvlOwymaWlnoHjyu+ogyFnUzMFAlpX9X8ACgkQyu+ogyFn
UzNQLRAAiaa3hFpxqFfD2kIx1Cx1Lcx+Hl5PuCUpo/29tDSi0Tz92tuSsQkuKXi8
wB7TqUcltbdviWCVqDPRAWu61HyVzgW4rAde7FFaddhFx/I9W3qv4k5pIFPc4sQg
ZLNSFPH/Ma0cnBoSCkUvBw88Pgy5wfePWvqk6bqjRFbMu8VAmGxydP5pIi7X8VLD
S9NqcFdT+rvNMnz6sPUR/J/+UoREigZvZFyqZQVfqsHnLTWQZhd7Gh9T2ENLl8GE
k0NRkor+4VuGoHe6NAMsteh4f8H5yR1CmFgRhZvfTd9yxi5F1TNsJU4SSyq2/ab+
oElEjuZC8gJBeGMV0pTsi/TuhhDRS7tARRLZid91uRx6nsxii7i+NnP7SWIYS1GB
nSQC/oTf9LeswJaHQ31FQ/hjeSViKDreGN53oYz8aJnjmylgKF8P8py/XXu1xTHU
K1qJbz2EaHqAgAR0hop4+V2Pmsniy7Zp3bymHigFij3OmYiIJ3hwB5GR6UArEhl3
MxPiRoFSA+pjB+nEJPEkVWqQJh1gn62OVHQgYL6Z2yrHGXDenhDdU12Amb16uxx3
mvhVUyLjEC8tE+1UKQHMFoZeTv2mzOFw2V7zujeavHQI//y36saHRMw4Fv9sZnS4
HeywwLO/o4YfEZa68mFHZVmnwsjog655ZQa/HavAugFJfdElq4Y=
=EFhf
-----END PGP SIGNATURE-----
--=-=-=--
