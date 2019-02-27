Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2DDC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:25:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82E12070B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 18:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.com header.i=@mail.com header.b="vZCJdXj6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E82E12070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=post.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 809614bf;
	Thu, 28 Feb 2019 18:14:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9ad495cc
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 13:16:40 +0000 (UTC)
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b5493067
 for <wireguard@lists.zx2c4.com>;
 Wed, 27 Feb 2019 13:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1551273973;
 bh=u/+fLA/r1euA8hFI7sK3MQrGKY6fVYsewOlx1gVJ/WA=;
 h=X-UI-Sender-Class:To:From:Subject:Date;
 b=vZCJdXj6fBvA1MDM/atzMAucaTrra/qJ0q11vvtJ8nnTJpNsPreM3DzVVkvmEtCOC
 db+Eq8FxDa3vciFmTYsMOh7AoIqpdjqnXsXH+rxFGhlEkwJwud/m1RRVchz/RfhCKl
 E+V7IeU4QDDwPqlkBXQOOlexG/d3quK91YwO6L9g=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [10.10.21.41] ([193.180.164.58]) by mail.gmx.com (mrgmxus001
 [74.208.5.15]) with ESMTPSA (Nemesis) id 0Ld0wI-1hPHU51qFs-00iGPA for
 <wireguard@lists.zx2c4.com>; Wed, 27 Feb 2019 14:26:13 +0100
To: wireguard@lists.zx2c4.com
From: F <finalcountdown@post.com>
Subject: Openresolv package is a requirement and should be added to install
 docs
Message-ID: <304c3849-35d1-3312-1670-e7a8469a01fe@post.com>
Date: Wed, 27 Feb 2019 13:26:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:iuCjTMemWtjw5ThawLDICC9InV2RMrwrQ+ccEjLCUKrLPAmj88H
 V7TKLwRvAOMtUaY2kVp8ce3Hu5FqggZBjNWYEadVsLjlTk3UQ/HPmFXAx2b/chW1eHFVNVt
 FSZ3sCMaRrqLnSer6K1F4ldosneIjkhbjDIQ+gNQ04YVdG2bZvUCN69RFBn4Zz7cD1GigBY
 /XFzGbF6hX8nLgWY/7wkA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JVtrhE68S74=:4eD71GfphwzVfYI9m7/Bzp
 ZowEowfWbYNqi0o/yWX/VYnbDD78S2sHnaGkD3uX/jF04UaxlcWJALeuCLCbVK45jTNEz99bV
 W+7ZxDnvfgofqIUdwkiklklSMUUwhCwVh0TnQ41bwACZ8JIjY8TmLyjzgdFlpH8xOuvGcy/Fw
 rjCMDjUkHT94ZRwIYGQU1zPiSJ0L0Wu2iF6Mk9IBP7MWFSsErWRvUjzkEMhYYmGtwZ9extRfa
 IqOWtXuPIENXFtX2QCLKE1h2VL+9lYWIZK7A87ije1hSyrhmP1+ZUD2XSgaqcy0dIDc3aMr/Q
 NZHVRob51dZa9rOODZDvO5O8BaiZjLi+hyM+Fxgvw4AkeaVLrCosarixlieZrgGQvHLgPBB03
 PxFvPjv4DjcyKMtawz+cK2OW4xfixUR5HhDC2KcSdkBLr+EcwqQRvI3i7VO5+8VxjuO5/ivby
 0GlaGR8mcAYXm+RfBmaaD7ekPB+jlgT7gmXEu1D03moN5GFsPTZPbXEs3hTQHFNIDYY/2uRKH
 NO3h5r5tqLC0HUpLra7I0k/w3wTo42wQQBBLIivcZVJceqdYgDooGbA53NDDTBnnIvReH3mPS
 PU0vBYHP9o6hVW40e3rcM+Af5DlFzqwysISKFFho5eTp2qFlwZgAfcbVXoPyr9ZErwgEa/ouy
 LX+LQwDotK2d2MF7uuIJ5v1SAZd5efWXLsvz79V2kG+KdAyHn6FQxTHfjIK3qCupiZVV0W2iR
 xjkBajn9nrRNLFL2JP5wRaypN/hRSDEZx2QrcDhvZ1vSd3GeDZoPtw6dyjrYs5zmGM4hy6wCb
 Y6yh0QLSrFMwJAwOD6XNsniCq40E4h+J6CY+ITRdIdyA+m+KkaZMGgj3eE8YDiN7pLek5wpa/
 3BCbm2PUxY4wocqVdujrlsYrKiB+kxdUVmDq0AwyeZ1KwR4o5o+yZcib1UopLsC0QuqU4Y6UL
 lSx/P+AaNEA==
X-Mailman-Approved-At: Thu, 28 Feb 2019 19:14:53 +0100
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

Learnt how to get WG working here
https://github.com/StreisandEffect/streisand/issues/1434 and it
describes how the openresolv package is needed to get WG to connect
properly. This is not noted in the official WG docs and the average
person would have difficulty figuring out why wg-quick doesn't connect.

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
