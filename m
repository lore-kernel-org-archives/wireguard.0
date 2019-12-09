Return-Path: <SRS0=uCSF=Z7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40CFC00454
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:06:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528372073D
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  9 Dec 2019 16:06:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oern.de header.i=@oern.de header.b="xj3arx0V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528372073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oern.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 127ffb2d;
	Mon, 9 Dec 2019 16:05:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10dc11a9
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:33:34 +0000 (UTC)
Received: from mail.7lb.de (mail.7lb.de [194.32.77.195])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c12121ce
 for <wireguard@lists.zx2c4.com>; Mon, 9 Dec 2019 14:33:33 +0000 (UTC)
Subject: Re: Is this a concern
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oern.de; s=2018102513; 
 t=1575902012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ucOmr6YZongTwqVKjWYN2zLxYStAdsO4u7GJSwFosDk=;
 b=xj3arx0VYJY6IrsHnyfU4Og7SsHgMI8RBLYkbRY4P5ImzlUMTiKbrWb8CQQgAXV2TF+i1D
 ts2By/fNtM0UAxirho6jkDzlOmqdnYB4wMeTj1VTaQ+ec8iKfQZC4X2y1gGN9kPkmauxUv
 kaV6bQNUcIjzfLXFAp58GkmGEbEjpjlz3p6B/nAjUHwWglDNdRzi7hdr3lS+mCzlbUMPJz
 nmvsQLRcABqW0GwvTxxx3fXndwVSa2d7hYsDmxSZHUFSe30INUmDL2YksfceXLnenAG9L4
 cx/C93f6rMe+LaL5UHRC8TI3JBz0x7rya5F1akfrfTipKBXnhWbsQbdh4hgROg==
To: logcabin@fastmail.net, wireguard@lists.zx2c4.com
References: <c75aaac4-52bf-4759-aa0b-b67266af4361@www.fastmail.com>
From: =?UTF-8?Q?Bj=c3=b6rn_Fries?= <mail@oern.de>
Message-ID: <ad099d6a-831f-3995-b1a7-5d86ddfb6250@oern.de>
Date: Mon, 9 Dec 2019 15:33:11 +0100
MIME-Version: 1.0
In-Reply-To: <c75aaac4-52bf-4759-aa0b-b67266af4361@www.fastmail.com>
Content-Language: en-US
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=mail@oern.de smtp.mailfrom=mail@oern.de
X-Mailman-Approved-At: Mon, 09 Dec 2019 17:05:45 +0100
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

https://lore.kernel.org/wireguard/20191205191318.GA44156@zx2c4.com/

Am 09.12.19 um 15:25 schrieb logcabin@fastmail.net:
> Or could it be handled by pre-routing in wg-quick (if it isn't already):
> 
> https://lwn.net/Articles/806546/
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
