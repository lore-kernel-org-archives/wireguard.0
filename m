Return-Path: konstantin@linuxfoundation.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee1dad04
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:35:35 +0000 (UTC)
Received: from mail-it0-x22c.google.com (mail-it0-x22c.google.com
 [IPv6:2607:f8b0:4001:c0b::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c1dd0d7
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Aug 2018 14:35:35 +0000 (UTC)
Received: by mail-it0-x22c.google.com with SMTP id h23-v6so2935008ita.5
 for <wireguard@lists.zx2c4.com>; Fri, 10 Aug 2018 07:46:58 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Date: Fri, 10 Aug 2018 10:47:17 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Candler <b.candler@pobox.com>
Subject: Re: Reflections on WireGuard Design Goals
Message-ID: <20180810144717.GA14062@chatter>
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
In-Reply-To: <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 10, 2018 at 02:35:14PM +0100, Brian Candler wrote:
>From my point of view, the only thing which makes me uncomfortable=20
>about wireguard is the lack of any second authentication factor. Your=20
>private key is embedded in a plaintext file in your device (e.g. =20
>laptop), not even protected with a passphrase.=C2=A0 Anyone who gains acce=
ss=20
>to that laptop is able to establish wireguard connections.

I think one way of solving this is teaching the client-side tools to=20
hook into the TPM. We still grab the key and store it in memory (as=20
opposed to using TPM's crypto processing directly), but at least this=20
way it's not lying around on disk somewhere, and it doesn't require=20
changing anything about the protocol. I am hoping to hit up James=20
Bottomley about it when I next see him -- he's already written quite a=20
few tools that use TPM, including teaching GnuPG how to use it. :)

>But I'd feel a lot happier if a second level of authentication were=20
>required to establish a wireguard connection, if no packets had been=20
>flowing for more than a configurable amount of time - say, an hour. It=20
>would give some comfort around lost/stolen devices.

I believe this is orthogonal to the design of the protocol, which is=20
supposed to behave in a "stateless" fashion and resume transparently=20
after even prolonged downtimes. We use 2-factor authentication with=20
OpenVPN, and one of the most annoying aspects about it is the fact that=20
you have to manually re-auth after each VPN blip. If you don't do it=20
quickly enough, all your sessions get reset -- most horrible experience=20
if you are hoping your ssh connection to a server doesn't get severed in=20
the middle of a yum update.

>Whilst I appreciate that wireguard is symmetrical, a common use case is=20
>to have remote "clients" with a central "office".=C2=A0 I'm thinking about=
 a=20
>hook whereby the "office" side could request extra authentication when=20
>required - e.g. if it sees a connection from a wireguard public key=20
>which has been idle for more than a configurable amount of time, then=20
>it sends a challenge which requires (e.g.) a Yubikey to complete.=C2=A0 I=
=20
>appreciate that it's not going to be straightforward, requiring the=20
>kernel module to talk to userland components at both ends.

I think Wireguard's primary strength is its resilience to network blips=20
and fast operation. We intend to use it for site-to-site connectivity=20
across disjointed infrastructure where it will certainly operate much=20
smoother than OpenVPN or ipsec. For admin-to-site connections we will=20
continue to use OpenVPN or some combination thereof, until we figure out=20
a straightforward way of "upgrading" access level of a wireguard=20
connection. I suspect this is fairly easy with iptables and fwmark, but=20
I need to test and streamline it.

-K

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCW22ldQAKCRC2xBzjVmSZ
bKbaAQDiGknQ8SLNZ2yPQeyzywshYkuI36jipMIS1lDHi9RzRQEAo3bOe72/3Vnp
e0H1gXofBC/AikHU8Hut4wXKFBrTnQg=
=QTGR
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
