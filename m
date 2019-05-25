Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A4EC04AB5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:01:56 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2A220872
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 10:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zil.li header.i=@zil.li header.b="K1zs4KWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2A220872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=zil.li
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 35fe0796;
	Thu, 6 Jun 2019 10:01:43 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc961723
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 May 2019 18:38:53 +0000 (UTC)
Received: from epsilon.h6g-server.net (epsilon.h6g-server.net [185.207.104.70])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44207860
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 May 2019 18:38:52 +0000 (UTC)
To: wireguard@lists.zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zil.li; s=key2018;
 t=1558809531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xr0F/+AnZSB9rEz2CW1hEbZ6384P0uUN9QUWQ6O8qjw=;
 b=K1zs4KWeTZ2ebCNj9RLh6EwFcx07+IbgHKaUMrHfQ/ibmitW+QhEUd8oqZsIHqPpRc7Vds
 kfptk/A+CFU28hp01c4cOC6vnprY/1iES5zCAAEsduhvAepcmxWs9qjglR4nJ/vdH2xd9a
 89FP2KNN1+LuZQzxw3FpeZSJExj3K6vLx81uwvfs8kScmzrg4zcmK6x+zKIcd7c4UuMyHc
 lCFbmXfGwpM11h+SsTjkDcQ/C0c5il4MSpie0ePsArGnXvzbC4JY/IDwAoZpHr/szakPyb
 ZDz9zzawQoPZ44TuqaFDZq3nEc7TL20+DJv0B/hUcYsiPVX3wHKeYshKF66scA==
References: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
Subject: Re: Overlapping AllowedIPs Configuration
From: Paul Zillmann <paul@zil.li>
Message-ID: <536efee3-3d15-682f-4979-7fa2bb3457c3@zil.li>
Date: Sat, 25 May 2019 20:39:24 +0200
MIME-Version: 1.0
In-Reply-To: <20190506210827.2h4nzjxjpmwg7kpa@yavin>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Jun 2019 12:01:42 +0200
Cc: henningreich@gmail.com
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

Hello,

we have the same problem here, although our allowed IP ranges should be 
0.0.0.0/0 for all peers.
We have OSPF traffic on the wireguard links so it should be task of the 
Kernel's routing table to decide where to send what.

The problem is that the allowed-ips configuration has multiple purposes: 
routing table and firewall/packet filter. This introduces these 
problems. It would be helpfull to get a compile flag or something else 
to make this behavior optional. Right now Wireguard isn't very friendly 
to dynamic routing.

I came up with multiple solutions:
- create multiple interfaces + tunnels.
or
- create a bash script that injects the Kernel's routing table into the 
wg tool every other minute.

Do you guys have a better idea? If not I would create the bash script.

- Paul
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
