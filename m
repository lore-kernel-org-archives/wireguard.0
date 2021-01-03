Return-Path: <SRS0=V5dh=GG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0A97C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 21:31:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F01DD20784
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  3 Jan 2021 21:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F01DD20784
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=53c70r.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af204714;
	Sun, 3 Jan 2021 21:20:43 +0000 (UTC)
Received: from 53c70r.de (53c70r.de [45.142.177.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6d97a589
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 3 Jan 2021 21:20:40 +0000 (UTC)
Subject: Re: Wireguard not available for CentOS Stream
DKIM-Filter: OpenDKIM Filter v2.11.0 53c70r.de 7A0F840E6120
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=53c70r.de;
 s=default; t=1609709485;
 bh=gfp0He5qGB6q2zmOnv2dM3bqQJ9Lpp3utNFeQCKF/DY=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=Xv3WWq3vHjPXQoZxDrq+KI13PUfWIMyAb+Y4/cpOo1aVPzNByf9QPu9RRTYfGtVu/
 U+uN273K7zjA0ntIazxjkxuc1wg5ro+xP3JSwoadvCoI1YibtEyNW62rSfiA8mnxCL
 NIymXprtmBMm0kvqkWMVtEgr+XO3VZ07sDhVieKU=
From: Silvan Nagl <mail@53c70r.de>
To: wireguard@lists.zx2c4.com
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
Message-ID: <4d3a7bcc-63ff-f901-a930-1289bb21736e@53c70r.de>
Date: Sun, 3 Jan 2021 22:31:24 +0100
In-Reply-To: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

My temporary solution is now to use kernel-ml.

On 1/3/21 9:17 PM, Silvan Nagl wrote:
> Hi,
>
> i noticed that no Wireguard installation source currently supports
> CentOS Stream and its newer Kernels.
> Will there be support for it?
>
> Greetings,
>
> Silvan
>
