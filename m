Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2C1ECAAA1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Sep 2022 18:30:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 5a4d6d03;
	Mon, 19 Sep 2022 18:30:27 +0000 (UTC)
Received: from vmi832556.contaboserver.net (vmi832556.contaboserver.net
 [194.233.68.184])
 by lists.zx2c4.com (OpenSMTPD) with ESMTP id 721f7cbd
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Sep 2022 18:30:24 +0000 (UTC)
Received: from inspiro.localdomain (unknown [182.253.127.186])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest
 SHA256) (No client certificate requested)
 by vmi832556.contaboserver.net (Postfix) with ESMTPSA id E8CB11C0018;
 Mon, 19 Sep 2022 18:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kilabit.info;
 s=20210411-1; t=1663612223;
 bh=TjcxP5IulpPg1aEpdurbM/VT02zwyxt+GcrGEK5FzUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=fPFUEyszOumilid6TfX6D4RTXiVAcNBLNF8Ld+PZwTbtu27Q1uVcKGstn24eFm1Lf
 W7xjqZDmjURa2s+48Nlxe++uIk+8Grf1R37bFKMNA4gzRCXZ6728AY+jxGRE7mHlO9
 83ZRAYqV/5Oa8mAG4WMPTqcuWF3wwNR+USejttTQ=
Date: Tue, 20 Sep 2022 01:29:39 +0700
From: Shulhan <ms@kilabit.info>
To: Devanath S <s.devanath@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wireguard-go on MACos
Message-ID: <20220920012939.78a8be42@inspiro.localdomain>
In-Reply-To: <CADjMg7XtPWoozpBikNGP=EDCYvH=dr3Uo60emPXGvUv0MbJvVQ@mail.gmail.com>
References: <CADjMg7XtPWoozpBikNGP=EDCYvH=dr3Uo60emPXGvUv0MbJvVQ@mail.gmail.com>
Organization: kilabit.info
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cq3hImTxUQNV9whwrbLRNup";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/cq3hImTxUQNV9whwrbLRNup
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dev,

On Mon, 19 Sep 2022 10:47:29 -0700
Devanath S <s.devanath@gmail.com> wrote:

> Hi All,
>=20
> We are using wireguard-go on MACOS/LINUX and a dns-proxy is listening
> on wireguard device. dns-proxy is receiving dns requests from the
> desktop (destined to wireguarddeviceip:53) on linuxos. But the same
> does not work on MACos.
>=20
> I have tried to create tun/ap using go-library (water) and was able to
> receive the requests, but the same fails when using a wireguard device
> created using wireguard-go. Also ping to wireguard device ip from the
> desktop fails miserably.
>=20

I assume you want to make all peers request to the same DNS server, yes?

In that case, instead of installing dns-proxy on each user, setup a
central DNS server and let the WireGuard handle the rest.

For example, in my experience, I setup rescached [1] (or any DNS
caches/forwarder) on the "server" peer at 10.8.0.1 and set the DNS
option on each "client" peer to that address

  [Interface]
  ...
  DNS =3D 10.8.0.1

With this mode, client does not need to install or setup anything except
the WireGuard application.

[1] https://kilabit.info/project/rescached

--=20
{ "git":"git.sr.ht/~shulhan", "site":"kilabit.info" }

--Sig_/cq3hImTxUQNV9whwrbLRNup
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQSyS35x1RIQ2SkuGz5KU2C1AMnE8AUCYyi1EwAKCRBKU2C1AMnE
8IAwAP4rZkjDj5+rGEhaG8Q890Qab2tQLvzRGXkLcFyh0+rRLgEA2uLNHqD9vuRq
ZHlX7tOdVohk9LrlKuC9t9FBXbWoGg0=
=mto8
-----END PGP SIGNATURE-----

--Sig_/cq3hImTxUQNV9whwrbLRNup--
