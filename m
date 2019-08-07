Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A999FC3A5A5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E826206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:34:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEuh4UVQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E826206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffbebcb5;
	Sun, 25 Aug 2019 15:31:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20012a2b
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 10:52:26 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 41c63c58
 for <wireguard@lists.zx2c4.com>; Wed, 7 Aug 2019 10:52:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p74so81311791wme.4
 for <wireguard@lists.zx2c4.com>; Wed, 07 Aug 2019 03:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=/eX/d/u/2OO2qiYPtqMmdWwoRbo0Ai3y2FzEZkuCR8Q=;
 b=GEuh4UVQRkEoctXC86HBAPAds71Uayj3wd4l4PfCPvMoNzKUjKnFMmiKnsIJc2+w+l
 QvSUqsFXadKcc0nBitin4qP+LXKCKaSf13N2M17L3J3AHnyZ9NqEn4r0s7w8a0/kPawa
 SSNFv6qFxiBc4aXis0QbK90sKCZQMx5fCTtZLxVnaxlmlP4kx6PCnZWuWTU6b3PbrrB4
 NFRsO3+bTQED84WTn8jyduTcvb3ztOnWkkSqzGEfY7wCYlqs3DyuzWpUVmarrVLNXRWX
 jcawsckL1DXWmQDr9E1Gj+aQt/ndGIdVVPPVQeYZYnt7FarCeQ4BsXsQwoF6jyiNmC7V
 dJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=/eX/d/u/2OO2qiYPtqMmdWwoRbo0Ai3y2FzEZkuCR8Q=;
 b=k+3BoyyMXNIyfhFfhtL88mQuKVA2GjGGmhWs32lMmXcpSqBR6+xAl8K04dUhkJhaU7
 azS61JJOTDvloG2Pv8WHr7Vc079F0NscStOrtgwnShtPfoO5mSdMLco2DJTLz/XJVkOy
 YlnmLoXo2cTfBWhu/lh5guqq/4Fd8t2bo1BmzpJmxmzhdsZLWrm7Z35xCMa18DK0RJOc
 BUeFsiMgF++33nxEKawxuhVQuMlD+1DQM1EijZTAAFxAJ7u8x1OAx1hmcjZOsCNJYLeV
 5pl8GzrT2GB9i34aelPHH9j7poCsWRJ+bfSHJrydoF7Bt/DWuTQu+SEahGW2/+wZ4Vjp
 Iv8w==
X-Gm-Message-State: APjAAAU+uJzD0O6tlm2WhuFelWeMn7p7/6jT8eBsbqKWfGG1Tk9PxdHP
 VIqFzhDau4WUQxHaHSiFGgc=
X-Google-Smtp-Source: APXvYqw09nEFA9VHzyMk1uxbVTFhFv1DW2y90/87RYttIjt8laDLphf23pkK0PXX86Dd2rtD06Ithg==
X-Received: by 2002:a1c:a7ca:: with SMTP id
 q193mr10768106wme.150.1565175144167; 
 Wed, 07 Aug 2019 03:52:24 -0700 (PDT)
Received: from valhalla.void.web.tr ([2a01:7e00:e000:295:dead:beef:cafe:babe])
 by smtp.gmail.com with ESMTPSA id
 2sm132357526wrn.29.2019.08.07.03.52.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 03:52:23 -0700 (PDT)
Message-ID: <6910a3cab7c5cdfe32de3b61095c7cc47e0702b2.camel@gmail.com>
Subject: Re: Wireguard command line tools for Android
From: =?UTF-8?Q?Ya=C4=9Fmur?= Oymak <yagmur.oymak@gmail.com>
To: boerner@t-online.de, wireguard@lists.zx2c4.com
Date: Wed, 07 Aug 2019 13:52:19 +0300
In-Reply-To: <5549622.se0SCevcK7@majestix.boerner.local>
References: <5549622.se0SCevcK7@majestix.boerner.local>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:31:49 +0200
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

On Sat, 2019-07-27 at 18:01 +0200, boerner@t-online.de wrote:
> My idea was to use Tasker to perform something like wg-quick up|down
> tun1 accordingly, but the Wireguard command line tools wg and wg-
> quick don't seem to be available (anymore). In older forum posts I've
> seen that you can install them from the app settings, but in my
> version (v0.0.20190708) this option is not available.
> 
> Does anybody know about another solution? Or, as a question to the
> developers, would it be a big deal to bring back the command line
> feature?

Hey,

The command line tools were not removed. If you are using the Go
userspace backend (the app will indicate this in settings, together
with the version information) they will not be available. The tools
control the kernel backend and require root access. Thus they are only
available if you are running a custom kernel with WireGuard support and
have root access.

--
Yagmur Oymak

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
