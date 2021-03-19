Return-Path: <SRS0=a6UP=IR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23522C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 07:47:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4CFE64F62
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Mar 2021 07:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4CFE64F62
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c5703ae;
	Fri, 19 Mar 2021 07:47:26 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f9f9774a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Mar 2021 07:47:25 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id C941995268;
 Fri, 19 Mar 2021 07:47:23 +0000 (UTC) (envelope-from gbe@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4F1wwC50gbz3sRP;
 Fri, 19 Mar 2021 07:47:23 +0000 (UTC) (envelope-from gbe@freebsd.org)
Received: from localhost (p200300d5d740b9b371f8e2bb23215a26.dip0.t-ipconnect.de
 [IPv6:2003:d5:d740:b9b3:71f8:e2bb:2321:5a26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: gbe)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 24DF85077;
 Fri, 19 Mar 2021 07:47:23 +0000 (UTC) (envelope-from gbe@freebsd.org)
Date: Fri, 19 Mar 2021 08:47:19 +0100
From: Gordon Bergling <gbe@freebsd.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Kyle Evans <kevans@freebsd.org>, freebsd-arch@freebsd.org,
 FreeBSD Hackers <freebsd-hackers@freebsd.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
Message-ID: <YFRXBzdglrzB18Ic@lion.0xfce3.net>
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
 <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
 <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="22oXUrEG2gqMUdDC"
Content-Disposition: inline
In-Reply-To: <CAHmME9pqVfzWVsuTrC2eovbWTVeTSX086ZM6DSOK1ejPjkV3uQ@mail.gmail.com>
X-Url: <https://www.gordons-perspective.com/>
X-Operating-System: FreeBSD 12.2-STABLE amd64
X-Host-Uptime: 8:41AM  up 4 days, 14:25, 4 users, load averages: 0.97, 2.84,
 3.53
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


--22oXUrEG2gqMUdDC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2021 at 12:34:02PM -0600, Jason A. Donenfeld wrote:
> Hi Gordon,
>=20
> On Wed, Mar 17, 2021 at 6:53 AM Gordon Bergling <gbe@freebsd.org> wrote:
> > I am not sure, if the removal is a great idea, a removal from
> > releng/13 and stable/13 - possibly yes, but from main?
> >
> > This is still -CURRENT and -CURRENT should be central place for develop=
ment,
> > even if we have phabricator for review.
>=20
> It looks like Kyle has gone ahead with the revert anyway, so
> development is now happening at:
>=20
> https://git.zx2c4.com/wireguard-freebsd/
>=20
> And there are now regular snapshot releases:
>=20
> https://lists.zx2c4.com/pipermail/wireguard/2021-March/006518.html
>=20
> As for your objections, and the question of what -CURRENT should or
> shouldn't be used for, I really have no idea as a community outsider.
> But I do look forward to submitting it for proper inclusion in
> -CURRENT after a few more cycles of development and refinement.
> There's also the crypto question that I'd welcome some feedback on:
>=20
> https://lists.freebsd.org/pipermail/freebsd-hackers/2021-March/057076.html
>=20
> > If the complete backout is happening, please don't forget the manual
> > page. I have spend a lot of time on it, while OpenBSD made a good
> > template.
>=20
> Thanks for bringing this up; I had actually forgotten about that. Do
> you want to re-add it and keep that current as we develop? If you
> email me your SSH key, you can just commit it directly.
>=20
> Jason

Thanks for the reply. I still think that the removal from main was a mistak=
e,
but it has happened.

I'll create a port for WireGuard tomorrow so that FreeBSD isn't losing Wire=
Guard
support at all, for whatever reason.

--Gordon

--22oXUrEG2gqMUdDC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYbWI0KY5X7yH/Fy4OQX2V8rP09wFAmBUVwdfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYx
QjU4OEQwQTYzOTVGQkM4N0ZDNUNCODM5MDVGNjU3Q0FDRkQzREMACgkQOQX2V8rP
09xcSwf7B8S5DymZnYOFWwh3KiWUgE8XICI3PSEGkQ+306lbVNn+6UIsPStiYop1
RHHBLMae1n3B+f6TGKg9zQOeViIYGZyYzHwcCY1FpO1WYuKP7MseI/iSWXh/VC5L
TSUkbcoDLYMqUuI/Z8s8dSFgZ72+ZrFuh0K8kkYSebOZ20ZhHAZvwH6iYzOn3QRy
WuznUc4ynH1I9IOuddzgpODptMCAoeRYB6BDxnOqLG8uPIKoJTGHTVUKYt3Ubv7R
Qc/RktLFF2nGiWFi1S6p8A44ClVHVk1SlpoLSGFY9UGmLp8M+6hfKPSEZVZ/LGmX
fU3KRYZtzwjSucPCOdkndFTTLjwKrw==
=l1RP
-----END PGP SIGNATURE-----

--22oXUrEG2gqMUdDC--
