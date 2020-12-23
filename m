Return-Path: <SRS0=UpYJ=F3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B18C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 13:56:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E57AC22C9F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 23 Dec 2020 13:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57AC22C9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=urlichs.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 16bfbe8a;
	Wed, 23 Dec 2020 13:47:01 +0000 (UTC)
Received: from netz.smurf.noris.de (dispatch.smurf.noris.de
 [2001:780:107:b::b])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 35c30f32
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 23 Dec 2020 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=urlichs.de; 
 s=20160512;
 h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
 From:References:To:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7/HQhWFgOQwROx17HfeSuwGR2h4ifl+QijfjYQUEjQs=; b=wk0TBr8Xp0P8pY91xgRw29N6xN
 b1+c09epTrT0vp4EJHFfxRdxSZhnpq6P3FlPIdPQmS/AArfdPAVyVmBTwJzpEaMU6f0q+HXrKG1wn
 cmov8gKSuXKE9OZJSn9ncxKuOEVaq4cUbLrkc0FaP8BLX64Dzi2ufjViI92WdixNLzUdD5NZQoTXm
 wgwsXnyJUobyc9iSN5eGkQPA2OxDOM/vRnhEB6nQ1qJ+Si2Y82aZYyjHSknpDjEVpl4XwB2ZYV0gU
 zI/axyAW4r53KAZwKUvPgaFpW2CmLlI0xK+MHwrqe2aCUeKzKbKubw91jGWEos4Nt9Z3750ZREJDM
 7XgEBGLPsvLLaVevPgEySvBlDbn8QDbVrXSiILu1Xa73GxvkHHbAuHgjV5Ctot/er3mfz+EHFlhRS
 FRSDg+uyecjXOmiIjEycfpbDATR3W2TYPd7FLnwcxsT2FGZw9H4tAsNMyb/b8vKesMiW795sYmoyn
 JJ1XOzHRJ3vEyBLeiISLe3KlN/mIcjxWxZxDJhhuv54krgPWfVbdDdC2IoqyyEUJXvH2pcxvHcGZI
 61D/xWEwDnypE/w1RVDltMmqmfEmDNtvbAkFtoSbkUjsOCSCh/swlDgYrT+D9XxYR9iaqT1C/Og1G
 qGVUaGYYC0XtB4mme1VJy+FikqjbHoABN0G3kJYAk=;
Received: from asi.s.smurf.noris.de ([2001:780:107:200::a])
 by mail.vm.smurf.noris.de with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <matthias@urlichs.de>) id 1ks4cF-000KfC-Fq
 for wireguard@lists.zx2c4.com; Wed, 23 Dec 2020 14:55:47 +0100
To: wireguard@lists.zx2c4.com
References: <20201220192149.bojbghrxm6g3yq7q@p51>
From: Matthias Urlichs <matthias@urlichs.de>
Subject: Re: wg trunk (TM) traffic isolation: VRF vs netns
Message-ID: <64d48aca-7de5-e303-fbd3-c91707920c83@urlichs.de>
Date: Wed, 23 Dec 2020 14:55:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201220192149.bojbghrxm6g3yq7q@p51>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ejcbZ3pzTGIVKtn8eOvmW0DrTtNM353Gq"
X-Smurf-Spam-Score: 0.0 (/)
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
--ejcbZ3pzTGIVKtn8eOvmW0DrTtNM353Gq
Content-Type: multipart/mixed; boundary="NzAXP1RkD64NqfK1kZScNlchUqkMejEXR";
 protected-headers="v1"
From: Matthias Urlichs <matthias@urlichs.de>
To: wireguard@lists.zx2c4.com
Message-ID: <64d48aca-7de5-e303-fbd3-c91707920c83@urlichs.de>
Subject: Re: wg trunk (TM) traffic isolation: VRF vs netns
References: <20201220192149.bojbghrxm6g3yq7q@p51>
In-Reply-To: <20201220192149.bojbghrxm6g3yq7q@p51>

--NzAXP1RkD64NqfK1kZScNlchUqkMejEXR
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: de-DE

Hello,
> thoughts?
>
> - jrun

When in doubt, do both.

I am running my home router as a couple of netns domains on one of the=20
less-overworked servers in the basement, facilitated by a couple of=20
"dumb" scripts that set it all up.

My setup: create a netns instance, move the machine's main interface=20
into it, setup VLANs and bridges in there, and then add a veth interface =

to one of the bridges whose other end is moved back to the root namespace=
=2E

Bonus points, the router instance doesn't have any services (thus only=20
needs FORWARD firewall rules) and can run on basically any local system=20
with enough bandwidth. Just add VLANs to its interface on the switch.

Within that router netns I have separate VRFs for "sensitive" and=20
"guest" traffic, mainly to simplify firewall rules and routing tables.

--=20
-- Matthias Urlichs



--NzAXP1RkD64NqfK1kZScNlchUqkMejEXR--

--ejcbZ3pzTGIVKtn8eOvmW0DrTtNM353Gq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENzGcEL8EYxehRDgJ+GyybHbBwWUFAl/jTGIFAwAAAAAACgkQ+GyybHbBwWXp
sxAAhkb0Thg+wPxB2vWP9MveYQXeBwJ0ZMS7qXf3iPqReihm+GyE0OM2EbAemKZaqBaFzY3zFGse
kB9eEH5F6hk7hsBdIK0Cn2mI9A8GCGtmQXsU95D6GBt6Fq/911lp6xJW0zbs6HdxjMQ7GFn93qaE
DZ5RozdEkE2O0h1DvSZ8o0LeJT2vW9FAV/tkfGLjyMBNfeeji1tUaOHbv8ZPy0raLsuTuyHccppS
AEwGeeoUH3cEN2vN38Bj3+gcwnSx111WR1mPYZHFGrzQ0maB3nxarEQtjFRSeN2LKlgroaJQIWlF
rx53gZ86gVTveThFB13I5wq1PJhpeTFDBopGe83t3nHQnF1wT0IavB0p2Yp+8SN7QZnObuqpX22B
ENO3gaFHXjgxWcnzi7C98mUv+YT4CjX2c5RWp2ST2vYEEh04NTZZ713eQY7/h5X5EIv/7YH66T66
0r/fNMUzNoT8qUsa2/jYCHUkTUxWO1DUyfye5i0rdTsRbYqfTCDn8TSZ+Y9psLTCwucPMVWHzuLB
Op3gprirhh8BL5e7QvywBjkdAGtyEmyzGkDunPfC9upjl2MyCxnpyk+wPAMjPyaiTNVhiMHsSIqu
aW1WrVuoxQue53I7FnT4nG81xfI3T4u9v8XQC0LFjjrPYuHAX4YMhNgFN6EwgL10AbDk4n0J/YHm
73g=
=BGJp
-----END PGP SIGNATURE-----

--ejcbZ3pzTGIVKtn8eOvmW0DrTtNM353Gq--
