Return-Path: <SRS0=A7sd=BE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E60DC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jul 2020 12:16:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7C920674
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Jul 2020 12:16:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7C920674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fud.no
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2cec11c4;
	Sat, 25 Jul 2020 11:53:26 +0000 (UTC)
Received: from mail.fud.no (mail.fud.no [2a02:c0:2f0:de01:f816:3eff:fede:dc6a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ea9fc71
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Jul 2020 11:53:24 +0000 (UTC)
Received: from [2a02:c0:2:7::1] (port=51092 helo=sloth.fud.no)
 by mail.fud.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tore@fud.no>)
 id 1jzJ6F-0006EO-Ux; Sat, 25 Jul 2020 14:16:24 +0200
Message-ID: <84986996953761e9d645b7ef583d3ffca689dfc5.camel@fud.no>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
From: Tore Anderson <tore@fud.no>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Tomcsanyi, Domonkos"
 <domi@tomcsanyi.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Date: Sat, 25 Jul 2020 14:16:23 +0200
In-Reply-To: <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
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

> This actually doesn't seem too bad to me. Are there cleaner solutions
> that I'm not thinking of that I should consider before applying this
> patch?

I have no idea why my solution keeps being ignored (even after two
gentle reminders), but perhaps third time's the charm?

In any case, to quote myself from 
https://lists.zx2c4.com/pipermail/wireguard/2020-June/005585.html :

«For what it is worth, I posted a patch that does exactly this back in
March:

https://lists.zx2c4.com/pipermail/wireguard/2020-March/005222.html

Reviews or user tests would be greatly appreciated.

You can also pull from https://github.com/toreanderson/wireguard-tools
if you prefer. The commit in question is here:

https://github.com/toreanderson/wireguard-tools/commit/8305a267ec4259206c0de7f1d3f9cfb8522a3223

There is one bugfix in GitHub compared to the patch I posted to the
list in March - using $REAL_INTERFACE instead of $INTERFACE in wg-
quick/openbsd.bash. I can post the updated patch to the list as well if
you want, just let me know.»

Tore

