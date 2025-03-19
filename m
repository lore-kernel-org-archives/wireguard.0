Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40329C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 09:18:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e49633d;
	Tue, 20 May 2025 19:42:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 347bb1d3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Mar 2025 16:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 509655C5B4C;
 Wed, 19 Mar 2025 16:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFCBC4CEE4;
 Wed, 19 Mar 2025 16:15:47 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Peq5GDrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1742400946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2VI/j+LK4IyIwE+OVTjjCr+GSdAaazGSA6tl8MFmzFY=;
 b=Peq5GDrvXDyXsqluuFRNiMS6x0ptJGsrdn/f/Q0RxgsBVPRnSqGcM3mY19Eg2LLgKfucFb
 WP/fFZCvRJjjx2xnPDHZVFAYbygBZZ0MZfpluc/fpLN5J3ZMb+ox4mMn/Cf537bviI/Mc/
 wcZRIUeC+YyDbHJQgBGem0DNPqNTKFM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2e07f44
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 19 Mar 2025 16:15:46 +0000 (UTC)
Date: Wed, 19 Mar 2025 17:15:41 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 RESEND net-next 2/2] selftests: wireguard: update to
 using nft for qemu test
Message-ID: <Z9rtrVk-15Ts_BNp@zx2c4.com>
References: <20250106081043.2073169-1-liuhangbin@gmail.com>
 <20250106081043.2073169-3-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106081043.2073169-3-liuhangbin@gmail.com>
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

On Mon, Jan 06, 2025 at 08:10:43AM +0000, Hangbin Liu wrote:
> +	echo "file /bin/nft $(NFTABLES_PATH)/src/nft 755 0 0" >> $@
> +	echo "file /lib/libmnl.so.0 $(TOOLCHAIN_PATH)/lib/libmnl.so.0 755 0 0" >> $@
> +	echo "file /lib/libnftnl.so.11 $(TOOLCHAIN_PATH)/lib/libnftnl.so.11 755 0 0" >> $@

Can't these be statically linked into the nft binary?
