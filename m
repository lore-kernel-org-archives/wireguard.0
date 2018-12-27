Return-Path: <SRS0=sk/S=PE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31103C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:27:48 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D309720879
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 27 Dec 2018 16:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="kEHDF47j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D309720879
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e98391e0;
	Thu, 27 Dec 2018 16:26:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1db6bf43
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:26:07 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5bb6f2ef
 for <wireguard@lists.zx2c4.com>;
 Thu, 27 Dec 2018 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=Content-Transfer-Encoding:MIME-Version:Date:
 Message-ID:Subject:From:To:content-disposition;
 bh=KcWMji0tyV27PnK9F/l9kNL5Vuvmkb915vGqCqZ0AtE=; b=kEHDF47j/aDROxinI+yFCjIZFC
 KBccowGPQBql9um0xx3u1eq3OQs+ppmemM1pijsxsX3vJHutcXabCwrRa87VUCx6MVgiL9P/8Orwf
 SNbie8mYQYti3hpLrJSRJbp0RtGa4CVTkmg0Oz3WDf5zj8OUotaPkqls3BaAf/hoFS6d4uaMXW5iv
 /ZgdnwJsNpvZrboHmHeHnTQieqKbrS477CeDyqRYWlSHja+SAA95EluOOW1HoOGK6L99Ee76bjhOr
 BBjo2IYaDINwsRan2oygRwm6hr8kzHuO0AbI0LNaxt4N3SjFvmqj88gzwY+2lJCKwC5p+H19dHGH4
 UdvAVEtSW3G5QPkfg+ncy5cQ0z09w1MBdQepzdYC6blQ/EgTUpM3XaEdUTP/m0wz0IQ2UPPn3q2jg
 x3hxctuXTMXSLl7tZqZZv4Dnje1O0c7pfkHZ0TfUiy/wxoyFURmH/IUOokq3FNE3h6ykk2gY9FOib
 1EVMOe8i/D1eSo0GnVthwOPjF3ZzSiwZMzTSj4LAVfYe/qTQ2mmtKQYIKz+htwoRGVZK46xky3qFP
 Rz4tTPsjucoLHbVuykcj4Gme6WGxGGSUB/L7c3fgaGv+1voZ2PnNLFUUjdblav8MlFZOxNYixhKSx
 8LHskUGf6MAv5HVOrBP4GopHwJBGQ2/PHvHWNWUzE=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1gcYVa-0003xt-I1
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Thu, 27 Dec 2018 17:27:43 +0100
To: wireguard@lists.zx2c4.com
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Subject: Behaviour of multiple Allowed-IPs 0.0.0.0/0 or ::0/0?
Message-ID: <443f1c88-5c11-36cb-859c-c7105d68cd19@bartschnet.de>
Date: Thu, 27 Dec 2018 17:27:41 +0100
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

how does Wireguard behave with multiple peers with Allowed-IPs 0.0.0.0/0 or ::0/0?

Regards,

Renne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
