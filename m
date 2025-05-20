Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D31C3DA6D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:25 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3568cc7f;
	Tue, 20 May 2025 21:10:40 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cbec356c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 20 May 2025 21:10:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 828AD629E8;
 Tue, 20 May 2025 21:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7474C4CEE9;
 Tue, 20 May 2025 21:10:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="QwjMz1oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1747775433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FcnEUGIidvbrlCTFSfkiuxs9z+zoIVTbHGD/stmUpa4=;
 b=QwjMz1oLEl1hY9lT5yC3iLOlYgINaXWp5E7pdcGmuRJx55H9Abqa1/AY8pRzs9SexBNZTz
 f33q4DeERkETNmmZhFy8j2uHEQzuD07l8nBYE5DpYIbV+H+6Q63mThUG7tJx0BqInuJBUq
 5SdNFiYan795g3SR9e5YbFtHXTNv6Eg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 387b7411
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 20 May 2025 21:10:32 +0000 (UTC)
Date: Tue, 20 May 2025 23:10:30 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jordan@jrife.io>
Cc: wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [RESEND PATCH v1 wireguard-tools] ipc: linux: Support
 incremental allowed ips updates
Message-ID: <aCzvxmD5eHRTIoAF@zx2c4.com>
References: <20250517192955.594735-1-jordan@jrife.io>
 <aCzirk7xt3K-5_ql@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCzirk7xt3K-5_ql@zx2c4.com>
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

On Tue, May 20, 2025 at 10:14:38PM +0200, Jason A. Donenfeld wrote:
> On Sat, May 17, 2025 at 12:29:51PM -0700, Jordan Rife wrote:
> > Extend the interface of `wg set` to leverage the WGALLOWEDIP_F_REMOVE_ME
> > flag, a direct way of removing a single allowed ip from a peer,
> > allowing for incremental updates to a peer's configuration. By default,
> > allowed-ips fully replaces a peer's allowed ips using
> > WGPEER_REPLACE_ALLOWEDIPS under the hood. When '+' or '-' is prepended
> > to any ip in the list, wg clears WGPEER_F_REPLACE_ALLOWEDIPS and sets
> > the WGALLOWEDIP_F_REMOVE_ME flag on any ip prefixed with '-'.
> > 
> > $ wg set wg0 peer <PUBKEY> allowed-ips +192.168.88.0/24,-192.168.0.1/32
> > 
> > This command means "add 192.168.88.0/24 to this peer's allowed ips if
> > not present, and remove 192.168.0.1/32 if present".
> > 
> > Use -isystem so that headers in uapi/ take precedence over system
> > headers; otherwise, the build will fail on systems running kernels
> > without the WGALLOWEDIP_F_REMOVE_ME flag.
> > 
> > Note that this patch is meant to be merged alongside the kernel patch
> > that introduces the flag.
> 
> Merged here:
> https://git.zx2c4.com/wireguard-tools/commit/?id=0788f90810efde88cfa07ed96e7eca77c7f2eedd
> 
> With a followup here:
> https://git.zx2c4.com/wireguard-tools/commit/?id=dce8ac6e2fa30f8b07e84859f244f81b3c6b2353

Also,
https://git.zx2c4.com/wireguard-go/commit/?id=256bcbd70d5b4eaae2a9f21a9889498c0f89041c
