Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbdcc2e4
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 14:02:58 +0000 (UTC)
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
 [209.85.215.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 641d4c83
 for <wireguard@lists.zx2c4.com>; Sat, 8 Jul 2017 14:02:58 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id h22so38358465lfk.3
 for <wireguard@lists.zx2c4.com>; Sat, 08 Jul 2017 07:20:52 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [10.10.10.52] (uk.webcrumb.net. [176.126.241.16])
 by smtp.googlemail.com with ESMTPSA id u139sm1247462lja.7.2017.07.08.07.20.49
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 08 Jul 2017 07:20:49 -0700 (PDT)
Subject: Re: Early Feedback on Container Networking, Resilience, Json Config
 and AcceptedIPs
To: wireguard@lists.zx2c4.com
References: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <e9273f83-638e-ba6f-f08b-8220b2a78653@york.ac.uk>
Date: Sat, 8 Jul 2017 15:20:40 +0100
MIME-Version: 1.0
In-Reply-To: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AsOB2PbJsbjaAMQ5omWE0tcWauUHBlhQE"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AsOB2PbJsbjaAMQ5omWE0tcWauUHBlhQE
Content-Type: multipart/mixed; boundary="KgVeduMdOnlFeDMmswr3baHIP813BXK1g";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <e9273f83-638e-ba6f-f08b-8220b2a78653@york.ac.uk>
Subject: Re: Early Feedback on Container Networking, Resilience, Json Config
 and AcceptedIPs
References: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
In-Reply-To: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>

--KgVeduMdOnlFeDMmswr3baHIP813BXK1g
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 08/07/17 03:26, raul wrote:
> 4. The Wireguard server is a single point of failure in a star topology=
=2E
> If the server host goes down your network goes down with it. How can we=

> add more resilience in a simple way? A backup server in L2 with
> identical keys and a floating internal IP?

I have deployed WireGuard (albeit to a limited number of servers) as
essentially a mesh - each server knows each of the others' endpoint
address and allowed IP.

Taking the most simplistic approach, I'd assume you could do something
similar for a server "cluster", e.g. deploy clients with several known
servers.


--KgVeduMdOnlFeDMmswr3baHIP813BXK1g--

--AsOB2PbJsbjaAMQ5omWE0tcWauUHBlhQE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEUzSNjhumunvu6bYD4DBDgow/9LsFAllg6j8ACgkQ4DBDgow/
9Lsq/g/+Ip3eI12MFEqOJpL3ggIYM9Fle1ErKZ92VneKo2VHDuWCHothkX2Y1wdb
4B3fZsY8Giz9JmpP8f+4KsCyguAX02zFufSEWNSSxzu5LdlDaODSd74dxbURR7uq
NNScLavi5ukq4+amDsv47/Ajv+Cnh2MvZ9RXkZZvON/Y2bo9hDBAvbkVElXiyRZ5
i8rZqVyw79H0bUg1cR8Lk17K0MvVvJbOcN8F6/TPhcTp4AVz2s/Z/xiMA6ZCNKbY
nHS4gPwipYPNgUHdqx46GRKMxxTiD5ye3tfyFZCugg/GrazCV1SQwCMQ7FmodEQi
MH8w0UUS6FMyOLjF2ec6Ya+e8G3HoPLTvzxu8KVFBQDrjcpzJWM4H9eUOTEIR8nv
eLW9jLMqjsWZLYMK342sX9KPpcyJKJh7ObMOrejAdnYuxCUf2ty4pQLFWNHCF2Qq
Y8bsQG6XG3OmJaoStrZ6ZjLlLl68wBgA98tzFfzI2C+ICo84bS9xSaT0FDO0N3XL
xVvbAjs6LKsuNZbxwM4FlU2MRag8gkLStyIM3roVBYFqlXSzWEj7+prJfo4SbLTj
Xz+ReXM0ftOjdtiDp/LXEOvYx4zfvjXRXjbhTdIZgkBr4Hyg6on+dVgCwXq/kXby
ifKkLNwXiyyTa7RNs7iOgsgbQPcoaqI8M97C7hVQ3+b9RX2X/aw=
=RCHX
-----END PGP SIGNATURE-----

--AsOB2PbJsbjaAMQ5omWE0tcWauUHBlhQE--
