Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544BAC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 12:17:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5535206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 12:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5535206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 62d8039f;
	Tue, 28 Jul 2020 11:53:59 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b6235819
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 11:53:57 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=50962 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1k0OXq-00064a-0t; Tue, 28 Jul 2020 14:17:22 +0200
Message-ID: <6c4eba00ca984fc4ff52c1f773ea10d2d0c9123e.camel@fud.no>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
From: Tore Anderson <tore@fud.no>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Date: Tue, 28 Jul 2020 14:17:21 +0200
In-Reply-To: <CAHmME9q2NFc9QbKW068jHc=o79m4N5pj6Xvjfw51VSfnsKU=3Q@mail.gmail.com>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
 <CAHmME9p+tVyEm_+ALbsCWhshrt5yR97enjBcuUdVhTAWTf-MwA@mail.gmail.com>
 <27652e0971672a8fab30f59ff053cf65feaa711f.camel@fud.no>
 <CAHmME9qGX58JXCiw=Mr9=4qw=+-91etz8not91oJek-8qGrQPw@mail.gmail.com>
 <48a85c212bffaf7004c4934b1da5c4b02674a54c.camel@fud.no>
 <CAHmME9q2NFc9QbKW068jHc=o79m4N5pj6Xvjfw51VSfnsKU=3Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 (3.36.4-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

* Jason A. Donenfeld

> By the way, I just made this change:
> https://git.zx2c4.com/wireguard-tools/commit/?id=37ed947239f4b3ef161c85428d9267eb23a69d69
> I had assumed it was syncconf all along, until I checked. That makes
> sense; Luis added `strip` before I added `syncconf`.

That is useful, thank you.

However, I believe this change invalidates the «note that the above
command will add and update peers but will not remove peers» caveat.

Tore

