Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FA3C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 18 Feb 2023 19:06:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 163e4560;
	Sat, 18 Feb 2023 19:06:29 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f982d358
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Feb 2023 19:06:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A634BB801B9;
 Sat, 18 Feb 2023 19:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D83C433EF;
 Sat, 18 Feb 2023 19:06:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Zalorvqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1676747181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPEmyBmChiURPYNyeiu5FZN2NBzOndNRLvwVDmQ5+lc=;
 b=ZalorvqgijKzS4neKjxNcN9/3Kxl9KG6MbCg8XEbYWCTCxcBdacJK6z1qRQZJpjfAlM3/6
 zloaK8x6aAQ2UYUWR0RQy9Kjp1YOjGjDO/kd//6tVkbNkbyrACkJpKJ6WzV3xSTyH27MIU
 Lwj2Pb7wkwYCNy8Asak3kY87yrlL5UA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 19f88aab
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 18 Feb 2023 19:06:21 +0000 (UTC)
Date: Sat, 18 Feb 2023 20:06:18 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, wireguard@lists.zx2c4.com, netdev@vger.kernel.org
Subject: Re: Fw: [Bug 217054] New: wireguard - allowedips.c - warning: the
 frame size of 1032 bytes is larger than 1024 bytes
Message-ID: <Y/EhqqFJepo3Ncpr@zx2c4.com>
References: <20230218095036.7c558146@hermes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230218095036.7c558146@hermes.local>
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

On Sat, Feb 18, 2023 at 09:50:36AM -0800, Stephen Hemminger wrote:
> 
> 
> Begin forwarded message:
> 
> Date: Sat, 18 Feb 2023 15:49:26 +0000
> From: bugzilla-daemon@kernel.org
> To: stephen@networkplumber.org
> Subject: [Bug 217054] New: wireguard - allowedips.c - warning: the frame size of 1032 bytes is larger than 1024 bytes
> 
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217054
> 
>             Bug ID: 217054
>            Summary: wireguard - allowedips.c - warning: the frame size of
>                     1032 bytes is larger than 1024 bytes
>            Product: Networking
>            Version: 2.5
>     Kernel Version: 6.1.12
>           Hardware: AMD
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: Other
>           Assignee: stephen@networkplumber.org
>           Reporter: ionut_n2001@yahoo.com
>         Regression: No
> 
> CC [M]  drivers/memstick/core/memstick.o
> drivers/net/wireguard/allowedips.c: In function 'root_remove_peer_lists':
> drivers/net/wireguard/allowedips.c:80:1: warning: the frame size of 1032 bytes
> is larger than 1024 bytes [-Wframe-larger-than=]
>    80 | }
>       | ^
> drivers/net/wireguard/allowedips.c: In function 'root_free_rcu':
> drivers/net/wireguard/allowedips.c:67:1: warning: the frame size of 1032 bytes
> is larger than 1024 bytes [-Wframe-larger-than=]
>    67 | }
>       | ^
>   CC [M]  drivers/net/wireguard/ratelimiter.o
>   CC [M]  drivers/memstick/core/ms_block.o

This keeps coming up. The frame size that the compiler targets on 64-bit
is 1280, not 1024. The reporter misconfigured the .config. Maybe there
should be a min value for that. Dunno. Old topic.

Jason
