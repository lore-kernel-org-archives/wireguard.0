Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6237C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 21:08:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aaf4d917;
	Wed, 21 May 2025 21:08:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e47379ea
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 21 May 2025 21:08:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9BB035C5C33;
 Wed, 21 May 2025 21:06:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073C0C4CEE4;
 Wed, 21 May 2025 21:08:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="AidkitYP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747861726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INPsIqZngrT1CYVa29cWbPUL4wHga4nxX1LRQFJ0XEc=;
 b=AidkitYPp7FT/9a/Ytz36IvGb0jbMwytbauk2Sbgzgi+s9vopQBI+WC4XuxAUmqoxlbCqU
 uRHrcli1Vpp9ZF29elwoOm9zl+q1wlbl1C145ZH5ZZYrk5uWjHPo5il1Wgz2A07X8qbe/E
 gbGmu86n0w22xCk3yB5mHvhXxDWfS+k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9b7ae8d8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 21 May 2025 21:08:45 +0000 (UTC)
Date: Wed, 21 May 2025 23:08:43 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Ismael Bouya <ismael@bouya.org>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Incorrect computation of the MTU in wg-quick
Message-ID: <aC5A29Qmn-5uoCC0@zx2c4.com>
References: <cvlwdlcato6fv5ih7qcib2tyzjltvfnq3l4flfcfrqqltl32j7@2mae3zkuvmuw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cvlwdlcato6fv5ih7qcib2tyzjltvfnq3l4flfcfrqqltl32j7@2mae3zkuvmuw>
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

> I would like to report a behavior that seems to be incorrect in the way
> wg-quick computes the MTU to assign to a wireguard interface:
> https://git.zx2c4.com/wireguard-tools/tree/src/wg-quick/linux.bash#n125
> In this block, wg-quick goes through every endpoint it knows about,
> gets the mtu of the route to reach the endpoint, and takes the highest
> value among all the computed values.
> However it appears to me that the chosen value should instead be the
> lowest among all endpoints rather than the highest.
> 
> As an example, if I declare myself (localhost) as an endpoint (it may or
> may not be supported, but that’s how I found about this issue), then the
> mtu will be set to 65456 (65536-80) which is higher than what the other
> endpoints are able to manage, and I’ll only be able to contact myself
> properly.

Thanks for the report. Fixed:
https://git.zx2c4.com/wireguard-tools/commit/?id=5150cd647073be1f1c12688aef291bdf17970154

Let me know if that looks okay to you.

Jason
