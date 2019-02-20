Return-Path: <SRS0=+Bco=Q3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF24C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Feb 2019 21:01:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EA642146E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Feb 2019 21:01:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=newmedia-net.de header.i=@newmedia-net.de header.b="gyZKFWw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EA642146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=newmedia-net.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b48ffc61;
	Wed, 20 Feb 2019 20:52:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c96032e
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 20:52:23 +0000 (UTC)
Received: from webmail.newmedia-net.de (smtps.newmedia-net.de
 [IPv6:2a05:a1c0:0:de::167])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c16e3768
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Feb 2019 20:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=newmedia-net.de; s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject;
 bh=jS8qzlPKg/mCY1L8BxmCIVs1pTEFI/Y+88u6rCvJoPI=; 
 b=gyZKFWw4+1MvI9ug/lYhG1Gi5JP9Ne3U/u/SsQNmhlmuMLJO4SRaFrku8Vek0+y5zJ31ty+HcRxW4rlxbXItFEbnS4Q5UHOtKGvLbTBmIHOljl9NefDvvq5pBDAobPvSKZvXuUb1cdGMPkFUctVC78cacnL7q9kRZSieX8S1StA=;
Subject: Re: iOS WG (1.0.3) - ARM64 SIMD ChaCha20
To: wireguard@lists.zx2c4.com
References: <A76D82AE-F12E-4E3E-906A-D34640E2DF4F@lonnie.abelbeck.com>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <db2ff044-47ab-6050-338c-d81fc0ed0c0e@newmedia-net.de>
Date: Wed, 20 Feb 2019 22:01:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <A76D82AE-F12E-4E3E-906A-D34640E2DF4F@lonnie.abelbeck.com>
X-Received: from [2003:c9:3f14:9100:3dbb:9551:4020:80ca]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@newmedia-net.de>)
 id 1gwYzL-00063o-Hv
 for wireguard@lists.zx2c4.com; Wed, 20 Feb 2019 22:01:07 +0100
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


Am 20.02.2019 um 16:03 schrieb Lonnie Abelbeck:
> Thanks to Jason and the team, a new iOS WG 1.0.3 appeared as an update:
>
> 1.0.3 / Feb 19, 2019
> --
> Performance should be higher and battery usage lower, thanks to a new ARM64 SIMD implementation of ChaCha20
> --
> For reference, the upstream golang crypto commit is here [1] with performance numbers.
>
> So, the question come to mind, do my iOS devices have ARM64 SIMD support, quick answer is if the device is less than 6 years old it should have ARM64 SIMD support.  Added in the A5/A6 CPU's from what I can tell.

A5 and A6 is 32 bit. A7 was the first 64 bit cpu (introduced with Iphone 5s)

Sebastian

>
> Apple-designed processors
> https://en.wikipedia.org/wiki/Apple-designed_processors
>
> Please correct my research if I over-simplified where the new ARM64 SIMD implementation of ChaCha20 is available for iOS WireGuard.
>
> Lonnie
>
> [1] chacha20: add SIMD implementation on arm64
> https://go.googlesource.com/crypto/+/74369b46fc6756741c016591724fd1cb8e26845f
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
