Return-Path: <SRS0=I5vT=PG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF26AC43387
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 12:17:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D300720857
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Dec 2018 12:17:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="bFrYRb38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D300720857
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce5b1cf3;
	Sat, 29 Dec 2018 12:15:15 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca3d5f57
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 12:15:12 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04a5d764
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Dec 2018 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=GYUdPRmK9pGVxcQg9b7+5fMjbXhf+tPVWqeLFQ0JSvw=; b=bFrYRb38isX6O8kB/bfjFmBX/S
 9iurptMB/LqFPlR+RUbOyujWSEuHTNYxsZt8LiKzQbu9MrwQHBp9LNCg/MtloxRf9n7xuPzqUTNES
 3ZrlTCU1oRBqoLfXqNAz4uCh5FE2vXMeCejQmhmOEckIjrNsi1PSx31OhebF/743Y2dHQGTW7/Dod
 aPeAEXtqtRdlSmqqnDN0p8z4DXt+Y+QRB3vRtEeWuWME7D/VgC6Wo58Jbdz4c055Lqeh0v9GxQYiC
 229s3xSslT2NftJzdbNiSgjug+G4hU5TJGizzTuGLXuegYe8GhAAXtniG7zTM8DxYmKHeBGy19SEL
 zJUfRStX3OQmrZd3/QgrGIOg20ILjjuWvs6GWuxn8FjF1wu2tWDmfRTnIo/Of/sSXkTuPix5G8K9k
 onn1t+P1U8ZdnuwXhNjsO+df3na0lCdOg7ziP1xguhxWHbXv/yGWHD5+IOEJUOb5nI4Tnpc5NyFe6
 nFQPiCeYK2nptWp0ls2Ne6RA4m1d8bDpNB6O1lJREf6980vur8EaEbn4tTcjiEGdlP1Gofnnj4mvT
 wApjCt2yEft1wzhmFsxsrf3UcmmBzaqf7BHwI7rVoW3tK02mvde2OXR3QxSytK8fA/qojf+WpFI+u
 NYKSQtxjhRJ86OlfuRIqdrTEpb9Br4raZuox+I/p0=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gdDY5-00075E-69
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sat, 29 Dec 2018 13:17:02 +0100
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Android and Manjaro road warriors behind dynamic IP addresses/Carrier
 Grade NAT?
Message-ID: <52b0449f-930a-87b0-e3f2-42d3f251e9cf@bartschnet.de>
Date: Sat, 29 Dec 2018 13:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Language: de-DE
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

we have Android and Manjaro road warriors which are often behind internet sockets with dynamic IP addresses AND Carrier Grade NAT.

Does anyone know a trick how to initiate a direct Wireguard connection between to road warriors without knowing their endpoint IP addresses/ports?

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
