Return-Path: egbert@eggiecode.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f70604f7
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 16:27:15 +0000 (UTC)
Received: from mail01.eggieservers.nl (mail01.eggieservers.nl
 [149.210.159.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d44be5b0
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 Feb 2017 16:27:14 +0000 (UTC)
Subject: Re: wg binary in armhf deb from ppa missing
To: Alexander Morlang <alx@dd19.de>
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
From: Egbert Verhage <egbert@eggiecode.org>
Message-ID: <e77f62c0-04de-f45d-6a86-15e351c98551@eggiecode.org>
Date: Sun, 19 Feb 2017 17:27:33 +0100
MIME-Version: 1.0
In-Reply-To: <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="f7ecBieL4pPoCmb8PEjOqJ7JsCSHsF5sv"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--f7ecBieL4pPoCmb8PEjOqJ7JsCSHsF5sv
Content-Type: multipart/mixed; boundary="WxqfUXfxqoqMjHR6EeHa5dblahsjIlHQP";
 protected-headers="v1"
From: Egbert Verhage <egbert@eggiecode.org>
To: Alexander Morlang <alx@dd19.de>
Cc: wireguard@lists.zx2c4.com
Message-ID: <e77f62c0-04de-f45d-6a86-15e351c98551@eggiecode.org>
Subject: Re: wg binary in armhf deb from ppa missing
References: <EF6AB0BF-E341-41C1-8744-7CA8A5A778D0@dd19.de>
 <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>
In-Reply-To: <37c21d07-0153-7fa2-8fe3-c852704e53b9@eggiecode.org>

--WxqfUXfxqoqMjHR6EeHa5dblahsjIlHQP
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hey Alex,

This is strange. Just builded the package on my PI and it is working as
intended.
(https://eggiecode.org/wireguard-tools_0.0.20170214-wg1~xenial_armhf.deb
<https://eggiecode.org/wireguard-tools_0.0.20170214-wg1%7Exenial_armhf.de=
b>)
The PPA build systems screwed the tools package up, looks like it is not
running `make install` to the package.

See the build log differance in the ppa of armhf and amd64.

Greetz,
Egbert

armhf:
https://launchpadlibrarian.net/306379568/buildlog_ubuntu-yakkety-armhf.wi=
reguard_0.0.20170214-wg1~yakkety_BUILDING.txt.gz
amd64:
https://launchpadlibrarian.net/306379566/buildlog_ubuntu-yakkety-amd64.wi=
reguard_0.0.20170214-wg1~yakkety_BUILDING.txt.gz


On 2017-02-19 15:51, Egbert Verhage wrote:
> Hey Alex,
>
> Ow, I never tested the package on armhf. I will give test it tomorrow o=
n
> my own Banana Pi 2 and Raspberry pi 2.
>
> If you are running the image of lemaker on your banana pi, maybe try
> first to build the package from the git repo.
>
> Greetz,
> Egbert
>
>
> On 2017-02-19 02:14, Alexander Morlang wrote:
>> Hi,
>> used the launchpad ppa in xenial on armhf (Banana Pro).=20
>> The wireguard-tools packet installed only /usr/share/doc
>>
>> Is this a known problem?
>>
>> I downloaded the
>> https://launchpad.net/~wireguard/+archive/ubuntu/wireguard/+files/wire=
guard-tools_0.0.20170214-wg1~xenial_armhf.deb
>> and hat a look with dpkg -c <file>, getting the same result of no bina=
ry in the packet.
>>
>> regards, Alex
>> _______________________________________________
>> WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard



--WxqfUXfxqoqMjHR6EeHa5dblahsjIlHQP--

--f7ecBieL4pPoCmb8PEjOqJ7JsCSHsF5sv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQKTBAEBCgB9FiEEZDcPXJp/elBwhMYKeniW+rQIrvUFAlipx3ZfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDY0
MzcwRjVDOUE3RjdBNTA3MDg0QzYwQTdBNzg5NkZBQjQwOEFFRjUACgkQeniW+rQI
rvUoLRAA1TvkWhlrYdLPxzl8XQ7iMx9Qk5zmr4mAOqJv0bZbuXpxqEY49Z2r3G4p
1KwqrFRYf23Cr9pnYvQcQjNIVBAjie5HJHlnV/h2kS7H8cjMAPIESBt99Yxdm3ml
xiFJZ+wabpgJEuum0E15GBRa6s7ytORQfrBOx2437Mxha+GcMhuRCgIdgmFVixME
5dGTU6/wNMlDzjAsGMqXuULH05ELT9zgzYeQwJONtrZyUrzzMBdYUA/y1KYWZddf
u5tDan+V/dJxNUOPzKAk2Yh671L0dbD3cSzCy7AXgHDiQ6ozIT0/RPoqXrbsHik5
O5Cq81soYsIKENcDMMBDG6dlMIYMquMKBUuqSaIOX8qT80+IKZUoygXOuoC6zqs1
3d8O94vCFWmU2y8sEVgIF5GPtHh7D0WrxvTBJWpkw8ivfV/cDWsadlW+8pAtbCS4
Z0jo0DsvZv+RZZS29ez8qFX0xf+mtsoHl+EL5I/fwzTUWYK83B6c0v2pRRXEFhIQ
OxjmmV2H7keTuv38hjBsMgaG+ORboP0f2WcL+bT/6t4NZbO4ZEAWc5pwdl8t5rr8
buyIo/46a2vun0kFTAR4wIKur38PfHHW230Tpe5FHtabCmXRRqYmpsTBaHz329Qu
QinRbYa54ECtMN2Yt8bZ7aQIM/8xGWJQ8zACIz8np/JoKUHDuZk=
=8E1p
-----END PGP SIGNATURE-----

--f7ecBieL4pPoCmb8PEjOqJ7JsCSHsF5sv--
