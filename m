Return-Path: <SRS0=yrS1=SY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798E9C10F11
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 18:13:58 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0EB7214AE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Apr 2019 18:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfXl8rOu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0EB7214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a2378e6;
	Mon, 22 Apr 2019 18:13:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74b793c2
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 18:13:54 +0000 (UTC)
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d3e1507
 for <wireguard@lists.zx2c4.com>;
 Mon, 22 Apr 2019 18:13:54 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id y67so10168923ede.2
 for <wireguard@lists.zx2c4.com>; Mon, 22 Apr 2019 11:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=P5KxbyvhRlcvQ6agkDTbsCmRUMYyF3UgXqfnZiYdeVM=;
 b=LfXl8rOuQe/rJ2Y8Ryzf78SDLb9kQvOf4DZXkUQ/ovS8Yornhi7aw89iL9QmkNdBqe
 FZmR3nDunb+h++L/LFOrP7XoCXFgxZOST63hG9tdnfQpYoXBD6Sf9FaHelJCpfc/wK4K
 hr/GCu7jOk4vPnVj7pYTRvH6kKcpnGd97A1ErfrO/2UnLWKH3fg4wjW6HnDyOgMhaT0t
 fjuIaZQ73DA5W7IGE/F5fPKKPxw2enbWNMM2eKUVVFErzp22pQC39i4ZOqs38NyccMIq
 m6dWSipBSolqV6Ula3yEZ4q80G9ogra+76YxUJkE1XZDwuD7WOnkfrd/QxNP8kcR2dNU
 aW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=P5KxbyvhRlcvQ6agkDTbsCmRUMYyF3UgXqfnZiYdeVM=;
 b=AIwNLjgaaSNUBDnJv4etYVgISrBdBVkJRsMgxMMyvEhHFJeZ4F1mKPd17LerTLx0ms
 qvvm8IT4D/EynYm4h79Zot/BHoTVg8RwmXERy+usDvINe6/O5W7GTUu8X6DOt2RDdU5o
 4tlmI1DDtrGM1uLpJU5iWuj9WBTZ3PCD5ta3+RgCp2M0Zemt3zpb9GEN6aLwL3fNvCA/
 dtTORtcUS2x6OhOUbTfvmScTUoFcG2MXZb0qUGKXKRcqiqxRWijEcyKTj3XbRBWqbwn9
 dlSxX9bku33YWmGuPtR+nJ1P4pappxrwzyIfjmfkD1OCTXljlZt1bG/Nl53GBvSgIRr9
 6obg==
X-Gm-Message-State: APjAAAVT+zvqPP0EtATeTaW0K8hg5bN1eyYgd595GilCNN5xt3GJ+0JN
 NkKPB1f4W0CnQw6eRPYrGX0=
X-Google-Smtp-Source: APXvYqxTrOY8NDzVlSByQByK/OkUm0Nw365WEB65naQlCv4+yTZSbsv6Q9HNMS4luXBs6OfMUvyEqA==
X-Received: by 2002:a17:906:5587:: with SMTP id
 y7mr1909364ejp.112.1555956832859; 
 Mon, 22 Apr 2019 11:13:52 -0700 (PDT)
Received: from localhost (h082218221220.host.wavenet.at. [82.218.221.220])
 by smtp.gmail.com with ESMTPSA id l46sm3832641edb.24.2019.04.22.11.13.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Apr 2019 11:13:51 -0700 (PDT)
Date: Mon, 22 Apr 2019 20:13:50 +0200
From: Tharre <tharre3@gmail.com>
To: Matt Layher <mdlayher@gmail.com>
Subject: Re: Use of __kernel_timespec in userspace genetlink API
Message-ID: <20190422181350.GA26003@xultrabook>
References: <f87c87a0-c5b4-9ee8-ba28-9ff575987f72@gmail.com>
MIME-Version: 1.0
In-Reply-To: <f87c87a0-c5b4-9ee8-ba28-9ff575987f72@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2699082247515694877=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2699082247515694877==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04/18, Matt Layher wrote:
> My C experience is very limited, and I have no experience working on C
> within the kernel, but is exposing a "__kernel*" type to userspace a norm=
al
> procedure? I would have expected to see a regular timespec from
> linux/time.h, or perhaps a timespec64 in its place.

There is no timespec64 defined anywhere in include/linux, and it can't
be a normal timespec because of the Year 2038 problem. And despite it's
prefix, __kernel_timespec is defined in include/linux/time.h.

> I can do some slightly more intelligent checking to fix the current issue
> with my library, but I wanted to check in and confirm that this API contr=
act
> is correct.

The change from struct timespec to struct __kernel_timespec happened in
commit c870c7a[0] so I'm guessing it's intentional.

Hope that helps.

[0] http://git.zx2c4.com/WireGuard/commit/?id=3Dc870c7a

--=20
PGP fingerprint: 42CE 7698 D6A0 6129 AA16  EF5C 5431 BDE2 C8F0 B2F4

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEsuhqARgBY035sVClY1a5mXdUZMYFAly+BFwACgkQY1a5mXdU
ZMZnugf5AYx8aSyIlhQidmG/17lTG2Lz4D9fxTqZpRxntDeILMC46oog4fxS/nJo
ywwX2ov8yU7rnGgbITs9Jk4CpXsGaXhdWUBgE+GVu2/ecmQql+NpVoFGg9cb6zM+
hOYJebvbINWxrduZS9MsYEfiIZRJOVN8nJ5oqIcYj4BFs2t0ixcCHRurq2dhEp8S
Fo8MRGo/s9bW4aRAO13Vi/SzCV3M/oGn4d8Y+MdfPmiq5R0Qsapu0WlMSVeVmV1S
y0I9L8510mcuOArL4IMCHOgJwG1OnboB40I40WFo4u7rY3eahfJPAbTvcwTD/jY7
mWv3jjN0yM8bC5xVij27/Wc4PMN+RQ==
=GDwM
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--

--===============2699082247515694877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2699082247515694877==--
