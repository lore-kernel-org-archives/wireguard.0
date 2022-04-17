Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E970C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Apr 2022 19:05:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6268eb62;
	Sun, 17 Apr 2022 19:05:55 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 7257c60e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Apr 2022 19:05:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A13B5C00A8;
 Sun, 17 Apr 2022 15:05:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 17 Apr 2022 15:05:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 aaronmdjones.net; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1650222352; x=
 1650308752; bh=c3ellyitXC5eJ4VPyNOAR0lItYv5ITvqfPNlID1Mnes=; b=u
 +R0kabYH7mp0FsKntwBof+2viR9+1mnsisHJkXgMZZC1KBYVYO7WpHVlZOUmjsbG
 6arK+lJ0sFlEoM5xO06wWaWBFRUSPH5CXMmrdet2h53feDxSyh2FZ+vRBOCl/Pdk
 +H9Scv7GSPgiZBETNGit9h8HjY78pCgbprdPxms/YoPW1oTQXple67Mbxsn8sxjR
 gleTZFM2YaR0+US+ngECjd/NWsPxWE4R8f37Tl9gkoFPaC1KNAFvdwRIzYOXE2py
 9j4HIXqJ9pkNEII5BF5TvIxMlfFuUtAoC2cQl8f7UJBycaT6oP2pEQ6uYiwBiqts
 NxUgGRGbRNK9Nx9S+5QSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650222352; x=
 1650308752; bh=c3ellyitXC5eJ4VPyNOAR0lItYv5ITvqfPNlID1Mnes=; b=z
 KHF0X7inFuIAF//IRMYVnRhb9pY/DTKlN1qwgQllJKM2vGOOayY9zQGuV/IDOS91
 Wm3DczhB1fqnwIiVtGnCCqi6mrdDbqahLtiJH5gYz4JboYaqfRmEJmk5qstLB/fF
 HmpxNLm2LVCAWdpJUlsRjHJu7D3tA4j1Ai0cKNDIkwFpHeooOa3/13KEXJ2Q6Ew/
 TVBpVio0pkwRYQhMjfLfltKZt6nKFLqksJjUY8gZ003K7Un+qQ1sGcoShi8fNKSZ
 j9AEukyCmBaSHfca0fsOkxP4wq4LfaAkds80xu00RfHCz0xgm582n9rxtC3BF2pV
 7N2zEPZGzR/d60P16lpYQ==
X-ME-Sender: <xms:D2VcYvaIkmcCk9AbSuLzGqV-LBSVl5Hftgrh0FcpNU8NbX6sSELMLQ>
 <xme:D2VcYuZwL5_HXWOFL-x1IvK1cQKG4qa4ALUV1lTwZ-onH7KfYFW7rdCLLsiWWNwAB
 I-qdjfux7mFV2Oq99k>
X-ME-Received: <xmr:D2VcYh8OCubDKgdhyjaqi-5YB2FvyrbIf4MqYjIowyf1Oh8pP4TWMFHUhiy_HME94bEkeMHHgnqL5jngfcRUApwrCvuOmXQ9Kr_JoGzeQMzDURcsyiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudelledgudefhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfvfhfhufgjtgesghdtreertdefjeenucfhrhhomheptegrrhho
 nhculfhonhgvshcuoehmvgesrggrrhhonhhmughjohhnvghsrdhnvghtqeenucggtffrrg
 htthgvrhhnpeeitdeltdfghefhhfffieejvefhheelkedvgeevjeelheetgeeftddvueef
 leffveenucffohhmrghinhepfihirhgvghhurghrugdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvgesrggrrhhonhhmughjohhn
 vghsrdhnvght
X-ME-Proxy: <xmx:D2VcYlpJbyYNVTuXdu04nGLaymjjzTnVhIEpOek8TWTh-vZtK90EIg>
 <xmx:D2VcYqrbhEAaxR-x0JDlBp6cug62HG8RKDPSDS2fEJQC7qL0jrS9kg>
 <xmx:D2VcYrTfikOGbqzpsKRI6huFiye2S0kRl_f5kSU2HS393e4FzDHn4w>
 <xmx:EGVcYhQw2Vn-zKnYnUQgkB5efkD8YsTmwerJUZ90LDC8qnstBywgvg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Apr 2022 15:05:51 -0400 (EDT)
Message-ID: <c93e4542-d4d8-8cef-871a-0c3810d3242f@aaronmdjones.net>
Date: Sun, 17 Apr 2022 19:05:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: wireguard@lists.zx2c4.com
References: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>
Cc: Hendrik Friedel <hendrik@friedels.name>
From: Aaron Jones <me@aaronmdjones.net>
Subject: Re: Better Output
In-Reply-To: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MtCGBPBe00fOhARZB7C1PPOv"
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
--------------MtCGBPBe00fOhARZB7C1PPOv
Content-Type: multipart/mixed; boundary="------------9X6zXd2mfwMFCvsHIn2VcZ4D";
 protected-headers="v1"
From: Aaron Jones <me@aaronmdjones.net>
To: wireguard@lists.zx2c4.com
Cc: Hendrik Friedel <hendrik@friedels.name>
Message-ID: <c93e4542-d4d8-8cef-871a-0c3810d3242f@aaronmdjones.net>
Subject: Re: Better Output
References: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>
In-Reply-To: <em19dde1c0-bcda-4ad2-b3ce-d72fb64993e4@envy>

--------------9X6zXd2mfwMFCvsHIn2VcZ4D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTcvMDQvMjAyMiAwODoyMiwgSGVuZHJpayBGcmllZGVsIHdyb3RlOg0KID4gSSB3b3Vs
ZCBzdWdnZXN0IGFuIGltcHJvdmVtZW50IGhlcmU6DQogPg0KID4gMSkgSWYgbm8gU2VydmVy
IHJlc3BvbmRzIG9uIHRoZSBwYXJ0aWN1bGFyIGRvbWFpbi9JUCwNCiA+ICAgIHdpcmVndWFy
ZCBzaG91bGQgc2hvdyBhIG1lc3NhZ2UNCg0KVGhpcyB3b3VsZCBiZSB0ZWNobmljYWxseSBh
Y2hpZXZhYmxlLCBidXQgbm90ZSB0aGF0IFdpcmVHdWFyZA0KdXNlcyBVRFAsIHdoaWNoIGhh
cyBubyBjb25jZXB0IG9mICJjb25uZWN0aW9ucyIuIFNlZSBhbHNvDQpiZWxvdy4NCg0KID4g
MikgSWYgYSB3aXJlZ3VhcmQgc2VydmVyIHJlc3BvbmRzLCBidXQgdGhlIGtleSBpcyBub3Qg
dmFsaWQNCg0KV2lyZUd1YXJkIGRvZXMgbm90IHJlc3BvbmQgaWYgdGhlIGtleXMgYXJlIG5v
dCB2YWxpZC4gU2VlDQpzZWN0aW9uIDUuMSAoIlNpbGVuY2UgaXMgYSBWaXJ0dWUiKSBpbiB0
aGUgV2lyZUd1YXJkDQp3aGl0ZXBhcGVyIFsxXS4NCg0KID4gMykgSWYgdGhlIGNvbm5lY3Rp
b24gZmFpbHMsIHRoZSBXaW5kb3dzIENsaWVudCBzaG91bGQgc2hvdw0KID4gICAgYSBSRUQg
c3ltYm9sIHVuZGVyIHN0YXR1cy4NCg0KVGhpcyBjb3VsZCBvbmx5IGJlIGRldGVybWluZWQg
YnkgYSBwcmV2aW91c2x5LWluLXVzZSBzZXNzaW9uDQpoYXZpbmcgaGFkIG5vIHBhY2tldHMg
cmVjZWl2ZWQgZm9yIGdyZWF0ZXIgdGhhbiB0aGUgbWF4aW11bQ0KcmVrZXkgaW50ZXJ2YWwg
KDIgbWludXRlcykuDQoNCkhvd2V2ZXIsIFdpcmVHdWFyZCBpdHNlbGYgd2lsbCBub3Qgc2Vu
ZCBhbnkgZGF0YSBpZiBpdCBoYXMgbm8NCmRhdGEgdG8gc2VuZCAoc2FtZSBzZWN0aW9uIG9m
IHRoZSB3aGl0ZXBhcGVyKSwgYW5kIHNvIGlmIHlvdQ0KYXJlIG5vdCB1c2luZyB0aGUgdHVu
bmVsIGZvciAyIG1pbnV0ZXMsIHRoaXMgd291bGQgYmUNCmluZGlzdGluZ3Vpc2hhYmxlIGZy
b20gYSBmYWlsZWQgdHVubmVsLg0KDQpBbiBleGNlcHRpb24gaXMgaWYgeW91IGVuYWJsZSBr
ZWVwYWxpdmVzOyB0aGV5IGFyZSAwLWxlbmd0aA0KZGF0YSBwYWNrZXRzLg0KDQpbMV0gaHR0
cHM6Ly93d3cud2lyZWd1YXJkLmNvbS9wYXBlcnMvd2lyZWd1YXJkLnBkZg0KDQpSZWdhcmRz
LA0KQWFyb24gSm9uZXMNCg0K

--------------9X6zXd2mfwMFCvsHIn2VcZ4D--

--------------MtCGBPBe00fOhARZB7C1PPOv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEUh8K0NtYMbn+mJWCVjfoBb/oPSQFAmJcZQcACgkQVjfoBb/o
PSSjIg//Y07YY9M1QAIq4Kr+BI9LBZ/6EEDgVlok7UYfviOXZAZf3e6XV7Qfq5yv
TppcB8iA0c1y+WSedMtHsBRzqWrvw2Xt5fkSsaO+y4OTjgNx+VNnQt767b3TMfoa
Y73/9z8iiu3JpKs+z+MIDJmAZkBxZ2Vi2etn/d0wPREYN6p7S8AyPNgUJmwAIS2r
c+FIPuFhtZZVqKSgbDE4cen83jkyaLXUh7a0JVWAi3ya/qaFl4JZMOG9FurNMlEm
f7w79I4kEXYSJc6+h4fQVBYUopwH807GmRV1LdK+dG82pfyni8uVB5xG06kIgYVh
m1foXbh0ygQdnWtKhIoPtwYAxpcD0sLtTzQffnp1++Ox3+1J5UpzBt2F7yVs62xv
aYJsEXLBYo/dmnZo3fqy389v7HDT7xsvJs2++TJigH2QMYwQQLIy1aktfjLc7v9B
bqborudzCe0s52S2YxSxjjRNVI28GBS0koEnoUoNhTg/yCsXlswZme3x+Boso9Cj
cvXd3xDxfCux7ZkvhIzRDEvm3gGT/8zELSwBLZe9sGt46yYLoZ/dttHU6Xg+izhl
sL0u5lxFI2lX9ph3xnNlOJVcy8/MEHdkODz29IRzcSkpJ1V79HOaFg9VTZVBwVJH
AF9EWK3s0RDAu2M2oWucIRSntC1FDEUNXtPXKB3x1YyutfrL7aY=
=95Fe
-----END PGP SIGNATURE-----

--------------MtCGBPBe00fOhARZB7C1PPOv--
