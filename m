Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbd9e0c0
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 22:07:55 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 928ead33
 for <wireguard@lists.zx2c4.com>; Wed, 7 Dec 2016 22:07:55 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Ephemeral key lifetime & system sleep
In-Reply-To: <CAHmME9pEq1weLxpOC1c0_nFcO9pmJRtTQ3=H8Hh8AtZyhamqpw@mail.gmail.com>
References: <CAHmME9pEq1weLxpOC1c0_nFcO9pmJRtTQ3=H8Hh8AtZyhamqpw@mail.gmail.com>
Date: Wed, 07 Dec 2016 17:04:45 -0500
Message-ID: <87d1h3jszm.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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

On Wed 2016-12-07 16:20:43 -0500, Jason A. Donenfeld wrote:
> But I was thinking that instead of this, maybe it'd be simpler and
> even more desirable to simply *always wipe all keys immediately
> /before/ system suspend*. This would have the desirable property of
> preventing ephemeral key recovery from physical access to the ram or
> CPU of a suspended system, or attacks against modified SMM handlers
> pilfering data during resume just before handing control back to the
> kernel. Is this desirable? Is it absurd?
>
> The downside is that if you put your computer to sleep for just a
> couple of seconds, when it comes back up, the [mostly invisible
> anyway] 1-RTT handshake must occur again, and you won't be able to
> decrypt any packets that were sent to you before going to sleep and
> arrived after resuming.
>
> The upside is the tinfoil hat security properties outlined above.

I think scrubbing the ephemeral keys prior to suspend is the right thing
to do.  It's simpler to reason about, sounds straightforward to
implement, the usability cost isn't that great, and it's likely to be
the right thing in almost all long-term suspend cases.

    --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlhIh30ACgkQJOz/Wv9o
NwrM5g/+PXOQP7/VhfTqZYZY2iDq7ORNoTF5B8E06pgU9ZZFFiPBuojYShjN89xP
gZwng2GIKypPfjhiVJI8Awh/Apyr/dJUvVSYHAgmU9KWh+KTpB6ay3BDS33JBOA4
st7u7KEAb/TfZXwnutiCRsnE8UyOpJlSMR8r1F2BwwHOmtDleLzgqgZd9CLPPJKe
sZdVVhBxABJ7NEE5cijIeMEyqbqghKIUAmiU3nUxJpvWGYDEPcS+m87ZXqlBEBro
n4+IATsIZWi1WOgm3q+Dwjfm9hqkVWyZbgh79tdXUByG815p7cm3z4/6jWMnJMu6
rjlEvuGiqsA0ld2ztjC+nseRiITbmqJJMsT2FY3aNijT3UUYNzkt8TnQSq3CJp19
U/XjWAwOMobbmydiJXmh4xKTbV+PpABQIqAy94mOhsKiEYusgn8URozULCwGqU46
jftQ5C5bmGNVk6BER1f4tqlBii27dNyfNM8aKGYzUzze5Dgo9uM6biqHKlf/9mNy
xzeGO+IDCHH3MNvurIUz3pdeG2MNFyeaJyubDdhgJysEQzL2/ACkMqkh3c7e4rBm
JeD5hoOX1AqAimRNF0QKNAqWfHuGDNV1sMk0mpmgczmg8G4JRUYiMipaIf+1EEVA
X7tJRRTebb3+ZRfWWHtYHo5e07WQbHe2KyDw7q+XhduowF37EAs=
=OjYN
-----END PGP SIGNATURE-----
--=-=-=--
