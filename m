Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E67C54E65
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 11:42:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efb6c9cf;
	Tue, 20 May 2025 21:48:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c4a866ca
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 21:48:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF94B5C54E6;
 Tue, 20 May 2025 21:45:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE0BC4CEE9;
 Tue, 20 May 2025 21:48:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="d25nc40J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747777679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rCEUlX1/QPV1B7qcEKZTV8HI+MgfKkGTHei7tbjvtws=;
 b=d25nc40JGrnHTRX+30jTPpkkxps69P1wwmlfxiQLZFSBFJAO72QRCB/EJfNlpAl0LWDuOj
 KncLe0vk6xPZHEyJY/oUZ676QPpkci5MaBhI2lB8gbgsSj7xeMev8IezuHSBxmBEcInsLx
 8oKJLk32ChZKTDmXkISR9Vsabu1whnc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 731ccbf0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 May 2025 21:47:58 +0000 (UTC)
Date: Tue, 20 May 2025 23:47:56 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v3 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <aCz4jK9i-N6e5xk-@zx2c4.com>
References: <20250517192955.594735-1-jordan@jrife.io>
 <20250517192955.594735-2-jordan@jrife.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250517192955.594735-2-jordan@jrife.io>
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

Hi Jakub, Jordan,

On Sat, May 17, 2025 at 12:29:52PM -0700, Jordan Rife wrote:
> * Use NLA_POLICY_MASK for WGALLOWEDIP_A_FLAGS validation (Jakub).
[...]
> +	[WGALLOWEDIP_A_FLAGS]		= NLA_POLICY_MASK(NLA_U32, __WGALLOWEDIP_F_ALL),

I wonder... Can we update, in a separate patch, these to also use
NLA_POLICY_MASK?

   ...
        [WGDEVICE_A_FLAGS]              = { .type = NLA_U32 },
   ...
        [WGPEER_A_FLAGS]                = { .type = NLA_U32 },
   ...

Some consistency would be nice.

Regards,
Jason
