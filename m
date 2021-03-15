Return-Path: <SRS0=5KBh=IN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8DAC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:57:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7608C64E42
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 15 Mar 2021 14:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7608C64E42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fe87cb6d;
	Mon, 15 Mar 2021 14:57:46 +0000 (UTC)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 126b32a5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Mar 2021 14:57:44 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id B0B44235B
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 10:57:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 15 Mar 2021 10:57:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:from:message-id:date
 :mime-version:in-reply-to:content-type; s=fm3; bh=nKu69CMV8YgabY
 PI9TtNwAIVa0dh9WQgeu6ZvYBPRfc=; b=B1DZWg1/TIUWzUcqAb9szGDkJlf9u+
 9y2sW0XTCW4hdSW++fa6XFMGCBhkXDlwPIZV/kDxDeH1/J1sKe21KVrPKYAeNxh+
 KmLr/TOM7lW7dRvEMTuei9IJZgctMrs4hQA9bL00PNfWVctx2CGLYedZXnAU7k4/
 YWHWx6Ei62P2+9oHYXGZ0SKNEKkMFAjg5rvM2oZLHbngiu3b4TNzW+zTqQdBpjHJ
 AXtMQXSZPVKcQkoDhxPLaSoFExGErxrSqxVZnaa7qZ6q7i4M/ahUq8Xk42ASiTq0
 wNHD15fHGw9/6kwfEy3VgqiJ4r5igSYFYzS7qFP+yBfTnMc/m/dijjfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nKu69C
 MV8YgabYPI9TtNwAIVa0dh9WQgeu6ZvYBPRfc=; b=bLiwaAYRyc1F74WE/KU/Nc
 fm7QL6IfDQEO+eiepq6GdXc3NPiT5EyFjlxrm70a8LSMZ026CedGcXz8RLywuMEi
 DA7AHnb0KyRctZcgLKiNAKW46it2mqqAgHE+oo31CMoW8292d3MN9OXPQOoMLhyY
 uC19xweunXxZPD/+xA7zHs0PmzaQ+BjN0jrOzr+MOQ6oGF2rwCooAiSIO+TKuEpD
 ae465qs1BJxA6k4GtS9h2MkzkQwiRQlD5sRbnluVY/D8LuuDfyvFa4d/9RAecgm6
 998Qm/jboPgvcp7dVmf6Zh/R7qoa394aQhJXTmuLNhjcRSS5ELT5H1ydnT5JKGpQ
 ==
X-ME-Sender: <xms:5XVPYHwXTE_kj6HuuriSF2fMNTYX9WRC0dvpI26hW5UJ-SZWSA5f3Q>
 <xme:5XVPYFQHYyf9yrDvZ8XIhQdI5oIQdw7U_BI9wH1J4GZSqAzHgS7qPXCW6e7D16cx7
 aDO6sYz_uX0IuUX67Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvledgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgesghdtre
 fotdefjeenucfhrhhomheptegrrhhonhculfhonhgvshcuoehmvgesrggrrhhonhhmughj
 ohhnvghsrdhnvghtqeenucggtffrrghtthgvrhhnpeevkeekieeiuefggeffhfdtgeffte
 dtkeekfeetiefhveegteeiieffteetfeejvdenucfkphepkedvrdegjedruddvtddrkeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesrg
 grrhhonhhmughjohhnvghsrdhnvght
X-ME-Proxy: <xmx:5XVPYO-MeIur2oxhXXzuB89J-heplUv5cqgYoeFtlTL18bUpQxYMVg>
 <xmx:5XVPYMoEIQeZKt1kGnN5-sYZblkTAF8ECo3hUe7cuhBXH-g88kppGA>
 <xmx:5XVPYLkDWzO1CCv1bXZf1-byMFraC0tZ-40kaHwuHUVb1xQHc96ymQ>
 <xmx:5nVPYPsEzkFGeJTzsAc6KUclIrdpjp5oyu81CZu1olNEiMBOnYcYLQ>
Received: from [10.20.1.35] (cpc77355-stav19-2-0-cust7.17-3.cable.virginm.net
 [82.47.120.8])
 by mail.messagingengine.com (Postfix) with ESMTPA id 721F524005C
 for <wireguard@lists.zx2c4.com>; Mon, 15 Mar 2021 10:57:41 -0400 (EDT)
Subject: Re: Enhance the "AllowedIPs"
To: wireguard@lists.zx2c4.com
References: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
 <E047ABCC-8C43-4608-A518-B48BF9976B58@lonnie.abelbeck.com>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <ec03842a-ab61-69dc-61f6-5c5a042679e2@aaronmdjones.net>
Date: Mon, 15 Mar 2021 14:57:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <E047ABCC-8C43-4608-A518-B48BF9976B58@lonnie.abelbeck.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Mg4YuA1Bd2cigSxuytWQEerniIkeeBPfv"
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
--Mg4YuA1Bd2cigSxuytWQEerniIkeeBPfv
Content-Type: multipart/mixed; boundary="5XcmREO5kpwhEsein7Mx3NMAZ4QifOU7n";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Message-ID: <ec03842a-ab61-69dc-61f6-5c5a042679e2@aaronmdjones.net>
Subject: Re: Enhance the "AllowedIPs"
References: <CAEK8JBC6Y7utcom7YCz5AX=bHPOkc6cOdMoMKTC=QhqBQwDp_A@mail.gmail.com>
 <E047ABCC-8C43-4608-A518-B48BF9976B58@lonnie.abelbeck.com>
In-Reply-To: <E047ABCC-8C43-4608-A518-B48BF9976B58@lonnie.abelbeck.com>

--5XcmREO5kpwhEsein7Mx3NMAZ4QifOU7n
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 15/03/2021 13:31, Lonnie Abelbeck wrote:
> For giggles, I though this might be a clever solution:
> --
> [Peer]
> PublicKey =3D <remote PublicKey>
> Endpoint =3D remote-vpn:51820
> AllowedIPs =3D 0.0.0.0/0, ::/0
>=20
> [Peer]
> PublicKey =3D <local PublicKey>
> Endpoint =3D 127.0.0.1:51820
> AllowedIPs =3D 192.168.0.0/16
> --
>=20
> I tested, but wg silently ignores peers to itself.
> Lonnie

Indeed; but nothing prevents you from terminating it with a different
local WireGuard interface with a different private key.


--5XcmREO5kpwhEsein7Mx3NMAZ4QifOU7n--

--Mg4YuA1Bd2cigSxuytWQEerniIkeeBPfv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEC4pX0E/RcMwy4/jVUMJbpZCuerQFAmBPdeIACgkQUMJbpZCu
erRo9xAAoNtHe6y3Lv4F0NL0NTZyQ5wm53zApEDIU+vXzgDKcQIG67sdIDXzCkOj
QeTOopLuHNX+m5k88Zoxzg54CgRS7hpa23BpAgMK0LSwskCNoVgg43WQcfilcnqj
zYlUBKw51vruWAJ/a+pgT7w6V6qCIT48NCV42S4FA0sh1/Bz4tyyDS5RrCpY+xAH
jqfjOCJJHHLQuCJN6/yFY35gyjUb3UvkVGJxY8i/4zdDG6fEpDkINRd4lcrmEjif
dLfTlHIAFbtZTig8bpWj046tyFNCpLz/3/qBIx1wvlswmyzzgYl/eUJUQjEfYHXt
rAw4meWZLzNbq2+ScZOpKGuqmledhzzXPDS3nM23UQvWIdaz1XUOPQl8c3XiVstD
OHXliS+fpJlABTGDRvAP4IYNkhiscCinkeJAfeJrxx/1dXDEK5PS7P9JldEfHzIL
9QaAUeib2XUU7Q03XUV9REq8N0rDC5/SXF4mtwAE6a65ezyX4TqGUmv4e2NRsFSD
5xi2PXl6sZit6w+U68JKUGE1XWLVL/Y5b5z/j6XOcOgTj0rAjtVcjAige5vhmzzL
qcO+j6RO3qucOs+BS2Wl88xx19BjgstLfxVxZXH2zEsr3/jm1lw40M28bfbewpKv
kSFkhRx4+lLbKDTTq0OwnKs5yw3uOmuRNNrPt4rN/E/wQyGN6KM=
=UQH6
-----END PGP SIGNATURE-----

--Mg4YuA1Bd2cigSxuytWQEerniIkeeBPfv--
