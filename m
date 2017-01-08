Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09503326
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 14:02:52 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49cea059
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 14:02:52 +0000 (UTC)
Received: from phare.polynome.dn42 ([172.23.184.97]
 helo=tuxmachine.polynome.dn42)
 by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1cQECn-00025w-IH
 for wireguard@lists.zx2c4.com; Sun, 08 Jan 2017 15:12:17 +0100
Date: Sun, 8 Jan 2017 15:12:16 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Subject: Re: Multiple Endpoints
Message-ID: <20170108141216.GB6421@tuxmachine.polynome.dn42>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
In-Reply-To: <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jan 07, 2017 at 03:43:10PM +0100, em12345 wrote:
> I'm wondering how to setup a WG client when having multiple DynDNS names
> for a single WG server using dynamic IP. Using multiple DynDNS services
> for the same host is a common pattern to work around unreliable DynDNS
> services.
> As far as I see, only a single endpoint can be given in the configuration.

I am also interested in multiple endpoints support, and I am preparing a
proposal that I will send soon.

However, in your case, it would not really help.  Actually, even using a
single DynDNS name would not work correctly, because DNS resolution is
done only once by `wg`, when you configure your interface.  Afterwards,
the wireguard kernel module uses the IP address that was provided by `wg`,
not the hostname.  This is similar to the behaviour of iptables, and the
reason is simple: it would be really cumbersome to perform DNS resolution
=66rom kernelspace.

So, if a client is connected to the server and the server changes its IP
address, the client will keep trying to use the old IP address forever.
You would need to destroy the wireguard interface on the client and
recreate it, so that `wg` configures the kernel module with the new IP
address associated with the hostname.

On Sat, Jan 07, 2017 at 05:45:35PM +0100, em12345 wrote:
> On a server IP change:
>=20
> - the client still sends UDP packages to old server IP, which is useless
>=20
> - the server (from its new IP) can send UDP packages to the still
> remembered client IP (because of PersistentKeepalive). But my
> understanding is that stateful firewalls will block UDP packages from
> the new IP until the client has send an UDP to the new server IP.

For a stateful firewall, this will likely be the case.  However, it would
work with a full-cone NAT:

    https://en.wikipedia.org/wiki/Network_address_translation#Full-cone_NAT

That being said, I'm not an expert on NAT, so I don't know which kind of
NAT is the most widespread.

> So in such a scenario the roaming feature wouldn't help.

You're right, in your case, you would need to setup port forwarding on
your client, so that wireguard on your client device can be reached from
any IP address.

Baptiste

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhySLwACgkQvgHsIqBO
LkZKuQ/8CuGB5dCs/wufr9/xTj/3dFiDotc84uT7sbxOExVBgGnPIx8ejll5Rxvn
VlWXnDhUjG8RaRoiqgYT4JFZ+zOgRZm/50PvrxK2k2xkb3ImX1EbMYImOoEMfCiF
6O62FmiEoJDVXLYh3Hyzm7fBRDntMg5Pzon9THj+2tbfI5EBVoJRT3cGhqF29UoS
2G06AHfxstKeSjNmKDW29lIe8qHjU1/XddBw1re9MNQTbDcrDX07MbUwauX1VkSi
jD4/UJAvC+LeOxjbNporMWhcyu4Vf4vq0yj1lCEJ57atCa8nb3gFdQfj9N2SL3zB
+5XO/gNlDE0jHZNIawjp2Oni24LJC3TrQbqR0o7bM+4ceV9l1K7+JHnqPg2P0kNy
m9vqT1WVs34PzuXPJRSYhn819EMyp/9c3KtaZTVFtlDaYfvS6t47Ehw/yFitw4Au
fyUnpz3l0VsWrDWMpd91aVjJP/+XldPw1RN3oO55JlYBZkLKheT86t/Rz7nSrukp
Ku2659CRa0dC2YWH4pPgdUU0bAKu4KQF7uIjLNt9xv68Z/+7wnUpDtkl8QsUO4pM
5DlGwBKG+M9HIgGClLYcM61KHvp9xtKTMA8mTWPMunZE4gnNJgZT+CM6+qDCFx8l
z2T883RQp6TEqwNvHIhDcIhQd5UGA96+1YIUU3KeKe1yjnlP1Yo=
=ULYZ
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
