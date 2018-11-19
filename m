Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BCDC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE39C20685
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 19 Nov 2018 19:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="kWxhj9CU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE39C20685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=riseup.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6df2146;
	Mon, 19 Nov 2018 19:01:23 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fdbe8292
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:24:40 +0000 (UTC)
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04853129
 for <wireguard@lists.zx2c4.com>;
 Mon, 19 Nov 2018 17:24:40 +0000 (UTC)
Received: from cotinga.riseup.net (cotinga-pn.riseup.net [10.0.1.164])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "*.riseup.net",
 Issuer "COMODO RSA Domain Validation Secure Server CA" (verified OK))
 by mx1.riseup.net (Postfix) with ESMTPS id 291971A04D9
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 09:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1542648641; bh=zWzLQCuP/H1scgJJQbxGw5cbupsJHq/wl1mkHPzR988=;
 h=To:From:Subject:Date:From;
 b=kWxhj9CU0fVsyUkbdoDKtE4CmJGjVRc3h7vHloLnNteOpHamjaYCBjsGfokylw+NH
 AVcRPZ5aSkfU4F4UHFnJQRz6+KMCmc3337iBdxoi3brxaxE3qWjUxsKiBGNO5y6JjA
 vD6Mr3zY60Y8AReBNo3hzWUqXyhJQ9WXa48jBYLw=
X-Riseup-User-ID: C158D65C5769C42529646B7D5C63DF27D8171114DC7F9F9A1A172B76BFF11DF5
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by cotinga.riseup.net with ESMTPSA id 6CF58104525
 for <wireguard@lists.zx2c4.com>; Mon, 19 Nov 2018 09:30:40 -0800 (PST)
To: WireGuard List <wireguard@lists.zx2c4.com>
From: John Smith <johnsmith1@riseup.net>
Subject: WireGuard server and multiple clients
Message-ID: <09ef4c2c-a445-1183-d4c6-1a6ca0e0cb41@riseup.net>
Date: Mon, 19 Nov 2018 17:30:00 +0000
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 19 Nov 2018 20:01:18 +0100
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

Hello,

If I were to set up a WireGuard server and have multiple clients
connecting to it, is there anything I need to be aware of? Specifically,
I am looking to understand if this is recommended as I already see
commercial offering of WireGuard - but not by all providers - so I was
wondering if there are any caveats to this approach.

For added context, I was managing a VPN server for my family and friends
but now I am considering switching to WireGuard.

Thanks.

- J Smith
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
