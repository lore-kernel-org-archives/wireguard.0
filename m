Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8456D10F5A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 04:14:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c6ff68e0;
	Mon, 18 Nov 2024 01:39:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a18e14a7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2024 21:46:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 54FFD5C53F7;
 Sun, 17 Nov 2024 21:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D16C4CECD;
 Sun, 17 Nov 2024 21:46:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="oTJ4h7HK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1731880000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g34p6sutZbsEQgGncL8Aj9TPilMj0nJj3hqG1gcNwxo=;
 b=oTJ4h7HKsouagIo1IEmrWaqe5IBR09lPV0IxR246g8HstAVayNcqeyRo5D09tXW3LoLibp
 5zS9bMOPOranNBRBWPJok4u7PaAmRs8mx1FOKFWrcrSol+JWrKyOXLMkR5cllwxONd5aOz
 zpWZarC6QcbV+kMRXC+Ne/HPC65mFGc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id aea12104
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 17 Nov 2024 21:46:39 +0000 (UTC)
Date: Sun, 17 Nov 2024 22:46:37 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jrife@google.com>
Cc: wireguard@lists.zx2c4.com, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <ZzpkPWrrb_Z2ZfCq@zx2c4.com>
References: <20240905200551.4099064-1-jrife@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240905200551.4099064-1-jrife@google.com>
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

On Thu, Sep 05, 2024 at 03:05:41PM -0500, Jordan Rife wrote:
> With the current API the only way to remove an allowed IP is to
> completely rebuild the allowed IPs set for a peer using
> WGPEER_F_REPLACE_ALLOWEDIPS. 

Just for posterity, there actually is another way: create a new peer
with a random key, and give the allowed IP you want to remove to that
peer. Moves are atomic. Then destroy that peer.

Not that this is clean or nice or something, and I like your patch. But
in case somebody gets into trouble before this lands, I thought I should
note it on the list.

Jason
