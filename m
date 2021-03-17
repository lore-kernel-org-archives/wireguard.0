Return-Path: <SRS0=bERg=IP=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64255C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 12:36:08 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B27D064F67
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Mar 2021 12:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B27D064F67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee2abf1f;
	Wed, 17 Mar 2021 12:36:04 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25c3c708
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Mar 2021 12:36:03 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id D2F9B5BD
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 08:36:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 17 Mar 2021 08:36:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:from:message-id:date
 :mime-version:in-reply-to:content-type; s=fm3; bh=FP9vzpKFBOIH4T
 K/T4JYPsfbcaLvvMsb5GuTR+hjlgE=; b=n18GGvormNGx2cUwHCC2OYRK/TfAay
 KN6XD52yEkWjiYYkGFp4ocPqaibOBU6waddPH3Q+vAmCrdlJojZkKGNIsemAMWRq
 ryonWW6wptsFMezB4YzgFoZr7QH8gFCusHIROIYRwkaL7flHs1UnrL/g4WZgmIFK
 QJI8hOX9r97GVCj382uGBSmkoPoLpJW+ZDzxAITLfjiLR/wVuai3ANzwHCx7TuC6
 yyh7of9/6MuAtXIkcMXaqAFQNqaFAT9mSKI8sCA9xnFuydQPBEpQXtvhVoPjm5yc
 PkkTwfRBlLzfLthJ1tVk/UsPB3wWYQ6wXKlyfjE0bzRxhkv77TbkZBbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=FP9vzp
 KFBOIH4TK/T4JYPsfbcaLvvMsb5GuTR+hjlgE=; b=AjA7qCnIb7I32R9wi1K7As
 fLJCq2TEeLbPktu73l0E7W7R+eveTWxiKOy8wXqYPL7A0CqrhYXMEBX1T2J4s5Qf
 7RTUlhOQJTXZGnw+tEceA/AODmuC1IkaxsWqfWlkp8oIhApSjE2ufXX2a3k8/PWN
 HjXfjHQWwtQJbMmxkRRV+dH3YEsg4dbylANTA095CfCp1t4MQC2bAOBoQeNx185/
 HlLfMs/qjw5w5AX2EEsZ9rXjfYByTq6R3qe91Yv76lrFWKIVLKPXGsLsjQt9AQgb
 2zSc9yFGZB5Opmlmct/DRgBbGVBk4KKXkS46MY8wUYfAR76jx3DHEWOSgkfmclbA
 ==
X-ME-Sender: <xms:sPdRYOb1pwmKTTo0d1G8cfKRtIXsCHbSbHz5INcmvpIlH6FT-b7Hiw>
 <xme:sPdRYBZzbm8MZ4Z8WhlvpRQRANVYRMmzZr7DtaNycFJLq9rm0feKPy104ObFPURDQ
 1NiUorel1UV4sjQDks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgesghdtre
 fotdefjeenucfhrhhomheptegrrhhonhculfhonhgvshcuoehmvgesrggrrhhonhhmughj
 ohhnvghsrdhnvghtqeenucggtffrrghtthgvrhhnpeevkeekieeiuefggeffhfdtgeffte
 dtkeekfeetiefhveegteeiieffteetfeejvdenucfkphepkedvrdegjedruddvtddrkeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesrg
 grrhhonhhmughjohhnvghsrdhnvght
X-ME-Proxy: <xmx:sPdRYI8cFdH9GXvgI5RzweLqFsPdjM4KEYVw92cNH8-aLDs03ZesJw>
 <xmx:sPdRYAoPXZhNrvtWxSH45splsGtX5kznng4GrFG3zu5cbQko3kQsJg>
 <xmx:sPdRYJonnkCH60uHcIGLXHzggDBuoE5dwK5_SMFrA6sQ2ouk_BXKWQ>
 <xmx:sPdRYG337oDcsNxQVYDpvKFE7mY9I2j7dv544oCvNtpx3VEsJEBTig>
Received: from [10.20.1.35] (cpc77355-stav19-2-0-cust7.17-3.cable.virginm.net
 [82.47.120.8])
 by mail.messagingengine.com (Postfix) with ESMTPA id D9BD624005B
 for <wireguard@lists.zx2c4.com>; Wed, 17 Mar 2021 08:35:59 -0400 (EDT)
Subject: Re: [PATCH] Respect WG protocol reserved bytes
To: wireguard@lists.zx2c4.com
References: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <f5126d40-4ea7-193a-93dd-ab816af3bb7e@aaronmdjones.net>
Date: Wed, 17 Mar 2021 12:35:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ExQ897ujwtTbvsaz3v6WRXT1dlQe5s0iX"
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
--ExQ897ujwtTbvsaz3v6WRXT1dlQe5s0iX
Content-Type: multipart/mixed; boundary="HopjuIsBFDlw8dsScGtv921hX6VyjkR6Q";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Message-ID: <f5126d40-4ea7-193a-93dd-ab816af3bb7e@aaronmdjones.net>
Subject: Re: [PATCH] Respect WG protocol reserved bytes
References: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>
In-Reply-To: <9C811F88-FD21-47D0-B3FE-A14FD5BC1816@wandera.com>

--HopjuIsBFDlw8dsScGtv921hX6VyjkR6Q
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 17/03/2021 07:55, Laura Zelenku wrote:
> Packet that respects WG protocol contains Type on first byte followed b=
y
> three reserved bytes. Because wireguard-go implementation uses element
> pools it is required to make sure that reserved bytes are cleared for
> outgoing traffic (can get dirty by "bad" clients). Clearing reserved
> bytes is also for backwards compatibility.

Encoding the message type as a little-endian 32-bit integer already
takes care of setting the reserved bytes to zero; e.g. for a packet of
message type 1 (handshake initiation), its little-endian 32-bit encoding
is the following sequence of bytes: [ 0x01 0x00 0x00 0x00 ].

This is also the approach used for checking message types on the
receiving end, so packets whose reserved bytes are non-zero are already
discarded as being those of unknown types of message.

Regards,
Aaron Jones


--HopjuIsBFDlw8dsScGtv921hX6VyjkR6Q--

--ExQ897ujwtTbvsaz3v6WRXT1dlQe5s0iX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEC4pX0E/RcMwy4/jVUMJbpZCuerQFAmBR96wACgkQUMJbpZCu
erTcoQ/8CyjEJOuwC2g2JkD4OKL3VjhHeY93fg4Pvfuhj0NPmVWMU47EYaS9YrW9
jm98EQYuNX4nb6nt76fW+2LRKQ94yQ5UeoMgW+jVOEao0q7I9uz4YYc7euIRWZfs
NgXMBWqIijqYjKEMrEJgyLD2qnZ3AsOl+DIouYR9E/uB/+Iej6kAiEMQiNttWMTx
lql21a51Kazf40daVOMa10AzcoSXmLggVFtgLH2kOIT4X1ZCPl6G59iwhKJJCLgQ
X6KfAwQeHbQc6EU9hgHQEldHC6JJ/99SRh+1lgRLgv4FYqnNiAvYxh7L/uWo7dzy
QC4xOYCHExhYluae1u27n1nMmx15dn3xfjfrVlXOkZz22pjwKJPIZVa1hxO3PFE/
1YPPYcTjmuBi6197PTZYlLLaXw+/6hrcIHz4iu4/a6PNSTHKgZp8InzKTJTppifK
XRp1bi8tA87H8+u+fHXh3MnuxgR9mwx49gv35zU9YrGogSYMS5GSIfxIraB+z6i3
IWgZk1XTtobCRGPZhu7vOrGOTbuniblUHyFv6QOe2TMjw/g+6c2+P87MtN0mXrnR
KAUwyriIqo2JYpj5rYzME2vubBO7YWJooNPjmwK2+OT7qHCgtCKkz8OH7D8L1ot7
ST/zHZHex9IBydQJqRK3+ndMEFcj33TyLrjb3nkVlvewtHuRCJw=
=h5+O
-----END PGP SIGNATURE-----

--ExQ897ujwtTbvsaz3v6WRXT1dlQe5s0iX--
