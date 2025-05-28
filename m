Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402BEC3ABB2
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 May 2025 18:11:09 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d8a3d01;
	Wed, 28 May 2025 18:11:07 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3e95cf2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 May 2025 18:11:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5DF6544754;
 Wed, 28 May 2025 18:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C099AC4CEE3;
 Wed, 28 May 2025 18:11:02 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VuYyM9ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748455861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tl75LHmWpQbq9PL/fmRsuSQYbjZnbzMspbeEzKKBu2Y=;
 b=VuYyM9ST6z++Mt+mdja+BoYiBjhLx9+SkshI+TqPsyIKbzVgtcX6SvtnoteHKZ7CpAoJvG
 Rkj/rHwNzP2dSYaiSGpGGmSoD3UZG5cbJB8mAPk+oOP6JzUcXOzWsp/GRKUtgQDIATkw3d
 a36pnP8JmCRUZACNEWtLlXZlaxZjeok=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b3ed5d4d
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Wed, 28 May 2025 18:11:00 +0000 (UTC)
Date: Wed, 28 May 2025 20:10:52 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Mirco Barone <mirco.barone@polito.it>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: R: [PATCH] Enabling Threaded NAPI by Default
Message-ID: <aDdRrDwrZnDv3sL6@zx2c4.com>
References: <PA4PR05MB8995153AC212DDED36166CC48964A@PA4PR05MB8995.eurprd05.prod.outlook.com>
 <CAHmME9pV8inzKksdXFq8C1ey9dLJZBUzNJoCr7PrrqeHqy=e-g@mail.gmail.com>
 <PA4PR05MB8995DDB49A853E42F264B6458967A@PA4PR05MB8995.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PA4PR05MB8995DDB49A853E42F264B6458967A@PA4PR05MB8995.eurprd05.prod.outlook.com>
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

On Wed, May 28, 2025 at 05:26:34PM +0000, Mirco  Barone wrote:
> This happens because NAPI polling is hosted by default in softirq
> context, but the WireGuard driver only raises this softirq after the rx
> peer queue has been drained, which doesn't happen during high traffic.
> In this case, the softirq already active on a core is reused instead of
> raising a new one.
> 
> As a result, once two or more tunnel softirqs have been scheduled on
> the same core, they remain pinned there until the surge ends.
> 
> In our experiments, this almost always leads to all tunnel NAPIs being
> handled on a single core shortly after a surge begins, limiting
> scalability to less than 3× the performance of a single tunnel, despite
> plenty of unused CPU cores being available.

So *that's* what's been going on! Holy Moses, nice discovery.

> On our 32-core gateways, enabling threaded NAPI yields a ~4× performance
> improvement with 16 tunnels, increasing throughput from ~13 Gbps to
> ~48 Gbps. Meanwhile, CPU usage on the receiver (which is the bottleneck)
> jumps from 20% to 100%.

Shut up and take my money! Patch applied.

> ---
>  drivers/net/wireguard/device.c | 1 +
>  1 file changed, 1 insertion(+)

Actually, no, wait, sorry, this needs your Signed-off-by line, per the
kernel contribution guidelines, for me to be able to push it. Can you
just reply to your initial patch email, quote all of the text, and
append the string:

    Signed-off-by: Mirco Barone <mirco.barone@polito.it>

And then I'll push this up.

Sorry for the hassle; kernel development has its particularities.

Jason
