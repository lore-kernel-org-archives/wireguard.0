Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9298BECE599
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:36:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 351BA20854
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 351BA20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=martini.nu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 485412db;
	Wed, 16 Oct 2019 20:35:39 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9342ee86
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:34:33 +0000 (UTC)
Received: from martini.nu (martini.nu [69.163.39.203])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 8c210f15
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:34:33 +0000 (UTC)
Received: (qmail 31010 invoked by uid 1000); 16 Oct 2019 20:34:33 -0000
Date: Wed, 16 Oct 2019 13:34:33 -0700
From: "Mahlon E. Smith" <mahlon@martini.nu>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Android 10 and DNS
Message-ID: <20191016203433.dedx6bfk2m7bqmwx@martini.nu>
References: <20190926214916.7zazh6nzzxuqcwl4@martini.nu>
 <CAHmME9o9Kp6e_=Q_NGduKNJi2M+QH41A6qzuG+hveL5MUNwF=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHmME9o9Kp6e_=Q_NGduKNJi2M+QH41A6qzuG+hveL5MUNwF=g@mail.gmail.com>
X-GPG-Fingerprint: 1F7E 39D8 BDEA E34B 1169  F285 0741 7A1E E630 75D2
X-GPG-Key: http://martini.nu/misc/key.txt
X-Sysinfo: FreeBSD 12.0-RELEASE-p10 amd64
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Wed, 16 Oct 2019 22:35:37 +0200
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============1527723943884196063=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1527723943884196063==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7yku3jbb6rjelwiq"
Content-Disposition: inline


--7yku3jbb6rjelwiq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019, Jason A. Donenfeld wrote:
> Android 10 sometimes tries to forcibly enable the DNS-over-TLS or
> DNS-over-HTTPS setting. Maybe try disabling that. Another gotcha on
> Android 10 appears to be the Data Saver setting.


Yep, that was it.  Disabling the "Private DNS" system setting, all is
well again.

--
Mahlon E. Smith =20
http://www.martini.nu/

--7yku3jbb6rjelwiq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEH3452L3q40sRafKFB0F6HuYwddIFAl2nftQACgkQB0F6HuYw
ddLIuxAAxTMcvjdi7FS+YVVc681xCZkwzng92JtqhsW2rBj6wIhuXTB5Ow0FfyBg
kMMyk7iE0b77LJxjHc0p0V56nm+lA9yQ/QKMxkI2OPI0mNUmn6KLU+7qdO+DT0Ln
yP91e7lLpS1D+WZIu+CmKBEckotRwmMBgAib7XKdfLv4Yo+Z/9mVUu9Zzyta9NAI
Qqur1zjpwaXaveeglwQ5CK6pnD49CNspdxG3GetEmP27qBLPttBfENPhxGuegJVQ
49HZo4Z1weL0QYBIzNBRSVTm95//QCXaN8gXj9Bq88y79HHpa4WfqYbp1f7Umko5
kvdgs40DMWSnrUy0BTNMr+dgLgZ8e7ihYBQhxz6JoQ/fRg1pm8fFU5VVBBFQOcBl
39oYm0kl4UgrGQm17ys4in0pLl0NcwjydqtryrEq1wlZqbSG3J97W93eeDmEvIyh
m2jBPL+nj81r4a/f0VaFarj1MMSLGw+RZOFK43dJnpgtn/VXhohYlAvTiaKgzHNp
/1JkNsVKUxs1EFNhfzDXcFkWUtWtWaxzgic+Cn+UBowxmt3aHphL8+gIdJ8uSB3M
2DV3RQg1rVoE54RBtu+pFzCLl3X6rn5lUB+KNKmukObtc1UP6+xqXja5oEqzhPah
6cxoFzKVZ3DYhBLef9wXNeilvTTJojf65yWkCeJ2OwFOsvOTMWI=
=nP7Z
-----END PGP SIGNATURE-----

--7yku3jbb6rjelwiq--

--===============1527723943884196063==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1527723943884196063==--
