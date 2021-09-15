Return-Path: <SRS0=hlHF=OF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0E8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Sep 2021 07:31:49 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62D5060C51
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 15 Sep 2021 07:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 62D5060C51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9539b56e;
	Wed, 15 Sep 2021 07:31:46 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 913132ec
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Sep 2021 07:31:39 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 499485C0103;
 Wed, 15 Sep 2021 03:31:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Sep 2021 03:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:cc:from:message-id
 :date:mime-version:in-reply-to:content-type; s=fm2; bh=GZpkFwdkw
 8OeowtBC7VCJets844QtSWNxSIuvFLkHS0=; b=DzcsQlU8WZj9p19yPywBHJCLn
 l/P+IPZaisv0GcfMDUEjGQkmOUjOkZhD9KjNBCW8Ik3SQekcZldsfnqLtnoxHPqQ
 8ykdWJIZ9R7yHULoD4L1QX1wgu74Cd8Etp12g3wcBTCz5uHgFHyvSkS/c1Yff+b9
 0JCHpcqjEQxAA9YNhqJcyuzt4W2jWnP8d/CEFoSWHXUoGBpAAPlVINg5uJ3tt9TX
 HT+zMhTic6v3dSHKIgCAK5ioXf3z4G6zHuZtmRrWwuR/r9W3k5HfnVIZ81VN80rl
 EoMSSvep5BBkivy3gBr5sdmKcdvyl7+LztCA79Ex+JiyQvFD+ft97FDj1fNiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=GZpkFw
 dkw8OeowtBC7VCJets844QtSWNxSIuvFLkHS0=; b=qdGyxc+0DXMvOXg6fSLcOf
 THFNL9AFIPvK0C9kEQYudwv3/y4PLt3rHpqpnIdHSBtoeHM1/+2gJ596QkAEqRS7
 EAML611YJ8UE/QaV/JUwQ5A5oLWcGrhcQHEF+AOjTADZ/Qs17AOKAyyRwd9AmF1a
 ymMuM5ahmYF7cempmNgF8wp03EZJbH/10xoCD2OhgmESmoSq/3UzHoRgqq4KKg2n
 kTLZaHPX3XBYf0Cc6JJomx/IAuzlKhoL/Vlxd3YnZzcSTcmbS4grtIoMdfbisfhf
 0A+aI1ARzHXclT2nHEtl9KjIxv5McsS2HoBTmkex+LUPoWa4AIv9xeLIHEpEOy2A
 ==
X-ME-Sender: <xms:WaFBYVEdQypoDvD9adI19iSYpIvrqYYHlgDpKiGnEKwtILbnba_6Aw>
 <xme:WaFBYaVdjNdfvpvd2qnXxI0mzuG_DwhJJhCpYAm4fSb9qdlMzPs8FFnevpZtJUvJ_
 06hrhngu_qzEoXpQEs>
X-ME-Received: <xmr:WaFBYXJ1YkQ17It-k2L-kHRZ_UQVSndywSAOC50j4x_v6kJSSmI1DmaE_yhKJQMwDEZz6hQ0jYiZb7P9QGCBGHz3CJtlZW_ZLmvVmG784wxu_JkiLbM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehtddguddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgesghdtrefotdefjeenucfhrhhomheptegrrhho
 nhculfhonhgvshcuoehmvgesrggrrhhonhhmughjohhnvghsrdhnvghtqeenucggtffrrg
 htthgvrhhnpeevkeekieeiuefggeffhfdtgefftedtkeekfeetiefhveegteeiieffteet
 feejvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmvgesrggrrhhonhhmughjohhnvghsrdhnvght
X-ME-Proxy: <xmx:WaFBYbHZa_n2LbQX7vUy-S3FWBznBNNYnvMze3VlTEOPeKIZERDQ2A>
 <xmx:WaFBYbV68IF9mvcKN-KPe7A1Fy-rMwWySUXldrK-PV5uvvGY9eJPug>
 <xmx:WaFBYWN5ZfeoZSGWVxcdKlGSn7_Pn-MU6CA7c3VR5lLXIAjsuoW_pA>
 <xmx:WqFBYccOaudsdJf7Vu_Daz1zaMlD-CdoEcg3S7bB4jWLOQYDaMdcxg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Sep 2021 03:31:37 -0400 (EDT)
Subject: Re: Netstat bytes count doesn't match with Wireguard
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
Cc: Manikandan Thiagarajan <tmani@prosimo.io>
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <2876f8bc-9aae-31b6-3f53-97d8c95603a9@aaronmdjones.net>
Date: Wed, 15 Sep 2021 07:31:32 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="jVXg3MD3TzchMTtTZauCU6cPaAMDrGr9q"
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
--jVXg3MD3TzchMTtTZauCU6cPaAMDrGr9q
Content-Type: multipart/mixed; boundary="wfjfdugiTtcOCzwTMAYnZ5uJVuYCuP3Rw";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Manikandan Thiagarajan <tmani@prosimo.io>
Message-ID: <2876f8bc-9aae-31b6-3f53-97d8c95603a9@aaronmdjones.net>
Subject: Re: Netstat bytes count doesn't match with Wireguard
References: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>
In-Reply-To: <DBFC0427-180B-4757-A93A-0D9DECD959EE@prosimo.io>

--wfjfdugiTtcOCzwTMAYnZ5uJVuYCuP3Rw
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hello.

Netstat is only counting traffic sent or received on the interface; e.g.
the tunnelled bytes themselves, as it should. WireGuard however is
counting that, plus all of the encapsulation overhead (header, MAC,
etc), plus packets not sending or receiving tunnelled data (for example,
keep-alives and periodic re-handshaking), plus periodic response packets
when traffic is only flowing one way (common if you run unidirectional
protocols over it; for example, UDP video streaming).

These extra packets are documented in the WireGuard whitepaper on the
website.

Regards,
Aaron Jones


--wfjfdugiTtcOCzwTMAYnZ5uJVuYCuP3Rw--

--jVXg3MD3TzchMTtTZauCU6cPaAMDrGr9q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUh8K0NtYMbn+mJWCVjfoBb/oPSQFAmFBoVQACgkQVjfoBb/o
PSQBdRAAqxE1t5jKCT22ox9RSWkI44kBdmdJQRZq+mQGK/V9Ug7u+p5jHN99pVvU
65WMFMO6s/Xi4JFQdk5nA/ZFjuK/4VTHCbJjtjtzrVzv/eSgoJeUppkyyPsdqKrf
saVRTvM51Pzz4s4Xn0zar6sC4LuufvGSt6/TU5r3o6SJReOBdlManEPD5R9wSh5P
QrlbpvWN0Qt4eihuUg9L4zGel3Zho1h5lJpq2Mt8swk68XdlC8MTKZYwvapK+Bcw
BjbHu2KOkaWszpph6wMgzWnB6g2tniN3lmH8WA0fRFezsvFx/OYnEXo6Ye7mDMR9
SP94g9fU03gfzNUCDomCyr8aHHWFZw4zhR3MkcUOQJYSI/6AxnTAED0OBddkItEv
huVHlyyWumZrsBDe6E0JS8wc1D8k98nWwXoV6kTjjqJzuJG7EcbT/rbVwK1t2BiT
gQmAAtsTMvF2FaOV6fZqjjp6VRlup7q304SZZOJDiH32fJtqQWo215za/CziQ+/0
r57ECy7sEVyEl9GBRGTBs/vVKfAbZj8wSnAcDEGqno2vtYcLvO+9z8TuAD3QskQG
mdvc+QUoWyqEFhyo/22kd/nPHhS0QwPm4gZD0gyXUrkR7aRgeehrbygDUB/jAClY
GI4EyN5H4E37mMMEcYSV1qraeCzhBqobPSv4JIzBAArIiNfTbNE=
=zUgc
-----END PGP SIGNATURE-----

--jVXg3MD3TzchMTtTZauCU6cPaAMDrGr9q--
