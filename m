Return-Path: <SRS0=y9CJ=PH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33134C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 11:01:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BAB61154
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 19 Oct 2021 11:01:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56BAB61154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fala.red
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5704b022;
	Tue, 19 Oct 2021 11:01:36 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ededfa31
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 19 Oct 2021 11:01:34 +0000 (UTC)
Received: (Authenticated sender: faustin@fala.red)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 4676B1BF214
 for <wireguard@lists.zx2c4.com>; Tue, 19 Oct 2021 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fala.red; s=gm1;
 t=1634641294; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ld7zK/ZwmPLtoHsOCXqtjyjmx5Jf28RELn4Zc4PKBqw=;
 b=YNc7qJsVscBzT2A+fT8ZFi3kh+VDtSvAB8nIH7Dhdj0IdN6aWdYTaJVgRuwmYYhPs1bzDp
 pMNOge5Vrxnbqsh9xfMt+uOux0htjt7NPBwXGUoJ/Dc27XCFZLRG1IjNO02HJrjNhaBYwL
 KjOdBqwCZq1U/xCMLvLXUzCABoM+KY65odnMo7nsUkWN0+Fc7wb9BScwv7hQtC1SVITUj5
 Y03GeFpdYGGEVPoYpPXQ6ewU1o+6AjAALTBK92OX5v9EULUePMQe2fAB8iufFtghVKb2Cy
 BZ9ODLJWvIXuPwE9HH25GWed5h5ALmm5iDnxqmsIX7BiUVhqGV3iPFtgBMEOWw==
Date: Tue, 19 Oct 2021 13:01:33 +0200
From: Faustin Lammler <faustin@fala.red>
To: wireguard@lists.zx2c4.com
Subject: Re: Build wireguard-linux-compat on SLES15 (s390x)
Message-ID: <YW6ljZ3yvGsv9Njq@falared>
References: <YWFuczOf1dM3B4Pt@falared>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/rEq3N8brkzEBG4X"
Content-Disposition: inline
In-Reply-To: <YWFuczOf1dM3B4Pt@falared>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Reply-To: faustin@fala.red
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--/rEq3N8brkzEBG4X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi!

FYI,
I have managed to build wireguard by removing the #define.
https://git.zx2c4.com/wireguard-linux-compat/tree/src/compat/compat.h#n859

I am not a C dev, so I am not sure what the implications are but I
understand that it's a kind of debugging structure and it's also not
defined on CENTOS8 so, I guess it should be OK.

Cheers!

--
Faustin

--/rEq3N8brkzEBG4X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE9lK80RqoiXXwEEilOQovJ4MqXHkFAmFupY0ACgkQOQovJ4Mq
XHky+g/9Fwymtg0aoWYFVVaigCQO314C6QaDLab7ZuzgyEbWgwF6s0Wh08jSe8JJ
eAWgfg3TMr2ut31SRR4AEzhGOp+NKs8Dbl5octgTk9Pq2d6df++rrzzCnjtrCJN4
Code/ipWJ2cJ2N8S1+e+6iTglXPCXUY/1zKHlN/XXjiuhmtroaN1S0XiOKaGDanS
0ABDgd+BVVvwhlM/WiJ1kCzxgd8nj40Ea+21kBEGCB5keNBA198TZrJuQzxYM7RL
MU86AmK5dao98lxw9mo4quTPldAvy/6ykZIKqHn7M/JdFEz8XQayR4Y9AZpvRFjV
e5VcdDVYjI3AHyuBa+94vvJvSsQHWwrrdaQfwnTH1XQAvlVbDw6qT2zqj0ZmGsBt
BCOcCCWdvHqXkbal/B9wBM0NMhKZl9ON8/15v84YD6MCz1yZxn1sfC5qtWKw4rF8
+frNPhp9Jpv8UdcKrHW3l49eXlP4z14Wzcb8rcgodmDyQxka9b0R6Cc2pwTsq/iy
OgHOfjL7Bjxc9nPhQCcwltfuE/zGfBOIRGJ+V3kdn1V5Xk72fa4zmjsAMA6SNSAM
upmh8SuTt0XNMYEFGB8C1dYLQMw+efnFZ3mDrs1ECpL7Qcvt5dT713OG8+aeINNe
H43qsx71XfuBUYtjep7/IPrA4CQRRt5+lPVC9qXb181OgUGEYpU=
=lUr0
-----END PGP SIGNATURE-----

--/rEq3N8brkzEBG4X--
