Return-Path: <SRS0=uuIP=E5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7BECC388F9
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:42 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B94206D4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Nov 2020 21:23:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B94206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=max.pm
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fc212e94;
	Mon, 23 Nov 2020 21:18:15 +0000 (UTC)
Received: from hergenrother.uberspace.de (hergenrother.uberspace.de
 [185.26.156.204])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d4045097
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Nov 2020 16:57:35 +0000 (UTC)
Received: (qmail 371 invoked from network); 23 Nov 2020 17:02:57 -0000
Received: from localhost (HELO localhost) (127.0.0.1)
 by hergenrother.uberspace.de with SMTP; 23 Nov 2020 17:02:57 -0000
Date: Mon, 23 Nov 2020 18:02:55 +0100
From: "Max R. P. Grossmann" <m@max.pm>
To: Hendrik Friedel <hendrik@friedels.name>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Connection works, ping does not
Message-ID: <20201123170255.joa7zsjvztukjxd4@desktop42>
X-PGP-PK: mDMEXiQ2gxYJKwYBBAHaRw8BAQdAe486pBdti/gJHMqGnKAgX+5K2CiYJGZ6ONHAG8Q31ni0Hk1heCBSLiBQLiBHcm9zc21hbm4gPG1AbWF4LnBtPoiQBBMWCAA4FiEEoJqS/FAV7oYacJhRGZmGHBY2upsFAl4kNoMCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQGZmGHBY2upuk5AD9FArDm6+U2sD5O0PrXUxFQdsPKo7u/yeUAfdVafBIP6EBAMRUTzGsv72kVW/ZCZzzePW+rYFIXT23HHYB5NY+D5UOuDgEXiQ2gxIKKwYBBAGXVQEFAQEHQMRFCdiwQ/SkphEslSmg2TNp8vDM9QkYYrLB0LJ2zEpZAwEIB4h4BBgWCAAgFiEEoJqS/FAV7oYacJhRGZmGHBY2upsFAl4kNoMCGwwACgkQGZmGHBY2upuBtwEA9Sx9td+orI+VHu9QfrV0qw8unIS1MWQi+94PeKYGYH0BAO9Kr/xs0GTjB/1zaeQwC5zo7NvMJjeMlAFlSuGdJgkB
References: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qswx72rotbymcdxw"
Content-Disposition: inline
In-Reply-To: <embf875782-3b93-421c-bb54-3c3566b671bb@desktop-g0r648m>
User-Agent: NeoMutt/20201120
X-Mailman-Approved-At: Mon, 23 Nov 2020 22:18:07 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--qswx72rotbymcdxw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Connection works, ping does not
MIME-Version: 1.0

Hi Hendrik,

Could it be that some kind of firewall is restricting UDP traffic to your o=
ther server?

E.g. could you try to run `mtr --udp [other server's public IP address]` on=
 your computer (while disabling your other WireGuard connection, if applica=
ble) and report back whether there is any kind of packet loss?

If not, you may wish to check whether the port on the machine is reachable,=
 e.g. by running `nc -v -l -u -p 12345` on your server and then executing `=
echo test | nc -u [server's IP] 12345`, to check whether the message arrive=
s at the server.

Best,

Max

On 20/11/22 07:39pm, Hendrik Friedel wrote:
> Hello,
>=20
> (I posted this a while ago, but it never appeared on the list; if the lis=
t is the wrong place for this question, please let me know; I would appreci=
ate a hint for a more appropriate place)
>=20
> I am using wireguard to connect two machines.
> My local server is connected  to the internet via a router. I am using th=
eis Server also for connecting other devices (e.g. mobile phones) to my hom=
e network. This works great.
>=20
> But when connecting to another server (both debian 10), I only get a succ=
essful connection, but no ping.
> *My server:*
>=20
> wg show
> interface: wgnet0
>   public key: xxxxx=3D
>   private key: (hidden)
>   listening port: 51820
>=20
> peer: sdfsdfsdfsdfsdfsdf=3D
>   endpoint: 109.41.64.83:15167
>   allowed ips: 10.192.122.2/32
>   latest handshake: 1 minute, 7 seconds ago
>   transfer: 10.95 MiB received, 40.35 MiB sent
>=20
> peer: yyyy=3D
>   endpoint: 185.22.142.254:51380
>   allowed ips: 10.192.122.3/32
>   transfer: 0 B received, 5.20 KiB sent
>=20
> peer: yyyy=3D
>   endpoint: 93.214.229.137:64119
>   allowed ips: 10.192.122.4/32
>=20
> peer: yyyy=3D
>   endpoint: 93.214.225.116:49819
>   allowed ips: 10.192.122.5/32
>=20
> peer: yyyy=3D
>   allowed ips: 10.192.122.6/32
>=20
> peer: yyyy=3D
>   allowed ips: 10.192.122.7/32
>=20
>=20
> more /etc/wireguard/wgnet0.conf
> [Interface]
> Address =3D 10.192.122.1/24
> SaveConfig =3D true
> PostUp =3D iptables -A FORWARD -i wgnet0 -j ACCEPT; iptables -A FORWARD -=
o wgnet0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> PostDown =3D iptables -D FORWARD -i wgnet0 -j ACCEPT; iptables -D FORWARD=
 -o wgnet0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
> ListenPort =3D 51820
> PrivateKey =3D aaa=3D
>=20
> [Peer]
> PublicKey =3D yyyy=3D
> AllowedIPs =3D 10.192.122.2/32
> Endpoint =3D 123.41.67.233:18314
>=20
> [Peer]
> PublicKey =3D xxx=3D
> AllowedIPs =3D 10.192.122.3/32
> Endpoint =3D 123.22.142.254:51380
>=20
>=20
>=20
>=20
>=20
> ip route
> default via 192.168.177.1 dev eth0 proto static
> 10.192.122.0/24 dev wgnet0 proto kernel scope link src 10.192.122.1
>=20
> and the other side/server:
>=20
> interface: wgnet0
>   public key: xxxxx=3D
>   private key: (hidden)
>   listening port: 54004
>   fwmark: 0xca6c
>=20
> peer: yyyyy=3D
>   endpoint: [2003:cb:aaa:bbb:9ec7:a6ff:fefd:3a6d]:51820
>   allowed ips: 0.0.0.0/0
>   transfer: 0 B received, 2.75 KiB sent
>   persistent keepalive: every 25 seconds
>=20
>=20
>=20
>   more wgnet0.conf
> [Interface]
> Address =3D 10.192.122.3/32
> PrivateKey =3D xxxxx=3D
>=20
> [Peer]
> PublicKey =3D yyyyy=3D
> Endpoint =3D v.myfritz.net:51820
> AllowedIPs =3D 0.0.0.0/0
> PersistentKeepalive =3D 25
>=20
> It seems to me, that the connection is successfully established , but dat=
a is only transmitted in one direction.
>=20
> How can I find the reason?
>=20
> Regards,
> Hendrik
>=20

--qswx72rotbymcdxw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSgmpL8UBXuhhpwmFEZmYYcFja6mwUCX7vrPwAKCRAZmYYcFja6
m76gAQDuzcw8dEPB9sc4jmzUxY2bySJ9DZUIgKRVXNL0s1d+8AD+KS3GKU/juHkG
+Jk8u4L09BRnsF+H3m7iJVzLKmCo5wM=
=oPba
-----END PGP SIGNATURE-----

--qswx72rotbymcdxw--
