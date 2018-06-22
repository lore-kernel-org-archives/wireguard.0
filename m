Return-Path: a@unstable.cc
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f06c2b1c
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 10:48:44 +0000 (UTC)
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 539b007d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Jun 2018 10:48:44 +0000 (UTC)
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
To: Jordan Glover <Golden_Miller83@protonmail.ch>
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
From: Antonio Quartulli <a@unstable.cc>
Message-ID: <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
Date: Fri, 22 Jun 2018 18:53:27 +0800
MIME-Version: 1.0
In-Reply-To: <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="afrl8sPZSvhxEF2qonTZepRQDi8uYfyUJ"
Cc: "baines.jacob@gmail.com" <baines.jacob@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--afrl8sPZSvhxEF2qonTZepRQDi8uYfyUJ
Content-Type: multipart/mixed; boundary="LketLwTYwJZ30Au7IFzIYeY0PpXUW2a1H";
 protected-headers="v1"
From: Antonio Quartulli <a@unstable.cc>
To: Jordan Glover <Golden_Miller83@protonmail.ch>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "baines.jacob@gmail.com" <baines.jacob@gmail.com>
Message-ID: <6645df4c-3f98-6df9-fc48-6748ad4d6c00@unstable.cc>
Subject: Re: PostUp/PreUp/PostDown/PreDown Dangerous?
References: <CAHmME9qGuyr+aPA0xw5M0hf_NvUAZaBGvX9evzegowCASwgDFA@mail.gmail.com>
 <CAHmME9qPwF-YdSKRhngVuL4JXrMD_1=nbP0jDUAejBxexsN3EA@mail.gmail.com>
 <CAHmME9p6wS7BfWaa-0yHY-+T=ujqWVu_akkc1=XFO_rGAerY7A@mail.gmail.com>
 <a7989c95-0047-dfe9-e870-59db44fbb463@unstable.cc>
 <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>
In-Reply-To: <CgE9_flxwDk6vYs9xSAoTvLJp5qHdNF20xieK4syAMzldOBqEq5lZ3gZN77A7ambiqtFeuBfm-jXarYLMvcY4LAn1aC9ub1su871JPhDpUo=@protonmail.ch>

--LketLwTYwJZ30Au7IFzIYeY0PpXUW2a1H
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 22/06/18 18:46, Jordan Glover wrote:
> On June 22, 2018 3:56 AM, Antonio Quartulli <a@unstable.cc> wrote:
>>
>> In case this might be useful: in OpenVPN there is an additional
>>
>> parameter called "--script-security" that requires to be set to a
>>
>> certain level before allowing configured scripts to be executed.
>>
>> Unfortunately there is no real protection against the clueless user, w=
ho
>>
>> can and will blindly enable that setting if asked by a $random VPN pro=
vider.
>>
>> However, I still believe (and hope) that forcing the user to enable a
>>
>> specific knob may raise the level of attention.
>>
>> Maybe something similar could be added as a command line parameter to
>>
>> wg/wg-quick so that it will execute the various
>>
>> PostUp/PreUp/PostDown/PreDown only if allowed to?
>>
>> Just as a side note: this is not a VPN specific problem, this is
>>
>> something users can end up with everytime they execute some binary wit=
h
>>
>> a configuration they have not inspected. So, be careful out there ;-)
>>
>> Cheers,
>>
>=20
> Attacker can pass appropriate "--script-security" level with the very s=
ame config
> containing malicious commands so this isn't solving problem of not look=
ing at
> the content of config files.=20

that's why I suggested to implement it as a command line knob for
wg/wg-quick.

But I totally agree with you that against this kind of issues there is
not really a lot the developer can do - each of us is free to shoot
himself in the foot.

Regards,

--=20
Antonio Quartulli


--LketLwTYwJZ30Au7IFzIYeY0PpXUW2a1H--

--afrl8sPZSvhxEF2qonTZepRQDi8uYfyUJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEERdCuyFSHc3WdqS4EB6U8WA7yzXQFAlss1SgACgkQB6U8WA7y
zXSqUxAAhoSIPrSEpInCPdhIXWKmp37OBaLs8q3AyES7bN+7K5oepXmDMrgb97T3
n1IOOKC5JTT6JNZoplpNo8voR0J2pyrYWFtykCFNuoj8kBg/YZewrDuMRopihRM/
tJ9IcwT92/kXuLvHYBw/9SSdRJ+sSSRerr6ETey2KvcMmFlgnrE9tyfgK4j0Da/2
+zC4eya9/gOeHGb6D4nQE1gh0BvZMuP5xSZEXluieKJAOknVmSMuk4cnGKfDzeKd
IRzqS2bVgpX/57aV+uPuxr2zKowwdxYadgeS24bTFNFuSWlWCte1clIiOvieTvfP
aesFhmIisZdMh2RmKhJQonHZdaANQmIZb0RflLVfCrSZxWHL+qcvPPsFz44qWX2K
diYWkS4v0PSr0D4VWaNMCqQciEO7ROr3vN4cy8LQAQd2yuevQpItkxzLvHMGJb28
WlzIQ3J122HOliEYZeyvLVVCzp+/RjElv8dl1FAW9P5QHr1JigdTopZSUQ1Z80mQ
jgJfcN3BKRB2f8MALp0CTj24DYArrBW3WTFQoY/jdS8LdMsDsHykLf/lV6RhFxY5
bqPJ/i3UYhW5+GcF8qYN4jov9LO62rY8FeQIjiE9rc/8xnR9KxEijaInsUGw3Nx3
mmRZ4CQ4/8BzX9Tg/FkV/yUEZ8dlK/pZhYiuFmLRWcXdiJN9y/k=
=1VRw
-----END PGP SIGNATURE-----

--afrl8sPZSvhxEF2qonTZepRQDi8uYfyUJ--
