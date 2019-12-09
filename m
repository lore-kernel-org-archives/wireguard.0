Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F08CC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:55:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6982077B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 15:55:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=frign.de header.i=@frign.de header.b="Pg/8biFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6982077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=frign.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 06923c93;
	Mon, 9 Dec 2019 15:54:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92ac65e3
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 11:10:05 +0000 (UTC)
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 113d4254
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 11:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575889802;
 s=strato-dkim-0002; d=frign.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=8XzG7nVUpOArb/J6JSSAUS+cHCU+G5+R/iWw/OTNmkY=;
 b=Pg/8biFY2UNBv5oLbRNRcoCYZIQuqbCoBxVhBAtpqQkG/VmSgBn3vc+LtIfapPo6z0
 d1S9KP0GuIPu2/8EF8SetItOYH8HwG5oAEfWtP23VV5wkHOoeoIjAvA7y9ZBW3okIQDQ
 Tbt/zP7sp3dqqq2scVk/Q81THPm7xTc+XauSScUeikwHr67N61xLqi4bNA9Kv1w64938
 wyWjZ7tttys5pRXA2rIkZ2llKF/179hCLWnotmxbqaPoam0ELFdadTRta2YAJ0QAmEt3
 0R6PGcqKK0VVszTAkzeah0xx9ZmDEX4plOndZ6iPpVpynm6rMu3tNB6J8dErieYMkk0D
 iekw==
X-RZG-AUTH: ":KGkSVUa6cvg6QHOypuT/F+/ElAlFppyfIncvHffsptN49ixn09bzt6FCBhBjl7Pt"
X-RZG-CLASS-ID: mo00
Received: from localhost by smtp.strato.de (RZmta 46.0.2 AUTH)
 with ESMTPSA id h005dbvB9BA1LYG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 12:10:01 +0100 (CET)
Date: Mon, 9 Dec 2019 12:09:55 +0100
From: Laslo Hunhold <dev@frign.de>
To: wireguard@lists.zx2c4.com
Subject: Re: [ANNOUNCE] WireGuard merged to net-next, on its way to Linux 5.6
Message-ID: <20191209120955.46b715c0@frign.de>
In-Reply-To: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
References: <CAHmME9oRJqvMWF9rnSZejWe9J6ONUMbk108VkH1Qfy513Vp=dg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 16:54:35 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0068620021922077611=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0068620021922077611==
Content-Type: multipart/signed; boundary="Sig_/7gIQ.7qtjOA.Tkp9F8gFQ5d";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7gIQ.7qtjOA.Tkp9F8gFQ5d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 9 Dec 2019 11:12:23 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

Dear Jason,

> I'm happy to announce that WireGuard has been merged into Dave
> Miller's net-next tree. That means when Linus Torvalds opens up his
> tree for Linux 5.6, Dave will send a pull request to Linus, and
> WireGuard will wind up in Linux 5.6.
>=20
> This is big news and very exciting.
>=20
> Thanks to all the developers, contributors, users, advisers, and
> mailing list interlocutors who have helped to make this happen.
>=20
> In the coming hours and days I'll be sending followups on next steps.

this is great news! Maintaining a patchset out of tree is always a big
burden, so seeing it in-tree (despite some compromises) is a good
thing and will help focus more on other aspects in the userspace. Keep
up the great work!

With best regards

Laslo Hunhold

--Sig_/7gIQ.7qtjOA.Tkp9F8gFQ5d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEZ7KGJhX1XJt/mkfnaVdr0kz8uYAFAl3uK4MACgkQaVdr0kz8
uYChMQ//XqYPBJn7EULxJan/WuLB86yn9Tdk+8u1ISBIb0Dul4yQq7OLv7wPNt/J
9+ufSLSK3d+7m8Ku5eIvK74c3+38u5RbQJuIa83Vqi0HhPyLyRBLxnUfP3Ln2Gf9
tAoiE/9rb8lYh1dV3POBlHUdzjfYV1S5gvUAe994hRNAf2OWQRjiPRaHdEG7tWB7
NJqDsOSxIIEwcJpn8xkTDwtSe7ywP0HU3gPOi6vXhfloFQhpr32/nfGomgR6jzpu
QNFZZSYN6+X4mBIJLSWjX0tVX84e8kkiITXqv12Tt1/7oCS2MhzaNwQEt/+4WbRE
VZ+dN7ftz/nLOBc9f4IDckRdCrzgz/bt0wGOhOEVXD54mLbRSkuYfUFFt3mZHXl8
FeU3FXgQD/cIJkEu+arDQz04yT8ayx06OLEzrC4y99JVFe9RNtpE9vBtIHeCRGHA
crKp3okjeCX5VOe0kBkX96Dhw1v8/Om6ufiX8ab4mWBCHANzBxsBLHiNBNyUmN8Z
HlsIBqwtSoMovSl3aT8HUx2al5yCVLkcCDwzDhAbR3Yun+10ul4TTnDZjnaFVdhk
bHXOfbXY9vbTpew/jAuBXwfcLh6/7Etq+O1ing+K15bk7xmjWTmeR+Xk21ZELHvE
oTeJGHX95Ym4vO1CJMz0JIPEsLmyHRKWIEg6KIumxjoimITT7Bo=
=ATiR
-----END PGP SIGNATURE-----

--Sig_/7gIQ.7qtjOA.Tkp9F8gFQ5d--

--===============0068620021922077611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0068620021922077611==--
