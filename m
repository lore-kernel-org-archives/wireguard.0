Return-Path: <SRS0=NpDZ=H6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43B47C433E6
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Feb 2021 22:14:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2419460249
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 28 Feb 2021 22:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2419460249
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b81296a4;
	Sun, 28 Feb 2021 22:14:37 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7953e151
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 28 Feb 2021 00:53:49 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 5A86C772
 for <wireguard@lists.zx2c4.com>; Sat, 27 Feb 2021 19:53:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 27 Feb 2021 19:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:from:message-id:date
 :mime-version:in-reply-to:content-type; s=fm3; bh=XdkyfwK0zHZhzw
 xUXy41xmbIhxOI1duRABZCobBg6x0=; b=x48xaZPK1IDvfcuWBHZl78Sdibz/lV
 WEzqukaPupHm34NIKgI7jcTp7e+yRO+dbLJ44a2H003TKuvVzXGHf6gxv/Ap/090
 PBkA18KRQuRzSOpH5RwL2JG8nvoKItzN+sUvABospIlc1iTFRR+qlLdjG19L3NOX
 orDmU3rgcAezfrU6njN6iuBTqHoI8OczYsES4lVpzTfu9x/SsUdF1avF52EsO8lQ
 7/JP6QXNO2FI/NnCCZhD8kwcMQFEXyh94G1mWPftcmUBy+PhbsDiGuxd+0OlauXx
 McAvwWlds0CQG7qIbYKNdLrvf99nP0zMM34E4crMx5UP/TFCIHUQ7s7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Xdkyfw
 K0zHZhzwxUXy41xmbIhxOI1duRABZCobBg6x0=; b=S+RaeUr8WBcyJkJYbv6Wk7
 ifjiprWmiKLMpXxmWnuu9w5/k5bDVDkNI3toG/I2l63An4gsqhbwdPL9eTDTq3wX
 8dPhbLn/xKCcrtJ+WAoq7OpqMakkAgeyvaB6I+4DPnS4TkeowenPFIMPnzkndF9U
 OZo4fWSXLMZRNIMPaAmWsAvLUXxj+ATr1CofrLwbx5PHbplYgMGXe1ztGNQcwvsi
 FkXxeM0SqmigKteMOwSb+yAS++RMhcrJ1BmlGaSy99H4m1MKurUGD62nQEDMfJAc
 MCQb3MnweXC7sFiGNS/jH+AtQV/VVnuRa/OOQfxrpL+jdT5AZaT+hlSDjWaRYKOw
 ==
X-ME-Sender: <xms:muk6YJytmFvnXSDarhySOj44FwlMZAMPp9gTPFQyfh87REM79b_yoQ>
 <xme:muk6YJQvwsf2nqc84DUeRLTPbXr9zBkNym5TUzg7_PvheTdqFcfgLgUUGoBv1WEII
 9MJASXyivdJGGZsycs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleeggddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefuvfhfhffkffgfgggjtgesghdtrefotdefjeenucfhrhhomheptegrrhhonhcu
 lfhonhgvshcuoehmvgesrggrrhhonhhmughjohhnvghsrdhnvghtqeenucggtffrrghtth
 gvrhhnpeevkeekieeiuefggeffhfdtgefftedtkeekfeetiefhveegteeiieffteetfeej
 vdenucfkphepkedvrdegjedruddvtddrkeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmvgesrggrrhhonhhmughjohhnvghsrdhnvght
X-ME-Proxy: <xmx:muk6YDWSPbDxlV8MYyoDMwzOsAdJci31T0QUQtnRai-o4hBwxk623g>
 <xmx:muk6YLhKUl_D8BjfuT57BFPkdjnVc3YCXnXZQKxgoFFOc2Nx6DQ1_A>
 <xmx:muk6YLDkDjNcIuBVDHU3VcY2BWcJykGnG5AVHwcqphCF_ensgUwvbA>
 <xmx:m-k6YOOvXipNPO8vGEJBLm4lqZo2W38McvB6BsrtLrOwEazl3_NfsQ>
Received: from [10.20.1.35] (cpc77355-stav19-2-0-cust7.17-3.cable.virginm.net
 [82.47.120.8])
 by mail.messagingengine.com (Postfix) with ESMTPA id 091A8240057
 for <wireguard@lists.zx2c4.com>; Sat, 27 Feb 2021 19:53:45 -0500 (EST)
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
Date: Sun, 28 Feb 2021 00:53:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qZNat1xurr04hyqnLrktADFi04T7FcFTp"
X-Mailman-Approved-At: Sun, 28 Feb 2021 22:14:32 +0000
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
--qZNat1xurr04hyqnLrktADFi04T7FcFTp
Content-Type: multipart/mixed; boundary="1B5H70BDSeYgo6im9HW5N4EeKA9qEOzkY";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Message-ID: <65365aa6-cdd0-f9dc-f894-3a040ca596ae@aaronmdjones.net>
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
 <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
In-Reply-To: <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>

--1B5H70BDSeYgo6im9HW5N4EeKA9qEOzkY
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 27/02/2021 17:16, Frank Carmickle wrote:
> Iordan,
>
> You say that it's possible to run a nested configuration on
> Linux and Macos with just a single interface each. Have you
> done a packet capture to prove that that is in fact what is
> happening? That doesn't seem like how it would act given the
> design goals.

Nesting (Using one of Peer A's AllowedIPs as Peer B's Endpoint) does
work within the same WireGuard interface, at least on Linux.



--1B5H70BDSeYgo6im9HW5N4EeKA9qEOzkY--

--qZNat1xurr04hyqnLrktADFi04T7FcFTp
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEC4pX0E/RcMwy4/jVUMJbpZCuerQFAmA66ZUACgkQUMJbpZCu
erRwCw//ejPXSX6FVsjWnMD+VLuwJcwF/4trWPBmtt20T9Zfc1xPXO/j+d0ibwy3
y4xwpkLxLcXa6EoZKAh8jtKHa2HTj7MwQYwwyptUXYxOfgUA253WITdDGYum2rwZ
NZlR95D86Ufv8ZabOd+K16Bp+h4cK3aIi3FB7nriZc0PF0dYadyLE9KRr0ci+WVZ
408ty7nmKUt/9QHPml0wye5sskzgdRgQg0L5OAXVh0IeTaf1Q/FZnPVVVLpubCP+
laGMoz8vvtHIiRtT1ocdKZtok26c9zgvN1/+epkXVvasGpEw/89W1LSXNFcmEOPK
OXhLMopda95oUVGXpfgovRM//pDzm4j121wIstkpEH9TweeIexSxaeN4jnSSrEv7
QRLQx/YcQMJSiDBOkGzION3iIZ6E1cTnDvs/k0+EFYkG87SaP+ltMKRzJF86lXNS
vKP3WQbztxPRuesJGmnIJxkeXrwIAAUMOwYbs5wg0saOslR1hZCUaGHFzp8InOiy
hJtyNZ43xPCL+ErTpIdpiRnHo5uGEvWzLz2/E4OvCpFQx2rICTLJxz5RMS1afhOE
5SoBNyTFUv+Sw95sBnnni87Fh5Wn1t7xCMRttg7l+2MKxb5kfkfwAXKcOun2X5tD
8SQcsEMhKobGEHnZ0D2BhcGjsF151Bx8s0HbIftAkjW3uk6Ugdg=
=CPx1
-----END PGP SIGNATURE-----

--qZNat1xurr04hyqnLrktADFi04T7FcFTp--
