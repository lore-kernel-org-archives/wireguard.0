Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6797CCF9F8
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 Oct 2025 13:23:27 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d61122d0;
	Fri, 31 Oct 2025 13:21:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ec67b24d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 Oct 2025 13:21:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AC14860053;
 Fri, 31 Oct 2025 13:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3936C4CEE7;
 Fri, 31 Oct 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="ZaHraHty"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1761916869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+TBrrmDVWfZjrDT5nkv2n9oSojYsS2zzFgNPyf4h0yM=;
 b=ZaHraHty0xvbCodAPSScDP8QV2yIJXRQlHeC4gA1wXZkzc/FKrtA14JRxmn7bWoBFofwwt
 EvazBgfszkoJIh2Vo3cXzY4hUVlxaZISp47vrx30y2wam8L3OZ8AqTQ7LAYLR91Mj6gf8k
 SRjxSrAcISK+YBVc+hAD9nr/vO1Nw0Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1e87ff9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 31 Oct 2025 13:21:08 +0000 (UTC)
Date: Fri, 31 Oct 2025 14:21:05 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Anthony Paul <anthonypaul@gmail.com>
Cc: Simon Rozman <simon@rozman.si>,
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Crash on Windows ARM64 when Import and potential fix
Message-ID: <aQS3wRmL74-E3mTg@zx2c4.com>
References: <CAA+FdXqkOP3rxOOdVY6Q28g7eDsmqkwg38PzZ+rKbdG8DZs0KA@mail.gmail.com>
 <d19c02a02c61469499c5f8183ce0f079@rozman.si>
 <CAA+FdXoVKcB4pZmjK02shnEZcQuYL86iLJGB10ngk_4mc0Rruw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAA+FdXoVKcB4pZmjK02shnEZcQuYL86iLJGB10ngk_4mc0Rruw@mail.gmail.com>
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

On Fri, Oct 31, 2025 at 10:44:14AM -0230, Anthony Paul wrote:
> Hi Simon.
> 
> WG for arm64 windows still has all the issues with the file selection
> stuff...  Any way you could get this patch pushed through?  Anything I
> can do to help?

I'm in the process of rebuilding my Windows rig so that I can resume
development of this.

