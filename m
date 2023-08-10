Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1216C001DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Aug 2023 10:49:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1b029f1a;
	Thu, 10 Aug 2023 10:47:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8fc1d8cc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2023 10:47:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 488B660C2C;
 Thu, 10 Aug 2023 10:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400CCC433C8;
 Thu, 10 Aug 2023 10:47:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jK+DUvWb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1691664419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BQmH621M90RYzBdJ8EFcdvexed3kkG9AlLiQHws8NwY=;
 b=jK+DUvWbe+q5SKoMh+PJ9xhQiNl6aPhRRYLWI6XIaRu/QUtHjRDS/6kRJVMeu4GJzZa511
 aAmIzbyAwumYqw70nF9FBPI8Yj66MlrrScYqV7gPA1dgmRTQP+kcpzBFTt0ZRF6ArtofvA
 yOkicf4nItBRgr2xM/6yWEnO9UYFzNI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3e696408
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 10 Aug 2023 10:46:59 +0000 (UTC)
Date: Thu, 10 Aug 2023 12:46:57 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: What's the wireguard-tools
Message-ID: <ZNTAIUY6L20ltgiP@zx2c4.com>
References: <ZNRex9yqvEekpU/h@Laptop-X1>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZNRex9yqvEekpU/h@Laptop-X1>
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

Hi Hangbin,

On Thu, Aug 10, 2023 at 11:51:35AM +0800, Hangbin Liu wrote:
> Hi Jason,
> 
> I'm maintaining the RHEL wireguard-tools rpm. Recently, There is a request to
> convert the license tag in the spec file to SPDX format[1]. The current License
> tag in wireguard-tools spec file is GPLv2, which is the same with the COPYING
> in upstream. But when I searched the src files, I found there are kinds of
> license identifier. e.g. GPL-2.0, LGPL-2.1+, MIT, GPL-2.0 OR MIT, etc.
> 
> Do you know which one I should use at the end? Should we unify the src files?

The license is GPL-2.0.

Jason
