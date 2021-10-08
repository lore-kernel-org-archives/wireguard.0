Return-Path: <SRS0=G6+c=O4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5584AC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Oct 2021 14:56:01 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0657060F9E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Oct 2021 14:55:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0657060F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aaronmdjones.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9a55b2a;
	Fri, 8 Oct 2021 14:55:58 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 66148f18
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 8 Oct 2021 14:55:56 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2A8353200927;
 Fri,  8 Oct 2021 10:55:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 08 Oct 2021 10:55:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=subject:to:references:cc:from:message-id
 :date:mime-version:in-reply-to:content-type; s=fm2; bh=EwNik5Rpp
 eAzCEOc/06BURkW1Jag/XLj2GAvOrYVpj8=; b=Ictom9ztmkCVEkGtmj+yhUxwW
 BoZvpKe3G6+Dkh3cMMrXGF2DmC6vlWCHEDySMDaduRgmNoMp7bGPMoLzxSwqFfs3
 /uy9FfLEToGCYzEPySroXmt7pZVk4J+BdZGmphZeBuuw5zNM6uvWiPrh3SK848BK
 FWC/Z3cumjEdkACZbx/UqjyMGHnJaT2cMfQq59qeR9PnaLWekv1TWFbc8mdfn49Z
 7L05MNSXj/v621ttPtGWqMViWO2O5murTk25m18Tn3VPfEBKksHEwfsA6dnHYx0x
 oC0DczoK6xcILofdg2yvKS7q5N76RHKLXk0RQAnWXf5yKEY1lpeoeuw/K7gLA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EwNik5
 RppeAzCEOc/06BURkW1Jag/XLj2GAvOrYVpj8=; b=ed3xMNJyIFgfzn/ZHKE9RY
 LfkudEzy/0pNycLJH8ospMhJMagjGvgYFqZYeg3qDo/x4r4nHxl0/O+hjIIT0JrB
 f03i1d6TIti4AROgGlRdUHGnu4qZ8Bj036nzwteN1FaVikQspYXuINo2Lr/qUQRg
 wWrmHBdAkdE0kMuWBBjvXCl83SBPinDHmVbCvKHwc0auC2oyAZEeikqhvJAi1Ezp
 0B4H4OapX74zLNCM4+M7LjY5lTNQpN4nyXGh5eAbhXWU2NqwINjt+2AwRm0NB0ar
 dr7C06m8Q/nYPYFf+1A/9cyLEXjce+1a7h867B8W2F7x9da2qF04a+OhOVdx8KQA
 ==
X-ME-Sender: <xms:-VtgYdN__8h6r6h8S4GyFcDvJb8zKMasUsOF-0LJTKRqDj4O7Qg0cw>
 <xme:-VtgYf8aGzrNfmUITIZzIGFyvCenspE5RHz24gCCHFzhoBi-d6BBBjJY2DYKQvb0z
 XmxYR6OZnvDMlfflnE>
X-ME-Received: <xmr:-VtgYcTwPxQlL5fYaeWX74SKiQTtxlMSMIAj6Ui5GYyL0a1IBMKbYs6JnKnHB9r1q8FI2C6glDZrky7u1MZEgHpe__eRBalE54SxlqsRbDDqPxEzJ6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefuvfhfhffkffgfgggjtgesghdtre
 fotdefjeenucfhrhhomheptegrrhhonhculfhonhgvshcuoehmvgesrggrrhhonhhmughj
 ohhnvghsrdhnvghtqeenucggtffrrghtthgvrhhnpefhvdejueeiteevkeffjeethfeite
 dvledvgeehgffhfefhueduieffteevhfffueenucffohhmrghinhepfihirhgvghhurghr
 ugdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmvgesrggrrhhonhhmughjohhnvghsrdhnvght
X-ME-Proxy: <xmx:-VtgYZsHHUPCUVy955QxumzRvIq0GDlv40AzmnDdB9BOuK4gq7pg2g>
 <xmx:-VtgYVdDWVFEN81k0GWROh5CB8Ihc0M4qVM3GeVkiyG9NexbMmSc6g>
 <xmx:-VtgYV1ynNxddcdRgvK0H43s9_a5iGp53bMTYuE7njg24L3TZri1pQ>
 <xmx:-VtgYVniaAOiXm8XarEo_WgNE6KbK49rhuGjBMhAxEL1BbMlT7sRUw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Oct 2021 10:55:52 -0400 (EDT)
Subject: Re: performance: multiple clients on one interface?
To: wireguard@lists.zx2c4.com
References: <a208c85e-4835-cb77-003c-a040544ec968@moenia.de>
Cc: uxDWzco-wg@moenia.de
From: Aaron Jones <me@aaronmdjones.net>
Message-ID: <b53d4f44-b094-a5dd-14cf-55b846b17661@aaronmdjones.net>
Date: Fri, 8 Oct 2021 14:55:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a208c85e-4835-cb77-003c-a040544ec968@moenia.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QODSHWtC0BLSMaqBfxfJUJHOIiBujuMdC"
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
--QODSHWtC0BLSMaqBfxfJUJHOIiBujuMdC
Content-Type: multipart/mixed; boundary="D57mjKUUOZ7OPeKAkmXJobcF2VJiclILI";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Cc: uxDWzco-wg@moenia.de
Message-ID: <b53d4f44-b094-a5dd-14cf-55b846b17661@aaronmdjones.net>
Subject: Re: performance: multiple clients on one interface?
References: <a208c85e-4835-cb77-003c-a040544ec968@moenia.de>
In-Reply-To: <a208c85e-4835-cb77-003c-a040544ec968@moenia.de>

--D57mjKUUOZ7OPeKAkmXJobcF2VJiclILI
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

On 05/10/2021 08:39, uxDWzco-wg@moenia.de wrote:
> using same port for all connections means, that for receiving encrypted=

> packets every configured key must be tried, until the right one is
> found, or is this wrong?

Incorrect. The handshake establishes sender and receiver indexes; these
are reproduced in data packets so that the receiver does one hash table
lookup to determine the decryption key.

This is documented on https://www.wireguard.com/protocol/

> so: how many connections are reasonable for a single device, without
> running in to trouble due to the time trying all the keys?

Up to 1,048,576 peers per interface are supported, limited only by
bandwidth and kernel memory.


--D57mjKUUOZ7OPeKAkmXJobcF2VJiclILI--

--QODSHWtC0BLSMaqBfxfJUJHOIiBujuMdC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUh8K0NtYMbn+mJWCVjfoBb/oPSQFAmFgW/EACgkQVjfoBb/o
PSRZHxAAs5ZlVy6VwwmurPcxzHI6ceXFFXFYXKLNPgT0RWRID2QK395PtoxbwDhc
fbGNkp5IcJPuL84FHMkcBLf+yyquf3Zp5w7/+JU+CxuDk2A6X0cuBfMxcfORyCx/
1PhjJXUp+7o5gpET19lLXFAq+nKKV2DZ+9u1d56cmdb92Sg9/XqsILcNZe3lr1FZ
sJL/ZiKekLheBk5Ud490wWPROVIGqTQihxorR/hcn0TWUt/zCxGq5cHkRo7uUgdM
rMxlhcGTaCkKYuiv6ad35CXOwBuEdc9cKs2/jucojJDdx/AAaTYM67DLbEgLADOU
vktBhe0eHNJSlHW0MQcTfIBWfR1opRLUGNdK3w3m3a1nY2AHMM31Aok/G6tFg4+t
XZYzvQJ7+gPGnZgwF+dvRYRmsZ1FZtlN1/y1ZyfRxEVrRHhlg1WE/faRKjuDoGbr
vE4y/cJkLuTbZTxXls2/ZCK0S/FIMVkWaLcAD9F30L6rGk0VU2H6N2eM4XgHwCr2
4J+9r1p2Gm2iKtswvurBlnVkoh855TIlNCbSdU3JVYCsK2E15xJ/zS/Qnb5/Rj19
XbWPT4AM6YfIfFLX+tFIkL+oo0jxWMv8DCIOTnPBPFmFhKvgLoB/0uGcaNsgsRFL
YYhQsXPMa6z64jduAI2a1Loxd9HnQK5sgsp0jTjCzrF3gz+CMjo=
=nu6X
-----END PGP SIGNATURE-----

--QODSHWtC0BLSMaqBfxfJUJHOIiBujuMdC--
