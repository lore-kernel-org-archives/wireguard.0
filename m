Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62ECEC433EA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:46:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3C02065F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 14:46:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3C02065F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6eb7ab8;
	Fri, 24 Jul 2020 14:23:29 +0000 (UTC)
Received: from nautica.notk.org (ipv6.notk.org [2001:41d0:1:7a93::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b259800a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 14:23:27 +0000 (UTC)
Received: by nautica.notk.org (Postfix, from userid 1001)
 id EF8C8C009; Fri, 24 Jul 2020 16:46:20 +0200 (CEST)
Date: Fri, 24 Jul 2020 16:46:05 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: =?utf-8?B?VG9tY3PDoW55aSw=?= Domonkos <domi@tomcsanyi.net>,
 Garrit Franke <garritfranke@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
Message-ID: <20200724144605.GA1897@nautica>
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
 <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
 <20200724092536.m2bsg2cxo2ga6vwc@CKC-BS-N0240>
 <CAHmME9p=i5uPJH3KRisrW6ZojnukYrWS9rjh6mVVnu42i-0Tkw@mail.gmail.com>
 <CABZXeoBN-0fBVpXnu4=J-ovxxNCXV5FAQ4rGsuaTe2Jecf060g@mail.gmail.com>
 <CAHmME9qX9h9GKCEXfLiU4=AJ-v6CSWEFCcV5Xy54gBefXdy=Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9qX9h9GKCEXfLiU4=AJ-v6CSWEFCcV5Xy54gBefXdy=Vg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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

Jason A. Donenfeld wrote on Fri, Jul 24, 2020:
> Great, good to know. Made some small adjustments and committed this as:
> https://git.zx2c4.com/wireguard-tools/commit/?id=a66219fa107e1bf0a03ebbbc405879c1f0a826c5

diff --git a/src/systemd/wg-quick@.service
b/src/systemd/wg-quick@.service
index a9cbb58..dbdab44 100644
--- a/src/systemd/wg-quick@.service
+++ b/src/systemd/wg-quick@.service
@@ -15,6 +15,7 @@ Type=oneshot
 RemainAfterExit=yes
 ExecStart=/usr/bin/wg-quick up %i
 ExecStop=/usr/bin/wg-quick down %i
+ExecReload=/bin/bash -c 'exec /usr/bin/wg syncconf %i <(exec /usr/bin/wg-quick strip %i)'

FWIW, bash (and zsh, ksh etc) will optimise the last command call of a
script to not fork, `bash -c 'exec foo'`  is the same as `bash -c 'foo'`

(for some reason it doesn't in the subshell though so that one makes a
difference; you can check with e.g. `strace -f -e clone bash -c ...`)


Simpler shells e.g. dash or busybox ash don't, but they don't support
the pipe substitution syntax either so I guess it doesn't matter here.

-- 
Dominique
