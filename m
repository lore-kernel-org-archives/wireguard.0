Return-Path: <SRS0=NO40=ZW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034F6C432C0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Nov 2019 07:33:47 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D66D2075C
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 30 Nov 2019 07:33:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D66D2075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52df2cb4;
	Sat, 30 Nov 2019 07:33:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6b0cf531
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Nov 2019 07:33:42 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5db002b
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Nov 2019 07:33:42 +0000 (UTC)
Received: from natsu (natsu.40.romanrm.net
 [IPv6:fd39:aa:c499:6515:e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 0B6CC41100;
 Sat, 30 Nov 2019 07:33:39 +0000 (UTC)
Date: Sat, 30 Nov 2019 12:33:39 +0500
From: Roman Mamedov <rm@romanrm.net>
To: zrm <zrm@trustiosity.com>
Subject: Re: idle traffic considerations
Message-ID: <20191130123339.255a3424@natsu>
In-Reply-To: <86ffb110-50f2-de38-ec25-698b0232b09b@trustiosity.com>
References: <48f2826293c5cf93d123d8789b6afc15@ethergeist.de>
 <86ffb110-50f2-de38-ec25-698b0232b09b@trustiosity.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, 29 Nov 2019 16:18:52 -0500
zrm <zrm@trustiosity.com> wrote:

> Ballpark estimate, round a keepalive packet to about a hundred bytes. 
> You're also going to get a re-keys, call those two hundred bytes. If you 
> have a keepalive every 30 seconds and a re-key every 120 seconds, that's 
> around 18KB per hour per peer in each direction.

And read the small-print of mobile carrier plans, at least in our country[1]
they love so much to tally-up the user transferred data every hour, while also
rounding that up to nearest 250 KB, or even 1 MB. So even in the above
scenario they would bill for at least 250 KB/hour.

[1] http://tyumen.megafon.ru/tariffs/all/megafon-online.html

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
