Return-Path: baptiste@bitsofnetworks.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0957162
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 09:37:34 +0000 (UTC)
Received: from mails.bitsofnetworks.org (rezine.polyno.me [193.33.56.138])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 235234d2
 for <wireguard@lists.zx2c4.com>; Mon, 9 Jan 2017 09:37:33 +0000 (UTC)
Date: Mon, 9 Jan 2017 10:47:07 +0100
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [RFC] Handling multiple endpoints for a single peer
Message-ID: <20170109094706.GA1315@lud.polynome.dn42>
References: <20170108224117.GB9445@tuxmachine.polynome.dn42>
 <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pWyiEgJYm5f9v55/"
In-Reply-To: <CAHmME9pZLDieAabMhjDQHxpj_TDd5OLjNEUpQrraFvXA0g7gmA@mail.gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--pWyiEgJYm5f9v55/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 08, 2017 at 11:49:18PM +0100, Jason A. Donenfeld wrote:
> But if it is in the kernel, the decision logic boils down essentially
> to: there's a list of endpoints in a given order. Based on differing
> metrics of success at differing points in time, the list gets
> reordered, and packets are always sent to the top of the list.

This is not what I proposed.  Endpoints do not need to be ordered, and you
do not need to keep statistics about the past.  This path is precarious
because you will always have to balance between being overly conservative
(which means you won't react fast enough to new situations) and being
overly enthusiastic (which means that you will react to the slightest
insignificant change of your metric, impacting stability).

What I proposed is based on happy eyeballs, see an excerpt of my first
mail below:

On Sun, Jan 08, 2017 at 11:41:17PM +0100, Baptiste Jonglez wrote:
> ## Select new endpoint during each handshake
>=20
> This is perhaps the most clean and simple trade-off, and exploits the fact
> that Wireguard regularly performs a new handshake with a peer:
>=20
> - during the handshake, select the "best" endpoint
> - while the symmetric key is in use (a few minutes), keep the same endpoi=
nt
> - the roaming functionality can still update the current endpoint between=
 two handshakes
> - during the next handshake, repeat the procedure, potentially selecting =
a new endpoint
>=20
> Selection of the "best" endpoint can be quite simple: send a handshake
> packets to all endpoints simultaneously, and select the endpoint for which
> the answer arrives the first.  This would select the endpoint with the
> lowest RTT at this point in time.  To avoid switching endpoint too often,
> the current endpoint can be given a slight advantage, similarly to happy
> eyeballs: first send the handshake packet to the current endpoint, wait
> e.g. 10 ms, and then send the handshake packet to all other endpoints.
> This way, we switch to a new endpoint only if that would improve the RTT
> by 10 ms.
>=20
> It looks quite simple, but I am sure there would be a lot of
> implementation difficulties:
>=20
> - What if the remote peer always performs key exchange just before us?  We
>   would never be able to try other endpoints.
>=20
> - What should be the behaviour of the peer when it receives several
>   handshake packets?  Should it reply to all of them? (probably, because
>   of asymmetric RTT on Internet paths).  How would the peer select its own
>   endpoint towards us?
>=20
>=20
> Since Wireguard performs handshakes at relatively short intervals, this
> method provides some amount of liveliness: if connectivity with the
> current endpoint breaks (blackhole), it will be detected and corrected
> within a few minutes.
>=20
> Of course, there can be optimisations for cases with obvious lack of
> connectivity.  For instance, if the current endpoint is an IPv6 address
> and we are moving to a network with no IPv6 connectivity, trying to send
> an IPv6 packet will result in an immediate error.  In this case, we would
> immediately initiate a new handshake and use the IPv4 endpoint.
> Similarly, if sending an encrypted packet elicits an ICMP error in
> response (host or port unreachable), then we can initiate a new handshake
> to test other endpoints.

--pWyiEgJYm5f9v55/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAlhzXAsACgkQvgHsIqBO
LkblJw/+IezLm6NKF9fQcKqQq8PU6ozRfZVLyS4tVFJqo2MsCjHtREkyYVOpDwZ9
c09l7Lxt5dzg12S6jUpeN8KdXVasyzTdi/xD7XdfizldYMDQdWi6QQiiVW3i2T7v
hGpbQNB9TEKNx6CFwe9S8+iq+3brn8n9G5P80b5Y6eJDFUiR5Eho+ZnNdy0mJlac
7jtwi1lCbJSk8lMH1EKKeg6gpf/TizJLzCYzvnI08SoSEj/3MFT+FV1XaI2Gi9M1
Tpx6j6hwCRG3Yp0SV1eHMHZQ9hnms/qaqpue7iAVu1lO7Y1PHp64e9UpXTuQ1M7q
d3avrnb/p/GENdXhxhvQ11KQj4OaZ7Hy9d2czKBxppWwb+1NgGK16uzOPCGrIxrE
KiLR39REHaanLO98lOjJp/WsXHDBtFqTxt5llwxkaj+5p8P8SJIJnzd7FPX/rDfk
Eylinbbn5VjJUYBaiP64/FTVwQO7VSXB7J6gO2l2iBjRe6i5FOw93hqxoUsY1WkY
4XnCCWblBuTPE50X1ZaCIFzClE5mGpi9nMSs9wtwWJBqSkljwB2YZoVAPLEA5pdz
1kKmwqoy+P0E9RbLOIJkbpqhXwRrXfS6RKqXMzwW4TFs1bFcJEArfMoKt6RIQJpn
vnm4LAQEnts4h8jxLNswWXA9jxgnSsm19fIO1ipM87F/qLmNOvA=
=xpKb
-----END PGP SIGNATURE-----

--pWyiEgJYm5f9v55/--
