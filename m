Return-Path: dkg@fifthhorseman.net
Received: from che.mayfirst.org (che.mayfirst.org [162.247.75.118])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23c118b4
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Nov 2016 20:59:06 +0000 (UTC)
From: Daniel Kahn Gillmor <dkg@fifthhorseman.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Kalin KOZHUHAROV <me.kalin@gmail.com>
In-Reply-To: <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
References: <CAKXLc7fZYEejEu0FmATWX6_8aAPRUxkPL429UK-39TGsFF4aUA@mail.gmail.com>
 <CAHmME9ordFZD8ESpTr9BEsedocoFDWjBwkWf43ke4X-m-bvibQ@mail.gmail.com>
 <CAHmME9oDp1R87utxJaL6hHimDedC66RVr+Hj_DXp07wc-jRynQ@mail.gmail.com>
Date: Thu, 17 Nov 2016 06:01:50 +0900
Message-ID: <87shqr6sw1.fsf@alice.fifthhorseman.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] RFE: A notion of VERSION (was: Debugging AllowedIps)
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--=-=-=
Content-Type: text/plain

On Thu 2016-11-17 02:40:30 +0900, Jason A. Donenfeld wrote:
> Trying again with no line breaks:
>
>> WIREGUARD_VERSION := $(shell parent_name=$$(readlink -f .. | sed -n 's:.*/[wW]ire[Gg]uard[a-z-]*-\([0-9.]\+\)$$:\1:p');  if [ -d ../.git ]; then echo "git-$$(git rev-parse --short HEAD)"; elif [ -n $parent_name ]; then echo "$$parent_name"; else echo "unknown"; fi)

Please don't assume that the source code is built from a git repository.
On debian, we build from the tarball, which is extracted from the git
repo, and we have nothing for "git rev-parse" to draw from.

For the cost of one extra commit just before tagging, you could populate
a version.txt file and this then becomes $(shell cat version.txt).

simplicity, simplicity :)

            --dkg

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEE7bLnT1b88rZyl7c1JOz/Wv9oNwoFAlgsyT5fFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldEVE
QjJFNzRGNTZGQ0YyQjY3Mjk3QjczNTI0RUNGRjVBRkY2ODM3MEEACgkQJOz/Wv9o
NwrCDg/9Gyia819nYpBkfLf/YGAT3bvNIY1wlIetuRVO1/Jk6iYd4d+IcK5+80mz
iBGpmrum4zmGWc4wRV0Uu0TJPITt8iUwcivB50Wj8aLrw1K5yDcyrsDFw8opfg4j
JtVZ3d72HTwd86xpNGzp8LyWD55iId4MDXkIAyGpHtMjH7EY3LP369kL8+hpLI3I
vIr6d5wuwUrPesb09a8JexZ6YT4lVs92XO9ip9EvgKW/lHSaqdksO8dAezMMylQR
kOIpyoTNrCIzTKACNp0iWR+4zKfF3+vcU+gwR/bRRzbZvEg/zQ8A6wPOmaG3Mvzb
gzfI/m8hdhNYdrz8949SL1lpOuvdlMQOIzJyYicxi0RQcLjK1WGMH5JOxF5SzIwH
1+bIq1jJV07OHEOe6C4RjTo7wZvTtG2fmEw2eU1O5oQe/dml4sb9KAiuNxj3veRe
SDhbMXasfa9biRKioeccO65x9PJ9InTRpfTN5P38zdhHT7eGjAvQcMA4SuDiWu2p
BcmCp6XJLm3cuDM+pV67IyAs9L7q3WrqsVeMwfgPLGDHwwZQiKSLjQjZsoMGUsR0
J5JZu/+GlDMnDsIPRQIXyxEUHcdWDzVYrG0h85pXbE38e+bzUrQVSVBuhA+j6U1x
fSUhnb32Vp/lMxgIHB0T3B+1YkHu41ns7e+XumsaZXw5hRGboJQ=
=jZPr
-----END PGP SIGNATURE-----
--=-=-=--
