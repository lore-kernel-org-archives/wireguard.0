Return-Path: dkg@fifthhorseman.net
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fb37bdd6
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:38:17 +0000 (UTC)
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0f21e07
 for <wireguard@lists.zx2c4.com>; Tue, 3 Jan 2017 06:38:17 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [TOOL] wg-config graduates to src/tools, becomes wg-auto-config
In-Reply-To: <CAHmME9q1RQ_Z3tikOkOECsw5xNx5Mttwm5=MPV7PRqu+DcipkA@mail.gmail.com>
References: <CAHmME9qQ495gt_zByeJDA3_x+eKMoVWOjzJypiUQnHVJvq6BWQ@mail.gmail.com>
 <CAHmME9q1RQ_Z3tikOkOECsw5xNx5Mttwm5=MPV7PRqu+DcipkA@mail.gmail.com>
Date: Tue, 03 Jan 2017 01:46:58 -0500
Message-ID: <87tw9god25.fsf@alice.fifthhorseman.net>
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
Content-Transfer-Encoding: quoted-printable

On Mon 2017-01-02 10:17:30 -0500, Jason A. Donenfeld wrote:
> On Mon, Jan 2, 2017 at 5:57 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
>> Check out the man page, read the script --
>> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config -- and
>> please let me know what you think before I cut the next snapshot.
> Renamed:
> https://git.zx2c4.com/WireGuard/tree/src/tools/wg-auto-config.bash

debian is unlikely to install this if it is expected to be named with a
.bash suffix:

  https://www.debian.org/doc/debian-policy/ch-files.html#s-scripts

>>> When scripts are installed into a directory in the system PATH, the
>>> script name should not include an extension such as .sh or .pl that
>>> denotes the scripting language currently used to implement it.


That said, i'm not sure what you want with this.  If the ultimate goal
is to have systemd-style .network files, you should ask for these
changes in systemd itself.  That's likely the cleanest approach.  If you
do this, please post a link here to the systemd github issue or pull
request. :)

If it's just "we want a configuration for wg, but with some common/handy
wrappers around /bin/ip", you could (a) fork and exec ip from wg itself
when running "wg setconf", or (b) name the wrapper something like
/usr/bin/wg+ip=20

        --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlhrSOMACgkQJOz/Wv9o
NwotmhAAvK0uSpXCpfPHN2sI0vNj8EBLHr/lDe9XSAQgR8CqimOdnxrTKPAYWV26
9x1R2nuM/OXuGYSnnGMLmd/CCtUVfTDulPRYnbtxuvTcATpgQD634lJk1MO9BVbE
H9jMa8nvJucRqowgLTHJXHVhuVgfChoOc0Y1OKvvBivp6yRaiYgMOA4VOjUSRV9e
l0sXQ0+llNPtcT2C4EzfDJlnuaeQoY1Ym96ZAjsvJlmHmmG2HTcr42Gx7liXdpGN
ecMZU8KmQizhrIZ7P826vfvIeon71iFLit+tnJiJDhbnaAsIlerxo1tfD4lpsHyg
ekseGMm4ZMoTg7QbQT5sNnhhEr47VRLpJ+P/zr2b/sRdXJeoXKGbtCdxoDSkId0Q
qmQmR+zoUtRB+USVDDSUVixAG+jfCxojKgXCMP9nR4Kz83oud2MjpUec1q+R69FA
8Ito9uukcQgCTZg+p2xXUyxVtVtVKrS4jQyloyZnND6kilThfrQxb1lleXmONXri
YRX5CZYwyVkQu1FiyuMk2X7BrO7sqTus8avmfm81FXBkULHEkhAseVvBVDSI0CyK
PR4Zj1HPpJQk07bHhP51jY5yHWSjR/gzf8S0gJEsbGPMCslIZ7OTtKM/ITmfXutu
pbcHOeA7MD2zYhQ1AVVgbaaYpDVKO5nLkTggGA9wFwUbdy33z1M=
=Q0a3
-----END PGP SIGNATURE-----
--=-=-=--
