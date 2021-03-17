Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F033C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 12:56:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D7E64F67
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 12:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D7E64F67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eedb17c0;
	Wed, 17 Mar 2021 12:53:35 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 28e0c59c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 12:53:34 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id DF65073AF7
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 12:53:32 +0000 (UTC)
 (envelope-from gbe@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4F0qpN5jL3z3kSW;
 Wed, 17 Mar 2021 12:53:32 +0000 (UTC) (envelope-from gbe@freebsd.org)
Received: from localhost (p200300d5d740b9c039e609000b7e9f1f.dip0.t-ipconnect.de
 [IPv6:2003:d5:d740:b9c0:39e6:900:b7e:9f1f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: gbe)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 41861206B3;
 Wed, 17 Mar 2021 12:53:32 +0000 (UTC) (envelope-from gbe@freebsd.org)
Date: Wed, 17 Mar 2021 13:53:28 +0100
From: Gordon Bergling <gbe@freebsd.org>
To: Kyle Evans <kevans@freebsd.org>
Cc: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
Message-ID: <YFH7yIJ9OImHUwYO@lion.0xfce3.net>
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="RTChV5aF75eiVAKG"
Content-Disposition: inline
In-Reply-To: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
X-Url: <https://www.gordons-perspective.com/>
X-Operating-System: FreeBSD 12.2-STABLE amd64
X-Host-Uptime: 1:47PM  up 2 days, 19:32, 4 users, load averages: 0.26, 0.27,
 0.25
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


--RTChV5aF75eiVAKG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I am not sure, if the removal is a great idea, a removal from
releng/13 and stable/13 - possibly yes, but from main?

This is still -CURRENT and -CURRENT should be central place for development,
even if we have phabricator for review.

If the complete backout is happening, please don't forget the manual
page. I have spend a lot of time on it, while OpenBSD made a good
template.

--Gordon

On Tue, Mar 16, 2021 at 11:48:56AM -0500, Kyle Evans wrote:
> Hi,
>=20
> You may have recently noticed some chatter around the internet about
> FreeBSD's in-kernel WireGuard implementation, and the work we've done
> on it in the last week.  You may have also noticed additional chatter
> afterwards with regards to the original implementation.  I'd like to give
> some context and information with regards to the current situation, as
> well as provide some insight into the future as one of the developers
> involved.
>=20
> With regard to the original implementation, this will be my only
> commentary on the matter. I'm a developer, and I'm passionate
> about the work that I do- often to a fault. I've said some things that
> I regret; the accusations that Scott Long alluded to in an e-mail on Free=
BSD
> mailing lists were indeed made by me, and his phrasing of what I
> said was much kinder than it could have been. These were mistakes,
> and I'm going to own that. However, my personal belief is that neither
> Netgate, pfSense, nor the original developer deserved the level of
> scorn and criticism that they've received in the past days from both the
> press and the community at large.
>=20
> In the next day or so, I will be committing a removal of all WireGuard
> related bits from our 'main' branch, including the work that I recently
> committed. It will be followed up by a removal of the implementation
> from stable/13, and we will seek appropriate approval to remove it
> from releng/13.0 as well. Please, do not be concerned by any of this;
> this is being done with mutual support from all parties.
>=20
> Did the original implementation have issues? Yes, it did. Are we
> certain that our new version -doesn't- have issues? I believe it
> doesn't, but it hasn't been through thorough enough review. We hacked
> on this for a week, and we all reviewed each others' work in the
> process. The problem is that this work, in particular, is a driver with f=
airly
> severe security implications. Review by "three developers working
> and beating on it" is not the higher bar that we should be
> holding this to. While I believed I was doing what's right for the
> community, it's become clear that what's right for the community is
> to take a step back and do this the right way.
>=20
> Note that we're not dropping this effort. We will continue iterating
> on this out-of-tree, and we will go through the proper review
> channels. Folks will be unhappy in the interim because we're removing
> it right now, but in the end we will have a better FreeBSD because of
> it. There will be a kernel module available in ports at some point,
> but not before it's ready.
>=20
> Moving forward, myself, members of Netgate, and members of the larger
> community *are* working together on strictly technical details. I urge
> anyone with an interest in reviewing the driver to also get in touch with=
 me.
> Please, let's move forward as a community on this.
>=20
> Thank you,
>=20
> Kyle Evans
> _______________________________________________
> freebsd-arch@freebsd.org mailing list
> https://lists.freebsd.org/mailman/listinfo/freebsd-arch
> To unsubscribe, send any mail to "freebsd-arch-unsubscribe@freebsd.org"

--=20

--RTChV5aF75eiVAKG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGTBAEBCgB9FiEEYbWI0KY5X7yH/Fy4OQX2V8rP09wFAmBR+8hfFIAAAAAALgAo
aXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5maWZ0aGhvcnNlbWFuLm5ldDYx
QjU4OEQwQTYzOTVGQkM4N0ZDNUNCODM5MDVGNjU3Q0FDRkQzREMACgkQOQX2V8rP
09zmrQgAnsfgJ6vHWxHkAKQMmjsBu+/D0Zn9h3riJZmY79pC53/kEcfFIm4n45Gv
XDvbP5b4wrNSKYtLBJJuskJXY0OPHlNxDESoduEN2FIUy1ffxTj7eQKdP9FtdPj4
PRMtAcF/95IfGc/wUNRQcOsMW5LZq1md0uLqBM6YqKYCIILPfvBFxtOPUMsifWNK
hdfK8pHu0qUwAZUKLtKKF86SA67a/L874n2roKZazzNFzT0rqVNIxdr1T5qAtpk3
GkXaVDEVF25wo8IX4jIRvCXs6tjHqw9KdWc4bxX6WmsB0eelaJuuok4j4KN+oEkE
cz+huqPlxvOOWm+QOO4DKRrwAOwxWQ==
=2JqR
-----END PGP SIGNATURE-----

--RTChV5aF75eiVAKG--
