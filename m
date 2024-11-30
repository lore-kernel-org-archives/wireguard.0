Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39E7C54E71
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 19:34:31 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ccbefdd;
	Tue, 20 May 2025 19:34:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 81cc2d33
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 30 Nov 2024 17:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0C6525C4976;
 Sat, 30 Nov 2024 17:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749F2C4CECC;
 Sat, 30 Nov 2024 17:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732989385;
 bh=Ab4feArBZDLh5bvzEF2wp8FNfSQEeaamV/6tHPpOlTs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nyUWpmr2hn1aShisZ6dJhVRGYJozospmM0H9kujGzKxmjWv6ChyeEpRFqczlsFDVV
 8ujzv5U2IqSpMo6Vv75Rwja7R7MbqY1zq/bgvrgLYKZq5AKzafKFn2obWlCV70W/7U
 umCV6jxI0PafxtClfdcZCsM6HV+ainkOI9juAu7WdalidpMYnAhLw1BM2Y+Hb5fYvF
 VveTnnEsEJZzdXk5cjPtYQuMx/G/UCccwZW0uxe/KUf6hIxpTp6KwcOqmsg4LFoah/
 KomQD/VDp/jiMxM/IPJ2veJIdfDxWHoYi3cZhMkxxwIG9HSPw5KdZSRhNyKuy2vtlP
 ltqEpioC/ZYJw==
Date: Sat, 30 Nov 2024 09:56:24 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jordan Rife <jrife@google.com>
Cc: Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 shuah@kernel.org, wireguard@lists.zx2c4.com
Subject: Re: [PATCH v2 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <20241130095624.1c34a12c@kernel.org>
In-Reply-To: <20241127232133.3928793-1-jrife@google.com>
References: <CADKFtnTThMBDKCXufNaeci5uCeddOgLvXmqszyJoT6N=6xtWug@mail.gmail.com>
 <20241127232133.3928793-1-jrife@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 27 Nov 2024 23:21:33 +0000 Jordan Rife wrote:
> The second command fails with "Invalid argument" (EINVAL) on the
> unpatched kernel. This simplifies things, as there's no need for
> clients to explicitly probe to see if this attribute is supported. I
> will do the following:
> 
> 1. Revert WG_GENL_VERSION back to 1.
> 2. Add a check for new flags similar to the one you mentioned for
>    WGPEER_A_FLAGS.
> 
>         if (attrs[WGPEER_A_FLAGS])
>                 flags = nla_get_u32(attrs[WGPEER_A_FLAGS]);
>         ret = -EOPNOTSUPP;
>         if (flags & ~__WGPEER_F_ALL)
>                 goto out;
> 
> This should be sufficient. We might want to consider how best to bubble
> this error up to users. In the case of wg, "Invalid argument" may not be
> very helpful in determining where you went wrong. We could always detect
> when EINVAL is returned in response to an operation that sets
> WGALLOWEDIP_A_FLAGS and print something more helpful like "Operation not
> supported on this kernel". However, these are details that can be worked
> out.

Better still use NLA_POLICY_MASK() so that nla_parse_nested() can
perform the validation and attach a machine readable info about
the failure.
