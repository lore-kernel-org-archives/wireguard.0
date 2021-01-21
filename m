Return-Path: <SRS0=6TfW=GY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FC1C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 14:07:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63EB8239A4
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Jan 2021 14:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63EB8239A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ae93473;
	Thu, 21 Jan 2021 14:07:21 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 32b5e7b4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Jan 2021 14:07:19 +0000 (UTC)
Received: from natsu (unknown [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 888B2385;
 Thu, 21 Jan 2021 14:07:18 +0000 (UTC)
Date: Thu, 21 Jan 2021 19:07:18 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Harald Dunkel <harri@afaics.de>
Cc: wireguard@lists.zx2c4.com
Subject: Re: mtu on Linux vs MacOS
Message-ID: <20210121190718.13465dea@natsu>
In-Reply-To: <eadf405d-1039-06e7-744a-d2207ded2150@afaics.de>
References: <eadf405d-1039-06e7-744a-d2207ded2150@afaics.de>
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

On Sun, 17 Jan 2021 11:36:42 +0100
Harald Dunkel <harri@afaics.de> wrote:

> Hi folks,
> 
> I am using PPPoE to connect to my IP provider. To use wireguard on Linux I
> have to reduce the MTU in wg0.conf to 1400. Using the default 1420 a ssh
> connection tunneled through wireguard gets stuck (reproducible). An echo
> of a very long line (e.g. 4096 chars) is sufficient.
> 
> The weird part is, MTU 1420 works fine for wireguard on MacOS. How comes
> that Wireguard appears to be more stable on MacOS than on Linux?

WireGuard works just fine for me on Linux using MTU 1432 if over IPv4, and
1412 if over IPv6. The underlying PPPoE device MTU is 1492 in my case. Check
which PPPoE MTU you use in Linux vs in MacOS.

-- 
With respect,
Roman
