Return-Path: <SRS0=qOIe=3S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBBB2C33C9E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 00:39:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2052467E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 29 Jan 2020 00:39:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mjr.org header.i=@mjr.org header.b="VNQBAtZv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2052467E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mjr.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96f715ca;
	Wed, 29 Jan 2020 00:39:14 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f47c075
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 00:39:12 +0000 (UTC)
Received: from mail.mjr.org (tramp.mjr.org [212.13.216.229])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db7647bf
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Jan 2020 00:39:12 +0000 (UTC)
X-Virus-Scanned: Yes
Message-ID: <f2a81beb89f7d948b569ccde3b16262c12a0fbb0.camel@mjr.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mjr.org; s=mail;
 t=1580258350; bh=4A0t59IG+kuwJwadac2sy67EvK0qH9SYY1TcX+JdBZg=;
 h=Subject:From:To:In-Reply-To:References;
 b=VNQBAtZvVk6n34/j3sd/x3UKWo9I9FZDsUQYYmnX+8t/9FNneMIEkbGwhs9M8oIR6
 vmw73uV/HwYL39kMTD2Euy6V5yc7X7UYhPV6eLnCiH2qKR5BYrxWDCcztQS0OY1pHm
 AttXcaIow7RaUFpb32LY1Qkc1+jSIUt/NKuNcG+vYNk76WIEyYzYkaokJivH4QW2JB
 qSF2WOpO9rnGQCZ7EZencpVuISBy53/Jz28W4oP9vrxxYkkEb53vx1SXVuy8Hz2c4Z
 ejlK/vdY7i1wR9T5X0wzCQQGhwfC3tdnP8kbev7wEGk4uqGvkri4SKW2WHs2NCQUma
 6UTWgP9O2FR0g==
Subject: Re: Wireguard is now in Linus' tree
From: Paul Hedderly <paul@mjr.org>
To: Bruno Wolff III <bruno@wolff.to>, wireguard@lists.zx2c4.com
Date: Wed, 29 Jan 2020 00:39:10 +0000
In-Reply-To: <20200129002159.GA9104@wolff.to>
References: <20200129002159.GA9104@wolff.to>
Mime-Version: 1.0
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

On Tue, 2020-01-28 at 18:21 -0600, Bruno Wolff III wrote:
> Linus pulled in net-next about a half hour ago. So WireGuard is now 
> officially upstream. Yeah!

Brilliant news - congratulations guys.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
