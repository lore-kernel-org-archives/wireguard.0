Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b40a4906
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 18:43:49 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e387c33
 for <wireguard@lists.zx2c4.com>;
 Mon, 31 Jul 2017 18:43:49 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, Bzzzz <lazyvirus@gmx.com>
Subject: Re: About compression
In-Reply-To: <CAHmME9q2HWQuOciL73HCo+epVbruSO=sP5syAP2GPw5wQ=upKA@mail.gmail.com>
References: <20170731180632.51aeed9d@msi.defcon1>
 <CAHmME9q2HWQuOciL73HCo+epVbruSO=sP5syAP2GPw5wQ=upKA@mail.gmail.com>
Date: Mon, 31 Jul 2017 12:57:44 -0400
Message-ID: <87ini8a6if.fsf@fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Mon 2017-07-31 18:10:39 +0200, Jason A. Donenfeld wrote:

> No, not a chance. Compression is really better left for upper layers.
> I'm not sure I see the value in adding at layer 3. This is an
> especially contentious issue because of the history of complex and
> catastrophic interactions between compression and encryption (such as
> the CRIME and BREACH attacks against TLS).

I just wanted to second this response.  Jason's making absolutely the
right choice here, since content-agnostic transports like wireguard have
no way of knowing whether a given stream is a mixture of
confidentiality-sensitive data and attacker-controlled data.

If your application layer knows that certain things can be safely
compressed, it should do the compression itself.

            --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEOCdgUepHf6PklTkyFJitxsGSMjcFAll/YYkACgkQFJitxsGS
MjfeWA//XLiicoGY4QrfAVvczwcLGlgJvrIEUBpEsdBiqVe/DgVmgg2q1zfCWSGZ
VV2IzUYBDS0C8hDpDXIZFIHyyYWTu10wg7g4qR+P3GadzG7fd80bsy4WuhZeTB9u
jCYjM/orJOy9M/yz+25Nk77TGObHKNE/LRjnxcRtENQLZLdmZDpEcws3iacEzttG
XsOKXRxfXjvdf9ZBtHDo7p21cCerwU2SK+FcmP3ajVSKZ2wKc3Mr+8Gbtlhwsjv9
0mwHDr+NJHJXoP+TmzQ14Q1lHKwVmYG/EajqWgakt+EdhOzeiqBAUuooweV8Ti+H
gkCzMcPm4hR+/TC5sxM7vMtrpw+TpwtCD2S9uDL/t7eKlhbZihbGaSWVdmCGTck8
d8a6YfIHbu1Y6gDz16ej39qLH+KgSAGLxeuA67uAyDa+TmLxYoWV23sleQTmwfFA
jpHpI1g37rovSnGSIin/QwFdcPrn+Ml0TA5P5rlZop7G+pwMZDumX321N0kVH62d
mOmCeVZZEDNkCuVAx1+lXnJ90KHH0O47YDOroKuAZtPlxr7pX3apzzcNWWBe2tm1
4jY4e1sSW3bYIykZbhMWtYN2PzBv41c+c1EWBfrrSr67XQ9RofLvxoA9vtZmtk7O
i/1gCbR+gLuKExPMUQ6HcysY89YnZmmMsL1PaAzhTbj0gaQ69GE=
=YY65
-----END PGP SIGNATURE-----
--=-=-=--
