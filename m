Return-Path: <SRS0=8LYU=AY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE14C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 18:54:07 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE8E2067D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Jul 2020 18:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lindenberg.one header.i=@lindenberg.one header.b="OnUfnuNG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFE8E2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=lindenberg.one
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 546af6db;
	Mon, 13 Jul 2020 18:32:08 +0000 (UTC)
Received: from mailarchive.lindenberg.one (mailarchive.lindenberg.one
 [62.113.211.160])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f3a5281c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Jul 2020 18:32:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5CB32878D9
 for <wireguard@lists.zx2c4.com>; Mon, 13 Jul 2020 20:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lindenberg.one;
 s=dkim180429; t=1594666415;
 h=from:sender:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=LBVlUEYeUlg56uK/t3rCHzc2VC3OIycjUpJoWyIzvyU=;
 b=OnUfnuNGdec5YO41biXu9SrglmL2O6NkSPqTvIE0HTr7FNsoUFnMG5mLI6X3EKhBi2aGMb
 DQnbUmo1/32sKsYWTwnIJUbQOhPlc2jH70jnzygCeDfi9zDPZMcMyF8MA6hTufOb0A+MiX
 MCVJwHNANA8ii5dKX2/Z2e4pScmRthyT278VWHRpsA0DgUfOyL2pw/YdAKpRIpQQfCm5UJ
 vzYGf4fZGs8Dya1wZTbwgq2Il4rYTHRdVlg1VQQk4NqweULvxZCEGca9NDzHNP4hYkoFVn
 C6pVnNxjJq34d0RHTe1Uw5RsJvyZp3+C/sE0FeVNBe1Ptc2Xyr9pwBEMLJywsg==
From: <wireguard@lindenberg.one>
To: "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>
Subject: two client connections -> crash?
Date: Mon, 13 Jul 2020 20:53:35 +0200
Message-ID: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
MIME-Version: 1.0
Content-Type: text/plain; boundary="----=_NextPart_000_0899_01D65957.2E6E3690";
 charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Thread-Index: AQH0wPSGZbIWh7crz4igKWh9NP0dQg==
Content-Language: en-de
X-Last-TLS-Session-Version: TLSv1.2
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

I am trying to configure one client system (Ubuntu 18.04.4 LTS =
(GNU/Linux 5.3.0-62-generic x86_64)) against two servers. The =
configuration is very similar:

root@Mailcow:/home/joachim# cat /etc/wireguard/wg0-client.conf
[Interface]
Address =3D 10.200.200.2/24
PrivateKey =3D ***
DNS =3D 8.8.8.8 #10.200.200.1

[Peer]
PublicKey =3D qn6CTz578gbrYpzYkvV2okoqkIFHKye+mRj4i/I8Sz8=3D
Endpoint =3D fire.lindenberg.one:51820
AllowedIPs =3D 0.0.0.0/0
PersistentKeepalive =3D 21

root@Mailcow:/home/joachim# cat /etc/wireguard/wg1-client.conf
[Interface]
Address =3D 10.200.201.2/24
PrivateKey =3D ***
DNS =3D 8.8.8.8 #10.200.200.1

[Peer]
PublicKey =3D QAJANxtuAvdT+HR3fP1I2DXq0Azl0T3jF5s+cW7foSA=3D
Endpoint =3D nc.lindenberg.one:51820
AllowedIPs =3D 0.0.0.0/0
PersistentKeepalive =3D 21

Wg-quick up wg0-client ist at system startup. Now unfortunately when I =
do wg-quick up wg1-client the network stack kind of crashes. The command =
does not terminate, and connectivity on all interfaces is broken.
Is this a configuration issue? Should I change ports to be different? Is =
there some other issue?
Do I have to define two interfaces or could I have just one with =
multiple peers? But how could I then specify which tunnel to use?

Any suggestion welcome..
Thanks, Joachim



