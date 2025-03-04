Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA516C3ABC9
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 21 May 2025 13:06:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 206b7da3;
	Tue, 20 May 2025 19:42:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93688cb3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 Mar 2025 03:38:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 324465C4357;
 Tue,  4 Mar 2025 03:36:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D0BC4CEE4;
 Tue,  4 Mar 2025 03:38:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FEcBMeAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1741059521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Yw3BRhqRHcgvLMM2z9NVQxeCf03io7Nut0QRR3zfBJE=;
 b=FEcBMeAJcjvnDPb1F4rLSx1WyywhovqcVoB0EzrS4k7vVkXk1eiBU7ZZq6JSY7dyyFhSB9
 Kv9yvUjcACd6yn02X/h+PAedr0S2WdOw0UBYfBrop8K2chWNkqaSrd01IKvhNgroHAtuN9
 hTU4wmoJGnLq/bmpuvYfNjC8wNY891c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a21336a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 4 Mar 2025 03:38:41 +0000 (UTC)
Date: Tue, 4 Mar 2025 04:38:35 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Jordan Rife <jrife@google.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH v4 net-next] wireguard: allowedips: Add
 WGALLOWEDIP_F_REMOVE_ME flag
Message-ID: <Z8Z1uxRd_kNO6Ibv@zx2c4.com>
References: <20250304003900.1416866-1-jrife@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250304003900.1416866-1-jrife@google.com>
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

On Tue, Mar 04, 2025 at 12:38:55AM +0000, Jordan Rife wrote:
> NOTE
> ----
> I've addressed Jason's feedback from v2, but have been unable to
> get in touch with him about v3 after several attempts. If there are no
> objections, can we accept this into net-next?


No. I'll take this through the wireguard tree like usual. This patch and
the wg(8) patches ARE going in; I like them a lot. I've been very behind
as of late but am catching up.

Jason
