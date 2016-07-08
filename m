Return-Path: baptiste@bitsofnetworks.org
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b3c6ed0
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 14:27:52 +0000 (UTC)
Received: from rev-140-155.legacytubes.illyse.net ([89.234.140.155]
 helo=lud.polynome.dn42) by mails.bitsofnetworks.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
 (envelope-from <baptiste@bitsofnetworks.org>) id 1bLWlH-0000Kz-He
 for wireguard@lists.zx2c4.com; Fri, 08 Jul 2016 16:28:11 +0200
Date: Fri, 8 Jul 2016 16:28:09 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160708142809.GB18310@lud.polynome.dn42>
References: <20160708123412.11412-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
In-Reply-To: <20160708123412.11412-1-Jason@zx2c4.com>
Subject: Re: [WireGuard] [PATCH] persistent keepalive: start sending
 immediately
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 08, 2016 at 02:34:12PM +0200, Jason A. Donenfeld wrote:
> Rather than only start sending the persistent keepalive packets when the
> device first sends data, this changes it to send the packets immediately
> on `ip link set up`. This makes things generally seem more stateless,
> since the administrator does not have to manually ping the endpoint.

Yes, this is good to have, for the reasons mentioned by others (immediate
reachability in the reverse direction).

Does the first handshake occurs when the interface is up or when data is
first sent on the interface?

> Of course, if you have a lot of peers and all of them have persistent
> keepalive enabled, this could cause a lot of unwanted immediate traffic.
> On the other hand, if all of those peers are at some point going to be
> sending packets, this would happen anyway. I suppose the moral of the
> story is that persistent keepalive is a feature really just for clients
> behind NAT, not for servers, and it should be used sparingly, which is
> why we've set it off by default in the first place.

Sounds sensible.

If the large amount of "unwanted immediate traffic" when starting an
interface is really a problem, you could just randomize the delay between
keepalives (which might also help for obfuscation?).  But as you said,
keepalives don't really make sense for "servers", who would be the one
with lots of peers.

Just a random thought, though: are keepalive packets in only one direction
(client to server) enough to maintain a mapping in a NAT or stateful
firewall?  Aren't there edge cases where you would need keepalives in both
directions?

>=20
> Hi list,
>=20
> I haven't merged this yet, and I'm debating whether it's something we wan=
t.
> I'm open to all opinions here, so feed back would be most welcome.
>=20
> Thanks,
> Jason
>=20
>=20
>  src/config.c | 5 ++++-
>  src/device.c | 2 ++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/src/config.c b/src/config.c
> index 767d31a..910c31b 100644
> --- a/src/config.c
> +++ b/src/config.c
> @@ -106,8 +106,11 @@ static int set_peer(struct wireguard_device *wg, voi=
d __user *user_peer, size_t
>  	if (in_peer.persistent_keepalive_interval !=3D (uint16_t)-1) {
>  		if (in_peer.persistent_keepalive_interval && (in_peer.persistent_keepa=
live_interval < 10 || in_peer.persistent_keepalive_interval > 3600))
>  			ret =3D -EINVAL;
> -		else
> +		else {
> +			if (!peer->persistent_keepalive_interval && in_peer.persistent_keepal=
ive_interval && netdev_pub(wg)->flags & IFF_UP)
> +				socket_send_buffer_to_peer(peer, NULL, 0, 0);
>  			peer->persistent_keepalive_interval =3D in_peer.persistent_keepalive_=
interval;
> +		}
>  	}
> =20
>  	if (netdev_pub(wg)->flags & IFF_UP)
> diff --git a/src/device.c b/src/device.c
> index 120f8c9..198368f 100644
> --- a/src/device.c
> +++ b/src/device.c
> @@ -40,6 +40,8 @@ static int open_peer(struct wireguard_peer *peer, void =
*data)
>  	socket_set_peer_dst(peer);
>  	timers_init_peer(peer);
>  	packet_send_queue(peer);
> +	if (peer->persistent_keepalive_interval)
> +		socket_send_buffer_to_peer(peer, NULL, 0, 0);
>  	return 0;
>  }
> =20

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXf7h0AAoJEL4B7CKgTi5GiAUP/0I15gBF6PwyZDa67LdaFeYz
T4bzphVKGek6h+LlCLSmupRhodstiGmqa/+XnNvU2Zh0Qjj90H/+aKT22d98S0Y1
OKTBcnd/6it2Sxc6wMiLpDW8iWbp9HUL83a+7AmHL8PisO6XgY7tRdb+MkU67HvR
95MZ3n18djKEfob1De+cHyK8I/7og/LV19U9wB9qcCtfWd2DipusNxOjTiH0o9nC
dTFGPpXUxARq3/P4mGbAM3AgK3gHrFKYk0kaUB2c5HfaBdqxcz1ytHXUhWE8rpAS
sCFH5StX9TGzchpmAqWWfIjYgZamGukt5x76AtjRTPsC3LB5VhNzKY73MQ6RDle0
eNdtekhYxCVBiH7Oo9P6umFsO/tLN33dRVGqrk6/ffjQEEpqUew2ODdDeGjhtNzF
4gtPuRXtqzlVcjNS0D9QuQ5hXTmB7JTwUfVvDK7Sah1Ia6FarBlrlOSOvQUs2f6G
27UhJm1gTTseya4983gYy/Cz+FDUYh2aXzNKjF0bE6DbFukx3KNhQ6VwNiX0f6V/
F8xQP2ImMe8AR/QchXzdjJEu4+M6kn5v8BPB72PZZEMWwsI3Qw3VsUE4QYnjvimj
KfCX7/wcDGz+r0Favl3WL3z+7pnaae8t0wnXIOruBwO+VKU8mcMqeYuYO7Hv0yGh
4E1yyYjBYg3rsGiqNn1E
=/Ez8
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
