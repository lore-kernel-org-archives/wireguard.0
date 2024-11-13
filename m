Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D31D10F5B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 03:58:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 96ede99f;
	Mon, 18 Nov 2024 01:39:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8b1ad8c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Nov 2024 09:48:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CBFA85C544F;
 Wed, 13 Nov 2024 09:47:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3174CC4CECD;
 Wed, 13 Nov 2024 09:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731491316;
 bh=8t44CRZWa3doc2wAxlLVoy8bUIcjfDDp+F/2ou0Sv0I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WCq4k/oaRPAfo0bKlHX/aBbhyOuwXs9dLVkudKyrJ14/dhiSpVeiBfryjf+lwI4OT
 BBh9iur7GEQZgXxABVrZEvzBrbarrADEvX4Ple8UvYoyajcluP5Vfzrmgdtgifg32V
 GkFB5NhPmFS+txRoMqLdB+9kWIuzJuhgDUushu6iMZip8o1bnnq8BL7xxqr2hDTmXg
 783Q+xSXWu5vCgl9wVRFama2gvErvqJrb+HN1lldnSJ4mPsNFQeMdp2IgnDDrk8y+r
 b4vo9bWiHKJF0AJHfrTnGqyVsz0ecuCNT/bpHOAfd+hr/Gv0XDdZ+otYrWOt83c7sT
 52kYJ9zWVnCGg==
Date: Wed, 13 Nov 2024 09:48:32 +0000
From: Simon Horman <horms@kernel.org>
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: netdev@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 net] selftests: wireguard: load nf_conntrack if it's
 not present
Message-ID: <20241113094832.GW4507@kernel.org>
References: <20241112094828.391002-1-liuhangbin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112094828.391002-1-liuhangbin@gmail.com>
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

On Tue, Nov 12, 2024 at 09:48:27AM +0000, Hangbin Liu wrote:
> Some distros may not load nf_conntrack by default, which will cause
> subsequent nf_conntrack settings to fail. Let's load this module if it's
> not loaded by default.
> 
> Fixes: e7096c131e51 ("net: WireGuard secure network tunnel")
> Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
> ---
> v2: load the mode directly in case nf_conntrack is build in (Simon Horman)

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


