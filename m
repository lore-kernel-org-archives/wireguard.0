Return-Path: <SRS0=H2HX=T3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6401C04AB3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 May 2019 18:10:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1826320859
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 May 2019 18:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="oATHjLfU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1826320859
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a317eb2;
	Mon, 27 May 2019 18:10:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cf96ff01
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 May 2019 18:10:30 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a2f902cb
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 May 2019 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=42DUQz955W3UJ5HWut96LJTCd9xBlvz4yhOxSDJUJkQ=; b=oATHjLfUMy9+bNSI38wd6bYrX0
 96FOlPtvS9Qxxpt7QnyUutTekcARxekA1twZV8zNR6t+Jj4IxwoN+lfaeV4CaKV96ho1NBSdDa/s4
 S4sYLcF0s3xa+Bj4R+/p5+znDsOUloLzOf7uPRqtR6d5dVQ9c1lRLeE1pkQrRzgxq7u/MJ/Il/xI0
 +gNwvWsnec9RZWvumRvoKGRKx4XxT/j5juqdksg27YYUJaD1jSC5uVe+EtZg/+URnu/vYRmKTW+94
 RjnrmlHE5ZSS27ZMkI9xGOParlUSPag0iclJExUXLKzfeblImRmnKXv1Bfj3fT+JPZCmKInceM9K8
 3rJl8x26C0o3PWGJsNaoTVRoCQMu59rXFScyyGF21n1a0vebqU3lSFaYH+wq1lnSvKoN7rDt9ovTV
 bTTUUFDhCsra4y9tAfoMhZDBaJVT8ZnweXBskpHhE2gib3Xh/3MqlothYc7dVbcXnZ8qsyaJGdJO+
 oViZl4AIYrkoxVxwfrPe4G3KP7GSDCS7kmx7c6CIl0nuR99HV7Wli28/Lf9M/BldUoTfc1WSeN21U
 bP7n3L2B9JPya+CxvHIHfoNHFxjJAKgkQdWTJ6+uIjwr7lTQQfH8HpT/6kyzrs4WP9rChWNq8wWpm
 eEnVDeNQBWSRUpCST7tHmrdwgA07KKsykYFHJb46E=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1hVK4p-0008Ma-3i
 with ESMTPSA (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 for wireguard@lists.zx2c4.com; Mon, 27 May 2019 20:10:28 +0200
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: IPv6 endpoint AND IPv4 fallback endpoint in roadwarrior scenario?
Message-ID: <71fa7444-07f7-d7da-9a0b-895a27be18bd@bartschnet.de>
Date: Mon, 27 May 2019 20:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
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

Hi,

is it meanwhile possible to define an IPv6 endpoint AND and an IPv4 endpoint as fallback
in case a road warrior does not get IPv6 connectivity when switching internet sockets?

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
