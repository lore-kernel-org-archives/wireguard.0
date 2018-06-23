Return-Path: a@unstable.cc
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0fd52e2e
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 02:31:43 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1fe85227
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 Jun 2018 02:31:43 +0000 (UTC)
To: Jordan Glover <Golden_Miller83@protonmail.ch>,
 Lonnie Abelbeck <lists@lonnie.abelbeck.com>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <296DF757-2B21-4F54-9444-1EEBD4A40BEA@lonnie.abelbeck.com>
 <WPqGtU0DfSVI-hq2mee5j7VBN3_KVfJjWsf1-2MDe_1z2uIk7dBWnHF733CM6d9dF1dlhC-bEMy7naNqyAOtKnRZnYYoj5B4TZffzAJF6bA=@protonmail.ch>
From: Antonio Quartulli <a@unstable.cc>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
Message-ID: <654faeee-748b-77e6-2b26-a5216800b6d0@unstable.cc>
Date: Sat, 23 Jun 2018 10:36:31 +0800
MIME-Version: 1.0
In-Reply-To: <WPqGtU0DfSVI-hq2mee5j7VBN3_KVfJjWsf1-2MDe_1z2uIk7dBWnHF733CM6d9dF1dlhC-bEMy7naNqyAOtKnRZnYYoj5B4TZffzAJF6bA=@protonmail.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MyLy4Sfqn9IeQwDmtDvl8IqYyUehrHTpc"
Cc: "baines.jacob@gmail.com" <baines.jacob@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MyLy4Sfqn9IeQwDmtDvl8IqYyUehrHTpc
Content-Type: multipart/mixed; boundary="QeQWnnWGqHRdw3QFBGzHLeb2C8oueRr2c";
 protected-headers="v1"
From: Antonio Quartulli <a@unstable.cc>
To: Jordan Glover <Golden_Miller83@protonmail.ch>,
 Lonnie Abelbeck <lists@lonnie.abelbeck.com>
Cc: "baines.jacob@gmail.com" <baines.jacob@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <654faeee-748b-77e6-2b26-a5216800b6d0@unstable.cc>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <296DF757-2B21-4F54-9444-1EEBD4A40BEA@lonnie.abelbeck.com>
 <WPqGtU0DfSVI-hq2mee5j7VBN3_KVfJjWsf1-2MDe_1z2uIk7dBWnHF733CM6d9dF1dlhC-bEMy7naNqyAOtKnRZnYYoj5B4TZffzAJF6bA=@protonmail.ch>
In-Reply-To: <WPqGtU0DfSVI-hq2mee5j7VBN3_KVfJjWsf1-2MDe_1z2uIk7dBWnHF733CM6d9dF1dlhC-bEMy7naNqyAOtKnRZnYYoj5B4TZffzAJF6bA=@protonmail.ch>

--QeQWnnWGqHRdw3QFBGzHLeb2C8oueRr2c
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi,

On 23/06/18 06:13, Jordan Glover wrote:
[cut]
>=20
> But attacker will helpfully provide you customized 'wireguard.script'  =
as well
> and even tell you how to use it by setting 'chmod 4777 wireguard.script=
'.
>=20

An attacker will also tell you to run "rm -Rf /" :-P


Jokes apart, I was talking to Jason on IRC and I suggested an idea that
might be worth sharing.

A network device driver in the kernel is free to send events to
userspace with any custom set of properties/values.

Most of you have already seen and played with those typically thrown
when an interface goes up and down, with udev normally handling them by
executing some (user-)configured action.

These events can be easily created and customized by any kernel module
and associated to a network interface.
Wireguard could generate preup/postup/etc.. uevents and send them to
userspace.

It will then be udev to decide how to handle those.
Specific scripts could be installed by the admin, or udev could come
with its own default ones.

In any case, this would delegate the execution of scripts to a component
that is in charge of doing exactly that.

This would remove the risk of sneaking malicious things into the
configuration file, which is what people do not expect and is the core
of the issue discussed here.

(Yeah, I already hear people saying "but the malicious attacker will
tell the clueless user to install this script in udev", but I think that
by then, the problem has moved to another plane)

My experience with this mechanism comes from batman-adv[1], where it
used to report special routing events to the user so that he could react
accordingly (if desired).


just my 2 cents.


Cheers,

[1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/net/batman-adv/sysfs.c#n1209

--=20
Antonio Quartulli


--QeQWnnWGqHRdw3QFBGzHLeb2C8oueRr2c--

--MyLy4Sfqn9IeQwDmtDvl8IqYyUehrHTpc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEERdCuyFSHc3WdqS4EB6U8WA7yzXQFAlstsi8ACgkQB6U8WA7y
zXQCnBAAwSrttGwofUjkTZkqWp/xqAIgB/4/G6FEtWGPypLalYQf/a9NiEomdJOi
SyR6YRhxyq/GuDtBc5xkdW/gh6Emc9l/cddkkph1GTAsEScXC+JbXLpr4mRNmO9C
NxDWFtAi6qzP6z+d9TSzdbs9qG/3eTe+N+vLfpU33RLHrYxlOU+Yu5PWGHh/LYQX
HORjZkXI/L5m3RRP106ilIBg4cElBit5GsiaybMMVgSj/N5NDjJ7kuR6zAmmX/nw
T5Y+zUpwHgDqQxRGS4efTE9wx/kk/5grTSj8p32yWpj4OMwlDUEkLiKhMcD0aV6l
i+ZBdtWgugs84nShr6XHKYs69a4W+M4ZmPBo6F4lNUB2WCp9HGvxhBET3Td6HWBy
VfADOyx2S7rVa4pv2nX5nC5ozbopxmIaHoTvnesZjob9ZvTc130HHD0pK7vHMqWl
rXylg86k0D1Oz/qDLqUVRq3eU+jcs+MvNe969I2w1Nl8p6n5pQ7V4HVt/2oqQ+20
O1lQGgZnMoCOyGSzsgOXuAeBPNVGgjCsnc407YGBWWOJBByQbB0pzmwLG61FlMMU
z7WLLLTrl0hmitd5rcJnUpvUPz8zP6OVXvRQk7NVY/aB4VX3XNWbMnHzS1yr/Bpu
DbqYg+Tni9wsFNSPOoKZCTu2GkzkaYS1ge/fEn/2MO56qh9Ffx8=
=k5Q3
-----END PGP SIGNATURE-----

--MyLy4Sfqn9IeQwDmtDvl8IqYyUehrHTpc--
