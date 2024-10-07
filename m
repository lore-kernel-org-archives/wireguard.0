Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE22BD10F55
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 02:40:42 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a03fe80;
	Mon, 18 Nov 2024 01:37:53 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4bacf931
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 7 Oct 2024 16:42:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E996EA41882;
 Mon,  7 Oct 2024 16:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 644B9C4CEC6;
 Mon,  7 Oct 2024 16:42:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eFwaITMn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1728319363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OsFjrnHgCqteocAbZ0ZL286L+omyoHWMkj/C3qTonCY=;
 b=eFwaITMnwUmkmR5Zf4HFCg1K49h2Cq/xEzjQSVJOQB1zv9Uof0qCy6oBGex6knaSZHKm6b
 XUEVEaSmKKznkNQjAW+l85zpvLMtqEri2XTyDQn8h83vcSerKYl/S4+AN3+XecDezjeZb6
 d2nA2fYxUBMgGiIEUK3V6NDECFO5l3o=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 381477e3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 7 Oct 2024 16:42:43 +0000 (UTC)
Date: Mon, 7 Oct 2024 18:42:41 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: kuba@kernel.org, edumazet@google.com, aspsk@isovalent.com, m@lambda.lt,
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com
Subject: Re: [PATCH net-next v2] wireguard: Wire-up big tcp support
Message-ID: <ZwQPgbwio38LWqKS@zx2c4.com>
References: <20241004165518.120567-1-daniel@iogearbox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241004165518.120567-1-daniel@iogearbox.net>
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

Hi Daniel,

On Fri, Oct 04, 2024 at 06:55:18PM +0200, Daniel Borkmann wrote:
> Advertise GSO_MAX_SIZE as TSO max size in order support BIG TCP for wireguard.
> This helps to improve wireguard performance a bit when enabled as it allows
> wireguard to aggregate larger skbs in wg_packet_consume_data_done() via
> napi_gro_receive(), but also allows the stack to build larger skbs on xmit
> where the driver then segments them before encryption inside wg_xmit().

Thanks, I'll queue this up. Do you have any perf numbers on the speedup,
btw?

Jason
