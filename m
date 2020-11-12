Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A2AC2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 09:13:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75C9521534
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 09:13:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75C9521534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 190045fe;
	Thu, 12 Nov 2020 09:09:46 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0951491
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 09:09:43 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 8BDEE8BD;
 Thu, 12 Nov 2020 09:13:36 +0000 (UTC)
Date: Thu, 12 Nov 2020 14:13:36 +0500
From: Roman Mamedov <rm@romanrm.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Reiner Karlsberg <karlsberg@softart-ge.com>, WireGuard mailing list
 <wireguard@lists.zx2c4.com>
Subject: Re: Should we sunset Windows 7 support?
Message-ID: <20201112141336.29e5ca2e@natsu>
In-Reply-To: <CAHmME9oR=OD1Sib7hhriPOAXdL591BoQ=9v7LBE-hF3zYvVDtQ@mail.gmail.com>
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <65ad978d-61d8-59b5-3932-5c6be78ad92f@softart-ge.com>
 <CAHmME9oR=OD1Sib7hhriPOAXdL591BoQ=9v7LBE-hF3zYvVDtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 12 Nov 2020 09:34:43 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Could you let me know the rationale for your continued use of Windows
> 7? Is it economic? Is it just UI preference, and security isn't a
> priority to you? Something else?

For me, the UI preference absolutely; but security *is* certainly a priority,
which is exactly why I will not run Windows 10: 
https://www.networkworld.com/article/2956574/windows-10-privacy-spyware-settings-user-agreement.html
https://www.forbes.com/sites/gordonkelly/2015/11/02/microsoft-confirms-unstoppable-windows-10-tracking/
https://blog.emsisoft.com/en/18770/the-truth-about-windows-10-spying-on-almost-everything-you-do/

Don't want to wrestle with disabling all of that, to find out that the next
update rolled back my settings, and then added more spying that can't be
disabled this time.

-- 
With respect,
Roman
