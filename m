Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA28D10F5B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 04:14:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 853c2236;
	Mon, 18 Nov 2024 01:39:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3f974d6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Nov 2024 20:09:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C218F5C49FD;
 Sun, 17 Nov 2024 20:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92668C4CECD;
 Sun, 17 Nov 2024 20:09:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="G3gnCfZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1731874143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5sw0h/dqgM08uFeUSgZnIFoY4ccd5OOzMdaWfA9G/Pg=;
 b=G3gnCfZdz1VKqYPylbwF7EEntLMlnS6x7yLBnqeXCjMb6JxDg2+3ep8qsrGYtOBQAX6T+r
 7VAJY+ynhfBhggpBHI8YgQXvwYTmlFQOKCs6L08cc27396MufFCQLU+dU3bq7KTzRaTSr1
 fEciguDpl6BXdhvaOO3GyzPH9rFvKT0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5177d8e0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 17 Nov 2024 20:09:02 +0000 (UTC)
Date: Sun, 17 Nov 2024 21:09:00 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 net-next] selftests: wireguards: use nft by default
Message-ID: <ZzpNXM17NX3nVzMl@zx2c4.com>
References: <20241111041902.25814-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241111041902.25814-1-liuhangbin@gmail.com>
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

On Mon, Nov 11, 2024 at 04:19:02AM +0000, Hangbin Liu wrote:
> Use nft by default if it's supported, as nft is the replacement for iptables,
> which is used by default in some releases. Additionally, iptables is dropped
> in some releases.
 
Rather than having this optionality, I'd rather just do everything in
one way or the other. So if you're adamant that we need to use nft, just
convert the whole thing. And then subsequently, make sure that the qemu
test harness supports it. That should probably be a series.

Jason
