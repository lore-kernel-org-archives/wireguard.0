Return-Path: <SRS0=tjuz=QY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244C9C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 10:54:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5587321A4A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Feb 2019 10:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5587321A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 12c44cf7;
	Sun, 17 Feb 2019 10:45:56 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d13a6dcc
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 10:45:55 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [IPv6:2001:41d0:1:8055::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 720cbb32
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Feb 2019 10:45:55 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 0D58E203F0;
 Sun, 17 Feb 2019 10:54:08 +0000 (UTC)
Date: Sun, 17 Feb 2019 15:54:08 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Lee Yates <rainmakerraw@icloud.com>
Subject: Re: Logical cores / SMT with WireGuard
Message-ID: <20190217155408.3c6b8590@natsu>
In-Reply-To: <735c8b20-c92b-2403-1557-32187b130a8f@icloud.com>
References: <735c8b20-c92b-2403-1557-32187b130a8f@icloud.com>
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

On Thu, 14 Feb 2019 18:02:26 +0000
Lee Yates <rainmakerraw@icloud.com> wrote:

> recommendations to disable HT, I got to wondering how much - if at all -
> disabling HT would impact on WireGuard's real world performance. I mean,
> it obviously can utilise logical cores/threads, but is there a real
> world throughput benefit vs just using the real cores?

This sounds like something YOU are in a great position to test, and then write
an interesting blog post or mailing list message summarising the results. :)

-- 
With respect,
Roman
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
