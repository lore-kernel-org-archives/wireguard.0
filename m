Return-Path: a@unstable.cc
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79d4da1c
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 13:03:37 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bd3e35d8
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 13:03:37 +0000 (UTC)
Subject: Re: Request: Optional "Comment" [Peer] entry
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lonnie Abelbeck <lists@lonnie.abelbeck.com>
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
 <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
 <CAHmME9peMcMadCJ2WCp2+gp8e+nDK7Zcp_SjpydHniLm8bKiFw@mail.gmail.com>
From: Antonio Quartulli <a@unstable.cc>
Message-ID: <c9e9bc08-893d-686b-b42f-26d5ec8e554a@unstable.cc>
Date: Fri, 17 Nov 2017 21:07:23 +0800
MIME-Version: 1.0
In-Reply-To: <CAHmME9peMcMadCJ2WCp2+gp8e+nDK7Zcp_SjpydHniLm8bKiFw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HeA51uBDkNRqwj25vhXT91FqcN1LbDigo"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HeA51uBDkNRqwj25vhXT91FqcN1LbDigo
Content-Type: multipart/mixed; boundary="VHgsvWjNeco5F6EIMd9na6DDJeX7QlPkq";
 protected-headers="v1"
From: Antonio Quartulli <a@unstable.cc>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <c9e9bc08-893d-686b-b42f-26d5ec8e554a@unstable.cc>
Subject: Re: Request: Optional "Comment" [Peer] entry
References: <1510826689.1349863.1174432192.27EE87E6@webmail.messagingengine.com>
 <CAHmME9qvePERJzuUKXz+nMgd9rH2G9T2EkTbyfPO+8oonR+KoQ@mail.gmail.com>
 <7777F2EF-1D1B-4403-91C6-FB4A36C92CC5@lonnie.abelbeck.com>
 <CAHmME9peMcMadCJ2WCp2+gp8e+nDK7Zcp_SjpydHniLm8bKiFw@mail.gmail.com>
In-Reply-To: <CAHmME9peMcMadCJ2WCp2+gp8e+nDK7Zcp_SjpydHniLm8bKiFw@mail.gmail.com>

--VHgsvWjNeco5F6EIMd9na6DDJeX7QlPkq
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 17/11/17 17:20, Jason A. Donenfeld wrote:
> Hi Lonnie,
>=20
> Quite a few people have requested this, and I've implemented it, but
> never had the motivation to merge it. I keep hesitating between
> thinking that it's a reasonable thing to want, and thinking that it's
> not appropriate to have in a low level tool, and that whatever
> configuration management apparatus you're using should handle it
> instead. Usually I just defer thinking about it until later, but given
> it's come up again, I probably should revisit the issue. There is some
> precedent for this kind of thing: net devices have ifalias and
> iptables has the comment target. However, routes in the routing table
> don't have comments, and neither do IP address assignments on
> interfaces (unless you're counting rDNS). So, hm. I'll think about it.

Just an idea from another kernel module:

in batman-adv (a Layer2 routing protocol implemented in kernelspace)
there was a similar problem: people wanted to give names to peers rather
than using their (almost impossible to remember) MAC-addresses.

Given that batman-adv also comes with its own userspace tools, namely
batctl, the latter has been extended with a name-conversion functionality=
=2E
It basically relies on a file called /etc/bat-hosts the same way as most
linux commands rely on /etc/hosts when printing an hostnames/IPs to scree=
n.

The difference is that bat-hosts contains a MAC-addresses instead of IPs
- being batman-adv a L2 protocol.

How it works: whenever batctl has to print a peer ID to screen, it will
first search the bat-hosts file for a matching entry and then, if one is
found, the related name is printed. The MAC-address is printed otherwise.=


Couldn't wg do something similar? Maybe using some kind of
*/etc/wg-name* file containing a mapping from peer-key to
peer-name/comment? Or even by re-using the original configuration file
(with a new Comment/Name field).

This way the logic would all reside in the userspace tool without
touching the kernel module at all.

The same name conversion applies also for 'input' commands. I.e. you
could tell batctl to "ping" a name and it would first convert it to a
MAC address and then pass it down to the kernel module. Not sure if this
can happen to wg as well.


just my 2 cents.

Cheers,


>=20
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20

--=20
Antonio Quartulli


--VHgsvWjNeco5F6EIMd9na6DDJeX7QlPkq--

--HeA51uBDkNRqwj25vhXT91FqcN1LbDigo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEERdCuyFSHc3WdqS4EB6U8WA7yzXQFAloO3wsACgkQB6U8WA7y
zXQIgBAAtqIPZ/BibAo7+snOlbtc79SOOqXlfplYWI9z/TYOhL2Zx6Xc2FUOSACH
pdMdei/qRgC0BqfUw7ktpKpslhKZ5Uh/jqt1hX+q8LwPRSAWc9rwIU5iqTPD39xQ
JAwAi733IIRQRGtUgpVVzXEZ2X42phPwXTd7r1/wSyIpgTW6yrswQ5v56hYafRfw
gUN6oSrcOD9GK2/Th1CBGU5kQrrQ8CuyMGkvlWpNNd0MttManNxhSFBC2gaBTza+
meBemu0d2CG22qI3A+2zqfwzzEDsem4lqn52AUou3dBQHPY7dwHLAqQ3KUcGvYRZ
/q4M45Pk+eK/sVcoplC8KFQyPXbfdjcGuaGTCxdLq/PDHjQB95dsvlarxz1moL43
kLr65FNOabtgTFgHpT+A9ZjBOz7BBMv/MsyULpG7jsYavUHkBUaufhBNvLjIg1bX
IHjd1gSmFDIeQEOl8ARl9+yMNzptkDPx93KZrjPvzjVAWw4mm7+ZgK9OCBdq5r+s
LzVf+yFcuSrkFpvKcxlgrmqSAX8plUDustPsj59MeeL6K8rnABa05GWvYW5Fm3ru
7j0b31HVJdv+b7hVifeb2mDVi9Nr17gDdjAImBXgc1QpcPjKSHjq/igHJ0NJWdmg
KJpUlPhCiXDmP287HZDGitLkegUOyDrpFjPEXSEM0LEhaWU4TTU=
=+bHC
-----END PGP SIGNATURE-----

--HeA51uBDkNRqwj25vhXT91FqcN1LbDigo--
