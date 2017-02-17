Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a59a6f2b
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 02:48:59 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cba94a63
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 02:48:59 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: (Unofficial) wireguard packages for Debian Stretch (testing)
In-Reply-To: <20170215213153.GC16102@tuxmachine.polynome.dn42>
References: <CAMx+r7WsvfJ6j7JT9+Z5mNe=FEFwehTVNgX+7-8vnQMa5FxORg@mail.gmail.com>
 <874lzzqai9.fsf@alice.fifthhorseman.net>
 <CAMx+r7XsHgrxy+1T4ndqzSebA6Ds4XTjQrD9VmoCWAtJkLygHw@mail.gmail.com>
 <87o9y4n555.fsf@alice.fifthhorseman.net>
 <20170215213153.GC16102@tuxmachine.polynome.dn42>
Date: Thu, 16 Feb 2017 21:46:15 -0500
Message-ID: <87y3x5h6vc.fsf@alice.fifthhorseman.net>
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

Hi Baptiste--

On Wed 2017-02-15 16:31:54 -0500, Baptiste Jonglez wrote:
> On jessie, it worked exactly the same with the 4.9 kernel from
> jessie-backports:
>
> # cat /etc/apt/sources.list
> deb http://httpredir.debian.org/debian jessie main
> deb http://httpredir.debian.org/debian jessie-backports main
> deb http://httpredir.debian.org/debian unstable main
> # cat /etc/apt/preferences.d/limit-unstable
> Package: *
> Pin: release a=unstable
> Pin-Priority: 200
> # apt update
> # apt install -t jessie-backports linux-image-amd64 linux-base
> # reboot
> # apt install wireguard-dkms wireguard-tools
> # ./client.sh
> # ping 192.168.4.1
> PING 192.168.4.1 (192.168.4.1) 56(84) bytes of data.
> 64 bytes from 192.168.4.1: icmp_seq=1 ttl=64 time=15.1 ms

interesting, thanks for testing and reporting back!

are you sure that with this installation on jessie, the wireguard
packages are the only things that got pulled in from unstable?

If you have apt-show-versions installed, you might try grepping through
its output to make sure.

Regards,

       --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAlimY/gACgkQFJitxsGS
MjcDXhAAuglhvs6IIVaHw1bB1epHkM7YoOQZ4FSaJ7mu+J6u4i17mEnl2MmehSbE
K4+aLQzERDbUAJl5M5iZFBY9EWVORT/bSjrJFIZgDRkmGiuNK9poc+newK/ZCeFa
1l0R2wDkroRhuSje5i4iOhW33LL3wX55eMTjGpygrNP2JNbulcRdJTfJEAGhsgjQ
MWsanQudLjdkhren7NDQvTsPZu4QF6LamNzKhoBuuyJcpFR/4UKn8NmII0GFXWts
EK/qsEYgcW6diaN43RHD7BeK4C4qZtgj1E0bb/gkgT09RdMMyiNdSEr9o4H5OsgH
Nmxs5w8WUgY6h9aadKRRdyAVe0R+/MZ9bHrDy+aTPxYT+qC8RAIRdxgo2Mfvb9Qj
YWAQpzouHk+zsR9qOQewHt9zKF+I7CnILTh/1ENsxNkCfgKOpuTvJ4aXZpbI65TG
aG2L5/QfuEqTZu2oXY95sCJIBu9unU7HPxNwVNDfol7x/ErI68GMPW24WBgT/eiB
iC/0Xh/TsXDsLRD0Wf1gvh41R0QHdmYhYKvwRGHVn7OsZqwqRHiwxk++vWAHq/oc
BnGsnd/OIIU5p13HK8MYovunDWeE6vZY3RA9rhiRT/R1huDOnXOv7aNmX477WYLS
++ot+8gXeAkhWatvGf304W7j+R+xvbEhCTMoZ93LGWu4o9vzVIQ=
=DmIa
-----END PGP SIGNATURE-----
--=-=-=--
