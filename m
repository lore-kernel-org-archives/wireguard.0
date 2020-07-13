Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD10C433E3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8B2320825
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 23:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=smar.fi header.i=@smar.fi header.b="jL2cO/zk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8B2320825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=smar.fi
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c27c0df;
	Mon, 13 Jul 2020 23:31:26 +0000 (UTC)
Received: from airi.smar.fi (airi.smar.fi [95.216.48.100])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a1a9d04
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 14:18:31 +0000 (UTC)
Received: from marie.localnet (marie.smar.fi [IPv6:2a01:4f9:2a:64d:2000::30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by airi.smar.fi (Postfix) with ESMTPSA id 9A28DD2B8A;
 Mon, 13 Jul 2020 17:39:58 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smar.fi; s=mail;
 t=1594651199; bh=tiXl6nVE4iNOasqs/ydAoCjmPQvAPNIEDzrxPfo+BXA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=jL2cO/zkBCIipvUbggIeoSIKQhfrrf2jW47JaMtU+mKDV62v/6zkGLx2iEgoakr2x
 9m0ezd/ucuqeeDPM9pEdwr//vguJXqgYjp2WvTTqTfQlhlyKf7XlvW26EBqlD+df7w
 mPrbHPCBN/5VIh992EAK+ZbfofnevtPae8H9dOP4=
From: Samu Voutilainen <wireguard@smar.fi>
To: wireguard@lists.zx2c4.com
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [ANNOUNCE] wireguard-linux-compat v1.0.20200712 released
Date: Mon, 13 Jul 2020 17:39:54 +0300
Message-ID: <2284031.4Br07FEqMx@marie>
In-Reply-To: <CAHmME9qDW7CLDzQhwHQ7bb==dKAdgtbZfEtzmNaxB-atwCguag@mail.gmail.com>
References: <913e8149b5a5c3a6@mail.zx2c4.com>
 <CAHmME9qDW7CLDzQhwHQ7bb==dKAdgtbZfEtzmNaxB-atwCguag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2505411.EjlchxAVQW";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Mailman-Approved-At: Tue, 14 Jul 2020 01:31:20 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--nextPart2505411.EjlchxAVQW
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi,

=46or SLE, 15.1 will be supported until 6 months after 15.2 release (so unt=
il=20
next January/February), with long term support probably going to at least y=
ear=20
2023. Personally, I plan to upgrade to 15.2 pretty soon after the release.

=46or distribution upgrades, =E2=80=9Czypper dist-upgrade=E2=80=9D is requi=
red, or for SLE,=20
=E2=80=9Dzypper migration=E2=80=9D, i.e. it=E2=80=99s not part of the norma=
l update flow. This might=20
be a problem in enterprise setups, but I doubt there is many who would have=
=20
unofficial Wireguard there.=20

Jason A. Donenfeld kirjoitti maanantaina 13. hein=C3=A4kuuta 2020 7.06.06 E=
EST:
> On Sun, Jul 12, 2020 at 9:34 PM Jason A. Donenfeld <Jason@zx2c4.com> wrot=
e:
> >   * compat: SUSE 15.1 is the final SUSE we need to support
> >  =20
> >   >=3D15.2 is in SUSE's kernel now. We'll be dropping 15.1 support in a
> >  =20
> >   few weeks after people have had time to upgrade.
>=20
> As said above, SUSE backported WireGuard into their kernel for 15.2,
> both on the OpenSUSE variant and on their enterprise distro. This is
> terrific news.
>=20
> I'm considering making this compat module release the last release
> that supports the now-old 15.1 release. `zypper update` automatically
> puts people on 15.2, as far as I can tell, and it seems like the
> general path for SUSE is to update. Plus, people who tend to use
> WireGuard tend to like to update.
>=20
> I put this in the git repo a few minutes ago:
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=3D2a1b895ec2f529a=
75a6b
> c63fd5b6baee2b1735b3
>=20
> If anybody thinks that 15.1 support would be worth preserving for more
> releases (how many?), this would be the time to speak up. I'm happy to
> have my presumptions about SUSE user update habits proved wrong and to
> change course accordingly.
>=20
> Jason


--nextPart2505411.EjlchxAVQW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEzQiQ+Sk/d1O26r4vtNtW2rUdxQ0FAl8McjoACgkQtNtW2rUd
xQ1FUgf/fysY1tI59iULQGzu38yd/PJJDjNuXTff6RX4Y6eS4GqeToeX45+vOXjV
SoL91Zyx0d2T9L5g/oiZPvNM3eV/tGsYUe3VbF4mlaP0FOXwKOnk5eQAZ5O5W3BE
R46jKD6/dAw90OlY86DU8oPzh1d7fA3/0fQbpKfrm8z2eIbGNT9oeJKv/a+hkh2S
0YHhUu7yYNcmv6cbA/07HVV5yqmcXvzUbaCbVJ8AMpO9TFiFzdWm/fRM3bgW06Yo
f6+4NVijRY3yx5Xe2qEmZrZbcNBUdFsvk00awTk7xUfxiI8jGK0ykpXUHLkXTwXX
J/nbTu5+P33313EBEhaRE13x3xZDwg==
=jvIw
-----END PGP SIGNATURE-----

--nextPart2505411.EjlchxAVQW--



