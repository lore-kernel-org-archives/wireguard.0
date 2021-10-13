Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A7FC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 02:08:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D62E60E78
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 02:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D62E60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d8cfd5fb;
	Wed, 13 Oct 2021 02:08:48 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 518616c9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 02:08:46 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8304D5C0156;
 Tue, 12 Oct 2021 22:08:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 12 Oct 2021 22:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:cc:from:message-id
 :date:mime-version:in-reply-to:content-type; s=fm2; bh=LvNHYlkM4
 Yqo0Qmz1btuPLagsL67GxavNMhuDl9y95Y=; b=F5x9RvmCbhl9P7rQqyYRyIA9j
 z00JaNsRqTiMCEFmNEwUDDRzeBF9FjVOEozPKaBtgg2tiBLFAvMGXPj8m7NmeRgP
 a+b7xHHzubmBqS1cgGZjTxItB5hDCR1pFxPoFFsBb67gUp08IpYChfckDGr0J6ew
 gNUGRU1+rS/G0gp1wc89bn24tsupdUM4GUPePXcNr0eu/Lfyd4MS7FLZ85N+Btvk
 GIlfUl5TSr6uDWI1J5y8mWY+tnsSQvXwXLm0ImHlx2HYaLCqR26u1TdTRhW6J5ZP
 7MdLptbwnFRxCD2kSIPCDfupyv02TC04Py/gXL2vxTVbRVUYtKQYDILIbU0nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LvNHYl
 kM4Yqo0Qmz1btuPLagsL67GxavNMhuDl9y95Y=; b=LeC3VMfA3AF4r1yyOA2gK0
 lF3pgwegMy2p/xROwazg/abVyvRXz1C1sj4qtcJ6B2cC6ioGDcyeQPj1dCoiloUo
 1hSmMr9wx71dcEgAJcOwJtBmNI1xZQee09/+PAJyT3dOc1Q1Nf7GKmKU/cqWSPKH
 vyh8TglcW5GUu92vI18VXMIKupuSD95oNxJansL549TCkWYmvADCUvXFj3Csql5T
 eylnOdld29K37eWL4vfEtlLPX4U89UeL7uQXJ81BPz/r5BueZtFCyNJgoVTYp1c/
 l5FTb+GzmijHtxzMOW6msdPDMYo/PbuZgNMZr6U6mdfPcWXpTnAyxEfMgsXl0FKg
 ==
X-ME-Sender: <xms:rT9mYT2B0YQBorztrspID5NFkrg-dTLPu8pBMohvaEAbUZ_JOLnDRw>
 <xme:rT9mYSHxghk1zUqP6FxrPl00QdoL631_n81V1QGEd26jLqL82uea-fi6OjnFc8xat
 Pis--xe0aFVgH6Gy7Q>
X-ME-Received: <xmr:rT9mYT6pMGFPMjpUyOvrjObOsUq03sTt-XGgX_FNeF34vnPy5tvSF068PKOT8vM9HfVOlLP7mO_pfL_KPv4TRqXhNOr_Gs0UKgiGjkvPXap8pXPSjD0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtledghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtsehgtderofdtfeejnecuhfhrohhmpeetrghrohhn
 ucflohhnvghsuceomhgvsegrrghrohhnmhgujhhonhgvshdrnhgvtheqnecuggftrfgrth
 htvghrnhepveekkeeiieeugfegfffhtdegffettdekkeefteeihfevgeetieeiffetteef
 jedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 gvsegrrghrohhnmhgujhhonhgvshdrnhgvth
X-ME-Proxy: <xmx:rT9mYY0v0Se4id-zTiRM4rQZ9dcvtMVaGq8yjzK2yVDTWJMx5IDU7g>
 <xmx:rT9mYWGxCT0fQLVycG9wwSfboga_ErCZyQDG4PACuxNItiWt2Wyh_g>
 <xmx:rT9mYZ9I0NbhWANSy5wyL3u13Fcl7mg0DAWIr51aLlmZca-15Yka0g>
 <xmx:rT9mYRNwpuDNVNUEJmDWqUgewFwXtlti3zi1ZHtM1beBW_R5N4lMBg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Oct 2021 22:08:44 -0400 (EDT)
Subject: Re: Keepalive packets transmitted by default
To: wireguard@lists.zx2c4.com
References: <DM5PR1201MB0012B195C77099DA856C713CC5B69@DM5PR1201MB0012.namprd12.prod.outlook.com>
Cc: Gert Mertes <gmertes@outlook.be>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <21958b52-894e-cb79-d831-159d7fda04e6@aaronmdjones.net>
Date: Wed, 13 Oct 2021 02:08:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DM5PR1201MB0012B195C77099DA856C713CC5B69@DM5PR1201MB0012.namprd12.prod.outlook.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8swxHzdIMIa1mULq1rnWcSbbD4i78uFc8"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8swxHzdIMIa1mULq1rnWcSbbD4i78uFc8
Content-Type: multipart/mixed; boundary="Oy89wASoHoZXYeTzT4byqbFvYIRhUojN4";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Cc: Gert Mertes <gmertes@outlook.be>
Message-ID: <21958b52-894e-cb79-d831-159d7fda04e6@aaronmdjones.net>
Subject: Re: Keepalive packets transmitted by default
References: <DM5PR1201MB0012B195C77099DA856C713CC5B69@DM5PR1201MB0012.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR1201MB0012B195C77099DA856C713CC5B69@DM5PR1201MB0012.namprd12.prod.outlook.com>

--Oy89wASoHoZXYeTzT4byqbFvYIRhUojN4
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 12/10/2021 13:52, Gert Mertes wrote:
> Hi,
>
> My Windows client (0.4.11) will still sporadically send (and receive)
> keepalive packets over an idle tunnel, even though PersistentKeepalive
> is not set in the config of any peer in the tunnel. Explicitly setting
> it to 0 also has the same result. I=E2=80=99m wondering if (i) the abov=
e is
> expected behaviour and (ii) is it possible to completely disable
> keepalive packets?
>
> Thanks,
> Gert

This is the expected behaviour, and it is not possible to disable it.

It's occurring because there is a unidirectional data transfer happening
(e.g. UDP), and the other side is responding with the keepalive because
it hasn't already done so recently (like it would with e.g. a TCP ACK)
and has nothing to send.

The reasons are described in sections 6.2 and 6.5 of the WireGuard
whitepaper.



--Oy89wASoHoZXYeTzT4byqbFvYIRhUojN4--

--8swxHzdIMIa1mULq1rnWcSbbD4i78uFc8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUh8K0NtYMbn+mJWCVjfoBb/oPSQFAmFmP6gACgkQVjfoBb/o
PSSNQw//bsMBYv0GGHG2SoAcEVuzxIlhgKTRznhHCzmTJo+pGvRU8TsMDOWFa8jf
zj3Mdm8S87Xyr26HBMVE5z25aHPqqZqChlQnP8hAgBZZvocSCPRxHMl97NofXCR4
aThT40jkHMt7OnXdnN6MedsusCLdv9loGzauGDmsCYUdewLxJk+lTxVksF9KD2+I
tlL5ay+CZ3G6fEO3DfiqGhyL9GUR3fI5I2sXG5F9Qv2/7I6LH6k7yuUS/XQSyHxR
gI/F/ZkrWK0BRokeYNZvDwDo5EMr7gTwmlAjImtqb6+lIGGmgWdb26Ehwphdnd2S
eXqkbnoH4isddvnpla8pcXyuP9i1931u6z16GmdrjraCSQe/td5/m2rmjauyz9fK
SCPVBg4Oy8qLcA1nik/3r7aRpjGpCPEO/fnB3zsWpXBuu/EVHdyREud8D6FNKCzi
GtpZuJb6AmVGY98GHUn5NCm3FNy7IQXWMba+1ibnJdU2NrhBLVlKMivxS8qh0Eys
px+wdbt7y/gyaFwsRJFIcSf5GIKjTyBLxNoJDj5A8S29vY4djggCPSyTOBvMZ4V2
UYArsApH6QuwOePzEmzPNUdQ+xpTYGUvmdTNLjJGZ6ZJiQvdtMZNibIVY1RBiv+j
GHuvvUGnhjivfcI5lmlwbfxHIiQfmv7tPtL42+pfFyp17/pPN7E=
=eOgp
-----END PGP SIGNATURE-----

--8swxHzdIMIa1mULq1rnWcSbbD4i78uFc8--
