Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51352d8f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:48:03 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19bf00ad
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:48:02 +0000 (UTC)
Date: Sun, 8 Jan 2017 23:57:32 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Multiple Endpoints
Message-ID: <20170108225732.GC9445@tuxmachine.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
In-Reply-To: <CAHmME9p0wV=cVME+3vQ5tenWOBc5SQWicKevXOwf2N7O2R225Q@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jason,

On Sun, Jan 08, 2017 at 11:18:01PM +0100, Jason A. Donenfeld wrote:
> > So, if a client is connected to the server and the server changes its IP
> > address, the client will keep trying to use the old IP address forever.
>=20
> No. If the server sends a packet to the client using the same UDP
> src/dst, then it will make it to the client, and the client will learn
> the new server IP.
>=20
> > You would need to destroy the wireguard interface on the client and
> > recreate it, so that `wg` configures the kernel module with the new IP
> > address associated with the hostname.
>=20
> No. And even in the worst possible case, no destruction of the wg
> interface would be necessary. wg(8) can reconfigure all attributes on
> the fly.
>=20
> > You're right, in your case, you would need to setup port forwarding on
> > your client, so that wireguard on your client device can be reached from
> > any IP address.
>=20
> No. In the vast majority of cases I've seen, both stateful firewalls
> and NAT do not do the mapping based on the remote IP.

Please read Emmanuel's email more carefuly before being so assertive.
His use-case was a client behind a stateful firewall, so if the server
changes its IP address, roaming will not work.

I merely pointed out that a stateful firewall is similar to a symmetric
NAT, that is, both would cause issue with peer roaming.  But a full-cone
NAT would be fine, as you also mentioned.

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhyw9gACgkQvgHsIqBO
LkbZjA//UWrFMZxcESlfGHKkElYPW5F1F+r0/arRe1y6EF/8kLXtFN2sTHFatSgk
iL3cwNPHI1BTUxOJkOSnDJQP7S/LxQNqUayhYoB8vHHm3LDNHO60RdN8M72OjuOH
cA3U+5H05edEyy+SpsPn70vBaplfwA2uApZkaCqa1HZbU/y+dJNzNsnJC8lgb5u6
yk3bsqBFltVq8YTTEathgQOpQ5nHaH7BsaehoxA//oBQ0/XdTPyQ2UuBRKAHi+/7
npDADKjKwQ3KfhS926qInCnDs3OqxcAYAHhO7y3PUs+rrBc22uYtlyuxrteqleLB
JP27DGfW/D752ijpNiVcbXUUy/zKzdg/ddXl2Nt8dzESAJ9vXAulvxkZW3E+JnRx
IvWf9O5H7Qf5RViF5ldUEFVi17riksrYNoDpPJLm56g3/IBl83oxOfzUSTev+W9l
xCcENBgE3Zg9sDQKStG38LQLTly4yYOQXqlAAwd+aTa5is3Nbor4DAvOwiUZIygH
h7seSgZOfEZJsddXbaE0zkIYqav/Xlt5aM02kMznqY38r6yl9KOdC8aIXifW7uLF
IvsD5g/Zv2oBRw6pwjvFt5bgVcms02symmMLX0s8mLV3vkiDQiz89n2EylbBX03F
I36/AK0lCsPVZWqByYVPvZ305vMA1XjD/zJ2bbsd1N6ciDbsufM=
=zEGg
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
