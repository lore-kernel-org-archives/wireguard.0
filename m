Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E808CD10F57
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 04:02:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 316ba7ac;
	Mon, 18 Nov 2024 01:39:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 74dae249
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2024 20:06:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 981E95C516B;
 Sun, 17 Nov 2024 20:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71351C4CECD;
 Sun, 17 Nov 2024 20:06:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mC18zsML"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1731873981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OyxAN4YgaXUp4x+XaG2iuK6SIMvKnOiGTkjdOlJAyrU=;
 b=mC18zsML78oK44vTAGfzIlRcbHSABMcqxb1jceIME38nVDjL//ZsQKeO/rOwTefJ1cSgMT
 eWm1DsiL/dNk4Uh6mN5Yb8wX0Jl0J+Xh1WhnqQ86Ap2W1j0c5+tptSZhWaGkM/a6pqDZe5
 d6KQzjvXosYx+b2MXTGqpA3TPd0KzWo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 01568eab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 17 Nov 2024 20:06:20 +0000 (UTC)
Date: Sun, 17 Nov 2024 21:06:18 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Cc: wireguard@lists.zx2c4.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] wireguard: allowedips: Fix useless call issue
Message-ID: <ZzpMumfYVgV8fTFH@zx2c4.com>
References: <20241115110721.22932-1-dheeraj.linuxdev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241115110721.22932-1-dheeraj.linuxdev@gmail.com>
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

On Fri, Nov 15, 2024 at 04:37:21PM +0530, Dheeraj Reddy Jonnalagadda wrote:
> This commit fixes a useless call issue detected
> by Coverity (CID 1508092). The call to
> horrible_allowedips_lookup_v4 is unnecessary as
> its return value is never checked.

Applied to the wireguard tree, thanks.
