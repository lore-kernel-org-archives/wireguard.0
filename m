Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01265e3d
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 06:09:14 +0000 (UTC)
Received: from netz.smurf.noris.de (mail.vm.smurf.noris.de
 [IPv6:2001:780:107:8:83::])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1dd64a7e
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 06:09:13 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1fHkEq-000JTY-A6
 for wireguard@lists.zx2c4.com; Sun, 13 May 2018 08:12:08 +0200
Subject: Re: Need for HW-clock independent timestamps
To: wireguard@lists.zx2c4.com
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de>
Date: Sun, 13 May 2018 08:11:57 +0200
MIME-Version: 1.0
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="QNy7wSBuhOV6wfMf9uUHQlwiKZt2HKZFo"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QNy7wSBuhOV6wfMf9uUHQlwiKZt2HKZFo
Content-Type: multipart/mixed; boundary="UBEph3cljEYMqcUxWXBEhVOZGe84LM3xU";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <c468bc7b-c1bf-b8db-1168-0ee7eef2f385@urlichs.de>
Subject: Re: Need for HW-clock independent timestamps
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
 <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>
In-Reply-To: <793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de>

--UBEph3cljEYMqcUxWXBEhVOZGe84LM3xU
Content-Type: multipart/alternative;
 boundary="------------B3A05B48832E6D184C98595E"
Content-Language: de-DE

This is a multi-part message in MIME format.
--------------B3A05B48832E6D184C98595E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.05.2018 21:29, Axel Neumann wrote:
> Thanks a lot for your replies. But as you can see from my comments belo=
w
> this all does not look like a valid option for many embedded use cases.=

> BTW, my background are community mesh networks which are maintained by
> all kind of different individuals using a zoo of different device types=
=2E
>
> I would really appreciate if WG can further elaborate on this issue.
> There are many real-life communities with embedded-device deployments
> that would be looking forward to use WG.
>
> Could you also comment on the described approach (see again at the end
> of the mail) of allowing (maybe as an alternative) a sequence number
> instead of a timestamp?
What's the problem? the protocol documentation states

> The server keeps track of the greatest timestamp received /per client/
> and discards packets containing timestamps less than or equal to it.

I just checked the C implementation; it does this check (and no others).
In particular it doesn't check whether the timestamp field corresponds
to anybody's idea of the current time.

Thus you don't need current time; you just need to seed a counter. I
would thus add an option to wg.conf that, if present, sets the
interface's current timestamp to some value and uses it as a counter
instead of a timestamp.

Then, when you set up your WG instance, you should immediately rewrite
your wg.conf file (just add 2^32) so that a reboot doesn't DoS yourself.
Additionally, when you acquire NTP sync, set the parameter to the
TAI64N() of the current time. To be extra safe, repeat this every week
or month or so.

Can anybody think of problems with this solution?

--=20
-- Matthias Urlichs


--------------B3A05B48832E6D184C98595E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div class=3D"moz-cite-prefix">On 12.05.2018 21:29, Axel Neumann
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:793381ba-b59d-50e4-6d7b-cbe9bef91ba1@cgws.de">
      <pre wrap=3D"">Thanks a lot for your replies. But as you can see fr=
om my comments below
this all does not look like a valid option for many embedded use cases.
BTW, my background are community mesh networks which are maintained by
all kind of different individuals using a zoo of different device types.

I would really appreciate if WG can further elaborate on this issue.
There are many real-life communities with embedded-device deployments
that would be looking forward to use WG.

Could you also comment on the described approach (see again at the end
of the mail) of allowing (maybe as an alternative) a sequence number
instead of a timestamp?
</pre>
    </blockquote>
    What's the problem? the protocol documentation states<br>
    <br>
    &gt; The server keeps track of the greatest timestamp received <em>pe=
r
      client</em> <br>
    &gt; and discards packets containing timestamps less than or equal
    to it.<br>
    <br>
    I just checked the C implementation; it does this check (and no
    others). In particular it doesn't check whether the timestamp field
    corresponds to anybody's idea of the current time.<br>
    <br>
    Thus you don't need current time; you just need to seed a counter. I
    would thus add an option to wg.conf that, if present, sets the
    interface's current timestamp to some value and uses it as a counter
    instead of a timestamp.<br>
    <br>
    Then, when you set up your WG instance, you should immediately
    rewrite your wg.conf file (just add 2^32) so that a reboot doesn't
    DoS yourself. Additionally, when you acquire NTP sync, set the
    parameter to the TAI64N() of the current time. To be extra safe,
    repeat this every week or month or so.<br>
    <br>
    Can anybody think of problems with this solution?<br>
    <br>
    <pre class=3D"moz-signature" cols=3D"72">--=20
-- Matthias Urlichs</pre>
  </body>
</html>

--------------B3A05B48832E6D184C98595E--

--UBEph3cljEYMqcUxWXBEhVOZGe84LM3xU--

--QNy7wSBuhOV6wfMf9uUHQlwiKZt2HKZFo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEr9eXgvO67AILKKGfcs+OXiW0wpMFAlr31zEACgkQcs+OXiW0
wpP2eA//XCYdgK2E3iHowRyScxsmzc+ofIVJfWS0Ja5fGQ0BLbPMQ4jP8EB0id9z
usJ6LxTyYhcVMI8mHo+8uI4YHmP/a1NdFtHwhE6BjMNosFsauAxCiOH4XZLakIO5
Bp4MMZ6TenKtBP9f3tSfAiEumoUIeu5Z4S7IlmoOcjJDl36RA1GuBdZdaxfnycJ3
s/VsTqeozfmuPyCkI2waFtPdEMWlL/xfpdmW5eCqYmEUGnMEjdHPdyFZwao0GH6s
gp25qTp21JCdrJ5sLaxzH++xcJpcSx0cmgvxsGGZJAmD5LagcF1Dsn4V2ibZbaO7
72gHA9OncEeHlDz2UH8sbmoYNzcgsHYbpyNttrQu8Q48vvuwYeKKB0aYSyGrpkj0
OAOQBgsBH3vAbJlztb9Yw8YusNKiEVD54EssmoIuCPybkzGvwRDE0C+GHVRslVIh
Q2W1527eH+vIumXYiTlA5j9o9UiyUEdkZVzXo+G1bl7yyMQvf2XsXkmu/5cwMMvv
Cwu8G5VOj+H6s/OCQI9pKyeNmJq8Pz8GojIGYpEKViyEMDVTDYAH0MmglMv0/ncN
wHZ6wtIcjQGGd5bxXeYZ7LJqt7ohQfqWWcGBsBqo/tz3h0hMhg5DKJ1pQXqRbNzm
L2tKHu+qTUvXwAc/VNZJBt5SI5Rsx1vWk4ag2ygpmBTkt43uvTI=
=RPEx
-----END PGP SIGNATURE-----

--QNy7wSBuhOV6wfMf9uUHQlwiKZt2HKZFo--
