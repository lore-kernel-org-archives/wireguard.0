Return-Path: <SRS0=7eHk=2Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TRACKER_ID autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB5E8C2D0DA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 13:11:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8698A2075E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 Dec 2019 13:11:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="sMwP2KdX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8698A2075E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25e04e8a;
	Thu, 26 Dec 2019 13:11:20 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91671ffa
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 13:11:18 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 015a3ecb
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 13:11:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6941b24a
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=z3sW1UYAivxkdhkDIzUrArMC1t8=; b=sMwP2K
 dXp/qf5ssyRrrW+FV3XRloG2zYCl9cdylIoBktrscs8pqUdYRAPJ15RqcT0FQS17
 Xzu9Pxjyk4j64s4N0o1RjjOEQN1F0JwIGdep0h/ov47+cCibu3UrIwLER3qwYLtA
 WKI03aQeNZwptjclkb5m5Scv5HPENB3BhcS6uZqOKQ6LaPHjt5rQRmqAZu/p79i4
 48v5jA9FrwFskh9T8FkiFKXPQssLr3Rm7LdNRiyhd21xTPNfJPbhRzh2tXicOJIL
 C9Rm+aiBvLsgsIq9yBO4dDtADZoUI1ODHzgSsy9u8rSJ1Vh7Z3z67DfY6fysf+4j
 Qc9+lh69F+BVLVvA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c898798c
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 Dec 2019 12:13:42 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id k4so8449655oik.2
 for <wireguard@lists.zx2c4.com>; Thu, 26 Dec 2019 05:11:18 -0800 (PST)
X-Gm-Message-State: APjAAAVA+1p/VXl0qRws8yWedrOA6llTcHWrkg+GqsGA+yHZi0w+4kF2
 2Z2CXxbXwRh8tTyteT5udHrn91jW+p9TrqLPpww=
X-Google-Smtp-Source: APXvYqzy4H9J0QEDYl+53NElFXpvYAM7MGVRgyho+pFfPZMsZPJwD5loJn5/XNyWj/WOtxmnyz/g/OWon02KIPw5S3g=
X-Received: by 2002:aca:2109:: with SMTP id 9mr1711623oiz.119.1577365877362;
 Thu, 26 Dec 2019 05:11:17 -0800 (PST)
MIME-Version: 1.0
References: <fa05a96d8708b837@frisell.zx2c4.com>
In-Reply-To: <fa05a96d8708b837@frisell.zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 26 Dec 2019 14:11:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9oUhv4D-567aFP2v-eoeRGfrApbTkTKNe8m8owoTyVS9Q@mail.gmail.com>
Message-ID: <CAHmME9oUhv4D-567aFP2v-eoeRGfrApbTkTKNe8m8owoTyVS9Q@mail.gmail.com>
Subject: Re: [ANNOUNCE] wireguard-tools v1.0.20191226 released
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

That sha2 hash was wrong. The correct one is:

aa8af0fdc9872d369d8c890a84dbc2a2466b55795dccd5b47721b2d97644b04f



-----BEGIN PGP SIGNATURE-----

iQJEBAEBCAAuFiEEq5lC5tSkz8NBJiCnSfxwEqXeA64FAl4EsWEQHGphc29uQHp4
MmM0LmNvbQAKCRBJ/HASpd4Dri50D/9/etliazw92H7HNlAYyWAcnM8W+6itkiuU
5PjRPfxcNOFeHMP+xV0dwuOPED5fxCygOv8PJqR1ABleKM+SzInteLOHGEmCj59Z
r100IKlxzvBeTB8RVsCTSaN0mtP5ySTynt8DEv7sMXypQQZsFiLDshu24vilSW8G
B2X16orWX+986x2XPE6j75IH6Hu71YBN3m2lo+7b+Ki8IArYYctY6TywyPQ4IDh5
qC1K7uhnuOBozS3m8AbRmArf08xHe5Xvon8F144KEZCVji/wCfPdUPiqAtkKHKz/
QvwEA3UALtswV/CmhH8lD3vmTFqTrK6W0EdOBdq0URNBQZJRwfKSn6Hbw4caNusB
SS4ja7I3DBmRiR6JcXN8OdSDsowF5yF4C1VKjUkQuaRVdtGuE3uIpg8/b53U2yro
JD80+NdDdDh0r0F0UP/7IP+hjRg0BTyLosPFL5oKA5xULpbsMWCFaHzzTnAaiqgF
GAWPZBtUuoQbjCXCArLWOz/tBlsW9P001hsocOEcxwpXTH2JhL3DftWqOK1x0oO6
2AAXGKibqutdBOm3TGOBxMqDa9rVdXvYDZFe8GuWX4OQXZhLPXB/g1wSrJBoFhT0
lFpvlSS3YE6QrKAtv9UHO0+9QfipaG7feTdlTRWpCSF6D8Cd1eMNikEbtJDEPJd+
gbY9KJHzfg==
=O+lX
-----END PGP SIGNATURE-----
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
