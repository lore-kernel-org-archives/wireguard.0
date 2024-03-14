Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79E7C5475B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 14 Mar 2024 03:27:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 108fba74;
	Thu, 14 Mar 2024 03:24:12 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f57ee5b0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Mar 2024 03:24:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1E6BCE1D00;
 Thu, 14 Mar 2024 03:24:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCE4C43390;
 Thu, 14 Mar 2024 03:24:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="BEIJUDTD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1710386643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eZuRvmWgcpTPPgj9ycM/o+D8oj337tsMLnQUeUVCjfg=;
 b=BEIJUDTDI/ypsK5HykKPz4+WDrslSA51yjHA2iwec+V+FwVONbwptMVhFFYauWOvj7SrF+
 S9uL0mR9pLpOCn0AXRRe8AERsw7DWP6Zkfn0tfRYBNme/w0DRQMIoSX43AT7Wnnvg+n0Im
 bAH+sMJanbAJ4J4Q48s3atRF7K5dXUc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a62e8f60
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Thu, 14 Mar 2024 03:24:03 +0000 (UTC)
Date: Wed, 13 Mar 2024 21:23:58 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Breno Leitao <leitao@debian.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 horms@kernel.org, dsahern@kernel.org,
 "open list:WIREGUARD SECURE NETWORK TUNNEL" <wireguard@lists.zx2c4.com>
Subject: Re: [PATCH net-next v2 1/2] wireguard: Leverage core stats allocator
Message-ID: <ZfJtzhKJV4yo3LRF@zx2c4.com>
References: <20240308112746.2290505-1-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240308112746.2290505-1-leitao@debian.org>
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

I applied this series to the wireguard tree. Thanks for the patches.

Jason
