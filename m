Return-Path: <SRS0=IBFn=JW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73BAC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 14:07:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A029961364
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 14:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A029961364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 55cb269d;
	Sun, 25 Apr 2021 14:07:34 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d19171c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Apr 2021 14:07:32 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 42443678;
 Sun, 25 Apr 2021 14:07:31 +0000 (UTC)
Date: Sun, 25 Apr 2021 19:07:31 +0500
From: Roman Mamedov <rm@romanrm.net>
To: lejeczek <peljasz@yahoo.co.uk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: wgX iface as slave to a bridge - Linux
Message-ID: <20210425190731.5625f0ab@natsu>
In-Reply-To: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574.ref@yahoo.co.uk>
 <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
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

On Sat, 24 Apr 2021 11:11:50 +0100
lejeczek <peljasz@yahoo.co.uk> wrote:

> Hi guys.
> 
> Apologies, I'll bother you guys as I failed to find some 
> better places to ask, I searched for forums etc. but failed.
> 
> Can wiregurard ifaces be enslaved by LInux bridge? I tried 
> but it did not work for me. Similarly "mavclan" - 
> would/should wireguard work that way?
> What I've tried and failed was on CentOS stream with 
> 4.18.0-294.el8.x86_64.

As others have replied, it is an L3 interface, not L2 which can join bridges.
One solution that many use is to run an L2 tunnel over WireGuard, such as
VXLAN or GRETAP. But then you lose even more MTU compared to the standard 1500.

-- 
With respect,
Roman
