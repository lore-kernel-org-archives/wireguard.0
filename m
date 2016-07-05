Return-Path: n3ph@terminal21.de
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de
 [80.67.29.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 013b21de
 for <wireguard@lists.zx2c4.com>; Tue, 5 Jul 2016 00:04:05 +0000 (UTC)
Date: Tue, 5 Jul 2016 02:06:58 +0200
From: Michael Gerlach <n3ph@terminal21.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Message-ID: <20160705000658.GA6619@c3po>
References: <20160704225300.GC9424@c3po>
 <CAHmME9r33BJHwbx2G-ANf02+ED4TJOs_Go+Ad3xoCX9L8DJY0g@mail.gmail.com>
 <829db05d-422d-4573-a7f5-d1beff657160@posteo.de>
 <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+6KMIRAuhnl3hBn"
In-Reply-To: <CAHmME9ruAPJsRjvsm_+iPUBzD+z85N+4pdw25KhM9FpG0ygMCA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jens Viisauksena <viisauksena@posteo.de>
Subject: Re: [WireGuard] wireguard on gentoo (4.6.3)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--x+6KMIRAuhnl3hBn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Ah! I wasn't looking closely enough to the headers.. The maillist is in CC.=
=2E I always
use List-Reply, which wasn't working so i guessed you already wrote
offlist so i replied directly.. :)=20

I already tried to disable CONFIG_MODVERSIONS - which turned out to make
things get weired since mykernel was not starting anymore...  But I will
give it a try and have a look at it again.

Just for the details:

[01:50:36][n3ph@c3po:~][master]# zcat /proc/config.gz | grep -e
CONFIG_NET_UDP_TUNNEL -e CONFIG_IPV6 -e
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT -e CONFIG_PADATA
CONFIG_PADATA=3Dy
CONFIG_NET_UDP_TUNNEL=3Dy
CONFIG_IPV6=3Dy
CONFIG_IPV6_ROUTER_PREF=3Dy
# CONFIG_IPV6_ROUTE_INFO is not set
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_IPV6_MIP6 is not set
# CONFIG_IPV6_ILA is not set
# CONFIG_IPV6_VTI is not set
CONFIG_IPV6_SIT=3Dm
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=3Dy
CONFIG_IPV6_TUNNEL=3Dm
# CONFIG_IPV6_GRE is not set
# CONFIG_IPV6_MULTIPLE_TABLES is not set
# CONFIG_IPV6_MROUTE is not set
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dy
[01:50:37][n3ph@c3po:~][master]#

best regards,

n3ph


On Tue, Jul 05, 2016 at 01:54:13AM +0200, Jason A. Donenfeld wrote:
> Hey Jens,
>=20
> He sent me another message offlist, so I replied offlist. I suspect,
> from the dmesg he sent, that it actually might be an issue with
> CONFIG_MODVERSIONS, so I suggested disabling this option, as a test.
>=20
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> http://lists.zx2c4.com/mailman/listinfo/wireguard

--=20
Please use PGP - https://en.wikipedia.org/wiki/Pretty_Good_Privacy


--x+6KMIRAuhnl3hBn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXevoiAAoJEE1l5S41evqa6JcIAMQN7zaav1DKj937cnxF5IBn
4+eIpTncJqoDdp1ur2yrcg3ZE8h3yO+qJL+VhEgkpL+dWmMvv7YJKi0s35CWG4kQ
xtRCiWwsvwH1vGFcT/ccedOyqaiXvTrr9TYq0sDpaaPokIQoZtFq22CcPHrarMzu
e9X+eUFf8wG8BajgmDK+/1OmJaUUasgJdI5YqTsijFBf3dIE5wC0i3/igY5gwfNs
8W+2Cw6i5uIOfzwxdn9cmCJrk9gmGNCAEQWVWwaViZIuEh4+3olF5Vl+QFU8lRSo
Z8kCgFckzR0f2l/o3P8uA5w0AB9xxReCoqTLj2rtfadR5ANoG3F/V9K2PJjJ1Tw=
=Pvb8
-----END PGP SIGNATURE-----

--x+6KMIRAuhnl3hBn--
