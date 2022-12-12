Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C62EC4167B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Dec 2022 14:23:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a9e3c75;
	Mon, 12 Dec 2022 14:23:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 191641de
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Dec 2022 14:23:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8C0D61053;
 Mon, 12 Dec 2022 14:23:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA159C433EF;
 Mon, 12 Dec 2022 14:23:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="jWEad5U3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1670855017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EI3qlxgvMnT5OMYlRkhJ0Uy1WA8fWwEgE1pf1UuYfLA=;
 b=jWEad5U3zCZw+p1vKs1Thrb5KqB1Y7zb5iO1bjGmVU/XDI6V5zJrLjRTnPBM+nPEJy69bi
 EqF7CmUU03Phf+ktr+ubN8FH9Oykn3w8xX0H458rWKncg6hTdZz7+ttMrP5k8l7widxzzF
 ReZo17nkwnJzZnZppkCfy9a9StejSVM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8f7b6bc2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 12 Dec 2022 14:23:37 +0000 (UTC)
Date: Mon, 12 Dec 2022 15:23:34 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, Martin Liska <mliska@suse.cz>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org
Subject: Re: [PATCH v2] wireguard (gcc13): move ULLs limits away from enum
Message-ID: <Y5c5ZtXy2nQzBmGC@zx2c4.com>
References: <20221212114712.11802-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221212114712.11802-1-jirislaby@kernel.org>
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

I have this queued up already as:
https://git.zx2c4.com/wireguard-linux/commit/?id=3d9d8bba03db21f3276324cdba43c82be5d60729

I liked this variant better.

Jason
